package com.inyu.entity;

import javax.persistence.*;

@Entity
@Table(name = "crm_customer")
public class Crm_Customer {

 @Id
 @Column(name = "customer_id")
  private long customer_Id;
 @Column(name = "owner_role_id")
  private long owner_Role_Id;
 @Column(name = "creator_role_id")
  private long creator_Role_Id;
 @Column(name = "contacts_id")
  private long contacts_Id;
 @Column(name = "name")
  private String name;
 @Column(name = "email")
  private String email;
 @Column(name = "origin")
  private String origin;
 @Column(name = "licenc_no")
  private String licenc_No;
 @Column(name = "website")
  private String website;
 @Column(name = "telephone")
  private String telephone;
 @Column(name = "landline_telephone")
  private String landline_Telephone;
 @Column(name = "fax")
  private String fax;
 @Column(name = "satisfy")
  private long satisfy;
 @Column(name = "level")
  private long level;
 @Column(name = "address")
  private String address;
 @Column(name = "zip_code")
  private String zip_Code;
 @Column(name = "industry")
  private String industry;
 @Column(name = "annual_revenue")
  private String annual_Revenue;
 @Column(name = "ownership")
  private String ownership;
 @Column(name = "rating")
  private String rating;
 @Column(name = "create_time")
  private java.sql.Date create_Time;
 @Column(name = "update_time")
  private java.sql.Date update_Time;
 @Column(name = "is_deleted")
  private long is_Deleted;
 @Column(name = "is_locked")
  private long is_Locked;
 @Column(name = "delete_role_id")
  private long delete_Role_Id;
 @Column(name = "delete_time")
  private java.sql.Date delete_Time;


  public long getCustomer_Id() {
    return customer_Id;
  }

  public void setCustomer_Id(long customer_Id) {
    this.customer_Id = customer_Id;
  }


  public long getOwner_Role_Id() {
    return owner_Role_Id;
  }

  public void setOwner_Role_Id(long owner_Role_Id) {
    this.owner_Role_Id = owner_Role_Id;
  }


  public long getCreator_Role_Id() {
    return creator_Role_Id;
  }

  public void setCreator_Role_Id(long creator_Role_Id) {
    this.creator_Role_Id = creator_Role_Id;
  }


  public long getContacts_Id() {
    return contacts_Id;
  }

  public void setContacts_Id(long contacts_Id) {
    this.contacts_Id = contacts_Id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getOrigin() {
    return origin;
  }

  public void setOrigin(String origin) {
    this.origin = origin;
  }


  public String getLicenc_No() {
    return licenc_No;
  }

  public void setLicenc_No(String licenc_No) {
    this.licenc_No = licenc_No;
  }


  public String getWebsite() {
    return website;
  }

  public void setWebsite(String website) {
    this.website = website;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getLandline_Telephone() {
    return landline_Telephone;
  }

  public void setLandline_Telephone(String landline_Telephone) {
    this.landline_Telephone = landline_Telephone;
  }


  public String getFax() {
    return fax;
  }

  public void setFax(String fax) {
    this.fax = fax;
  }


  public long getSatisfy() {
    return satisfy;
  }

  public void setSatisfy(long satisfy) {
    this.satisfy = satisfy;
  }


  public long getLevel() {
    return level;
  }

  public void setLevel(long level) {
    this.level = level;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getZip_Code() {
    return zip_Code;
  }

  public void setZip_Code(String zip_Code) {
    this.zip_Code = zip_Code;
  }


  public String getIndustry() {
    return industry;
  }

  public void setIndustry(String industry) {
    this.industry = industry;
  }


  public String getAnnual_Revenue() {
    return annual_Revenue;
  }

  public void setAnnual_Revenue(String annual_Revenue) {
    this.annual_Revenue = annual_Revenue;
  }


  public String getOwnership() {
    return ownership;
  }

  public void setOwnership(String ownership) {
    this.ownership = ownership;
  }


  public String getRating() {
    return rating;
  }

  public void setRating(String rating) {
    this.rating = rating;
  }


  public java.sql.Date getCreate_Time() {
    return create_Time;
  }

  public void setCreate_Time(java.sql.Date create_Time) {
    this.create_Time = create_Time;
  }


  public java.sql.Date getUpdate_Time() {
    return update_Time;
  }

  public void setUpdate_Time(java.sql.Date update_Time) {
    this.update_Time = update_Time;
  }


  public long getIs_Deleted() {
    return is_Deleted;
  }

  public void setIs_Deleted(long is_Deleted) {
    this.is_Deleted = is_Deleted;
  }


  public long getIs_Locked() {
    return is_Locked;
  }

  public void setIs_Locked(long is_Locked) {
    this.is_Locked = is_Locked;
  }


  public long getDelete_Role_Id() {
    return delete_Role_Id;
  }

  public void setDelete_Role_Id(long delete_Role_Id) {
    this.delete_Role_Id = delete_Role_Id;
  }


  public java.sql.Date getDelete_Time() {
    return delete_Time;
  }

  public void setDelete_Time(java.sql.Date delete_Time) {
    this.delete_Time = delete_Time;
  }

}
