package com.inyu.service.impl;

import com.inyu.entity.QuartzProxy;
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
    public List<QuartzProxy> getProxyList() {
        return quarztProxyRepository.findAll();
    }

    @Override
    public QuartzProxy findById(long id) {
        return quarztProxyRepository.findOne(id);
    }

    @Override
    public QuartzProxy findByIp(String ip) {
        return quarztProxyRepository.findOneByIp(ip);
    }

    @Override
    public QuartzProxy saveProxy(QuartzProxy proxy) {
        return quarztProxyRepository.save(proxy);
    }

    @Override
    public QuartzProxy updateProxy(QuartzProxy proxy) {
        return quarztProxyRepository.save(proxy);
    }

}
