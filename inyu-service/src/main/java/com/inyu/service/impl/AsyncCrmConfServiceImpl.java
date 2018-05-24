package com.inyu.service.impl;

import com.inyu.entity.CrmConfig;
import com.inyu.entity.CrmCustomer;
import com.inyu.repo.CrmConfRepository;
import com.inyu.service.AsyncCrmConfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

/**
 *
 */
@Service
public class AsyncCrmConfServiceImpl implements AsyncCrmConfService {
    private Logger logger= LoggerFactory.getLogger(AsyncCrmConfServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    CrmConfRepository crmConfRepository;

    @Override
    public List<CrmConfig> getCrmConfList() {
        return crmConfRepository.findAll();
    }

    @Override
    public CrmConfig getCrmConfById(long confId) {
        return crmConfRepository.findOne(confId);
    }

    @Override
    public CrmConfig addCustomer(CrmConfig conf) {
        return crmConfRepository.save(conf);
    }

    @Override
    public CrmConfig updateCrmConf(CrmConfig conf) {
        return crmConfRepository.saveAndFlush(conf);
    }
}
