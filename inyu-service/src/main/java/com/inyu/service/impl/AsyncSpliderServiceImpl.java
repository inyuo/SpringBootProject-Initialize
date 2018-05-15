package com.inyu.service.impl;

import com.inyu.common.MyHttpUtils;
import com.inyu.entity.Crm_Config;
import com.inyu.entity.Crm_Customer;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncSpliderService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

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


    @Override
    public synchronized boolean getPageInfo(String baseCounter, String method) {

        Crm_Config crmConf = asyncCrmConfService.getCrmCongById(6l);
        String spliderCounter = crmConf.getValue();
        final String baseUrl = "https://www.11467.com/guangzhou/co/" + spliderCounter + ".htm";
        Crm_Customer customer = new Crm_Customer();
        try {
            HashMap<String, String> headers = initHeaders();
            String ret = MyHttpUtils.sendGet(baseUrl, headers,null);
            if (ret.indexOf("没找到") != -1) {
                return false;
            }
            Document parse = Jsoup.parse(ret);
            //公司联系方式
            Elements dtels = parse.getElementsByClass("codl").first().select("dt");
            Elements ddels = parse.getElementsByClass("codl").first().select("dd");
            customer.setOrigin(baseUrl);
            customer.setAddress(ddels.get(0).ownText());
            customer.setLandline_Telephone(ddels.get(1).ownText());
            customer.setName(ddels.get(2).ownText());
            customer.setTelephone(ddels.get(3).ownText());
            for (int i = 0; i < dtels.size(); i++) {
                if (dtels.get(i).ownText().indexOf("编码") != -1) {
                    customer.setZip_Code(ddels.get(i).ownText());
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
                    customer.setLicenc_No(ele.get(j).select("td").get(1).ownText());
                } else if (ele.get(j).select("td").first().ownText().indexOf("注册资本") != -1) {
                    customer.setAnnual_Revenue(ele.get(j).select("td").get(1).ownText());
                } else if (ele.get(j).select("td").first().ownText().indexOf("公司官网") != -1) {
                    customer.setAnnual_Revenue(ele.get(j).select("td").get(1).ownText());
                    customer.setWebsite(ele.get(j).select("td").get(1).ownText());
                }
            }
            //查询是否已存在
            Crm_Customer infoByName = asyncCustomerService.getCustomerInfoByIndustry(customer.getIndustry());
            if (infoByName != null) {
                logger.error("splider-save-customer--> 已存在 :  exist{ " + customer);
                return false;
            }
            // 存储用户
            Crm_Customer crm_customer = asyncCustomerService.addCustomer(customer);
            return Boolean.TRUE;
        } catch (Exception e) {
            logger.error("splider-save-customer--> 异常:", e);
            return Boolean.FALSE;
        } finally {
            int counter = Integer.parseInt(spliderCounter) + 1;
            crmConf.setValue(counter + "");
            asyncCrmConfService.updateCrmConf(crmConf);
            logger.info("splidert-hread-->  " + Thread.currentThread().getName() + "<--");
        }
    }

    /**
     * 构造header
     * @return
     */
    private HashMap<String, String> initHeaders() {
        ArrayList<String> USER_AGENTS = new ArrayList();
        USER_AGENTS.add("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; AcooBrowser; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
        USER_AGENTS.add("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)");
        USER_AGENTS.add("Mozilla/4.0 (compatible; MSIE 7.0; AOL 9.5; AOLBuild 4337.35; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
        USER_AGENTS.add("Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)");
        USER_AGENTS.add("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)");
        USER_AGENTS.add("Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 1.0.3705; .NET CLR 1.1.4322)");
        USER_AGENTS.add("Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30)");
        USER_AGENTS.add("Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/523.15 (KHTML, like Gecko, Safari/419.3) Arora/0.3 (Change: 287 c9dfb30)");
        USER_AGENTS.add("Mozilla/5.0 (X11; U; Linux; en-US) AppleWebKit/527+ (KHTML, like Gecko, Safari/419.3) Arora/0.6");
        USER_AGENTS.add("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.2pre) Gecko/20070215 K-Ninja/2.1.1");
        USER_AGENTS.add("Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9) Gecko/20080705 Firefox/3.0 Kapiko/3.0");
        USER_AGENTS.add("Mozilla/5.0 (X11; Linux i686; U;) Gecko/20070322 Kazehakase/0.4.5)");
        USER_AGENTS.add("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.8) Gecko Fedora/1.9.0.8-1.fc10 Kazehakase/0.5.6)");
        USER_AGENTS.add("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11");
        USER_AGENTS.add("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.20 (KHTML, like Gecko) Chrome/19.0.1036.7 Safari/535.20");
        USER_AGENTS.add("Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52");

        HashMap<String, String> headers = new HashMap<>();
        headers.put("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
        headers.put("Accept-Encoding", "gzip, deflate, br");
        headers.put("Accept-Language", "zh-CN,zh;q=0.9");
        headers.put("Cache-Control", "max-age=0");
        headers.put("Connection", "keep-alive");
        headers.put("Host", "www.11467.com");
        headers.put("Upgrade-Insecure-Requests", "1");
        headers.put("Cookie", "mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D;"
                + " mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D; "
                + "channelid=0; sid=1526290266591573; _ga=GA1.2.811598351.1526290267; _gid=GA1.2.101351125.1526290267; Qs_lvt_161068=1526290267%2C1526291088; "
                + "Hm_lvt_7ed65b1cc4b810e9fd37959c9bb51b31=1526290267,1526291089; _gat=1; mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D; "
                + "Qs_pv_161068=4091851921230243000%2C4203865782801775600%2C2477124948762491000%2C2922827072946573300%2C4238660453164286500; Hm_lpvt_7ed65b1cc4b810e9fd37959c9bb51b31=1526291500");
        headers.put("User-Agent", USER_AGENTS.get((int) (Math.random() * 16)));
        return headers;
    }
}
