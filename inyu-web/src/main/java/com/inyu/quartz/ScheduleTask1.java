package com.inyu.quartz;

import com.inyu.SpringContext;
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
public class ScheduleTask1 implements Job {

    private static Logger logger = LoggerFactory.getLogger(ScheduleTask1.class);

        public void execute() throws JobExecutionException {

         AsyncQuartzProxyService asyncQuartzProxyService= SpringContext.getBean("asyncQuartzProxyService",AsyncQuartzProxyService.class);
            List<Quartz_Proxy> proxyList = asyncQuartzProxyService.getProxyList();
            for (Quartz_Proxy quartz_proxy : proxyList) {

            }
            try {
            System.out.println("任务执行1！");

        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        logger.info("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 开启!" + DateUtil.getNowDate());
        try {
            System.out.print("任务执行1 :");

            System.out.println(DateUtil.getNow());
        } catch (Exception e) {
            logger.error("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====>异常!",e.getMessage());
        }finally {
            logger.info("==== 定时任务实现类（获取&验证代理ip池）ScheduleTask ====> 结束!" + DateUtil.getNowDate());
        }
    }
}
