package com.inyu.quartz;

import com.inyu.common.DateUtil;
import com.inyu.entity.CrmConfig;
import com.inyu.entity.CrmCustomer;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.service.utils.MyHttpUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;

/**
 * 定时任务实现类
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
@Component
@EnableScheduling
public class ScheduleTask2 implements Job {

    private static Logger logger = LoggerFactory.getLogger(ScheduleTask2.class);

    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;
    @Autowired
    private AsyncCrmConfService asyncCrmConfService;
    @Autowired
    private AsyncCustomerService asyncCustomerService;

    // 可用的代理状态
    private static final int EFFECT_PROXY_STAT = 0;
    // 失败计数
    private static int failCount = 0;

    public void executeJob() throws JobExecutionException {

        logger.info("==== 定时任务实现类（XX节活动专场提醒）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        CrmConfig crmConf = null;
        int spliderCounter = 0;
        try {
            crmConf = asyncCrmConfService.getCrmConfById(6);
            spliderCounter = Integer.parseInt(crmConf.getValue());
            //获取代理池
//            List<QuartzProxy> proxyList = asyncQuartzProxyService.getProxyList();
//            int size = proxyList.size();
//            int proxyIndex = spliderCounter % size;
            // 访问地址
            String baseUrl = "https://www.11467.com/guangzhou/co/" + spliderCounter + ".htm";
            CrmCustomer customer = new CrmCustomer();

            HashMap<String, String> headers = MyHttpUtils.initHeaders();
            String getRet = MyHttpUtils.sendGet(baseUrl, headers, null);
            /*while (StringUtils.equalsIgnoreCase("EXP",getRet)){
                spliderCounter++;
                getRet = MyHttpUtils.sendGet(baseUrl, headers, proxyList.get(proxyIndex));
            }*/

            if (getRet.contains("没找到")) {
                logger.error("splider-save-customer ==> 没找到 ");
                failCount++;
                return;
            }
            //失败清零
            failCount = 0;
            Document parse = Jsoup.parse(getRet);
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
                if (text.contains("编码")) {
                    customer.setZipCode(ddels.get(i).ownText());
                } else if (text.contains("传真")) {
                    customer.setFax(ddels.get(i).ownText());
                } else if (text.contains("邮箱")) {
                    customer.setEmail(ddels.get(i).ownText());
                }
            }

            //工商资料
            Elements ele = parse.getElementsByClass("codl").get(1).select("tr");
            customer.setIndustry(ele.get(0).select("td").get(1).ownText());
            for (int j = 0; j < ele.size(); j++) {
                String td = ele.get(j).select("td").first().ownText();
                if (td.contains("营业执照")) {
                    customer.setLicencNo(ele.get(j).select("td").get(1).ownText());
                } else if (td.contains("注册资本")) {
                    customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                } else if (td.contains("公司官网")) {
                    customer.setAnnualRevenue(ele.get(j).select("td").get(1).ownText());
                    customer.setWebsite(ele.get(j).select("td").get(1).ownText());
                }
            }
            //查询是否已存在
            List<CrmCustomer> infoByName = asyncCustomerService.getCustomerInfoByIndustry(customer.getIndustry());
            if (!CollectionUtils.isEmpty(infoByName)) {
                logger.error("splider-save-customer ==> 已存在: " + infoByName.size());
                return;
            }
            // 存储用户
            asyncCustomerService.addCustomer(customer);
        } catch (Exception e) {
            logger.error("splider-save-customer--> 异常:", e);
        } finally {
            crmConf.setValue(++spliderCounter + "");
            asyncCrmConfService.updateCrmConf(crmConf);
            logger.info("splidert-hread-->  " + Thread.currentThread().getName() + "<--");
        }
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {
            executeJob();

        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }
}
