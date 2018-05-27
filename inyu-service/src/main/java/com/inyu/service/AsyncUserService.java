package com.inyu.service;

import com.inyu.entity.CrmUser;

import java.awt.print.Pageable;
import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncUserService {
    CrmUser login(CrmUser user);
    List<CrmUser> getUserList(String name,Pageable apge);
    CrmUser getUserInfo(Long uid);
    CrmUser validate(CrmUser user);

    int addUser(CrmUser addUser);

    boolean delUserById(long userId);
    boolean delUserByIds(List<Long> userIds);
}
