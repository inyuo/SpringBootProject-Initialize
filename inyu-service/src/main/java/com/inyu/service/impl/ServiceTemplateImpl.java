package com.inyu.service.impl;

import com.inyu.common.BasicResult;
import com.inyu.service.ServiceCallback;
import com.inyu.service.ServiceTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

/**
 * @author 你的名称
 * @createTime 27 下午 10:15
 * @description
 */
@Service
public class ServiceTemplateImpl implements ServiceTemplate {
    /**
     * 事务模板
     */
    @Autowired
    private TransactionTemplate transactionTemplate;

    @Override
    public <T> T executeWithoutTransaction(Class  clazz, ServiceCallback <T>action) {
        Object result = null;
        try {
            // 执行校验
            action.check();
            //锁操作
            action.doLock();

            // 执行处理逻辑
            result = action.executeService();
            //可以对结果进行初步校验TODO


        } catch (Exception e) {
            //打日志TODO
            return (T) result;

        } catch (Throwable e2) {
            //打日志TODO
            return (T) result;
        }

        return (T) result;
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T execute(Class  clazz, ServiceCallback action) {
        T acResult = (T) transactionTemplate.execute(new TransactionCallback() {
            /**
             * @see org.springframework.transaction.support.TransactionCallback#doInTransaction(org.springframework.transaction.TransactionStatus)
             */
            public Object doInTransaction(TransactionStatus status) {

                Object  result = null;

                try {

                    result = clazz.newInstance();
                    // 执行校验逻辑
                    action.check();

                    //锁操作
                    action.doLock();

                    // 执行处理逻辑
                    result = action.executeService();
                    // 返回值异常处理
                    if (result == null || !(result instanceof BasicResult)) {
                         throw new Exception();
                    }

                } catch (Exception e) {
                    // 业务异常捕获, 回滚, 打日志TODO

                    status.setRollbackOnly();

                    return result;
                } catch (Throwable e2) {
                    // 系统异常捕获, 回滚, 打日志TODO
                    status.setRollbackOnly();
                    return result;
                } return result;
            }
        });
        return acResult;
    }
}
