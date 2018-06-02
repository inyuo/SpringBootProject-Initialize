package com.inyu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "crm_customer")
public class CrmCustomer implements Serializable {
    /**
     * 客户id
     */
    @Id
    @Column(name = "customer_id")
    private Integer customerId;

    /**
     * 所有者岗位
     */
    @Column(name = "owner_role_id")
    private Integer ownerRoleId;

    /**
     * 创建者id
     */
    @Column(name = "creator_role_id")
    private Integer creatorRoleId;

    /**
     * 首要联系人
     */
    @Column(name = "contacts_id")
    private Integer contactsId;

    /**
     * 联系人
     */
    private String name;

    private String email;

    /**
     * 来源
     */
    private String origin;

    /**
     * 客户营业执照编码
     */
    @Column(name = "licenc_no")
    private String licencNo;

    /**
     * 网站
     */
    private String website;

    /**
     * 电话
     */
    private String telephone;

    @Column(name = "landline_telephone")
    private String landlineTelephone;

    /**
     * 传真
     */
    private String fax;

    /**
     * 客户满意度
     */
    private Integer satisfy;

    /**
     * 客户等级
     */
    private Integer level;

    /**
     * 客户联系地址
     */
    private String address;

    /**
     * 邮编
     */
    @Column(name = "zip_code")
    private String zipCode;

    /**
     * 企业
     */
    private String industry;

    /**
     * 年营业额
     */
    @Column(name = "annual_revenue")
    private String annualRevenue;

    private String ownership;

    private String rating;

    /**
     * 建立时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 是否删除
     */
    @Column(name = "is_deleted")
    private Integer isDeleted;

    /**
     * 是否锁定 0 -no / 1- yes
     */
    @Column(name = "is_locked")
    private Integer isLocked;

    /**
     * 删除人
     */
    @Column(name = "delete_role_id")
    private Integer deleteRoleId;

    /**
     * 删除时间
     */
    @Column(name = "delete_time")
    private Date deleteTime;

    private static final long serialVersionUID = 1L;

    /**
     * 获取客户id
     *
     * @return customer_id - 客户id
     */
    public Integer getCustomerId() {
        return customerId;
    }

    /**
     * 设置客户id
     *
     * @param customerId 客户id
     */
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    /**
     * 获取所有者岗位
     *
     * @return owner_role_id - 所有者岗位
     */
    public Integer getOwnerRoleId() {
        return ownerRoleId;
    }

    /**
     * 设置所有者岗位
     *
     * @param ownerRoleId 所有者岗位
     */
    public void setOwnerRoleId(Integer ownerRoleId) {
        this.ownerRoleId = ownerRoleId;
    }

    /**
     * 获取创建者id
     *
     * @return creator_role_id - 创建者id
     */
    public Integer getCreatorRoleId() {
        return creatorRoleId;
    }

    /**
     * 设置创建者id
     *
     * @param creatorRoleId 创建者id
     */
    public void setCreatorRoleId(Integer creatorRoleId) {
        this.creatorRoleId = creatorRoleId;
    }

    /**
     * 获取首要联系人
     *
     * @return contacts_id - 首要联系人
     */
    public Integer getContactsId() {
        return contactsId;
    }

    /**
     * 设置首要联系人
     *
     * @param contactsId 首要联系人
     */
    public void setContactsId(Integer contactsId) {
        this.contactsId = contactsId;
    }

    /**
     * 获取联系人
     *
     * @return name - 联系人
     */
    public String getName() {
        return name;
    }

    /**
     * 设置联系人
     *
     * @param name 联系人
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取来源
     *
     * @return origin - 来源
     */
    public String getOrigin() {
        return origin;
    }

    /**
     * 设置来源
     *
     * @param origin 来源
     */
    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    /**
     * 获取客户营业执照编码
     *
     * @return licenc_no - 客户营业执照编码
     */
    public String getLicencNo() {
        return licencNo;
    }

    /**
     * 设置客户营业执照编码
     *
     * @param licencNo 客户营业执照编码
     */
    public void setLicencNo(String licencNo) {
        this.licencNo = licencNo == null ? null : licencNo.trim();
    }

    /**
     * 获取网站
     *
     * @return website - 网站
     */
    public String getWebsite() {
        return website;
    }

    /**
     * 设置网站
     *
     * @param website 网站
     */
    public void setWebsite(String website) {
        this.website = website == null ? null : website.trim();
    }

    /**
     * 获取电话
     *
     * @return telephone - 电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置电话
     *
     * @param telephone 电话
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * @return landline_telephone
     */
    public String getLandlineTelephone() {
        return landlineTelephone;
    }

    /**
     * @param landlineTelephone
     */
    public void setLandlineTelephone(String landlineTelephone) {
        this.landlineTelephone = landlineTelephone == null ? null : landlineTelephone.trim();
    }

    /**
     * 获取传真
     *
     * @return fax - 传真
     */
    public String getFax() {
        return fax;
    }

    /**
     * 设置传真
     *
     * @param fax 传真
     */
    public void setFax(String fax) {
        this.fax = fax == null ? null : fax.trim();
    }

    /**
     * 获取客户满意度
     *
     * @return satisfy - 客户满意度
     */
    public Integer getSatisfy() {
        return satisfy;
    }

    /**
     * 设置客户满意度
     *
     * @param satisfy 客户满意度
     */
    public void setSatisfy(Integer satisfy) {
        this.satisfy = satisfy;
    }

    /**
     * 获取客户等级
     *
     * @return level - 客户等级
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * 设置客户等级
     *
     * @param level 客户等级
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * 获取客户联系地址
     *
     * @return address - 客户联系地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置客户联系地址
     *
     * @param address 客户联系地址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * 获取邮编
     *
     * @return zip_code - 邮编
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * 设置邮编
     *
     * @param zipCode 邮编
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    /**
     * 获取企业
     *
     * @return industry - 企业
     */
    public String getIndustry() {
        return industry;
    }

    /**
     * 设置企业
     *
     * @param industry 企业
     */
    public void setIndustry(String industry) {
        this.industry = industry == null ? null : industry.trim();
    }

    /**
     * 获取年营业额
     *
     * @return annual_revenue - 年营业额
     */
    public String getAnnualRevenue() {
        return annualRevenue;
    }

    /**
     * 设置年营业额
     *
     * @param annualRevenue 年营业额
     */
    public void setAnnualRevenue(String annualRevenue) {
        this.annualRevenue = annualRevenue == null ? null : annualRevenue.trim();
    }

    /**
     * @return ownership
     */
    public String getOwnership() {
        return ownership;
    }

    /**
     * @param ownership
     */
    public void setOwnership(String ownership) {
        this.ownership = ownership == null ? null : ownership.trim();
    }

    /**
     * @return rating
     */
    public String getRating() {
        return rating;
    }

    /**
     * @param rating
     */
    public void setRating(String rating) {
        this.rating = rating == null ? null : rating.trim();
    }

    /**
     * 获取建立时间
     *
     * @return create_time - 建立时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置建立时间
     *
     * @param createTime 建立时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取是否删除
     *
     * @return is_deleted - 是否删除
     */
    public Integer getIsDeleted() {
        return isDeleted;
    }

    /**
     * 设置是否删除
     *
     * @param isDeleted 是否删除
     */
    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    /**
     * 获取是否锁定 0 -no / 1- yes
     *
     * @return is_locked - 是否锁定 0 -no / 1- yes
     */
    public Integer getIsLocked() {
        return isLocked;
    }

    /**
     * 设置是否锁定 0 -no / 1- yes
     *
     * @param isLocked 是否锁定 0 -no / 1- yes
     */
    public void setIsLocked(Integer isLocked) {
        this.isLocked = isLocked;
    }

    /**
     * 获取删除人
     *
     * @return delete_role_id - 删除人
     */
    public Integer getDeleteRoleId() {
        return deleteRoleId;
    }

    /**
     * 设置删除人
     *
     * @param deleteRoleId 删除人
     */
    public void setDeleteRoleId(Integer deleteRoleId) {
        this.deleteRoleId = deleteRoleId;
    }

    /**
     * 获取删除时间
     *
     * @return delete_time - 删除时间
     */
    public Date getDeleteTime() {
        return deleteTime;
    }

    /**
     * 设置删除时间
     *
     * @param deleteTime 删除时间
     */
    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", customerId=").append(customerId);
        sb.append(", ownerRoleId=").append(ownerRoleId);
        sb.append(", creatorRoleId=").append(creatorRoleId);
        sb.append(", contactsId=").append(contactsId);
        sb.append(", name=").append(name);
        sb.append(", email=").append(email);
        sb.append(", origin=").append(origin);
        sb.append(", licencNo=").append(licencNo);
        sb.append(", website=").append(website);
        sb.append(", telephone=").append(telephone);
        sb.append(", landlineTelephone=").append(landlineTelephone);
        sb.append(", fax=").append(fax);
        sb.append(", satisfy=").append(satisfy);
        sb.append(", level=").append(level);
        sb.append(", address=").append(address);
        sb.append(", zipCode=").append(zipCode);
        sb.append(", industry=").append(industry);
        sb.append(", annualRevenue=").append(annualRevenue);
        sb.append(", ownership=").append(ownership);
        sb.append(", rating=").append(rating);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", isDeleted=").append(isDeleted);
        sb.append(", isLocked=").append(isLocked);
        sb.append(", deleteRoleId=").append(deleteRoleId);
        sb.append(", deleteTime=").append(deleteTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}