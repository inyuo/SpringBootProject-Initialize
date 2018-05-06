package com.inyu.repo;


import com.inyu.entity.Crm_Config;
import com.inyu.entity.Quartz_Proxy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface QuarztProxyRepository extends JpaRepository<Quartz_Proxy,Long> {

    @Query(value = "select * from quartz_proxy where ip= ?1 ",nativeQuery =true)
    Quartz_Proxy findOneByIp(String ip);

}
