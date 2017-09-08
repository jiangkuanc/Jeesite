package com.dagongsoft.p2p.utils;

public class RatingState {

    public static final int FINISH_APPLICATION_GUIDE = 50;

    /**
     * 完成评级申请提交
     */
    public static final int FINISH_RATING_APPLICATION = 100;

    /**
     * 完成企业材料提交
     */
    public static final int FINISH_ENTERPRISE_DOCUMENTS = 200;

    /**
     * 完成财务材料提交
     */
    public static final int FINISH_FINANCE_DOCUMENTS = 202;

    /**
     * 材料审核失败
     */
    public static final int RATING_DOCUMENTS_FAIL = 201;

    /**
     * 等待支付评级费
     */
    public static final int NEED_PAY_RATING_FEE = 300;

    /**
     * 信用评级中
     */
    public static final int CREDIT_RATING_ING = 400;

    /**
     * 待确认评级结果
     */
    public static final int NEED_CONFIRM_RESULT = 500;

    /**
     * 复评中
     */
    public static final int REVIEW_RATING = 600;

    /**
     * 待发布评级报告
     */
    public static final int NEED_PUBLISH_REPORT = 700;

    /**
     * 等待结项
     */
    public static final int STAY_FINISH = 800;

    /**
     * 正常结项
     */
    public static final int FINISH_PROJECT = 900;

    /**
     * 非正常结项
     */
    public static final int CANCEL_PROJECT = 901;
}
