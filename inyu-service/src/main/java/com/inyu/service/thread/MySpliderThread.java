package com.inyu.service.thread;

import com.inyu.common.MyHttpUtils;
import com.inyu.entity.CrmConfig;
import com.inyu.entity.CrmCustomer;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.utils.SpringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;


public class MySpliderThread implements Runnable {
    /** 日志  */
    private Logger logger = LoggerFactory.getLogger(getClass().getName());
    @Resource
    private static AsyncCrmConfService asyncCrmConfService ;

    @Resource
    private static AsyncCustomerService asyncCustomerService;

    @Override
    public void run() {
        try {
            synchronized (this) {
                this.asyncCrmConfService= SpringUtils.getApplicationContext().getBean(AsyncCrmConfService.class);
                this.asyncCustomerService= SpringUtils.getApplicationContext().getBean(AsyncCustomerService.class);
                Thread.sleep(1000);
                CrmConfig crmConf = asyncCrmConfService.getCrmConfById(6l);
                String spliderCounter = crmConf.getValue();
                final String baseUrl = "https://www.11467.com/guangzhou/co/" + spliderCounter + ".htm";
                CrmCustomer customer = new CrmCustomer();
                try {
                    String ret = MyHttpUtils.sendGet(baseUrl, null,null);
                    if (ret.indexOf("没找到") != -1) {
                        return ;
                    }
                    Document parse = Jsoup.parse(ret);
                    //公司联系方式
                    Elements dtels = parse.getElementsByClass("codl").first().select("dt");
                    Elements ddels = parse.getElementsByClass("codl").first().select("dd");
                    customer.setOrigin(baseUrl);
                    customer.setAddress(ddels.get(0).ownText());
                    customer.setLandlineTelephone(ddels.get(1).ownText());
                    customer.setName(ddels.get(2).ownText());
                    customer.setTelephone(ddels.get(3).ownText());
                    for (int i = 0; i < dtels.size(); i++) {
                        if (dtels.get(i).ownText().indexOf("编码") != -1) {
                            customer.setZipCode(ddels.get(i).ownText());
                        } else if (dtels.get(i).ownText().indexOf("传真") != -1) {
                            customer.setFax(ddels.get(i).ownText());
                        } else if (dtels.get(i).ownText().indexOf("邮箱") != -1) {
                            customer.setEmail(ddels.get(i).ownText());
                        }
                    }

                    //工商资料
                    Elements ele = parse.getElementsByClass("codl").get(1).select("tr");
                    customer.setIndustry(ele.get(0).select("td").get(1).ownText());
                    for (int j = 0; j < ele.size(); j++) {
                        if (ele.get(j).select("td").first().ownText().indexOf("营业执照") != -1) {
                            customer.setLicencNo(ele.get(j).select("td").get(1).ownText());
                        } else if (ele.get(j).select("td").first().ownText().indexOf("注册资本") != -1) {
                            customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                        } else if (ele.get(j).select("td").first().ownText().indexOf("公司官网") != -1) {
                            customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                            customer.setWebsite(ele.get(j).select("td").get(1).ownText());
                        }
                    }
                    //查询是否已存在
                    CrmCustomer infoByName = asyncCustomerService.getCustomerInfoByIndustry(customer.getIndustry());
                    if (infoByName !=null){
                        logger.error("splider-save-customer--> error : info is exist{ "+customer);
                        return ;
                    }
                    // 存储用户
                    CrmCustomer CrmCustomer = asyncCustomerService.addCustomer(customer);
                    return ;
                } catch (Exception e) {
                    logger.error("splider-save-customer--> error", e);
                    return ;
                } finally {
                    int counter = Integer.parseInt(spliderCounter) + 1;
                    crmConf.setValue(counter + "");
                    asyncCrmConfService.updateCrmConf(crmConf);
                    logger.info("splidert-hread-->  "+Thread.currentThread().getName()+"<--");
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + "执行完毕");
    }
}
