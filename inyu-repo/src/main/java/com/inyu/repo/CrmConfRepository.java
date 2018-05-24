package com.inyu.repo;


import com.inyu.entity.CrmConfig;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface CrmConfRepository extends JpaRepository<CrmConfig,Long> {

//    @Query(value = "select * from crm_user  where name= ?1 and password = ?2",nativeQuery =true)
//    Crm_Customer login(String name, String password);

}
