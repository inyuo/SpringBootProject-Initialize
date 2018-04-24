package com.inyu.service.impl;

import com.inyu.common.DateUtil;
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
    public List<Crm_Customer> getCustomerList() {
        List<Crm_Customer> customers = customerRepository.findAll();
        return customers;
    }

    @Override
    public Crm_Customer getCustomerInfo(int id) {
        return customerRepository.findOne(id);
    }

    @Override
    public Crm_Customer getCustomerInfoByName(String name) {
        return customerRepository.getCustomerInfoByName(name);
    }

    @Override
    public Crm_Customer addCustomer(Crm_Customer customer) {
       Crm_Customer crm_customer = checkCustomer(customer);
        return customerRepository.save(customer);
    }

    //设置默认属性
    private Crm_Customer checkCustomer(Crm_Customer customer) {
        customer.setCreator_Role_Id(1l);
        customer.setCreate_Time((Date) DateUtil.getNowDateShort());
        customer.setUpdate_Time((Date) DateUtil.getNowDateShort());
        customer.setLevel(0l);
        customer.setIs_Locked(0l);
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
