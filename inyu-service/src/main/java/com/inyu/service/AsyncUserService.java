package com.inyu.service;

import com.inyu.entity.Crm_User;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncUserService {
    Crm_User login(Crm_User user);
    List<Crm_User> getUserList();
    Crm_User getUserInfo(Long uid);
    Crm_User validate(Crm_User user);

    Crm_User addUser(Crm_User addUser);
    boolean delUserById(long userId);
}
