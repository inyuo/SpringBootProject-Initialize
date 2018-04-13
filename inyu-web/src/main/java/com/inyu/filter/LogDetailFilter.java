package com.inyu.filter;


import com.inyu.InyuWebApplication;
import org.jboss.logging.MDC;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.UUID;

/**
 *  过滤器
 * Created by jinyu on 2018/4/3/003.
 */
@Order(1)
@WebFilter(filterName = "logDetailFilter",urlPatterns = "/*")
public class LogDetailFilter implements Filter {
    private Logger logger = LoggerFactory.getLogger(getClass().getName());
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String loggerID = UUID.randomUUID().toString();
        InyuWebApplication.loggerIDInheritableThreadLocal.set(loggerID);
        MDC.put("LOGGER_ID", loggerID);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
