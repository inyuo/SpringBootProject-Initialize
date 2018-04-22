package com.inyu.service.impl;

import com.inyu.common.MyHttpUtils;
import com.inyu.entity.Crm_Customer;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncSpliderService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AsyncSpliderServiceImpl implements AsyncSpliderService {

    /** 日志 */
    private Logger logger = LoggerFactory.getLogger(getClass().getName());

    /** 客户管理接口 */
    @Autowired
    private AsyncCustomerService asyncCustomerService;

    @Override
    public boolean getPageInfo(String url, String method) {
        Crm_Customer customer = new Crm_Customer();
        try {
            String ret = MyHttpUtils.sendGet(url, null);
            if (ret.indexOf("没找到")!=-1){
                return false;
            }
            Document parse = Jsoup.parse(ret);
            //公司联系方式
            Elements dtels = parse.getElementsByClass("codl").first().select("dt");
            Elements ddels = parse.getElementsByClass("codl").first().select("dd");
            customer.setOrigin(url);
            customer.setAddress(ddels.get(0).ownText());
            customer.setLandline_Telephone(ddels.get(1).ownText());
            customer.setName(ddels.get(2).ownText());
            customer.setTelephone(ddels.get(3).ownText());
            for (int i=0;i<dtels.size();i++){
                if (dtels.get(i).ownText().indexOf("编码")!=-1){
                    customer.setZip_Code(ddels.get(i).ownText());
                }else if (dtels.get(i).ownText().indexOf("传真")!=-1){
                    customer.setFax(ddels.get(i).ownText());
                }else if (dtels.get(i).ownText().indexOf("邮箱")!=-1){
                    customer.setEmail(ddels.get(i).ownText());
                }
            }

            //工商资料
            Elements ele = parse.getElementsByClass("codl").get(1).select("tr");
            customer.setIndustry(ele.get(0).select("td").get(1).ownText());
            for (int j=0;j<ele.size();j++){
                if (ele.get(j).select("td").first().ownText().indexOf("营业执照")!=-1){
                    customer.setLicenc_No(ele.get(j).select("td").get(1).ownText());
                }else if (ele.get(j).select("td").first().ownText().indexOf("注册资本")!=-1){
                    customer.setAnnual_Revenue(ele.get(j).select("td").get(1).ownText());
                }else if (ele.get(j).select("td").first().ownText().indexOf("公司官网")!=-1){
                    customer.setAnnual_Revenue(ele.get(j).select("td").get(1).ownText());
                    customer.setWebsite(ele.get(j).select("td").get(1).ownText());
                }
            }
            // 存储用户
            Crm_Customer crm_customer = asyncCustomerService.addCustomer(customer);
            return Boolean.TRUE;
        } catch (Exception e) {
            logger.error("splider-save-customer--> error",e);
            return Boolean.FALSE;
        }
    }
}
