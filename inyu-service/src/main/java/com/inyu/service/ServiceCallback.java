package com.inyu.service;

public interface ServiceCallback<T> {
    /**
     * 3      * <pre> 校验
     * 4      * 对于校验不通过，异常驱动返回
     * 5      * </pre>
     * 6
     */
    void doLock();

    /**
     * <pre> 校验
     * 对于校验不通过，异常驱动返回
     * </pre>
     */
    void check();

    /**
     * <pre> 执行业务逻辑
     * </pre>
     *
     * @return
     */
    T executeService();
}
