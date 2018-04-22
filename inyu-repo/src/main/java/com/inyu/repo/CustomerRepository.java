package com.inyu.repo;


import com.inyu.entity.Crm_Customer;
import com.inyu.entity.Crm_User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface CustomerRepository extends JpaRepository<Crm_Customer,Integer> {

//    @Query(value = "select * from crm_user  where name= ?1 and password = ?2",nativeQuery =true)
//    Crm_Customer login(String name, String password);

}
