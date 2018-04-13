package com.inyu.service;

import com.inyu.entity.Quartz_Config;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface AsyncQuartzConfService {

    List<Quartz_Config> getJobList();

    Quartz_Config findById(long id);
}
