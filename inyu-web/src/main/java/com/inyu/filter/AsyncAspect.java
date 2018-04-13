package com.inyu.filter;

import com.inyu.InyuWebApplication;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

/**
 * Created by casparhuan on 2017/8/23.
 */
@Aspect
@Component
public class AsyncAspect {

    /** 拦截开启新线程 async开头 */
    @Pointcut("execution(* com.inyu.*.async*(..))")
    public void newThreadAddLoggerID() {
    }

    @Before("newThreadAddLoggerID()")
    public void beforeInvoked2(final JoinPoint joinPoint) {
        MDC.put("LOGGER_ID", (String) InyuWebApplication.loggerIDInheritableThreadLocal.get());
    }

}
