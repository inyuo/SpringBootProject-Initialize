package com.inyu.quartz;

import com.inyu.common.DateUtil;
import com.inyu.common.MyHttpUtils;
import com.inyu.entity.Quartz_Proxy;
import com.inyu.service.AsyncQuartzProxyService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
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
    String baidu = "https://www.baidu.com";

    public void executeJob() throws JobExecutionException {
        logger.info("==== 定时任务实现类（清明节活动专场提醒）ScheduleTask ====> 开启!" + DateUtil.getNowDate());


        try {
            List<Quartz_Proxy> proxyList = asyncQuartzProxyService.getProxyList();
            for (Quartz_Proxy quartz_proxy : proxyList) {
                quartz_proxy.setLast_Validate(DateUtil.getSqlDateShort());
                //获取页面
                String proxyPage = MyHttpUtils.sendGet(baidu, null,quartz_proxy);
                if (proxyPage==null||proxyPage.indexOf("百度一下，你就知道")!=-1){
                    quartz_proxy.setStatus(1l);
                }else {
                    quartz_proxy.setStatus(0l);
                }
                asyncQuartzProxyService.updateProxy(quartz_proxy);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
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
