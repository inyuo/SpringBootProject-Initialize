package com.inyu.controller;


import com.inyu.common.BasicResult;
import com.inyu.service.AsyncCrmConfService;
import com.inyu.service.AsyncCustomerService;
import com.inyu.service.AsyncSpliderService;
import com.inyu.service.thread.MySpliderThread;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Api(value = "爬虫信息", description = "爬虫信息管理")
@RestController
@CrossOrigin
@RequestMapping("/splider/*")
public class SpliderController {

    private Logger logger = LoggerFactory.getLogger(getClass().getName());
    ExecutorService pool = Executors.newFixedThreadPool(5);

    @Autowired
    private AsyncSpliderService asyncSpliderService;
//    @Autowired
//    private AsyncCustomerService asyncCustomerService;
    private static int counter = 20;

    @ApiOperation("开启")
    @PostMapping(value = "start")
    public BasicResult startSplider() {
        try {
            //创建固定大小的线程池
            ExecutorService exec = Executors.newFixedThreadPool(5);
            while (counter<1000){
                synchronized (this) {
//                    exec.execute(new MySpliderThread());
                    asyncSpliderService.getPageInfo("","");
                    Thread.sleep(1000);
                    counter++;
                }
                exec.shutdown();
            }
            return BasicResult.isOk();
        } catch (Exception e) {
            logger.error("开启失败！",e);
            return BasicResult.isFail(e);
        }
    }
}
