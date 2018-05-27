package com.inyu.service;

import com.inyu.entity.CrmCustomer;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCustomerService {
    List<CrmCustomer> getCustomerList();
    CrmCustomer getCustomerInfo(int id);
    CrmCustomer getCustomerInfoByIndustry(String industry);

    int addCustomer(CrmCustomer customer);
    boolean delCustomerById(int userId);
}
