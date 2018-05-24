package com.inyu.service;

import com.inyu.entity.CrmUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncUserService {
    CrmUser login(CrmUser user);
    Page<CrmUser> getUserList(String name,Pageable apge);
    CrmUser getUserInfo(Long uid);
    CrmUser validate(CrmUser user);

    CrmUser addUser(CrmUser addUser);

    boolean delUserById(long userId);
    boolean delUserByIds(List<Long> userIds);
}
