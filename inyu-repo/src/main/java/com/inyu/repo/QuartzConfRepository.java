package com.inyu.repo;


import com.inyu.entity.Crm_User;
import com.inyu.entity.Quartz_Config;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface QuartzConfRepository extends JpaRepository<Quartz_Config,Long> {

    @Modifying
    @Query(value="update quartz_config sc set sc.cron =?2 , sc.msg=?3 where sc.id =?1",nativeQuery =true)
    @Transactional
    int editJob(long id,String cron,String msg);

    @Modifying
    @Query(value="update quartz_config sc set sc.status = ?2 where sc.id =?1",nativeQuery =true)
    @Transactional
    int updateJobStatus(long id,int status);
}
