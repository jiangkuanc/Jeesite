package com.dagongsoft.p2p.config.entity;

import java.util.Date;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 协议表Entity
 *
 * @author Zeus
 * @version 2016-11-21
 */
public class P2pAgreement extends DataEntity<P2pAgreement> {

    private static final long serialVersionUID = 1L;
    private String agreementType;        // 协议类别
    private String agreementMainTitle;        // 主标题
    private String agreementSubTitle;        // 副标题
    private String agreementContent;        // 协议内容
    private String agreementFile;        // 协议文件
    private String isEnable;        // 是否生效(yes_no)
    private Date successTime;        // 失效时间
    private Date failureTime;        // 生效时间

    public P2pAgreement() {
        super();
    }

    public P2pAgreement(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "协议类别长度必须介于 0 和 64 之间")
    public String getAgreementType() {
        return agreementType;
    }

    public void setAgreementType(String agreementType) {
        this.agreementType = agreementType;
    }

    @Length(min = 0, max = 64, message = "主标题长度必须介于 0 和 64 之间")
    public String getAgreementMainTitle() {
        return agreementMainTitle;
    }

    public void setAgreementMainTitle(String agreementMainTitle) {
        this.agreementMainTitle = agreementMainTitle;
    }

    @Length(min = 0, max = 64, message = "副标题长度必须介于 0 和 64 之间")
    public String getAgreementSubTitle() {
        return agreementSubTitle;
    }

    public void setAgreementSubTitle(String agreementSubTitle) {
        this.agreementSubTitle = agreementSubTitle;
    }

    public String getAgreementContent() {

        return StringEscapeUtils.unescapeHtml4(agreementContent);
    }

    public void setAgreementContent(String agreementContent) {
        this.agreementContent = agreementContent;
    }

    @Length(min = 0, max = 64, message = "协议文件长度必须介于 0 和 64 之间")
    public String getAgreementFile() {
        return agreementFile;
    }

    public void setAgreementFile(String agreementFile) {
        this.agreementFile = agreementFile;
    }

    @Length(min = 0, max = 64, message = "是否生效(yes_no)长度必须介于 0 和 64 之间")
    public String getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(String isEnable) {
        this.isEnable = isEnable;
    }

    public Date getSuccessTime() {
        return successTime;
    }

    public void setSuccessTime(Date successTime) {
        this.successTime = successTime;
    }

    public Date getFailureTime() {
        return failureTime;
    }

    public void setFailureTime(Date failureTime) {
        this.failureTime = failureTime;
    }

}