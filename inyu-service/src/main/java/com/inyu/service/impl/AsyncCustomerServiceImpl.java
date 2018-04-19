package com.inyu.service.impl;

import com.inyu.entity.Crm_Customer;
import com.inyu.entity.Crm_User;
import com.inyu.repo.CustomerRepository;
import com.inyu.repo.UserRepository;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

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
    public List<Crm_Customer> getCustomerList() {
        List<Crm_Customer> customers = customerRepository.findAll();
        return customers;
    }

    @Override
    public Crm_Customer getCustomerInfo(int id) {
        return null;
    }

    @Override
    public Crm_Customer addCustomer(Crm_Customer addUser) {
        return null;
    }

    @Override
    public boolean delCustomerById(long userId) {
        return false;
    }
}
