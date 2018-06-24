package com.inyu.filter;

import com.alibaba.fastjson.JSONObject;
import com.inyu.common.DateUtil;
import com.inyu.common.HttpContextUtils;
import com.inyu.common.IPUtils;
import com.inyu.entity.CrmActionLog;
import com.inyu.entity.CrmUser;
import com.inyu.service.AsyncCrmActionLogService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;


/**
 * 系统日志，切面处理类
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017年3月8日 上午11:07:35
 */
@Aspect
@Component
public class ActionLogAspect {
    private Logger logger = LoggerFactory.getLogger(ActionLogAspect.class);

    @Autowired
    private AsyncCrmActionLogService asyncCrmActionLogService;

    @Pointcut("@annotation(io.swagger.annotations.ApiOperation)")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object result =null;
        try {
            long beginTime = System.currentTimeMillis();
            //执行方法
            result = point.proceed();
            //执行时长(毫秒)
            long time = System.currentTimeMillis() - beginTime;

            //保存日志
            saveSysLog(point, time);
        } catch (Exception e) {
            logger.error("sysLogAspect 保存系统日志出错", e);
        } finally {
            return result;
        }
    }

    private void saveSysLog(ProceedingJoinPoint joinPoint, long time) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        CrmActionLog actionLog = new CrmActionLog();
        ApiOperation syslog = method.getAnnotation(ApiOperation.class);
        if (syslog != null) {
            //注解上的描述
            actionLog.setActionName(syslog.value());
        }

        //请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        actionLog.setContent(className + "." + methodName + "()");
        //module
        actionLog.setModuleName(className);

        //请求的参数
        Object[] args = joinPoint.getArgs();
        String params = JSONObject.toJSONString(args);
        actionLog.setParamName(params);


        //获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        //设置IP地址
        actionLog.setIp(IPUtils.getIpAddr(request));

        //用户名
        String username="SYSTEM";
        try {
            username = ((CrmUser) SecurityUtils.getSubject().getPrincipal()).getName();
        }catch (Exception e){
            logger.error("获取用户失败");
        }
        actionLog.setOperator(username);

        //未做鉴权。。默认:1
        actionLog.setActionId(1);

        actionLog.setCreateTime(DateUtil.getNow());
        //保存系统日志
        asyncCrmActionLogService.saveActionLog(actionLog);
    }
}
