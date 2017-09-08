package com.dagongsoft.p2p.config.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 行业分类Entity
 *
 * @author Quincy
 * @version 2016-11-23
 */
public class P2pIndustryclassi extends DataEntity<P2pIndustryclassi> {

    private static final long serialVersionUID = 1L;
    private String industrynum;        // 行业编号
    private String classinameCn;        // 行业名称（中文）
    private String classinameEn;        // 行业名称（英文）
    private String parentnum;        // 上级行业编号
    private String sort;        // 排序
    private Integer isleaf;        // 是否为子节点
    private Date createdate;        // 创建时间
    private String remark;        // 备注

    public P2pIndustryclassi() {
        super();
    }

    public P2pIndustryclassi(String id) {
        super(id);
    }

    @Length(min = 1, max = 36, message = "行业编号长度必须介于 1 和 36 之间")
    public String getIndustrynum() {
        return industrynum;
    }

    public void setIndustrynum(String industrynum) {
        this.industrynum = industrynum;
    }

    @Length(min = 0, max = 36, message = "行业名称（中文）长度必须介于 0 和 36 之间")
    public String getClassinameCn() {
        return classinameCn;
    }

    public void setClassinameCn(String classinameCn) {
        this.classinameCn = classinameCn;
    }

    @Length(min = 0, max = 36, message = "行业名称（英文）长度必须介于 0 和 36 之间")
    public String getClassinameEn() {
        return classinameEn;
    }

    public void setClassinameEn(String classinameEn) {
        this.classinameEn = classinameEn;
    }

    @Length(min = 0, max = 36, message = "上级行业编号长度必须介于 0 和 36 之间")
    public String getParentnum() {
        return parentnum;
    }

    public void setParentnum(String parentnum) {
        this.parentnum = parentnum;
    }

    @Length(min = 0, max = 10, message = "排序长度必须介于 0 和 10 之间")
    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(Integer isleaf) {
        this.isleaf = isleaf;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Length(min = 0, max = 1000, message = "备注长度必须介于 0 和 1000 之间")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}