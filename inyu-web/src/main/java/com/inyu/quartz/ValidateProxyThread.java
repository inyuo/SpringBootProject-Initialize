package com.inyu.quartz;

import com.inyu.common.DateUtil;
import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncQuartzProxyService;
import com.inyu.service.utils.MyHttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 验证代理
 *
 * @author : jingo
 * @version V1.0
 * @Project: jingo
 * @Package com.inyu.quartz
 * @Description: TODO
 * @date Date : 2018年07月16日 下午 10:02
 */
public class ValidateProxyThread implements Runnable {
    private static Logger logger = LoggerFactory.getLogger(ScheduleTask1.class);

    @Autowired
    private AsyncQuartzProxyService asyncQuartzProxyService;
    /**
     * 队列 存储待验证的代理池
     */
    public static Queue<QuartzProxy> proxyQuene = new LinkedBlockingQueue();

    String baidu = "https://www.baidu.com/";

    /**
     * 验证代理
     */
    @Override
    public void run() {
        synchronized (proxyQuene) {
            logger.info("==== 定时任务实现类（代理验证）ScheduleTask ====> 开启!" + DateUtil.getStringToday());
            if (!CollectionUtils.isEmpty(proxyQuene)) {
                logger.info("==== 定时任务-代理验证===> 进行中，队列剩余：" + proxyQuene.size() + "，当前时间：" + DateUtil.getStringToday());
            } else {
                List<QuartzProxy> proxyList = asyncQuartzProxyService.getProxyList();
                proxyQuene.addAll(proxyList);
            }
            while (proxyQuene.size() > 0) {
                QuartzProxy proxy = proxyQuene.poll();
                proxy.setLastValidate(DateUtil.getSqlDateShort());
                //获取页面
                String proxyPage = MyHttpUtils.sendGet(baidu, null, proxy);
                if (!proxyPage.contains("<!--STATUS OK-->")) {
                    proxy.setStatus(1);
                } else {
                    proxy.setStatus(0);
                }
                asyncQuartzProxyService.updateProxy(proxy);
            }
        }

    }

}
