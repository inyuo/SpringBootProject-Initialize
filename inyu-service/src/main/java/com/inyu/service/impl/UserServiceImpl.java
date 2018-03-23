package com.inyu.service.impl;

import com.inyu.entity.User;
import com.inyu.repo.UserRepository;
import com.inyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jinyu on 2018/3/21/021.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;
    @Override
    public User login(User user) {
        return userRepository.login(user.getUsername(),user.getPassword());
    }

    @Override
    public List<User> getUserList() {
        return userRepository.findAll();
    }
}
