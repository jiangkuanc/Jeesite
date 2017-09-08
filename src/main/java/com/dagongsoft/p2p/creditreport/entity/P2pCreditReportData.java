package com.dagongsoft.p2p.creditreport.entity;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 信用报告指标数据表Entity
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
public class P2pCreditReportData extends DataEntity<P2pCreditReportData> {

    private static final long serialVersionUID = 1L;
    private String creditReportId;        // 信用报告编号
    private String indexId;        // 指标编号
    private Integer good;        // 良好
    private Integer normal;        // 正常
    private Integer risk;        // 风险

    public P2pCreditReportData() {
        super();
    }

    public P2pCreditReportData(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "信用报告编号长度必须介于 0 和 64 之间")
    public String getCreditReportId() {
        return creditReportId;
    }

    public void setCreditReportId(String creditReportId) {
        this.creditReportId = creditReportId;
    }

    @Length(min = 1, max = 64, message = "指标编号长度必须介于 1 和 64 之间")
    public String getIndexId() {
        return indexId;
    }

    public void setIndexId(String indexId) {
        this.indexId = indexId;
    }

    @NotNull(message = "良好不能为空")
    public Integer getGood() {
        return good;
    }

    public void setGood(Integer good) {
        this.good = good;
    }

    @NotNull(message = "正常不能为空")
    public Integer getNormal() {
        return normal;
    }

    public void setNormal(Integer normal) {
        this.normal = normal;
    }

    public Integer getRisk() {
        return risk;
    }

    public void setRisk(Integer risk) {
        this.risk = risk;
    }

}