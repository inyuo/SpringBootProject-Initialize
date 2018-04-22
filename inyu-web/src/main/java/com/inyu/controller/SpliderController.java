package com.inyu.controller;


import com.inyu.common.BasicResult;
import com.inyu.service.AsyncSpliderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value = "爬虫信息", description = "爬虫信息管理")
@RestController
@CrossOrigin
@RequestMapping("/splider/*")
public class SpliderController {

    private Logger logger = LoggerFactory.getLogger(getClass().getName());

    @Autowired
    private AsyncSpliderService asyncSpliderService;
    private static long baseCounter =4l;

    @ApiOperation("开启")
    @PostMapping(value = "start")
    public BasicResult startSplider() {
        try {
            while (baseCounter!=999) {
                final String baseUrl = "https://www.11467.com/guangzhou/co/"+baseCounter+".htm";
                boolean pageInfo = asyncSpliderService.getPageInfo(baseUrl, "");
                baseCounter++;
                Thread.sleep(500);
            }
            return BasicResult.isOk();
        } catch (Exception e) {
            logger.error("开启失败！",e);
            return BasicResult.isFail(e);
        }
    }
}
