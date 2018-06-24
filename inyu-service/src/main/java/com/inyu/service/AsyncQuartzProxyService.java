package com.inyu.service;

import com.inyu.entity.QuartzProxy;

import java.util.List;

/**
 * ip代理服务管理类
 * @author jinyu
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncQuartzProxyService {

    List<QuartzProxy> getProxyList();

    List<QuartzProxy> selectProxyListByStatus(Integer status);

    QuartzProxy findById(long id);

    QuartzProxy findByIp(String ip);

    int saveProxy(QuartzProxy proxy);

    int updateProxy(QuartzProxy proxy);
}
