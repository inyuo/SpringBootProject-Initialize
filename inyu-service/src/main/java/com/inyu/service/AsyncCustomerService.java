package com.inyu.service;

import com.inyu.entity.Crm_Customer;
import com.inyu.entity.Crm_User;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCustomerService {
    List<Crm_Customer> getCustomerList();
    Crm_Customer getCustomerInfo(int id);
    Crm_Customer getCustomerInfoByName(String name);

    Crm_Customer addCustomer(Crm_Customer customer);
    boolean delCustomerById(int userId);
}
