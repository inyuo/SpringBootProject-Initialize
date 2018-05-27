package com.inyu;

import com.alibaba.druid.support.http.StatViewServlet;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;


@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/druid/*",initParams = {
        //@WebInitParam(name = "allow",value = "127.0.0.1,192.168.1.142"),//白名单
        @WebInitParam(name = "deny",value = "126.12.22.1"),//黑名单 (存在共同时，deny优先于allow)
        @WebInitParam(name="loginUsername",value="cocos"),// 用户名
        @WebInitParam(name="loginPassword",value="cocospw"),// 密码
        @WebInitParam(name="resetEnable",value="false")// 禁用HTML页面上的“Reset All”功能


})


public class DruidStateViewServlet extends StatViewServlet {
}

