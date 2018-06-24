package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.common.PageBean;
import com.inyu.entity.CrmCustomer;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.ServiceTemplate;
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
public class CustomerController extends AbstractController  {

    private Logger logger = LoggerFactory.getLogger(getClass().getName());
    @Autowired
    ServiceTemplate serviceTemplate;
    @Autowired
    AsyncCustomerService asyncCustomerService;

    @ApiOperation("获取所有客户")
    @GetMapping("list")
    public BasicResult list(@ApiParam("当前页：queryObj")@RequestParam(value = "queryObj",required = false)String queryObj,
                            @ApiParam("当前页：currentPage")@RequestParam(value = "currentPage",required = true)Integer currentPage,
                            @ApiParam("每页多少条：pageSize")@RequestParam(value = "pageSize",required = true)Integer pageSize) {
        PageBean<CrmCustomer> customerBean = asyncCustomerService.getCustomerList(queryObj,currentPage,pageSize);
        BasicResult result = BasicResult.isOk();
        result.setData(customerBean);
        return result;
       /* return serviceTemplate.execute(BasicResult.class,new ServiceCallback<BasicResult>(){

            @Override
            public void doLock() {
            }

            @Override
            public void check() {
            }

            @Override
            public BasicResult executeService() {

                PageBean<CrmCustomer> customerBean = asyncCustomerService.getCustomerList(queryObj,currentPage,pageSize);
                BasicResult result = BasicResult.isOk();
                result.setData(customerBean);
                return result;
            }
        });*/
    }

    @ApiOperation("删除客户")
    @PostMapping("remove")
    public BasicResult removeCustomer(@ApiParam("客户id：customerId")@RequestParam int customerId) {
        try {
            boolean bool = asyncCustomerService.delCustomerById(customerId);
            if (!bool){
                return BasicResult.isFail();
            }
        } catch (Exception e) {
            logger.error("删除客户失败！",e);
            return BasicResult.isFail(e);
        }
        return BasicResult.isOk();
    }

}
