package com.inyu.service.impl;

import com.inyu.entity.CrmConfig;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.dal.master.CrmConfigMapper;
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
    CrmConfigMapper crmConfigMapper;

    @Override
    public List<CrmConfig> getCrmConfList() {
        return crmConfigMapper.selectAll();
    }

    @Override
    public CrmConfig getCrmConfById(int confId) {
        return crmConfigMapper.selectByPrimaryKey(confId);
    }

    @Override
    public int addCustomer(CrmConfig conf) {
        return crmConfigMapper.insert(conf);
    }

    @Override
    public int updateCrmConf(CrmConfig conf) {
        return crmConfigMapper.updateByPrimaryKey(conf);
    }
}
