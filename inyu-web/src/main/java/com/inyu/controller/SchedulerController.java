package com.inyu.controller;

import com.inyu.common.BasicResult;
import com.inyu.quartz.MySchedulerFactory;
import com.inyu.service.AsyncQuartzConfService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2018/3/20/020.
 */

@Api(value = "调度信息", description = "调度任务管理")
@RestController
@CrossOrigin
@RequestMapping("/quartz/*")
public class SchedulerController {

    private Logger logger = LoggerFactory.getLogger(getClass().getName());

    //激活状态码
    private static final int ACTIVE_CODE=0;
    //停止状态码
    private static final int PAUSE_CODE=1;

    //事务模版
    @Autowired
    private TransactionTemplate transactionTemplate;

    @Autowired
    AsyncQuartzConfService asyncQuartzConfService;

    @Autowired
    MySchedulerFactory mySchedulerFactory;

    @ApiOperation("获取所有任务")
    @GetMapping("list")
    public BasicResult list(@ApiParam("当前页：queryObj") @RequestParam(value = "queryObj", required = false) String queryObj,
                            @ApiParam("当前页：currentPage") @RequestParam(value = "currentPage", required = true) String currentPage,
                            @ApiParam("每页多少条：pageSize") @RequestParam(value = "pageSize", required = true) String pageSize) {
        try {
            return BasicResult.isOk().data(asyncQuartzConfService.getJobList());
        } catch (Exception e) {
            logger.error("获取所有任务！", e);
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("更新任务")
    @PostMapping("edit")
    public BasicResult editJob(@ApiParam("ID：id") @RequestParam(value = "id", required = true) long id,
                               @ApiParam("CRON：cron") @RequestParam(value = "cron", required = true) String cron,
                               @ApiParam("信息：msg") @RequestParam(value = "msg", required = true) String msg) {
        try {
            return BasicResult.isOk().data(asyncQuartzConfService.updateJob(id, cron, msg));
        } catch (Exception e) {
            logger.error("更新任务失败！", e);
            return BasicResult.isFail(e);
        }
    }

    @ApiOperation("暂停任务")
    @PostMapping("pausejob")
    public BasicResult pausejob(@ApiParam("ID：id") @RequestParam(value = "id", required = true) long id) {

        return transactionTemplate.execute(new TransactionCallback<BasicResult>() {
            @Override
            public BasicResult doInTransaction(TransactionStatus transactionStatus) {
                try {
                    mySchedulerFactory.pauseJob(id);
                    asyncQuartzConfService.updateJobStatus(id,PAUSE_CODE);
                } catch (Exception e) {
                    logger.error("暂停任务失败！", e);
                    transactionStatus.setRollbackOnly();
                    return BasicResult.isFail(e);
                }
                return BasicResult.isOk();
            }
        });
    }


    @ApiOperation("恢复任务")
    @PostMapping("resumejob")
    public BasicResult resumeJob(@ApiParam("ID：id") @RequestParam(value = "id", required = true) long id) {
        return transactionTemplate.execute(new TransactionCallback<BasicResult>() {

            @Override
            public BasicResult doInTransaction(TransactionStatus transactionStatus) {
                try {
                    mySchedulerFactory.resumeJob(id);
                    asyncQuartzConfService.updateJobStatus(id,ACTIVE_CODE);
                } catch (Exception e) {
                    logger.error("暂停任务失败！", e);
                    transactionStatus.setRollbackOnly();
                    return BasicResult.isFail(e);
                }
                return BasicResult.isOk();
            }
        });

    }
}
