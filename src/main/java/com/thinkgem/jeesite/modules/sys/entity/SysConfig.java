package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 系统配置信息Entity
 *
 * @author Summer
 * @version 2016-12-05
 */
public class SysConfig extends DataEntity<SysConfig> {

    private static final long serialVersionUID = 1L;
    private String sysId;        // 系统编号
    private String constantName;        // 常量名称
    private String constantKey;        // key
    private String constantValue;        // value
    private String constantComment;        // 备注
    private String sort;        // 排序

    public SysConfig() {
        super();
    }

    public SysConfig(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "系统编号长度必须介于 0 和 64 之间")
    public String getSysId() {
        return sysId;
    }

    public void setSysId(String sysId) {
        this.sysId = sysId;
    }

    @Length(min = 0, max = 64, message = "常量名称长度必须介于 0 和 64 之间")
    public String getConstantName() {
        return constantName;
    }

    public void setConstantName(String constantName) {
        this.constantName = constantName;
    }

    @Length(min = 0, max = 64, message = "key长度必须介于 0 和 64 之间")
    public String getConstantKey() {
        return constantKey;
    }

    public void setConstantKey(String constantKey) {
        this.constantKey = constantKey;
    }

    @Length(min = 0, max = 500, message = "value长度必须介于 0 和 500 之间")
    public String getConstantValue() {
        return constantValue;
    }

    public void setConstantValue(String constantValue) {
        this.constantValue = constantValue;
    }

    @Length(min = 0, max = 200, message = "备注长度必须介于 0 和 200 之间")
    public String getConstantComment() {
        return constantComment;
    }

    public void setConstantComment(String constantComment) {
        this.constantComment = constantComment;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

}