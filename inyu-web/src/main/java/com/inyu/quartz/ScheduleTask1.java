package com.inyu.quartz;

import com.alibaba.fastjson.JSONObject;
import com.inyu.common.DateUtil;
import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.service.utils.MyHttpUtils;
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
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 定时任务实现类
 *
 * @author jingu
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
@Component
@EnableScheduling
public class ScheduleTask1 implements Job, Serializable {

    private static Logger logger = LoggerFactory.getLogger(ScheduleTask1.class);
    /**
     * 队列 存储待验证的代理池
     */
    Queue<QuartzProxy> proxyQuene = new LinkedBlockingQueue();
    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;

    // 在运行态
    private static boolean lockeD = false;

    /**
     * 蘑菇代理
     *
     * @throws JobExecutionException
     */
    public void moguProxyJob() throws JobExecutionException {
        logger.info("==== 定时任务实现类（代理获取）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        try {
            //处理中
            if (lockeD) {
                return;
            }
            lockeD = true;
            //访问地址
            String kuaiProxy = "http://www.mogumiao.com/proxy/free/listFreeIp";
            HashMap<String, String> headers = new HashMap<>();
            headers.put("Accept", "application/json, text/plain, */*");
            headers.put("Accept-Encoding", "gzip, deflate, sdch");
            headers.put("Accept-Language", "zh-CN,zh;q=0.9");
            headers.put("Connection", "keep-alive");
            headers.put("Host", "www.mogumiao.com");
            headers.put("Referer", "http://www.mogumiao.com/web");
            headers.put("Cookie", "JSESSIONID=49F58A0B91865C7F9E44F2D41310A5A2; UM_distinctid=16430cee0f7a9-068ea502d88819-6b1b1279-1fa400-16430cee0f8790; CNZZDATA1271466141=1890848463-1529824475-null%7C1529824475");
            headers.put("X-Requested-With", "XMLHttpRequest");
            headers.put("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36");

            //获取页面
            String proxyPage = MyHttpUtils.sendGet(kuaiProxy, headers, null);
            Mogu mogu = JSONObject.parseObject(proxyPage, Mogu.class);


            QuartzProxy proxy = new QuartzProxy();
            for (Map<String, String> jsonObject : mogu.getMsg()) {
                proxy.setIp(jsonObject.get("ip"));
                proxy.setPort(jsonObject.get("port"));
                asyncQuartzProxyService.saveProxy(proxy);
            }
            lockeD = false;
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            lockeD = false;
        }
    }

    /**
     * 西刺代理
     *
     * @throws JobExecutionException
     */
    public void xiciProxyJob() throws JobExecutionException {
        logger.info("==== 定时任务实现类（代理xici获取）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        try {
            //处理中
            if (lockeD) {
                return;
            }
            lockeD = true;
            //访问地址
            String kuaiProxy = "http://www.xicidaili.com/nn/";
            HashMap<String, String> headers = new HashMap<>();
            headers.put("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
            headers.put("Accept-Encoding", "gzip, deflate");
            headers.put("Accept-Language", "zh-CN,zh;q=0.9");
            headers.put("Connection", "keep-alive");
            headers.put("Host", "www.xicidaili.com");
            headers.put("Referer", "http://www.xicidaili.com/");
            headers.put("Cookie", "_free_proxy_session=BAh7B0kiD3Nlc3Npb25faWQGOgZFVEkiJTg3NmYzYWEyNWUxMGQ0NTRiN2Y2Y2FiODEyYWY2OGY1BjsAVEkiEF9jc3JmX3Rva2VuBjsARkkiMVM0UldRUXVVOFBRSWQ0SmhucTlWUlFGNjVTdFFsbjRPKzhENGZUbnF0S2c9BjsARg%3D%3D--d3ecb93828cbcd1a29df587606dd087b3930d77b; Hm_lvt_0cf76c77469e965d2957f0553e6ecf59=1530420455; Hm_lpvt_0cf76c77469e965d2957f0553e6ecf59=1530422250");
            headers.put("Upgrade-Insecure-Requests", "1");
            headers.put("If-None-Match", "W/\"7659c0b44110cbf4df9a774f24f7ce77\"");
            headers.put("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36");

            //获取页面
            String proxyPage = MyHttpUtils.sendGet(kuaiProxy, headers, null);
            Document parse = Jsoup.parse(proxyPage);
            //公司联系方式
            Elements select = parse.select("#ip_list > tbody").select("tr");
            QuartzProxy proxy = null;
            for (int i=1;i<select.size();i++) {
                Element element = select.get(i);
                // 获取行信息
                Elements rowInfo = element.select("td");
                // 首行信息过滤
                if (CollectionUtils.isEmpty(rowInfo)) {
                    continue;
                }
                proxy = new QuartzProxy();
                proxy.setIp(rowInfo.get(1).ownText());
                proxy.setPort(rowInfo.get(2).ownText());
                proxy.setStatus(0);
                String spread= rowInfo.get(6).getElementsByClass("bar").get(0).attr("title").replaceAll("秒","");
                proxy.setSpread(Float.parseFloat(spread));
                proxy.setLastValidate(DateUtil.getNowDate());
                proxy.setType(rowInfo.get(5).ownText());
                proxy.setLocation(rowInfo.get(4).ownText());

                //存储代理ip
                asyncQuartzProxyService.saveProxy(proxy);
            }
            lockeD = false;
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            lockeD = false;
        }
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        logger.info("====== 定时任务实现类（获取代理ip池）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        try {
//            moguProxyJob();
            xiciProxyJob();
        } catch (Exception e) {
            logger.error("==== 定时任务实现类（获取代理ip池）ScheduleTask ====>异常!", e.getMessage());
        } finally {
            logger.info("==== 定时任务实现类（获取代理ip池）ScheduleTask ====> 结束!" + DateUtil.getStringToday());
        }
    }


    class Mogu {
        private String code;
        private List<Map<String, String>> msg;

        public Mogu(String code, List<Map<String, String>> msg) {
            this.code = code;
            this.msg = msg;
        }

        public Mogu() {
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public List<Map<String, String>> getMsg() {
            return msg;
        }

        public void setMsg(List<Map<String, String>> msg) {
            this.msg = msg;
        }
    }
}