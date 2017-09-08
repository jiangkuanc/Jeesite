package com.dagongsoft.p2p.creditreport.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 信用报告指标表Entity
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
public class P2pCreditReportIndex extends DataEntity<P2pCreditReportIndex> {

    private static final long serialVersionUID = 1L;
    private String creditInfoType;        // 信用信息类型(credit_info_type)
    private String indexName;        // 指标名称
    private Integer sort;        // 排序
    private String isUse;        // 是否启用(yes_no)

    public P2pCreditReportIndex() {
        super();
    }

    public P2pCreditReportIndex(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "信用信息类型(credit_info_type)长度必须介于 0 和 64 之间")
    public String getCreditInfoType() {
        return creditInfoType;
    }

    public void setCreditInfoType(String creditInfoType) {
        this.creditInfoType = creditInfoType;
    }

    @Length(min = 1, max = 64, message = "指标名称长度必须介于 1 和 64 之间")
    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName;
    }

    @NotNull(message = "排序不能为空")
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Length(min = 0, max = 64, message = "是否启用(yes_no)长度必须介于 0 和 64 之间")
    public String getIsUse() {
        return isUse;
    }

    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }

}