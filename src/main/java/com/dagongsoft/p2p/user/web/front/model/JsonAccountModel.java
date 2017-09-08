package com.dagongsoft.p2p.user.web.front.model;


/**
 * 账户Json消息封装
 *
 * @author Joe
 */
public class JsonAccountModel {

    private String status;
    private String message;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AccountModel getAccountModel() {
        return accountModel;
    }

    public void setAccountModel(AccountModel accountModel) {
        this.accountModel = accountModel;
    }

    private AccountModel accountModel;

    public JsonAccountModel build(AccountModel accountModel) {
        this.accountModel = accountModel;
        return this;
    }


}
