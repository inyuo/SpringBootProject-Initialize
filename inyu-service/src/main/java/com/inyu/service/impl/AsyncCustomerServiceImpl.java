package com.inyu.service.impl;

import com.inyu.common.DateUtil;
import com.inyu.entity.CrmCustomer;
import com.inyu.repo.CustomerRepository;
import com.inyu.service.AsyncCustomerService;
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
    CustomerRepository customerRepository;

    @Override
    public List<CrmCustomer> getCustomerList() {
        List<CrmCustomer> customers = customerRepository.findAll();
        return customers;
    }

    @Override
    public CrmCustomer getCustomerInfo(int id) {
        return customerRepository.findOne(id);
    }

    @Override
    public CrmCustomer getCustomerInfoByIndustry(String industry) {
        return customerRepository.getCustomerInfoByIndustry(industry);
    }

    @Override
    public CrmCustomer addCustomer(CrmCustomer customer) {
       CrmCustomer CrmCustomer = checkCustomer(customer);
        return customerRepository.save(customer);
    }

    //设置默认属性
    private CrmCustomer checkCustomer(CrmCustomer customer) {
        customer.setContactsId(1l);
        customer.setCreateTime((Date) DateUtil.getNowDateShort());
        customer.setUpdateTime((Date) DateUtil.getNowDateShort());
        customer.setLevel(0l);
        customer.setIsLocked(0l);
        customer.setOrigin("splider");
        customer.setOwnership("default");
        customer.setRating("0");

        return customer;
    }

    @Override
    public boolean delCustomerById(int cid) {
        try {
            customerRepository.delete(cid);
            return Boolean.TRUE;
        }catch (Exception e){
            return Boolean.FALSE;
        }
    }
}
