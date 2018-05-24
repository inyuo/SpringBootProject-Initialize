package com.inyu.entity;

import com.inyu.entity.basic.ToString;

import javax.persistence.*;

@Entity
@Table(name = "crm_customer")
public class CrmCustomer extends ToString {

 @Id
 @Column(name = "customer_id")
  private long customerId;
 @Column(name = "owner_role_id")
  private long ownerRoleId;
 @Column(name = "creator_role_id")
  private long creatorRoleId;
 @Column(name = "contacts_id")
  private long contactsId;
 @Column(name = "name")
  private String name;
 @Column(name = "email")
  private String email;
 @Column(name = "origin")
  private String origin;
 @Column(name = "licenc_no")
  private String licencNo;
 @Column(name = "website")
  private String website;
 @Column(name = "telephone")
  private String telephone;
 @Column(name = "landline_telephone")
  private String landlineTelephone;
 @Column(name = "fax")
  private String fax;
 @Column(name = "satisfy")
  private long satisfy;
 @Column(name = "level")
  private long level;
 @Column(name = "address")
  private String address;
 @Column(name = "zip_code")
  private String zipCode;
 @Column(name = "industry")
  private String industry;
 @Column(name = "annual_revenue")
  private String annualRevenue;
 @Column(name = "ownership")
  private String ownership;
 @Column(name = "rating")
  private String rating;
 @Column(name = "create_time")
  private java.sql.Date createTime;
 @Column(name = "update_time")
  private java.sql.Date updateTime;
 @Column(name = "is_deleted")
  private long isDeleted;
 @Column(name = "is_locked")
  private long isLocked;
 @Column(name = "delete_role_id")
  private long deleteRoleId;
 @Column(name = "delete_time")
  private java.sql.Date deleteTime;


  public long getCustomerId() {
    return customerId;
  }

  public void setCustomerId(long customerId) {
    this.customerId = customerId;
  }


  public long getOwnerRoleId() {
    return ownerRoleId;
  }

  public void setOwnerRoleId(long ownerRoleId) {
    this.ownerRoleId = ownerRoleId;
  }


  public long getCreatorRoleId() {
    return creatorRoleId;
  }

  public void setCreatorRoleId(long creatorRoleId) {
    this.creatorRoleId = creatorRoleId;
  }


  public long getContactsId() {
    return contactsId;
  }

  public void setContactsId(long contactsId) {
    this.contactsId = contactsId;
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


  public String getLicencNo() {
    return licencNo;
  }

  public void setLicencNo(String licencNo) {
    this.licencNo = licencNo;
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


  public String getLandlineTelephone() {
    return landlineTelephone;
  }

  public void setLandlineTelephone(String landlineTelephone) {
    this.landlineTelephone = landlineTelephone;
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


  public String getZipCode() {
    return zipCode;
  }

  public void setZipCode(String zipCode) {
    this.zipCode = zipCode;
  }


  public String getIndustry() {
    return industry;
  }

  public void setIndustry(String industry) {
    this.industry = industry;
  }


  public String getAnnualRevenue() {
    return annualRevenue;
  }

  public void setAnnualRevenue(String annualRevenue) {
    this.annualRevenue = annualRevenue;
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


  public java.sql.Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Date createTime) {
    this.createTime = createTime;
  }


  public java.sql.Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Date updateTime) {
    this.updateTime = updateTime;
  }


  public long getIsDeleted() {
    return isDeleted;
  }

  public void setIsDeleted(long isDeleted) {
    this.isDeleted = isDeleted;
  }


  public long getIsLocked() {
    return isLocked;
  }

  public void setIsLocked(long isLocked) {
    this.isLocked = isLocked;
  }


  public long getDeleteRoleId() {
    return deleteRoleId;
  }

  public void setDeleteRoleId(long deleteRoleId) {
    this.deleteRoleId = deleteRoleId;
  }


  public java.sql.Date getDeleteTime() {
    return deleteTime;
  }

  public void setDeleteTime(java.sql.Date deleteTime) {
    this.deleteTime = deleteTime;
  }

}
