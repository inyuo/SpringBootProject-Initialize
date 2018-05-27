package com.inyu.service.impl;

import com.inyu.entity.CrmUser;
import com.inyu.service.AsyncUserService;
import com.inyu.dal.custom.CrmUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import java.awt.print.Pageable;
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
    CrmUserMapper crmUserMapper;

    /**
     * 登录验证
     *
     * @param user
     * @return
     */
    @Override
    public CrmUser login(CrmUser user) {
        return crmUserMapper.login(user.getName(), user.getPassword());
    }

    /**
     * 获取用户列表
     *
     * @return
     */
    @Override
    public List<CrmUser> getUserList(String name, Pageable page) {

        List<CrmUser> crmUsers = crmUserMapper.selectAll();
        return null;
    }

    /**
     * 获取用户信息ById
     *
     * @param uid
     * @return
     */
    @Override
    public CrmUser getUserInfo(Long uid) {
        return crmUserMapper.selectByPrimaryKey(uid);
    }

    /**
     * 验证用户名是否占用
     *
     * @param user
     * @return
     */
    @Override
    public CrmUser validate(CrmUser user) {
        return crmUserMapper.validateUserName(user.getName());
    }

    /**
     * 添加用户
     *
     * @param addUser
     * @return
     */

    @Override
    public int addUser(CrmUser addUser) {
        return transactionTemplate.execute(new TransactionCallback<Integer>() {
            @Override
            public Integer doInTransaction(TransactionStatus transactionStatus) {
                int save = crmUserMapper.insert(addUser);
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
            crmUserMapper.deleteByPrimaryKey(userId);
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
                        crmUserMapper.deleteByPrimaryKey(userId);
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
