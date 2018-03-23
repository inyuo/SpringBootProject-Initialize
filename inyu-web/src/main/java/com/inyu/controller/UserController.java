package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.entity.User;
import com.inyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2018/3/20/020.
 */
@RestController
@CrossOrigin
@RequestMapping("/user/*")
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("login")
    public BasicResult login(@RequestParam(value = "username",required = true)String username,
                            @RequestParam(value = "password",required = true)String password) {
        try {
            User loginUser = new User();
            loginUser.setUsername(username);
            loginUser.setPassword(password);
            return BasicResult.isOk().data(userService.login(loginUser));
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }

    @GetMapping("list")
    public BasicResult list() {
        try {
            return BasicResult.isOk().data(userService.getUserList());
        } catch (Exception e) {
            return BasicResult.isFail(e);
        }
    }
}
