package com.inyu.service;

import com.inyu.common.PageBean;
import com.inyu.entity.CrmCustomer;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCustomerService {
    PageBean<CrmCustomer> getCustomerList(String queryObj, Integer currentPage, Integer pageSize);
    CrmCustomer getCustomerInfo(int id);
    CrmCustomer getCustomerInfoByIndustry(String industry);

    int addCustomer(CrmCustomer customer);
    boolean delCustomerById(int userId);
}
