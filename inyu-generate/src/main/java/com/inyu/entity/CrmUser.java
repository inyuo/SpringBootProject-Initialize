package com.inyu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "crm_user")
public class CrmUser implements Serializable {
    /**
     * 用户id
     */
    @Id
    @Column(name = "user_id")
    private Long userId;

    /**
     * 当前使用岗位
     */
    @Column(name = "role_id")
    private Integer roleId;

    /**
     * 用户类别
     */
    @Column(name = "category_id")
    private Integer categoryId;

    /**
     * 状态：0-未验证，1-已验证
     */
    private Integer status;

    /**
     * 用户名
     */
    private String name;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户自定义导航菜单
     */
    private String nickname;

    /**
     * 安全符
     */
    private String salt;

    /**
     * 用户性别1男2女
     */
    private Integer sex;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 用户的电话
     */
    private String telephone;

    /**
     * 用户的联系地址
     */
    private String address;

    /**
     * 

     */
    private Date birthday;

    /**
     * 注册时的ip
     */
    @Column(name = "reg_ip")
    private String regIp;

    /**
     * 用户的注册时间
     */
    @Column(name = "reg_time")
    private Date regTime;

    /**
     * 用户最后一次登录的时间
     */
    @Column(name = "last_login_time")
    private Date lastLoginTime;

    /**
     * 用户申请找回密码的时间
     */
    @Column(name = "lostpw_time")
    private Date lostpwTime;

    private String weixinid;

    /**
     * 个人面板
     */
    private String dashboard;

    private static final long serialVersionUID = 1L;

    /**
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取当前使用岗位
     *
     * @return role_id - 当前使用岗位
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置当前使用岗位
     *
     * @param roleId 当前使用岗位
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取用户类别
     *
     * @return category_id - 用户类别
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     * 设置用户类别
     *
     * @param categoryId 用户类别
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * 获取状态：0-未验证，1-已验证
     *
     * @return status - 状态：0-未验证，1-已验证
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态：0-未验证，1-已验证
     *
     * @param status 状态：0-未验证，1-已验证
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取用户名
     *
     * @return name - 用户名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置用户名
     *
     * @param name 用户名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取用户密码
     *
     * @return password - 用户密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置用户密码
     *
     * @param password 用户密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 获取用户自定义导航菜单
     *
     * @return nickname - 用户自定义导航菜单
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * 设置用户自定义导航菜单
     *
     * @param nickname 用户自定义导航菜单
     */
    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    /**
     * 获取安全符
     *
     * @return salt - 安全符
     */
    public String getSalt() {
        return salt;
    }

    /**
     * 设置安全符
     *
     * @param salt 安全符
     */
    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    /**
     * 获取用户性别1男2女
     *
     * @return sex - 用户性别1男2女
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * 设置用户性别1男2女
     *
     * @param sex 用户性别1男2女
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * 获取用户邮箱
     *
     * @return email - 用户邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置用户邮箱
     *
     * @param email 用户邮箱
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取用户的电话
     *
     * @return telephone - 用户的电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置用户的电话
     *
     * @param telephone 用户的电话
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * 获取用户的联系地址
     *
     * @return address - 用户的联系地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置用户的联系地址
     *
     * @param address 用户的联系地址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * 获取

     *
     * @return birthday - 

     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置

     *
     * @param birthday 

     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取注册时的ip
     *
     * @return reg_ip - 注册时的ip
     */
    public String getRegIp() {
        return regIp;
    }

    /**
     * 设置注册时的ip
     *
     * @param regIp 注册时的ip
     */
    public void setRegIp(String regIp) {
        this.regIp = regIp == null ? null : regIp.trim();
    }

    /**
     * 获取用户的注册时间
     *
     * @return reg_time - 用户的注册时间
     */
    public Date getRegTime() {
        return regTime;
    }

    /**
     * 设置用户的注册时间
     *
     * @param regTime 用户的注册时间
     */
    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    /**
     * 获取用户最后一次登录的时间
     *
     * @return last_login_time - 用户最后一次登录的时间
     */
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    /**
     * 设置用户最后一次登录的时间
     *
     * @param lastLoginTime 用户最后一次登录的时间
     */
    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    /**
     * 获取用户申请找回密码的时间
     *
     * @return lostpw_time - 用户申请找回密码的时间
     */
    public Date getLostpwTime() {
        return lostpwTime;
    }

    /**
     * 设置用户申请找回密码的时间
     *
     * @param lostpwTime 用户申请找回密码的时间
     */
    public void setLostpwTime(Date lostpwTime) {
        this.lostpwTime = lostpwTime;
    }

    /**
     * @return weixinid
     */
    public String getWeixinid() {
        return weixinid;
    }

    /**
     * @param weixinid
     */
    public void setWeixinid(String weixinid) {
        this.weixinid = weixinid == null ? null : weixinid.trim();
    }

    /**
     * 获取个人面板
     *
     * @return dashboard - 个人面板
     */
    public String getDashboard() {
        return dashboard;
    }

    /**
     * 设置个人面板
     *
     * @param dashboard 个人面板
     */
    public void setDashboard(String dashboard) {
        this.dashboard = dashboard == null ? null : dashboard.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userId=").append(userId);
        sb.append(", roleId=").append(roleId);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", status=").append(status);
        sb.append(", name=").append(name);
        sb.append(", password=").append(password);
        sb.append(", nickname=").append(nickname);
        sb.append(", salt=").append(salt);
        sb.append(", sex=").append(sex);
        sb.append(", email=").append(email);
        sb.append(", telephone=").append(telephone);
        sb.append(", address=").append(address);
        sb.append(", birthday=").append(birthday);
        sb.append(", regIp=").append(regIp);
        sb.append(", regTime=").append(regTime);
        sb.append(", lastLoginTime=").append(lastLoginTime);
        sb.append(", lostpwTime=").append(lostpwTime);
        sb.append(", weixinid=").append(weixinid);
        sb.append(", dashboard=").append(dashboard);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}