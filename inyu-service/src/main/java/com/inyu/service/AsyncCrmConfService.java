package com.inyu.service;

import com.inyu.entity.CrmConfig;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCrmConfService {
    List<CrmConfig> getCrmConfList();
    CrmConfig getCrmConfById(int confId);
    int addCustomer(CrmConfig conf);
    int updateCrmConf(CrmConfig conf);
}
