package com.dagongsoft.p2p.user.web.front.investment;

import java.io.Serializable;

/**
 * 投资信息记录信息json报文类
 *
 * @param <InvestmentInfo>
 * @author Joe
 * @since 2016-11-04
 */
public class InvestmentInfoJson<InvestmentInfo> implements Serializable {

    private static final long serialVersionUID = -7594803325272534631L;
    private String message;                                    //返回客户端消息
    private String code;                                    //返回客户端状态码
    private InvestmentInfo investmentInfo;                    //返回客户端投资记录数据实体类

    @Override
    public String toString() {
        return "InvestmentInfoJson [message=" + message + ", code=" + code
                + ", investmentInfo=" + investmentInfo + "]";
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public InvestmentInfo getInvestmentInfo() {
        return investmentInfo;
    }

    public void setInvestmentInfo(InvestmentInfo investmentInfo) {
        this.investmentInfo = investmentInfo;
    }


}
