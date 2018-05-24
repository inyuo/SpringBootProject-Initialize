package com.inyu.entity;

import com.inyu.entity.basic.ToString;

import javax.persistence.*;

@Entity
@Table(name = "crm_user")
public class CrmUser extends ToString {

 @Id
 @Column(name = "user_id")
  private long userId;
 @Column(name = "role_id")
  private long roleId;
 @Column(name = "category_id")
  private long categoryId;
 @Column(name = "status")
  private long status;
 @Column(name = "name")
  private String name;
 @Column(name = "password")
  private String password;
 @Column(name = "nickname")
  private String nickname;
 @Column(name = "salt")
  private String salt;
 @Column(name = "sex")
  private long sex;
 @Column(name = "email")
  private String email;
 @Column(name = "telephone")
  private String telephone;
 @Column(name = "address")
  private String address;
 @Column(name = "birthday")
  private java.sql.Date birthday;
 @Column(name = "dashboard")
  private String dashboard;
 @Column(name = "reg_ip")
  private String regIp;
 @Column(name = "reg_time")
  private java.sql.Timestamp regTime;
 @Column(name = "last_login_time")
  private java.sql.Timestamp lastLoginTime;
 @Column(name = "lostpw_time")
  private java.sql.Timestamp lostpwTime;
 @Column(name = "weixinid")
  private String weixinid;


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }


  public long getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(long categoryId) {
    this.categoryId = categoryId;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }


  public String getSalt() {
    return salt;
  }

  public void setSalt(String salt) {
    this.salt = salt;
  }


  public long getSex() {
    return sex;
  }

  public void setSex(long sex) {
    this.sex = sex;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public java.sql.Date getBirthday() {
    return birthday;
  }

  public void setBirthday(java.sql.Date birthday) {
    this.birthday = birthday;
  }


  public String getDashboard() {
    return dashboard;
  }

  public void setDashboard(String dashboard) {
    this.dashboard = dashboard;
  }


  public String getRegIp() {
    return regIp;
  }

  public void setRegIp(String regIp) {
    this.regIp = regIp;
  }


  public java.sql.Timestamp getRegTime() {
    return regTime;
  }

  public void setRegTime(java.sql.Timestamp regTime) {
    this.regTime = regTime;
  }


  public java.sql.Timestamp getLastLoginTime() {
    return lastLoginTime;
  }

  public void setLastLoginTime(java.sql.Timestamp lastLoginTime) {
    this.lastLoginTime = lastLoginTime;
  }


  public java.sql.Timestamp getLostpwTime() {
    return lostpwTime;
  }

  public void setLostpwTime(java.sql.Timestamp lostpwTime) {
    this.lostpwTime = lostpwTime;
  }


  public String getWeixinid() {
    return weixinid;
  }

  public void setWeixinid(String weixinid) {
    this.weixinid = weixinid;
  }

}
