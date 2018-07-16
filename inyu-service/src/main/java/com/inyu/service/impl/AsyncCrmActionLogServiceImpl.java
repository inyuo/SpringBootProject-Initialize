package com.inyu.service.impl;

import com.inyu.dal.master.CrmActionLogMapper;
import com.inyu.entity.CrmActionLog;
import com.inyu.service.AsyncCrmActionLogService;
import com.inyu.service.ServiceTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

/**
 * @author : jingo
 * @version V1.0
 * @Project: jingo
 * @Package com.inyu.service.impl
 * @Description: TODO
 * @date Date : 2018年06月02日 下午 4:17
 */
@Service
public class AsyncCrmActionLogServiceImpl implements AsyncCrmActionLogService {

    private Logger logger= LoggerFactory.getLogger(AsyncCrmActionLogServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    ServiceTemplate serviceTemplate;

    @Autowired
    CrmActionLogMapper crmActionLogMapper;

    @Override
    public List<CrmActionLog> getActionLogList() {
        return crmActionLogMapper.selectAll();
    }

    @Override
    public CrmActionLog getActionLogById(int id) {
        return crmActionLogMapper.selectByPrimaryKey(id);
    }

    @Override
    public int saveActionLog(CrmActionLog actionLog) {
        return crmActionLogMapper.insert(actionLog);
    }

    @Override
    public int updateCrmConf(CrmActionLog actionLog) {
        return 0;
    }
}
