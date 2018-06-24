package com.inyu.quartz;

import com.alibaba.fastjson.JSONObject;
import com.inyu.common.DateUtil;
import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.service.utils.MyHttpUtils;
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
    String baidu = "https://www.baidu.com/";

    /**
     * 获取代理
     * @throws JobExecutionException
     */
    public void moguProxyJob() throws JobExecutionException {
        logger.info("==== 定时任务实现类（代理获取）ScheduleTask ====> 开启!" + DateUtil.getTime());
        try {
            //处理中
            if (lockeD){
                return;
            }
            lockeD =true;
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


            QuartzProxy proxy= new QuartzProxy();
            for (Map<String, String> jsonObject : mogu.getMsg()) {
                proxy.setIp(jsonObject.get("ip"));
                proxy.setPort(jsonObject.get("port"));
                asyncQuartzProxyService.saveProxy(proxy);
            }
            lockeD = false;
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            lockeD =false;
            executeJob();
        }
    }

    /**
     * 验证代理
     * @throws JobExecutionException
     */
    public void executeJob() throws JobExecutionException {
        logger.info("==== 定时任务实现类（代理验证）ScheduleTask ====> 开启!" + DateUtil.getTime());
        try {
            if (!CollectionUtils.isEmpty(proxyQuene)){
                logger.info("==== 定时任务====> 进行中，队列剩余：" + proxyQuene.size()+"，当前时间："+DateUtil.getTime());
                return;
            }
            List<QuartzProxy> proxyList = asyncQuartzProxyService.getProxyList();
            proxyQuene.addAll(proxyList);
            for (QuartzProxy QuartzProxy : proxyQuene) {
                QuartzProxy.setLastValidate(DateUtil.getSqlDateShort());
                //获取页面
                String proxyPage = MyHttpUtils.sendGet(baidu, null,QuartzProxy);
                if (proxyPage==null||proxyPage.indexOf("百度一下，你就知道")!=-1){
                    QuartzProxy.setStatus(1);
                }else {
                    QuartzProxy.setStatus(0);
                }
                asyncQuartzProxyService.updateProxy(QuartzProxy);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        logger.info("====== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        try {
            moguProxyJob();
        } catch (Exception e) {
            logger.error("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====>异常!", e.getMessage());
        } finally {
            logger.info("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 结束!" + DateUtil.getStringToday());
        }
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
