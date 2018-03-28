package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.entity.Crm_User;
import com.inyu.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/3/20/020.
 */

@Api(value = "用户信息",description = "用户登录、登出，信息验证")
@RestController
@CrossOrigin
@RequestMapping("/user/*")
public class UserController {

    @Autowired
    UserService userService;

    @ApiOperation("登录")
    @PostMapping(value = "login")
    public BasicResult login(@ApiParam("用户名：username")@RequestParam(value = "username",required = true)String username,
                             @ApiParam("密码：password")@RequestParam(value = "password",required = true)String password,
                             HttpServletRequest request, HttpServletResponse response) {
        try {
            Crm_User loginUser = new Crm_User();
            loginUser.setName(username);
            loginUser.setPassword(password);
            Crm_User userInfo = userService.login(loginUser);
            HttpSession session = request.getSession();
            session.setAttribute("userInfo",userInfo);
            Cookie uidCookie = new Cookie("uid",userInfo.getUser_Id()+"");
            uidCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(uidCookie);
            return BasicResult.isOk().data(userInfo);
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("获取所有用户")
    @GetMapping("list")
    public BasicResult list(@ApiParam("当前页：queryObj")@RequestParam(value = "queryObj",required = true)String queryObj,
                            @ApiParam("当前页：currentPage")@RequestParam(value = "currentPage",required = true)String currentPage,
                            @ApiParam("每页多少条：pageSize")@RequestParam(value = "pageSize",required = true)String pageSize) {
        try {
            return BasicResult.isOk().data(userService.getUserList());
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("获取当前用户")
    @PostMapping("getCurrentUser")
    public BasicResult getCurrentUser(HttpServletRequest request) {
        try {
            String uid="";
            // 1.获取cookie的值
            Cookie[] cookies = request.getCookies();
            // 2.判断cookie数组是否为null
            if (cookies != null) {
                // 3.判断cookie中是否有用户名和密码
                for (int i = 0; i < cookies.length; i++) {
                    if ("uid".equals(cookies[i].getName())) {
                        // 4.如果cookie中有用户名和密码，就获取
                        uid = cookies[i].getValue();
                        break;
                    }
                }
            }
            Crm_User userInfo = userService.getUserInfo(uid);
            request.getSession().setAttribute("userInfo",userInfo);
            if (userInfo!=null){
                return BasicResult.isOk().data(userService.getUserInfo(uid));
            }
            return BasicResult.isFail();
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("添加用户")
    @PostMapping("addUser")
    public BasicResult addUser(@ApiParam("用户名：username")@RequestParam(value = "username",required = true)String username,
                             @ApiParam("密码：password")@RequestParam(value = "password",required = true)String password,
                             HttpServletRequest request, HttpServletResponse response) {
        try {
            Crm_User addUser = new Crm_User();
            addUser.setName(username);
            addUser.setPassword(password);
            Crm_User userValidate = userService.validate(addUser);
            if (userValidate!=null){
                return BasicResult.isFail().msg(new Throwable("用户名已被占用！"));
            }
            Crm_User userInfo = userService.addUser(addUser);
            HttpSession session = request.getSession();
            session.setAttribute("userInfo",userInfo);
            Cookie uidCookie = new Cookie("uid",userInfo.getUser_Id()+"");
            uidCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(uidCookie);
            return BasicResult.isOk().data(userInfo);
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }
}
