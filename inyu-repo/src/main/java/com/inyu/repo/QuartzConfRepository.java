package com.inyu.repo;


import com.inyu.entity.Crm_User;
import com.inyu.entity.Quartz_Config;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface QuartzConfRepository extends JpaRepository<Quartz_Config,Long> {

}
