package com.inyu.service.impl;

import com.inyu.entity.CrmUser;
import com.inyu.repo.UserRepository;
import com.inyu.service.AsyncUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * 用户接口
 * Created by jinyu on 2018/3/21/021.
 */
@Service
public class AsyncUserServiceImpl
        implements AsyncUserService {

    private Logger logger = LoggerFactory.getLogger(AsyncUserServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    UserRepository userRepository;

    /**
     * 登录验证
     *
     * @param user
     * @return
     */
    @Override
    public CrmUser login(CrmUser user) {
        return userRepository.login(user.getName(), user.getPassword());
    }

    /**
     * 获取用户列表
     *
     * @return
     */
    @Override
    public Page<CrmUser> getUserList(String name, Pageable page) {
        Specification<CrmUser> spec = new Specification<CrmUser>() {
            @Override
            public Predicate toPredicate(Root<CrmUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Path<String> name = root.get("name");
                Predicate predicate = cb.like(name, "%" + name + "%");
                return predicate;
            }
        };
        Page<CrmUser> all = userRepository.findAll(spec, page);
        return all;
    }

    /**
     * 获取用户信息ById
     *
     * @param uid
     * @return
     */
    @Override
    public CrmUser getUserInfo(Long uid) {
        return userRepository.findOne(uid);
    }

    /**
     * 验证用户名是否占用
     *
     * @param user
     * @return
     */
    @Override
    public CrmUser validate(CrmUser user) {
        return userRepository.validateUserName(user.getName());
    }

    /**
     * 添加用户
     *
     * @param addUser
     * @return
     */

    @Override
    public CrmUser addUser(CrmUser addUser) {
        return transactionTemplate.execute(new TransactionCallback<CrmUser>() {
            @Override
            public CrmUser doInTransaction(TransactionStatus transactionStatus) {
                CrmUser save = userRepository.save(addUser);
                return save;
            }
        });
    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    public boolean delUserById(long userId) {
        try {
            userRepository.delete(userId);
        } catch (Exception e) {
            logger.error("删除失败!", e);
            return false;
        }
        return true;
    }

    /**
     * 批量删除用户
     *
     * @param userIds
     * @return
     */
    @Override
    public boolean delUserByIds(List<Long> userIds) {
        return transactionTemplate.execute(new TransactionCallback<Boolean>() {
            @Override
            public Boolean doInTransaction(TransactionStatus transactionStatus) {
                try {
                    for (Long userId : userIds) {
                        userRepository.delete(userId);
                    }
                    logger.info("批量删除用户:ids" + userIds);
                    return true;
                } catch (Exception e) {
                    logger.error("批量删除用户出错", e);
                    return false;
                }
            }
        });
    }
}
