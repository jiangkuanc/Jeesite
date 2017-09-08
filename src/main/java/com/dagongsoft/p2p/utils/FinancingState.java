package com.dagongsoft.p2p.utils;

public class FinancingState {

    /**
     * 待提交非财务材料
     */
    public static final int FINANCING_APPLICATION_FINISHED = 101;

    /**
     * 待提交财务材料
     */
    public static final int COMMITED_NON_FINANC_DOCUMENTS = 200;

    /**
     * 材料初审未通过
     */
    public static final int DOCUMENTS_AUDIT_FAILURE = 201;

    /**
     * 材料审核中（材料已提交）包括已提交非财务材料和财务材料
     */
    public static final int DOCUMENTS_AUDIT = 202;

    /**
     * 待立项
     */
    public static final int DOCUMENTS_AUDIT_SUCCESS = 203;

    /**
     * 信用评级中
     */
    public static final int CREDIT_RATING_ING = 210;

    /**
     * 待确认评级结果
     */
    public static final int RATING_RESULTS_TO_BE_CONFIRMED = 211;

    /**
     * 评级结果内容修改中
     */
    public static final int RATING_RESULTS_CONTENT_MODIFING = 212;

    /**
     * 复评
     */
    public static final int REVIEW_ING = 220;

    /**
     * 报告发布审核
     */
    public static final int REPORT_AUDIT = 225;

    /**
     * 待选择补信公司
     */
    public static final int SUPPLY_CREDIT = 230;

    /**
     * 补信公司处理中
     */
    public static final int SUBMIT_CREDIT_CERTIFY = 240;

    /**
     * 市场人员待确认
     */
    public static final int MARKET_STAFF_CONFIRMED = 250;

    /**
     * 待确认债项
     */
    public static final int CREDIT_RATING_SUCCESS = 302;

    /**
     * 待发布审核
     */
    public static final int CONFIRM_RESULT = 400;

    /**
     * 债项募集期
     */
    public static final int FINANCING_PUBLISHED = 500;

    /**
     * 待满标审核
     */
    public static final int INVESTED = 600;

    /**
     * 待放款
     */
    public static final int PAID_RATING = 700;


    /**
     * 还款中
     */
    public static final int MAKE_LOAN = 800;

    /**
     * 项目结项
     */
    public static final int PAID_OFF_LOAN = 900;

    //后续更新中....

    /**
     * 待流标
     */
    public static final int FINANCING_EXPIRED = 901;

    /**
     * 项目结项（撮合前）
     */
    public static final int PROJECT_KNOT = 902;

    /**
     * 已流标
     */
    public static final int FINANCING_FAILURE = 999;
}
