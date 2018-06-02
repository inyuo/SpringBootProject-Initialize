package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.common.PageBean;
import com.inyu.entity.CrmUser;
import com.inyu.entity.exception.InyuException;
import com.inyu.service.AsyncUserService;
import com.inyu.service.ServiceCallback;
import com.inyu.service.ServiceTemplate;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */

@Api(value = "用户信息",description = "用户登录、登出，信息验证")
@RestController
@CrossOrigin
@RequestMapping("/user/*")
public class UserController {
    private Logger logger = LoggerFactory.getLogger(getClass().getName());
    @Autowired
    AsyncUserService asyncUserService;
    @Autowired
    ServiceTemplate serviceTemplate;
    @ApiOperation("登录")
    @PostMapping(value = "login")
    public BasicResult login(@ApiParam("用户名：username")@RequestParam(value = "username",required = true)String username,
                             @ApiParam("密码：password")@RequestParam(value = "password",required = true)String password,
                             HttpServletRequest request, HttpServletResponse response) {
        try {
            CrmUser loginUser = new CrmUser();
            loginUser.setName(username);
            loginUser.setPassword(password);
            CrmUser userInfo = asyncUserService.login(loginUser);
            if (userInfo!=null) {
                HttpSession session = request.getSession();
                session.setAttribute("userInfo", userInfo);
                Cookie uidCookie = new Cookie("uid", userInfo.getUserId() + "");
                uidCookie.setMaxAge(60 * 60 * 24);
                response.addCookie(uidCookie);
                return BasicResult.isOk().data(userInfo);
            }else {
                throw new Exception("登陆失败");
            }
        } catch (Exception e) {
            logger.error("登陆失败！",e);
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("分页查询用户")
    @GetMapping("list")
    public BasicResult<PageBean<CrmUser>> list(@ApiParam("查询条件：name")@RequestParam(value = "name",required = false)String name,
                            @ApiParam("当前页：currentPage")@RequestParam(value = "currentPage",required = true)Integer currentPage,
                            @ApiParam("每页多少条：pageSize")@RequestParam(value = "pageSize",required = true)Integer pageSize) {
        try {
            PageBean<CrmUser> users = asyncUserService.getUserList(name, currentPage, pageSize);
            BasicResult result = BasicResult.isOk();
            result.setData(users);
            return result;
        } catch (Exception e) {
            logger.error("获取所有用户失败！",e);
            return BasicResult.isFail(e);
        }
    }



    @ApiOperation("获取当前用户")
    @GetMapping("getCurrentUser")
    public BasicResult getCurrentUser(HttpServletRequest request) {
        try {
            long uid=0l;
            // 1.获取cookie的值
            Cookie[] cookies = request.getCookies();
            // 2.判断cookie数组是否为null
            if (cookies != null) {
                // 3.判断cookie中是否有用户名和密码
                for (int i = 0; i < cookies.length; i++) {
                    if ("uid".equals(cookies[i].getName())) {
                        // 4.如果cookie中有用户名和密码，就获取
                        uid = Long.parseLong(cookies[i].getValue());
                        break;
                    }
                }
            }
            CrmUser userInfo = asyncUserService.getUserInfo(uid);
            request.getSession().setAttribute("userInfo",userInfo);
            if (userInfo!=null){
                return BasicResult.isOk().data(asyncUserService.getUserInfo(uid));
            }
            return BasicResult.isFail();
        } catch (Exception e) {
            logger.error("获取当前用户失败！",e);
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("添加用户")
    @PostMapping("add")
    public BasicResult addUser(@ApiParam("User Model：addUser")@RequestBody CrmUser addUser) {
        return serviceTemplate.execute(Integer.class,new ServiceCallback<BasicResult>(){
            @Override
            public void doLock() {

            }

            @Override
            public void check() {
                if (addUser ==null){
                    logger.error("添加记录为空");
                    throw new  InyuException("Invalid Params","入参为空");
                }
            }

            @Override
            public BasicResult executeService() {
                int save = asyncUserService.addUser(addUser);
                if (save>=1){
                    return BasicResult.isOk();
                }else {
                    return BasicResult.isFail().msg("添加用户失败！");
                }
            }
        });
    }


    @ApiOperation("删除用户")
    @PostMapping("remove")
    public BasicResult removeUser(@ApiParam("用户id：userId")@RequestParam long userId) {
        try {
            boolean bool = asyncUserService.delUserById(userId);
            if (!bool){
                return BasicResult.isFail();
            }
        } catch (Exception e) {
            logger.error("删除用户失败！",e);
            return BasicResult.isFail(e);
        }
        return BasicResult.isOk();
    }

    @ApiOperation("批量删除用户")
    @PostMapping("removeUserList")
    public BasicResult removeUser(@ApiParam("用户id：userIds")@RequestParam(value = "userIds",required = true)List userIds) {
        return serviceTemplate.execute(Integer.class, new ServiceCallback<BasicResult>() {
            @Override
            public void doLock() {
            }

            @Override
            public void check() {
                if (CollectionUtils.isEmpty(userIds)) {
                    logger.error("删除id列表为空");
                    throw new InyuException("Invalid Params", "入参为空");
                }
            }

            @Override
            public BasicResult executeService() {
                boolean ret = asyncUserService.delUserByIds(userIds);
                if (ret) {
                    return BasicResult.isOk();
                } else {
                    return BasicResult.isFail().msg("添加用户失败！");
                }
            }
        });
    }
}
