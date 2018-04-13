package com.inyu.quartz;

import com.inyu.service.AsyncQuartzConfService;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 调度工厂类
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
@EnableScheduling
@Component
public class ScheduleRefreshDatabase {

    @Autowired
    private AsyncQuartzConfService asyncQuartzConfService;

    @Resource(name = "jobDetail")
    private JobDetail jobDetail;

    @Resource(name = "jobTrigger")
    private CronTrigger cronTrigger;

    @Resource(name = "scheduler")
    private Scheduler scheduler;

    @Scheduled(fixedRate = 5000) // 每隔5s查库，并根据查询结果决定是否重新设置定时任务
    public void scheduleUpdateCronTrigger() throws SchedulerException {

        CronTrigger trigger = (CronTrigger) scheduler.getTrigger(cronTrigger.getKey());
        // 当前Trigger使用的
        String currentCron = trigger.getCronExpression();
        // 从数据库查询出来的
        String searchCron = asyncQuartzConfService.findById(1L).getCron();
        System.out.println("currentCron:"+currentCron);
        System.out.println("searchCron:"+searchCron);
        if (currentCron.equals(searchCron)) {
            // 如果当前使用的cron表达式和从数据库中查询出来的cron表达式一致，则不刷新任务
        } else {
            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(searchCron);
            // 按新的cronExpression表达式重新构建trigger
            trigger = (CronTrigger) scheduler.getTrigger(cronTrigger.getKey());
            trigger = trigger.getTriggerBuilder().withIdentity(cronTrigger.getKey())
                    .withSchedule(scheduleBuilder).build();
            // 按新的trigger重新设置job执行
            scheduler.rescheduleJob(cronTrigger.getKey(), trigger);
            currentCron = searchCron;
        }
    }

}
