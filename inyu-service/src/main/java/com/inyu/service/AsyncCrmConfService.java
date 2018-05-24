package com.inyu.service;

import com.inyu.entity.CrmConfig;
import com.inyu.entity.CrmCustomer;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCrmConfService {
    List<CrmConfig> getCrmConfList();
    CrmConfig getCrmConfById(long confId);
    CrmConfig addCustomer(CrmConfig conf);
    CrmConfig updateCrmConf(CrmConfig conf);
}
