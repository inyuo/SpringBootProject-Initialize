package com.inyu.repo;


import com.inyu.entity.CrmCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface CustomerRepository extends JpaRepository<CrmCustomer,Integer> {

//    @Query(value = "select * from crm_user  where name= ?1 and password = ?2",nativeQuery =true)
//    CrmCustomer login(String name, String password);

    @Query(value = "select * from CrmCustomer  where industry =?1 ",nativeQuery =true)
     CrmCustomer getCustomerInfoByIndustry(String industry);
}
