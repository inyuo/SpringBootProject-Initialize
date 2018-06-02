package com.inyu.entity;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "quartz_config")
public class QuartzConfig implements Serializable {
    @Id
    private Long id;

    private String group;

    private String name;

    private String cron;

    private Integer status;

    private String msg;

    @Column(name = "quartz_class")
    private String quartzClass;

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
     * @return group
     */
    public String getGroup() {
        return group;
    }

    /**
     * @param group
     */
    public void setGroup(String group) {
        this.group = group == null ? null : group.trim();
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return cron
     */
    public String getCron() {
        return cron;
    }

    /**
     * @param cron
     */
    public void setCron(String cron) {
        this.cron = cron == null ? null : cron.trim();
    }

    /**
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg
     */
    public void setMsg(String msg) {
        this.msg = msg == null ? null : msg.trim();
    }

    /**
     * @return quartz_class
     */
    public String getQuartzClass() {
        return quartzClass;
    }

    /**
     * @param quartzClass
     */
    public void setQuartzClass(String quartzClass) {
        this.quartzClass = quartzClass == null ? null : quartzClass.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", group=").append(group);
        sb.append(", name=").append(name);
        sb.append(", cron=").append(cron);
        sb.append(", status=").append(status);
        sb.append(", msg=").append(msg);
        sb.append(", quartzClass=").append(quartzClass);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}