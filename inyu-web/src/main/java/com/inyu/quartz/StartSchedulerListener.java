package com.inyu.quartz;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 * 定时任务运行工厂类
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
public class StartSchedulerListener implements ApplicationListener<ContextRefreshedEvent> {
    @Autowired
    public MySchedulerFactory mySchedulerFactory;
    @Autowired
    private MyJobFactory myJobFactory;
    // springboot 启动监听
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        try {
            mySchedulerFactory.scheduleJobs();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    //注入SchedulerFactoryBean
    @Bean
    public SchedulerFactoryBean schedulerFactoryBean() {
        SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        schedulerFactoryBean.setJobFactory(myJobFactory);
        return schedulerFactoryBean;
    }

}
