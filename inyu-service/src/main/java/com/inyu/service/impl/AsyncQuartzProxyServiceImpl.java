package com.inyu.service.impl;

import com.inyu.entity.Quartz_Proxy;
import com.inyu.repo.QuarztProxyRepository;
import com.inyu.service.AsyncQuartzProxyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
@Service
public class AsyncQuartzProxyServiceImpl implements AsyncQuartzProxyService {

    private Logger logger= LoggerFactory.getLogger(AsyncQuartzProxyServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    QuarztProxyRepository quarztProxyRepository;

    @Override
    public List<Quartz_Proxy> getProxyList() {
        return quarztProxyRepository.findAll();
    }

    @Override
    public Quartz_Proxy findById(long id) {
        return quarztProxyRepository.findOne(id);
    }

    @Override
    public Quartz_Proxy findByIp(String ip) {
        return quarztProxyRepository.findOneByIp(ip);
    }

    @Override
    public Quartz_Proxy saveProxy(Quartz_Proxy proxy) {
        return quarztProxyRepository.save(proxy);
    }

    @Override
    public Quartz_Proxy updateProxy(Quartz_Proxy proxy) {
        return quarztProxyRepository.save(proxy);
    }

}
