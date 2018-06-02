package com.inyu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "quartz_proxy")
public class QuartzProxy implements Serializable {
    @Id
    private Long id;

    private String ip;

    /**
     * 端口
     */
    private String port;

    /**
     * 状态：0-yes  1-nol
     */
    private Integer status;

    /**
     * 位置
     */
    private String location;

    /**
     * 类型
     */
    private String type;

    /**
     * 响应速度
     */
    private Float spread;

    @Column(name = "last_validate")
    private Date lastValidate;

    private static final long serialVersionUID = 1L;

    /**
     * @return id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return ip
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param ip
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * 获取端口
     *
     * @return port - 端口
     */
    public String getPort() {
        return port;
    }

    /**
     * 设置端口
     *
     * @param port 端口
     */
    public void setPort(String port) {
        this.port = port == null ? null : port.trim();
    }

    /**
     * 获取状态：0-yes  1-nol
     *
     * @return status - 状态：0-yes  1-nol
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态：0-yes  1-nol
     *
     * @param status 状态：0-yes  1-nol
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取位置
     *
     * @return location - 位置
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置位置
     *
     * @param location 位置
     */
    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    /**
     * 获取类型
     *
     * @return type - 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * 获取响应速度
     *
     * @return spread - 响应速度
     */
    public Float getSpread() {
        return spread;
    }

    /**
     * 设置响应速度
     *
     * @param spread 响应速度
     */
    public void setSpread(Float spread) {
        this.spread = spread;
    }

    /**
     * @return last_validate
     */
    public Date getLastValidate() {
        return lastValidate;
    }

    /**
     * @param lastValidate
     */
    public void setLastValidate(Date lastValidate) {
        this.lastValidate = lastValidate;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", ip=").append(ip);
        sb.append(", port=").append(port);
        sb.append(", status=").append(status);
        sb.append(", location=").append(location);
        sb.append(", type=").append(type);
        sb.append(", spread=").append(spread);
        sb.append(", lastValidate=").append(lastValidate);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}