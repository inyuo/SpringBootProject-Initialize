package com.inyu.spider;


import com.inyu.entity.Crm_Customer;
import com.inyu.repo.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class HuangYeSpider {

    @Autowired
    CustomerRepository customerRepository;

    public boolean insertCustomers(List<Crm_Customer> customerList){

        return false;
    }

}
