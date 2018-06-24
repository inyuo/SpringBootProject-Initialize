package com.inyu.service.impl;

import com.inyu.entity.CrmConfig;
import com.inyu.entity.CrmCustomer;
import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.service.AsyncSpliderService;
import com.inyu.service.utils.MyHttpUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;

@Service
public class AsyncSpliderServiceImpl implements AsyncSpliderService {

    /**
     * 日志
     */
    private Logger logger = LoggerFactory.getLogger(getClass().getName());


    /**
     * 客户管理接口
     */
    @Autowired
    private AsyncCustomerService asyncCustomerService;

    /**
     * 配置 管理接口
     */
    @Autowired
    private AsyncCrmConfService asyncCrmConfService;

    /**
     * 配置 管理接口
     */
    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;


    @Override
    public synchronized boolean getPageInfo(String baseCounter, String method) {

        CrmConfig crmConf = asyncCrmConfService.getCrmConfById(6);
        int spliderCounter = Integer.parseInt(crmConf.getValue());
        //获取代理池
        List<QuartzProxy> proxyList = asyncQuartzProxyService.getProxyList();
        int size = proxyList.size();
        int proxyIndex = spliderCounter%size;
        // 访问地址
        String baseUrl = "https://www.11467.com/guangzhou/co/" + spliderCounter + ".htm";
        CrmCustomer customer = new CrmCustomer();
        try {
            HashMap<String, String> headers = MyHttpUtils.initHeaders();
            String ret = MyHttpUtils.sendGet(baseUrl, headers,proxyList.get(proxyIndex));
            if (ret.indexOf("没找到") != -1) {
                logger.error("splider-save-customer ==> 没找到 ");
                return false;
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
                String text = dtels.get(i).ownText();
                if (text.indexOf("编码") != -1) {
                    customer.setZipCode(ddels.get(i).ownText());
                } else if (text.indexOf("传真") != -1) {
                    customer.setFax(ddels.get(i).ownText());
                } else if (text.indexOf("邮箱") != -1) {
                    customer.setEmail(ddels.get(i).ownText());
                }
            }

            //工商资料
            Elements ele = parse.getElementsByClass("codl").get(1).select("tr");
            customer.setIndustry(ele.get(0).select("td").get(1).ownText());
            for (int j = 0; j < ele.size(); j++) {
                String td = ele.get(j).select("td").first().ownText();
                if (td.indexOf("营业执照") != -1) {
                    customer.setLicencNo(ele.get(j).select("td").get(1).ownText());
                } else if (td.indexOf("注册资本") != -1) {
                    customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                } else if (td.indexOf("公司官网") != -1) {
                    customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                    customer.setWebsite(ele.get(j).select("td").get(1).ownText());
                }
            }
            //查询是否已存在
            List<CrmCustomer> customerInfoByIndustry = asyncCustomerService.getCustomerInfoByIndustry(customer.getIndustry());
            if (!CollectionUtils.isEmpty(customerInfoByIndustry)) {
                logger.error("splider-save-customer ==> 已存在: " + customer);
                return false;
            }
            // 存储用户
            int i = asyncCustomerService.addCustomer(customer);
            return Boolean.TRUE;
        } catch (Exception e) {
            logger.error("splider-save-customer--> 异常:", e);
            return Boolean.FALSE;
        } finally {
            crmConf.setValue(++spliderCounter+"");
            asyncCrmConfService.updateCrmConf(crmConf);
            logger.info("splidert-hread-->  " + Thread.currentThread().getName() + "<--");
        }
    }


}
