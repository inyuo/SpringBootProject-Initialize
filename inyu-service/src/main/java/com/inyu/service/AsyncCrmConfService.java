package com.inyu.service;

import com.inyu.entity.Crm_Config;
import com.inyu.entity.Crm_Customer;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCrmConfService {
    List<Crm_Config> getCrmConfList();
    Crm_Config getCrmCongById(long confId);
    Crm_Config addCustomer(Crm_Config conf);
    boolean delCustomerById(long confId);
    Crm_Config updateCrmConf(Crm_Config conf);
}
