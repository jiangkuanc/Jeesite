package com.dagongsoft.p2p.user.web.front.model;

import java.io.Serializable;
import java.util.List;


/**
 * 账户总览模型类
 *
 * @author Joe
 */
public class AccountModel implements Serializable {

    public AccountModel() {
        super();
    }

    public AccountModel(String id, String isCertificate, String isBindBank,
                        List<String> messageId, String isMembers, String bankId,
                        String isEvaluation, String accountInfo) {
        super();
        this.id = id;
        this.isCertificate = isCertificate;
        this.isBindBank = isBindBank;
        this.messageId = messageId;
        this.isMembers = isMembers;
        BankId = bankId;
        this.isEvaluation = isEvaluation;
        this.accountInfo = accountInfo;
    }

    private static final long serialVersionUID = 1871435143724944337L;
    private String id;//当前用户的id
    private String isCertificate;//是否认证
    private String isBindBank;//是否绑卡
    private List<String> messageId;//站内信
    private String isMembers;//是否是会员
    private String BankId;//银行卡id
    private String isEvaluation;//是否进行风险测评
    private String accountInfo;//银行账户信息
    private Integer state;

    @Override
    public String toString() {
        return "AccountModel [id=" + id + ", isCertificate=" + isCertificate
                + ", isBindBank=" + isBindBank + ", messageId=" + messageId
                + ", isMembers=" + isMembers + ", BankId=" + BankId
                + ", isEvaluation=" + isEvaluation + ", accountInfo="
                + accountInfo + ", state=" + state + "]";
    }

    public AccountModel(String id, String isCertificate, String isBindBank,
                        List<String> messageId, String isMembers, String bankId,
                        String isEvaluation, String accountInfo, Integer state) {
        super();
        this.id = id;
        this.isCertificate = isCertificate;
        this.isBindBank = isBindBank;
        this.messageId = messageId;
        this.isMembers = isMembers;
        BankId = bankId;
        this.isEvaluation = isEvaluation;
        this.accountInfo = accountInfo;
        this.state = state;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIsCertificate() {
        return isCertificate;
    }

    public void setIsCertificate(String isCertificate) {
        this.isCertificate = isCertificate;
    }

    public String getIsBindBank() {
        return isBindBank;
    }

    public void setIsBindBank(String isBindBank) {
        this.isBindBank = isBindBank;
    }

    public List<String> getMessageId() {
        return messageId;
    }

    public void setMessageId(List<String> messageId) {
        this.messageId = messageId;
    }

    public String getIsMembers() {
        return isMembers;
    }

    public void setIsMembers(String isMembers) {
        this.isMembers = isMembers;
    }

    public String getBankId() {
        return BankId;
    }

    public void setBankId(String bankId) {
        BankId = bankId;
    }

    public String getIsEvaluation() {
        return isEvaluation;
    }

    public void setIsEvaluation(String isEvaluation) {
        this.isEvaluation = isEvaluation;
    }

    public String getAccountInfo() {
        return accountInfo;
    }

    public void setAccountInfo(String accountInfo) {
        this.accountInfo = accountInfo;
    }


}
