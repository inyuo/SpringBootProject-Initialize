package com.inyu.entity;

import javax.persistence.*;

@Entity
@Table(name = "crm_config")
public class Crm_Config {

 @Id
 @Column(name = "id")
  private long id;
 @Column(name = "name")
  private String name;
 @Column(name = "value")
  private String value;
 @Column(name = "description")
  private String description;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
