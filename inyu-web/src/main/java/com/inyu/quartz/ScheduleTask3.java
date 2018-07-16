package com.inyu.quartz;

import com.inyu.common.DateUtil;
import com.inyu.entity.QuartzProxy;
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
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.List;
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
public class ScheduleTask3 implements Job, Serializable {

    private static Logger logger = LoggerFactory.getLogger(ScheduleTask1.class);
    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        logger.info("====== 定时任务实现类（代理验证）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
        try {
            Queue<QuartzProxy> proxyQuene = new LinkedBlockingQueue();
            if (!CollectionUtils.isEmpty(proxyQuene)) {
                logger.info("==== 定时任务-代理验证===> 进行中，队列剩余：" + proxyQuene.size() + "，当前时间：" + DateUtil.getStringToday());
            } else {
                List<QuartzProxy> proxyList = asyncQuartzProxyService.getProxyList();
                proxyQuene.addAll(proxyList);
            }

            ValidateProxyThread proxyThread = new ValidateProxyThread();
            Thread vp1 = new Thread(proxyThread, "validate-thrad-1");
            Thread vp2 = new Thread(proxyThread, "validate-thrad-2");
            Thread vp3 = new Thread(proxyThread, "validate-thrad-3");

            vp1.start();
            vp2.start();
            vp3.start();

        } catch (Exception e) {
            logger.error("==== 定时任务实现类（代理验证）ScheduleTask ====>异常!", e.getMessage());
            return;
        } finally {
            logger.info("==== 定时任务实现类（代理验证）ScheduleTask ====> 结束!" + DateUtil.getStringToday());
        }
    }
}
