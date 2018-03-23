package com.inyu.service;

import com.inyu.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface UserService {
    User login(User user);
    List<User> getUserList();
}
