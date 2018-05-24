package com.inyu.repo;


import com.inyu.entity.CrmUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface UserRepository extends JpaSpecificationExecutor<CrmUser>,JpaRepository<CrmUser,Long> {
    @Query(value = "select * from crm_user  where name= ?1 and password = ?2",nativeQuery =true)
    CrmUser login(String name, String password);

    @Query(value = "select * from crm_user  where name= ?1",nativeQuery =true)
    CrmUser validateUserName(String name);

    Page<CrmUser> findByName(String name, Pageable pageRequest);
}
