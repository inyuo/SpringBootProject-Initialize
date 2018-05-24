package com.inyu.service.impl;

import com.inyu.entity.QuartzConfig;
import com.inyu.repo.QuartzConfRepository;
import com.inyu.service.AsyncQuartzConfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by jinyu on 2018/4/13/013.
 */
@Service
@Transactional
public class AsyncQuartzConfServiceImpl implements AsyncQuartzConfService{
    private Logger logger= LoggerFactory.getLogger(AsyncUserServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    QuartzConfRepository quartzConfRepository;


    @Override
    public List<QuartzConfig> getJobList() {
       return quartzConfRepository.findAll();
    }

    @Override
    public QuartzConfig findById(long id) {
        return quartzConfRepository.findOne(id);
    }

    @Override
    public int updateJob(long id, String cron, String msg) {
        return quartzConfRepository.editJob(id,cron,msg);
    }

    @Override
    public int updateJobStatus(long id, int status) {
        return quartzConfRepository.updateJobStatus(id,status);
    }
}
