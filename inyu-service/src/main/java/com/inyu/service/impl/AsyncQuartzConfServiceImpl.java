package com.inyu.service.impl;

import com.inyu.entity.QuartzConfig;
import com.inyu.service.AsyncQuartzConfService;
import com.inyu.dal.master.QuartzConfigMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

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
    QuartzConfigMapper quartzConfigMapper;


    @Override
    public List<QuartzConfig> getJobList() {
        List<QuartzConfig> quartzConfigList = quartzConfigMapper.selectAll();
        return quartzConfigList;
    }

    @Override
    public QuartzConfig findById(long id) {
        return quartzConfigMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateJob(long id, String cron, String msg) {
        return quartzConfigMapper.updateMsgByPK(id,cron,msg);
    }

    @Override
    public int updateJobStatus(long id, int status) {
        return quartzConfigMapper.updateStatusByPK(id,status);
    }
}
