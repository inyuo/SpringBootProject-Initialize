package com.inyu.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2018/3/20/020.
 */

@Api(value = "客户信息管理",description = "客户管理接口")
@RestController
@CrossOrigin
@RequestMapping("/customer/*")
public class CustomerController {
}
