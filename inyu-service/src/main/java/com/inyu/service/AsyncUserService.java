package com.inyu.service;

import com.inyu.common.PageBean;
import com.inyu.entity.CrmUser;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncUserService {
    CrmUser login(CrmUser user);
    PageBean<CrmUser> getUserList(String name, Integer currentPage, Integer pageSize);
    CrmUser getUserInfo(Long uid);
    CrmUser validate(CrmUser user);

    int addUser(CrmUser addUser);

    boolean delUserById(long userId);
    boolean delUserByIds(List<Long> userIds);
}
