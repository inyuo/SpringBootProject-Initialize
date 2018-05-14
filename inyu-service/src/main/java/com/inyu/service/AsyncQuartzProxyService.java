package com.inyu.service;

import com.inyu.entity.Quartz_Proxy;

import java.util.List;

/**
 * ip代理服务管理类
 * @author jinyu
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncQuartzProxyService {

    List<Quartz_Proxy> getProxyList();

    Quartz_Proxy findById(long id);

    Quartz_Proxy findByIp(String ip);

    Quartz_Proxy saveProxy(Quartz_Proxy proxy);

//    Quartz_Proxy updateProxy(Quartz_Proxy proxy);

}
