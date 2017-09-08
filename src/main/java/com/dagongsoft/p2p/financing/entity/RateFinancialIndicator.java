package com.dagongsoft.p2p.financing.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 企业财务指标Entity
 *
 * @author Zach
 * @version 2016-10-26
 */
public class RateFinancialIndicator extends DataEntity<RateFinancialIndicator> {

    private static final long serialVersionUID = 1L;
    private String financialIndicatorId;        // 企业财务指标编号
    private String financialIndicatorName;        // 企业财务指标名称
    private String financialIndicatorAnotherName;        // 企业财务指标别名
    private String parentIndicatorId;        // 上级指标编号
    private String formula;        // 公式
    private String bewrite;        // 描述
    private String orderNum;        // 顺序编号
    /**
     * 用来回显的字段名
     */
    private String periodValue;//期报值
    private String firstYearValue;//最新一年的值
    private String secondYearValue;//最近第二年的值
    private String thirdYearValue;//最近第三年的值
    private String lastYearValue;//最近第四年的值

    private String[] result;//公式计算结果对比

    public RateFinancialIndicator() {
        super();
    }

    public RateFinancialIndicator(String id) {
        super(id);
    }

    @Length(min = 1, max = 36, message = "企业财务指标编号长度必须介于 1 和 36 之间")
    public String getFinancialIndicatorId() {
        return financialIndicatorId;
    }

    public void setFinancialIndicatorId(String financialIndicatorId) {
        this.financialIndicatorId = financialIndicatorId;
    }

    @Length(min = 0, max = 200, message = "企业财务指标名称长度必须介于 0 和 200 之间")
    public String getFinancialIndicatorName() {
        return financialIndicatorName;
    }

    public void setFinancialIndicatorName(String financialIndicatorName) {
        this.financialIndicatorName = financialIndicatorName;
    }

    @Length(min = 0, max = 100, message = "企业财务指标别名长度必须介于 0 和 100 之间")
    public String getFinancialIndicatorAnotherName() {
        return financialIndicatorAnotherName;
    }

    public void setFinancialIndicatorAnotherName(String financialIndicatorAnotherName) {
        this.financialIndicatorAnotherName = financialIndicatorAnotherName;
    }

    @Length(min = 0, max = 36, message = "上级指标编号长度必须介于 0 和 36 之间")
    public String getParentIndicatorId() {
        return parentIndicatorId;
    }

    public void setParentIndicatorId(String parentIndicatorId) {
        this.parentIndicatorId = parentIndicatorId;
    }

    @Length(min = 0, max = 200, message = "公式长度必须介于 0 和 200 之间")
    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    @Length(min = 0, max = 200, message = "描述长度必须介于 0 和 200 之间")
    public String getBewrite() {
        return bewrite;
    }

    public void setBewrite(String bewrite) {
        this.bewrite = bewrite;
    }

    @Length(min = 0, max = 10, message = "顺序编号长度必须介于 0 和 10 之间")
    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getPeriodValue() {
        return periodValue;
    }

    public void setPeriodValue(String periodValue) {
        this.periodValue = periodValue;
    }

    public String getFirstYearValue() {
        return firstYearValue;
    }

    public void setFirstYearValue(String firstYearValue) {
        this.firstYearValue = firstYearValue;
    }

    public String getSecondYearValue() {
        return secondYearValue;
    }

    public void setSecondYearValue(String secondYearValue) {
        this.secondYearValue = secondYearValue;
    }

    public String getThirdYearValue() {
        return thirdYearValue;
    }

    public void setThirdYearValue(String thirdYearValue) {
        this.thirdYearValue = thirdYearValue;
    }

    public String getLastYearValue() {
        return lastYearValue;
    }

    public void setLastYearValue(String lastYearValue) {
        this.lastYearValue = lastYearValue;
    }

    public String[] getResult() {
        return result;
    }

    public void setResult(String[] result) {
        this.result = result;
    }


}