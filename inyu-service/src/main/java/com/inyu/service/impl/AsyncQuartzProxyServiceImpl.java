package com.inyu.service.impl;

import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.repo.QuartzProxyMapper;
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
    QuartzProxyMapper quartzProxyMapper;

    @Override
    public List<QuartzProxy> getProxyList() {
        return quartzProxyMapper.selectAll();
    }

    @Override
    public QuartzProxy findById(long id) {
        return quartzProxyMapper.selectByPrimaryKey(id);
    }

    @Override
    public QuartzProxy findByIp(String ip) {
        return quartzProxyMapper.queryProxyByIp(ip);
    }

    @Override
    public int saveProxy(QuartzProxy proxy) {
        return quartzProxyMapper.insert(proxy);
    }

    @Override
    public int updateProxy(QuartzProxy proxy) {
        return quartzProxyMapper.updateByPrimaryKey(proxy);
    }

}
