package com.inyu.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.inyu.common.DateUtil;
import com.inyu.common.PageBean;
import com.inyu.dal.master.CrmCustomerMapper;
import com.inyu.entity.CrmCustomer;
import com.inyu.service.AsyncCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.sql.Date;

/**
 * 用户接口
 * Created by inyu on 2018/3/21/021.
 */
@Service
public class AsyncCustomerServiceImpl implements AsyncCustomerService {


    private Logger logger = LoggerFactory.getLogger(AsyncCustomerServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    CrmCustomerMapper crmCustomerMapper;

    @Override
    public PageBean<CrmCustomer> getCustomerList(String queryObj, Integer currentPage, Integer pageSize) {
        //设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
        PageHelper.startPage(currentPage, pageSize);
        Page<CrmCustomer> crmCustomers = crmCustomerMapper.selectAll();
        int totalCounnt = crmCustomers.size();            //总记录数
        PageBean<CrmCustomer> pageData = new PageBean<>(currentPage, pageSize, totalCounnt,Boolean.TRUE );
        pageData.setItemList(crmCustomers);
        return pageData;
    }

    @Override
    public CrmCustomer getCustomerInfo(int id) {
        return crmCustomerMapper.selectByPrimaryKey(id);
    }

    @Override
    public CrmCustomer getCustomerInfoByIndustry(String industry) {
        return crmCustomerMapper.queryCustomerInfoByIndustry(industry);
    }

    @Override
    public int addCustomer(CrmCustomer customer) {
        CrmCustomer CrmCustomer = checkCustomer(customer);
        return crmCustomerMapper.insert(customer);
    }

    //设置默认属性
    private CrmCustomer checkCustomer(CrmCustomer customer) {
        customer.setContactsId(1);
        customer.setCreateTime((Date) DateUtil.getNowDateShort());
        customer.setUpdateTime((Date) DateUtil.getNowDateShort());
        customer.setLevel(0);
        customer.setIsLocked(0);
        customer.setOrigin("splider");
        customer.setOwnership("default");
        customer.setRating("0");

        return customer;
    }

    @Override
    public boolean delCustomerById(int cid) {
        try {
            crmCustomerMapper.deleteByPrimaryKey(cid);
            return Boolean.TRUE;
        } catch (Exception e) {
            return Boolean.FALSE;
        }
    }
}
