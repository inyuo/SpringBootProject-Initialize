package com.inyu.repo;


import com.inyu.entity.QuartzProxy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface QuarztProxyRepository extends JpaRepository<QuartzProxy,Long> {

    @Query(value = "select * from QuartzProxy where ip= ?1 ",nativeQuery =true)
    QuartzProxy findOneByIp(String ip);


}
