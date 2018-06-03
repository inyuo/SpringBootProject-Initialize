package com.inyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.inyu.common.PageBean;
import com.inyu.dal.custom.CrmUserMapper;
import com.inyu.entity.CrmUser;
import com.inyu.service.AsyncUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口
 * Created by jinyu on 2018/3/21/021.
 */
@Service
public class AsyncUserServiceImpl  implements AsyncUserService {

    private Logger logger = LoggerFactory.getLogger(AsyncUserServiceImpl.class);



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
    public PageBean<CrmUser> getUserList(String name, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<CrmUser> userList = crmUserMapper.selectAll();
        int totalNum = userList.size();            //总记录数
        PageBean<CrmUser> pageInfo = new PageBean<>(currentPage, pageSize, totalNum,Boolean.TRUE);
        pageInfo.setItemList(userList);
        return pageInfo;
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
        try {
            return crmUserMapper.insert(addUser);
        } catch (Exception e) {
            logger.error("删除失败!", e);
            return -1;
        }
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

    @Override
    public CrmUser getUserInfoByName(String username) {
        return crmUserMapper.selectByName();
    }
}
