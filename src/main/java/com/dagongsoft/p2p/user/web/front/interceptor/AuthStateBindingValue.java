package com.dagongsoft.p2p.user.web.front.interceptor;

import java.io.Serializable;

/**
 * 封装认证状态并绑定值类
 *
 * @author DAGONG
 */
public class AuthStateBindingValue implements Serializable {

    public String getIsBindIdCard() {
        return isBindIdCard;
    }

    public void setIsBindIdCard(String isBindIdCard) {
        this.isBindIdCard = isBindIdCard;
    }

    public String getIsBindBankCard() {
        return isBindBankCard;
    }

    public void setIsBindBankCard(String isBindBankCard) {
        this.isBindBankCard = isBindBankCard;
    }

    public String getIsRiskEvaluation() {
        return isRiskEvaluation;
    }

    public void setIsRiskEvaluation(String isRiskEvaluation) {
        this.isRiskEvaluation = isRiskEvaluation;
    }

    public String getIsBeMember() {
        return isBeMember;
    }

    public void setIsBeMember(String isBeMember) {
        this.isBeMember = isBeMember;
    }

    public AuthStateBindingValue() {
        super();
    }

    public AuthStateBindingValue(String isBindIdCard, String isBindBankCard,
                                 String isRiskEvaluation, String isBeMember) {
        super();
        this.isBindIdCard = isBindIdCard;
        this.isBindBankCard = isBindBankCard;
        this.isRiskEvaluation = isRiskEvaluation;
        this.isBeMember = isBeMember;
    }

    private static final long serialVersionUID = 4053612442124929860L;
    private String isBindIdCard;        //是否绑定身份证
    private String isBindBankCard;        //是否绑定银行卡
    private String isRiskEvaluation;    //是否风险测评
    private String isBeMember;            //是否成为会员

    @Override
    public String toString() {
        return "AuthStateBindingValue [isBindIdCard=" + isBindIdCard
                + ", isBindBankCard=" + isBindBankCard + ", isRiskEvaluation="
                + isRiskEvaluation + ", isBeMember=" + isBeMember + "]";
    }


}
