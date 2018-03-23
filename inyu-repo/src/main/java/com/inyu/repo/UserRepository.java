package com.inyu.repo;


import com.inyu.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2018/3/20/020.
 */
public interface UserRepository extends JpaRepository<User,String> {
    @Query(value = "select * from t_user  where username= ?1 and password = ?2",nativeQuery =true)
    public User login(String username, String password);
}
