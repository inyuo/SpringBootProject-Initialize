package com.inyu.service;

import com.inyu.entity.CrmActionLog;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncCrmActionLogService {
    List<CrmActionLog> getActionLogList();
    CrmActionLog getActionLogById(int id);
    int saveActionLog(CrmActionLog actionLog);
    int updateCrmConf(CrmActionLog actionLog);
}
