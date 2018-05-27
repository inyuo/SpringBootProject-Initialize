package com.inyu.service;

public interface ServiceTemplate {

    /**
     * <pre> 无事务模板执行业务处理
     * 1. 异常捕获，及分类处理
     * 2. 业务日志记录
     * </pre>
     *
     * @param <T>
      * @param clazz  返回对象
      * @param action 业务操作回调的接口
      * @return       服务返回对象
      */
    <T> T executeWithoutTransaction(Class  clazz, ServiceCallback<T> action);

     /** <pre> 支持本地事务模板执行业务处理
      * 1. 本地事务封装
      * 2. 异常捕获，及分类处理
      * 3. 业务日志记录
      * </pre>
      *
      * @param <T>
      * @param clazz  返回对象
      * @param action 业务操作回调的接口
      * @return       服务返回对象
      */
       <T> T execute(Class  clazz, ServiceCallback action);
}
