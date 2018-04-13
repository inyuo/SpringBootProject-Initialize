package com.inyu.service.impl;

import com.inyu.entity.Crm_User;
import com.inyu.repo.UserRepository;
import com.inyu.service.AsyncUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

/**
 * 用户接口
 * Created by jinyu on 2018/3/21/021.
 */
@Service
public class AsyncUserServiceImpl implements AsyncUserService {

    private Logger logger= LoggerFactory.getLogger(AsyncUserServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    UserRepository userRepository;

    /**
     * 登录验证
     * @param user
     * @return
     */
    @Override
    public Crm_User login(Crm_User user) {
        return userRepository.login(user.getName(),user.getPassword());
    }

    /**
     * 获取用户列表
     * @return
     */
    @Override
    public List<Crm_User> getUserList() {
        return userRepository.findAll();
    }

    /**
     * 获取用户信息ById
     * @param uid
     * @return
     */
    @Override
    public Crm_User getUserInfo(Long uid) {
        return userRepository.findOne(uid+"");
    }

    /**
     * 验证用户名是否占用
     * @param user
     * @return
     */
    @Override
    public Crm_User validate(Crm_User user) {
        return userRepository.validateUserName(user.getName());
    }

    @Override
    public Crm_User addUser(Crm_User addUser) {

        return transactionTemplate.execute(new TransactionCallback<Crm_User>() {
            @Override
            public Crm_User doInTransaction(TransactionStatus transactionStatus) {
                Crm_User save = userRepository.save(addUser);
                return save;
            }
        });
    }
}
