package com.inyu.service.impl;

import com.inyu.entity.Crm_Config;
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
    public List<Crm_Config> getCrmConfList() {
        return crmConfRepository.findAll();
    }

    @Override
    public Crm_Config getCrmCongById(long confId) {
        return crmConfRepository.findOne(confId);
    }

    @Override
    public Crm_Config addCustomer(Crm_Config conf) {
        return crmConfRepository.save(conf);
    }

    @Override
    public boolean delCustomerById(long confId) {
        try {
            crmConfRepository.delete(confId);
            return true;
        }catch (Exception e){
            logger.error("save crmConf error!",e);
            return false;
        }
    }

    @Override
    public Crm_Config updateCrmConf(Crm_Config conf) {
        return crmConfRepository.saveAndFlush(conf);
    }
}
