package com.inyu;

import com.inyu.filter.LoggerIDInheritableThreadLocal;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Created by inyu on 2018/3/20/020.
 */
@SpringBootApplication
@EnableScheduling
@EnableAutoConfiguration
@EnableAsync
@ServletComponentScan       //描到自己编写的servlet和filter druid监控
public class InyuWebApplication extends SpringBootServletInitializer{
    public static LoggerIDInheritableThreadLocal loggerIDInheritableThreadLocal = new LoggerIDInheritableThreadLocal();

    public static void main(String[] args) {
        SpringApplication.run(InyuWebApplication.class, args);
    }
}
