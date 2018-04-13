package com.inyu.entity;

import javax.persistence.*;

@Entity
@Table(name = "quartz_config")
public class Quartz_Config {

 @Id
 @Column(name = "id")
  private long id;
 @Column(name = "group")
  private String group;
 @Column(name = "name")
  private String name;
 @Column(name = "cron")
  private String cron;
 @Column(name = "status")
  private long status;
 @Column(name = "msg")
  private String msg;
 @Column(name = "quartz_class")
  private String quartz_Class;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getGroup() {
    return group;
  }

  public void setGroup(String group) {
    this.group = group;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getCron() {
    return cron;
  }

  public void setCron(String cron) {
    this.cron = cron;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }


  public String getQuartz_Class() {
    return quartz_Class;
  }

  public void setQuartz_Class(String quartz_Class) {
    this.quartz_Class = quartz_Class;
  }

}
