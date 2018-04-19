package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncQuartzConfService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2018/3/20/020.
 */

@Api(value = "客户信息管理",description = "客户管理接口")
@RestController
@CrossOrigin
@RequestMapping("/customer/*")
public class CustomerController {

    private Logger logger = LoggerFactory.getLogger(getClass().getName());

    @Autowired
    AsyncCustomerService asyncCustomerService;

    @ApiOperation("获取所有客户")
    @GetMapping("list")
    public BasicResult list(@ApiParam("当前页：queryObj")@RequestParam(value = "queryObj",required = false)String queryObj,
                            @ApiParam("当前页：currentPage")@RequestParam(value = "currentPage",required = true)String currentPage,
                            @ApiParam("每页多少条：pageSize")@RequestParam(value = "pageSize",required = true)String pageSize) {
        try {
            return BasicResult.isOk().data(asyncCustomerService.getCustomerList());
        } catch (Exception e) {
            logger.error("获取所有用户！",e);
            return BasicResult.isFail(e);
        }
    }
}
