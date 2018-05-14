package com.inyu.quartz;

import com.inyu.common.DateUtil;
import com.inyu.common.MyHttpUtils;
import com.inyu.entity.Quartz_Proxy;
import com.inyu.service.AsyncQuartzProxyService;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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

import java.io.Serializable;
import java.util.HashMap;

/**
 * 定时任务实现类
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
@Component
@EnableScheduling
public class ScheduleTask1 implements Job, Serializable {

    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;
    private static Logger logger = LoggerFactory.getLogger(ScheduleTask1.class);
    private static int num = 1;

    public void proxyJob() {
        try {
            //访问地址
            String kuaiProxy = "https://www.kuaidaili.com/free/inha/" + num + "/";
            HashMap<String, String> headers = new HashMap<>();
            headers.put("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
            headers.put("Accept-Encoding", "gzip, deflate, br");
            headers.put("Accept-Language", "zh-CN,zh;q=0.9");
            headers.put("Connection", "keep-alive");
            headers.put("Host", "www.kuaidaili.com");
            headers.put("Referer", "https://www.kuaidaili.com/free/");
            headers.put("Cookie", "mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D;"
                    + " mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D; "
                    + "channelid=0; sid=1526290266591573; _ga=GA1.2.811598351.1526290267; _gid=GA1.2.101351125.1526290267; Qs_lvt_161068=1526290267%2C1526291088; "
                    + "Hm_lvt_7ed65b1cc4b810e9fd37959c9bb51b31=1526290267,1526291089; _gat=1; mediav=%7B%22eid%22%3A%22260320%22%2C%22ep%22%3A%22%22%2C%22vid%22%3A%22fPa%3AZ%23iXLk%3AoZ2%3C0Wm3%3A%22%2C%22ctn%22%3A%22%22%7D; "
                    + "Qs_pv_161068=4091851921230243000%2C4203865782801775600%2C2477124948762491000%2C2922827072946573300%2C4238660453164286500; Hm_lpvt_7ed65b1cc4b810e9fd37959c9bb51b31=1526291500");
            headers.put("Upgrade-Insecure-Requests", "1");
            headers.put("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36");

            //获取页面
            String proxyPage = MyHttpUtils.sendGet(kuaiProxy, headers);
            Document parse = Jsoup.parse(proxyPage);
            Elements elements = parse.getElementsByClass("table table-bordered table-striped").select("tr");
            Quartz_Proxy proxy = null;
            for (int i = 1; i < elements.size(); i++) {
                proxy = new Quartz_Proxy();
                Element element = elements.get(i);
                Elements selects = element.select("td");
                String ip = selects.get(0).ownText();
                if (StringUtils.isEmpty(ip)) {
                    logger.warn("ip is null element:" + element);
                    continue;
                }
                proxy.setIp(selects.get(0).ownText());
                proxy.setPort(selects.get(1).ownText());
                proxy.setType(selects.get(3).ownText());
                proxy.setLocation(selects.get(4).ownText());
                String time = selects.get(5).ownText().replace("秒", "");
                proxy.setSpread(Float.parseFloat(time));
                proxy.setStatus(0l);//默认可用
                proxy.setLast_Validate(DateUtil.getSqlDateShort());
                //该记录已存在 & 更新
                asyncQuartzProxyService.saveProxy(proxy);
            }

        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            num++;
        }
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        logger.info("====== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 开启!" + DateUtil.getNowDate());
        try {
            proxyJob();
        } catch (Exception e) {
            logger.error("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====>异常!", e.getMessage());
        } finally {
            logger.info("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 结束!" + DateUtil.getNowDate());
        }
    }
}
