package com.inyu.entity;

import javax.persistence.*;

@Entity
@Table(name = "crm_user")
public class Crm_User {

 @Id
 @Column(name = "user_id")
  private long user_Id;
 @Column(name = "role_id")
  private long role_Id;
 @Column(name = "category_id")
  private long category_Id;
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
  private String reg_Ip;
 @Column(name = "reg_time")
  private java.sql.Date reg_Time;
 @Column(name = "last_login_time")
  private java.sql.Date last_Login_Time;
 @Column(name = "lostpw_time")
  private java.sql.Date lostpw_Time;
 @Column(name = "weixinid")
  private String weixinid;


  public long getUser_Id() {
    return user_Id;
  }

  public void setUser_Id(long user_Id) {
    this.user_Id = user_Id;
  }


  public long getRole_Id() {
    return role_Id;
  }

  public void setRole_Id(long role_Id) {
    this.role_Id = role_Id;
  }


  public long getCategory_Id() {
    return category_Id;
  }

  public void setCategory_Id(long category_Id) {
    this.category_Id = category_Id;
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


  public String getReg_Ip() {
    return reg_Ip;
  }

  public void setReg_Ip(String reg_Ip) {
    this.reg_Ip = reg_Ip;
  }


  public java.sql.Date getReg_Time() {
    return reg_Time;
  }

  public void setReg_Time(java.sql.Date reg_Time) {
    this.reg_Time = reg_Time;
  }


  public java.sql.Date getLast_Login_Time() {
    return last_Login_Time;
  }

  public void setLast_Login_Time(java.sql.Date last_Login_Time) {
    this.last_Login_Time = last_Login_Time;
  }


  public java.sql.Date getLostpw_Time() {
    return lostpw_Time;
  }

  public void setLostpw_Time(java.sql.Date lostpw_Time) {
    this.lostpw_Time = lostpw_Time;
  }


  public String getWeixinid() {
    return weixinid;
  }

  public void setWeixinid(String weixinid) {
    this.weixinid = weixinid;
  }

}
