package com.inyu.service.impl;

import com.inyu.entity.Quartz_Config;
import com.inyu.repo.QuartzConfRepository;
import com.inyu.repo.UserRepository;
import com.inyu.service.AsyncQuartzConfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

/**
 * Created by jinyu on 2018/4/13/013.
 */
@Service
public class AsyncQuartzConfServiceImpl implements AsyncQuartzConfService{
    private Logger logger= LoggerFactory.getLogger(AsyncUserServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    QuartzConfRepository quartzConfRepository;


    @Override
    public List<Quartz_Config> getJobList() {
       return quartzConfRepository.findAll();
    }

    @Override
    public Quartz_Config findById(long id) {
        return quartzConfRepository.findOne(id);
    }
}
