package com.inyu.service;

import com.inyu.entity.Quartz_Proxy;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncQuartzProxyService {

    List<Quartz_Proxy> getProxyList();

    Quartz_Proxy findById(long id);

    Quartz_Proxy findByIp(String ip);

    Quartz_Proxy saveProxy(Quartz_Proxy proxy);

}
