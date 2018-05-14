package com.inyu;

import com.inyu.filter.LoggerIDInheritableThreadLocal;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import java.io.IOException;
import java.util.concurrent.Executor;

/**
 * Created by Administrator on 2018/3/20/020.
 */
@SpringBootApplication
@EnableScheduling
@EnableAutoConfiguration
@EnableAsync
public class InyuWebApplication extends SpringBootServletInitializer{
    public static LoggerIDInheritableThreadLocal loggerIDInheritableThreadLocal = new LoggerIDInheritableThreadLocal();

    public static void main(String[] args) {
        SpringApplication.run(InyuWebApplication.class, args);
    }
}
