package com.inyu.dal.master;

import com.inyu.entity.CrmActionLog;
import java.util.List;

public interface CrmActionLogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(CrmActionLog record);

    CrmActionLog selectByPrimaryKey(Integer logId);

    List<CrmActionLog> selectAll();

    int updateByPrimaryKey(CrmActionLog record);
}