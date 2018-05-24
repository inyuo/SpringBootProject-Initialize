package com.inyu.entity;

import com.inyu.entity.basic.ToString;

import javax.persistence.*;

@Entity
@Table(name = "quartz_proxy")
public class QuartzProxy  extends ToString {

 @Id
 @Column(name = "id")
  private long id;
 @Column(name = "ip")
  private String ip;
 @Column(name = "port")
  private String port;
 @Column(name = "status")
  private long status;
 @Column(name = "location")
  private String location;
 @Column(name = "type")
  private String type;
 @Column(name = "spread")
  private double spread;
 @Column(name = "last_validate")
  private java.sql.Date lastValidate;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }


  public String getPort() {
    return port;
  }

  public void setPort(String port) {
    this.port = port;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public double getSpread() {
    return spread;
  }

  public void setSpread(double spread) {
    this.spread = spread;
  }


  public java.sql.Date getLastValidate() {
    return lastValidate;
  }

  public void setLastValidate(java.sql.Date lastValidate) {
    this.lastValidate = lastValidate;
  }

}
