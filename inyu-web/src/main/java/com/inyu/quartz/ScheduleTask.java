package com.inyu.quartz;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * 定时任务实现类
 * Created by jinyu on 2018/4/12/012.
 */
@Configuration
@Component
@EnableScheduling
public class ScheduleTask implements Job{

    private static Logger logger = LoggerFactory.getLogger(ScheduleTask.class);

//    public String getTemplate(String templatename, Map<String, String> params) throws Exception {
//        UserMsgService userMsgService = SpringContext.getBean("userMsgService", UserMsgService.class);
//        String template = userMsgService.getTemplate(templatename);
//        for (String key : params.keySet()) {
//            String v = params.get(key);
//            template = template.replace("${" + key + "}", v);
//        }
//        return template;
//    }
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
//        logger.info("==== 定时任务实现类（清明节活动专场提醒）ScheduleTask ====> 开启!" + DateUtils.getCurrentDate("yyyy-MM-dd HH:mm:ss"));

//        UserService userService= SpringContext.getBean("userService",UserService.class);
//        UserMsgService userMsgService= SpringContext.getBean("userMsgService",UserMsgService.class);

        try {
            System.out.println("任务执行！");

//            List<User> userList = userService.getAllUsers();
//            String msg = getTemplate("qingmingregard", new HashMap<String, String>());
//
//            for (User user : userList) {
//                userMsgService.addMsg(user.getId(), 1, 1, "【系统通知】", msg);
//            }

        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }
}
