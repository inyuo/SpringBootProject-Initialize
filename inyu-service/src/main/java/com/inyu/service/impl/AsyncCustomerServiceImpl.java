package com.inyu.service.impl;

import com.inyu.common.DateUtil;
import com.inyu.entity.CrmCustomer;
import com.inyu.service.AsyncCustomerService;
import com.inyu.repo.CrmCustomerMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.sql.Date;
import java.util.List;

/**
 * 用户接口
 * Created by jinyu on 2018/3/21/021.
 */
@Service
public class AsyncCustomerServiceImpl implements AsyncCustomerService {

    private Logger logger= LoggerFactory.getLogger(AsyncCustomerServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    CrmCustomerMapper crmCustomerMapper;

    @Override
    public List<CrmCustomer> getCustomerList() {
        List<CrmCustomer> customers = crmCustomerMapper.selectAll();
        return customers;
    }

    @Override
    public CrmCustomer getCustomerInfo(int id) {
        return crmCustomerMapper.selectByPrimaryKey(id);
    }

    @Override
    public CrmCustomer getCustomerInfoByIndustry(String industry) {
        return crmCustomerMapper.queryCustomerInfoByIndustry(industry);
    }

    @Override
    public int addCustomer(CrmCustomer customer) {
       CrmCustomer CrmCustomer = checkCustomer(customer);
        return crmCustomerMapper.insert(customer);
    }

    //设置默认属性
    private CrmCustomer checkCustomer(CrmCustomer customer) {
        customer.setContactsId(1);
        customer.setCreateTime((Date) DateUtil.getNowDateShort());
        customer.setUpdateTime((Date) DateUtil.getNowDateShort());
        customer.setLevel(0);
        customer.setIsLocked(0);
        customer.setOrigin("splider");
        customer.setOwnership("default");
        customer.setRating("0");

        return customer;
    }

    @Override
    public boolean delCustomerById(int cid) {
        try {
            crmCustomerMapper.deleteByPrimaryKey(cid);
            return Boolean.TRUE;
        }catch (Exception e){
            return Boolean.FALSE;
        }
    }
}
