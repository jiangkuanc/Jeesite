/**
 *
 */
package com.dagongsoft.p2p.utils.msg;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

/**
 * @author Zeus
 * @2017-2-23
 */
public class MsgSmsTemplate {

    private static String temp = "【丝路互金网】";
    private static SimpleDateFormat s1 = new SimpleDateFormat("yyyy年MM月dd日");
    private static SimpleDateFormat s2 = new SimpleDateFormat("yyyy年MM月dd HH:mm:ss");
    private static DecimalFormat df = new DecimalFormat("###,##0.00");
    private static P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao = SpringContextHolder.getBean(P2pBeforeMatchDebtStateDao.class);

    /**
     * 企业代理人身份认证失败
     *
     * @return
     */
    public static String getQysfrzsb() {
        String str = "尊敬的用户您好：很遗憾，您的企业代理人身份认证失败，请您登录丝路互金网查看失败原因。";
        return str + temp;
    }

    /**
     * 企业认证失败
     *
     * @return
     */
    public static String getQyrzsb() {
        String str = "尊敬的用户您好：很遗憾，您的企业认证失败，请您登录丝路互金网查看失败原因。";
        return str + temp;
    }

    /**
     * 企业代理人身份认证成功
     *
     * @return
     */
    public static String getQysfrzcg() {
        String str = "尊敬的用户您好：恭喜您，您的企业代理人身份认证已审核通过，感谢您对我司的支持，相信有您的支持我们会做的更好！";
        return str + temp;
    }

    /**
     * 企业认证成功
     *
     * @return
     */
    public static String getQyrzcg() {
        String str = "尊敬的用户您好：恭喜您，您的企业认证已审核通过。您离完成融资前准备工作就差一步啦，请您登录后完成操作。";
        return str + temp;
    }

    /**
     * 成为免费会员
     *
     * @return
     */
    public static String getCwmfhy() {
        String str = "尊敬的用户您好：恭喜您成为平台免费会员，请您在丝路互金网站内信中查看具体会员权益，感谢您对我司的支持！";
        return str + temp;
    }

    /**
     * 会员到期前三天提醒
     *
     * @return
     */
    public static String getHydqqsttx(Date date) {
        //尊敬的用户您好：您的XX会员于XX年XX月XX日即将到期，为确保您的会员权益不间断，请及时续费。
        String str = "尊敬的用户您好：您的XX会员于" + s1.format(date) + "即将到期，为确保您的会员权益不间断，请及时续费。";
        return str + temp;
    }

    /**
     * 会员到期前一天提醒
     *
     * @return
     */
    public static String getHydqyttx() {
        String str = "尊敬的用户您好：今天是您XX会员到期的最后日期，为确保您的会员权益不间断，请及时续费。";
        return str + temp;
    }

    /**
     * 会员已到期
     *
     * @return
     */
    public static String getHyydq() {
        String str = "尊敬的用户您好：您的XX会员已到期，如需继续享有会员权益，请重新购买会员服务。";
        return str + temp;
    }

    /**
     * 评级材料审核失败
     *
     * @return
     */
    public static String getPjclshsb() {
        //尊敬的用户您好：很遗憾，您提交的XXXX材料审核未通过。请您登录丝路互金网查看未通过原因，修改评级材料并重新提交。
        String str = "尊敬的用户您好：很遗憾，您提交的评级材料审核未通过。请您登录丝路互金网查看未通过原因，修改评级材料并重新提交。";
        return str + temp;
    }

    /**
     * 评级材料收费通知
     *
     * @return
     */
    public static String getPjfsftz() {
        //尊敬的用户您好：恭喜您，您提交的XXXX材料审核已通过！为加快评级进度，请尽快支付评级费。
        String str = "尊敬的用户您好：恭喜您，您提交的评级材料审核已通过！为加快评级进度，请尽快支付评级费。";
        return str + temp;
    }

    /**
     * 未支付且市场立项未通过
     *
     * @return
     */
    public static String getWzfsclxwtg() {
        String str = "尊敬的用户您好：很遗憾，由于您未在有效时间内支付评级费用，借贷产品申请结束。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 评级结果确认通知
     *
     * @return
     */
    public static String getPjjgqrtz() {
        String str = "尊敬的用户您好：您的借贷产品信用评级已完成，请在5个工作日内确认评级结果。如届时仍未确认，系统将自动默认您对评级结果无异议。";
        return str + temp;
    }

    /**
     * 评级结果确认时间即将到期提醒通知
     *
     * @return
     */
    public static String getPjjgjjdq(Date date) {
        //尊敬的用户您好：您的借贷产品信用评级已完成，请您及时登录丝路互金网，查看并确认评级结果。确认时间截止到XX年XX月XX日 XX：XX：XX。如届时仍未确认，系统将自动默认您对评级结果无异议。
        String str = "尊敬的用户您好：您的借贷产品信用评级已完成，请您及时登录丝路互金网，查看并确认评级结果。确认时间截止到" + s2.format(date) + "。如届时仍未确认，系统将自动默认您对评级结果无异议。";
        return str + temp;
    }

    /**
     * 评级结果确认时间已经到期通知
     *
     * @return
     */
    public static String getPjjgyjdq() {
        String str = "尊敬的用户您好：由于您未在有效时间内确认评级结果，系统已自动默认您对评级结果无异议。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 无异议且级别BB以下
     *
     * @return
     */
    public static String getWyyjbBB(String level) {
        //尊敬的用户您好：您的借贷产品信用评级已完成，信用级别为XX。由于您未达到融资所需的最低信用级别BB-级，借贷产品申请结束。
        String str = "尊敬的用户您好：您的借贷产品信用评级已完成，信用级别为" + level + "。由于您未达到融资所需的最低信用级别BB-级，借贷产品申请结束。";
        return str + temp;
    }

    /**
     * 有异议且复评结果BB以下
     *
     * @return
     */
    public static String getYyyjbBB(String level) {
        //尊敬的用户您好：您的借贷产品复评已完成，信用级别为XX。由于您未达到融资所需的最低信用级别BB-级，借贷产品申请结束。
        String str = "尊敬的用户您好：您的借贷产品复评已完成，信用级别为" + level + "。由于您未达到融资所需的最低信用级别BB-级，借贷产品申请结束。";
        return str + temp;
    }

    /**
     * 评级结果确认无异议且级别在BB-A
     *
     * @return
     */
    public static String getWyyjbBB_A(String id, String level) {
        //尊敬的用户您好：您的借贷产品信用评级已完成，信用级别为XX。为加快您的融资申请进度，请您选择增信机构。
        //判断债项是否经过复评
        List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateDao.isOrNoFuPing(id);
        String fuPing = "";
        if (list != null && list.size() > 0) {
            fuPing = "复评";
        } else {
            fuPing = "信用评级";
        }
        String str = "尊敬的用户您好：您的借贷产品" + fuPing + "已完成，信用级别为" + level + "。为加快您的融资申请进度，请您选择增信机构。";
        return str + temp;
    }

    /**
     * 评级结果确认有异议且复评级别在BB-A
     *
     * @return
     */
    public static String getYyyjbBB_A(String level) {
        //尊敬的用户您好：您的借贷产品复评已完成，信用级别为XX。为加快您的融资申请进度，请您选择增信机构。
        String str = "尊敬的用户您好：您的借贷产品复评已完成，信用级别为" + level + "。为加快您的融资申请进度，请您选择增信机构。";
        return str + temp;
    }

    /**
     * 增信材料审核未通过通知
     *
     * @return
     */
    public static String getZxclshwtg() {
        //尊敬的用户您好：很遗憾，您提交的XXXX材料审核未通过。请您登录丝路互金网查看未通过原因，修改增信材料并重新提交。
        String str = "尊敬的用户您好：很遗憾，您提交的增信材料审核未通过。请您登录丝路互金网查看未通过原因，修改增信材料并重新提交。";
        return str + temp;
    }

    /**
     * 增信材料审核未通过结项通知
     *
     * @return
     */
    public static String getZxclshwtgjx() {
        String str = "尊敬的用户您好：由于您的借贷产品增信申请被驳回，借贷产品申请结束。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 评级结果确认无异议且级别在A以上
     *
     * @return
     */
    public static String getWyyjbA(String id) {
        //判断债项是否经过复评
        List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateDao.isOrNoFuPing(id);
        String fuPing = "";
        if (list != null && list.size() > 0) {
            fuPing = "复评";
        } else {
            fuPing = "信用评级";
        }
        String str = "尊敬的用户您好：您的借贷产品" + fuPing + "已完成。为加快您的融资申请进度，请尽快支付评级费。";
        return str + temp;
    }

    /**
     * 评级结果确认有异议且复评级别在A以上
     *
     * @return
     */
    public static String getYyyjbA() {
        String str = "尊敬的用户您好：您的借贷产品复评已完成。为加快您的融资申请进度，请尽快支付评级费。";
        return str + temp;
    }

    /**
     * 增信材料审核通过
     *
     * @return
     */
    public static String getZxclshtg() {
        //尊敬的用户您好：恭喜您，您提交的XXXX材料审核已通过！为加快您的融资申请进度，请尽快支付评级费。
        String str = "尊敬的用户您好：恭喜您，您提交的增信材料审核已通过！为加快您的融资申请进度，请尽快支付评级费。";
        return str + temp;
    }

    /**
     * 未支付且市场发布确认未通过
     *
     * @return
     */
    public static String getWzfscfbwtg() {
        String str = "尊敬的用户您好：很遗憾，由于您未在有效时间内支付评级费用，借贷产品申请结束。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 借贷产品信息确认通知
     *
     * @return
     */
    public static String getJdcpxxqr() {
        String str = "尊敬的用户您好：恭喜您，您已进入借贷产品信息确认阶段。为加快您的融资申请进度，请您及时登录丝路互金网确认借贷产品信息。";
        return str + temp;
    }

    /**
     * 借贷产品发布通知
     *
     * @return
     */
    public static String getJdcpfbtz() {
        String str = "尊敬的用户您好：您的借贷产品已成功发布，恭喜您进入借贷产品募集期！请您登录丝路互金网查看募集详情。";
        return str + temp;
    }

    /**
     * 借贷产品发布未通过
     *
     * @return
     */
    public static String getJdcpfbwtg() {
        String str = "尊敬的用户您好：由于您的借贷产品发布审核未通过，我们很遗憾地通知您借贷产品申请结束。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 募集暂停通知
     *
     * @return
     */
    public static String getMjzttz() {
        String str = "尊敬的用户您好：根据平台风险监控情况，我们发现存在可能影响您融资进度的信用事件，需暂停您的资金募集并进一步调查，敬请谅解。";
        return str + temp;
    }

    /**
     * 募集恢复通知
     *
     * @return
     */
    public static String getMjhftz() {
        String str = "尊敬的用户您好：根据平台风险应急处理措施，我们已排除信用事件对您融资进度的影响，并已恢复您的资金募集，感谢您的理解与配合。";
        return str + temp;
    }

    /**
     * 募集终止通知（流标）
     *
     * @return
     */
    public static String getMjzztz() {
        String str = "尊敬的用户您好：根据平台风险应急处理措施，我们很抱歉地通知您，信用事件已导致您的借贷产品无法继续募集资金，您的借贷产品已流标。";
        return str + temp;
    }

    /**
     * 募集期到期提醒通知(还有三天)
     *
     * @return
     */
    public static String getMjdqst(Date date) {
        String str = "尊敬的用户您好：您的借贷产品募集截止时间为" + s2.format(date) + "，还有3天即将到期，请您随时关注认购进度！";
        return str + temp;
    }

    /**
     * 募集期到期提醒通知(还有一天)
     *
     * @return
     */
    public static String getMjdqyt(Date date) {
        String str = "尊敬的用户您好：您的借贷产品募集截止时间为" + s2.format(date) + "，还有1天即将到期，请您随时关注认购进度！";
        return str + temp;
    }

    /**
     * 募集期满仍未满标
     *
     * @return
     */
    public static String getMjdqwmb() {
        String str = "尊敬的用户您好：您的借贷产品由于在募集期限内未满标，我们很遗憾地通知您，您的借贷产品已流标。";
        return str + temp;
    }

    /**
     * 已满标未缴费时支付询问
     *
     * @return
     */
    public static String getMbwjftz() {
        String str = "尊敬的用户您好：恭喜您，您的借贷产品已满标。为加快您的放款进度，请及时支付评级费。";
        return str + temp;
    }

    /**
     * 已满标未缴费时支付询问后仍未交费
     *
     * @return
     */
    public static String getMbwjflb() {
        String str = "尊敬的用户您好：由于未在有效时间内支付评级费，我们很遗憾地通知您，您的借贷产品已流标。";
        return str + temp;
    }

    /**
     * 机构标满标时通知融资企业
     *
     * @return
     */
    public static String getJgmbtzqy() {
        String str = "尊敬的用户您好：恭喜您，您的借贷产品已获得投资邀约。请您登录丝路互金网，在站内信中查看投资机构联系信息以便顺利获得资金。";
        return str + temp;
    }

    /**
     * 个人标满标时通知融资企业
     *
     * @return
     */
    public static String getGrmbtzqy(Double money) {
        //尊敬的用户您好：恭喜您，您的借贷产品已满标。总计募集金额XXX元，待平台放款审核通过后开始放款计息。
        String str = "尊敬的用户您好：恭喜您，您的借贷产品已满标。总计募集金额" + df.format(money) + "元，待平台放款审核通过后开始放款计息。";
        return str + temp;
    }

    /**
     * 个人标放款审核未通过
     *
     * @return
     */
    public static String getGrbfkwtg() {
        String str = "尊敬的用户您好：由于放款审核未通过，我们很遗憾地通知您，您的借贷产品已流标。";
        return str + temp;
    }

    /**
     * 个人标放款审核已通过
     *
     * @return
     */
    public static String getGrbfkytg(Double money) {
        //尊敬的用户您好：您的借贷产品已放款，总金额为XXX元，即日开始计息，进入还款期。请您关注还款日历，按时还款。
        String str = "尊敬的用户您好：您的借贷产品已放款，总金额为" + df.format(money) + "元，即日开始计息，进入还款期。请您关注还款日历，按时还款。";
        return str + temp;
    }

    /**
     * 还款日到期提醒通知  剩三天
     *
     * @return
     */
    public static String getHkrstdq(Date date, Double money) {
        //尊敬的用户您好：XX月XX日是您本期借贷产品的还款日，共计应还款XXX元。距离还款日还有3天，请您按时还款。
        String str = "尊敬的用户您好：" + s1.format(date) + "是您本期借贷产品的还款日，共计应还款" + df.format(money) + "元。距离还款日还有3天，请您按时还款。";
        return str + temp;
    }

    /**
     * 还款日到期提醒通知 最后一天
     *
     * @return
     */
    public static String getHkrzhyt(Double money) {
        //尊敬的用户您好：今天是您本期借贷产品的最后还款日，共计应还款XXX元，请您及时还款。如已还款请忽略此消息。
        String str = "尊敬的用户您好：今天是您本期借贷产品的最后还款日，共计应还款" + df.format(money) + "元，请您及时还款。如已还款请忽略此消息。";
        return str + temp;
    }

    /**
     * 还款凭证审核未通过通知(只针对机构标)
     *
     * @return
     */
    public static String getHkpzshwtg(Date date) {
        //尊敬的用户您好：您XX年XX月XX日上传的还款凭证审核未通过。请您登录丝路互金网查看未通过原因，并重新上传还款凭证。
        String str = "尊敬的用户您好：您" + s1.format(date) + "上传的还款凭证审核未通过。请您登录丝路互金网查看未通过原因，并重新上传还款凭证。";
        return str + temp;
    }

    /**
     * 缴费已完成
     *
     * @return
     */
    public static String getJfywc(String s, Double money) {
        //尊敬的用户您好：您购买XX产品的XX元已成功支付。
        String str = "尊敬的用户您好：您购买" + s + "产品的" + df.format(money) + "元已成功支付。";
        return str + temp;
    }

    /**
     * 第三方支付—支付中断
     *
     * @return
     */
    public static String getDsfzfsb(String s) {
        //尊敬的用户您好：您购买XX产品支付失败，为保证您的正常使用，请登录丝路互金网重新支付。
        String str = "尊敬的用户您好：您购买" + s + "产品支付失败，为保证您的正常使用，请登录丝路互金网重新支付。";
        return str + temp;
    }

    /**
     * 充值成功通知
     *
     * @return
     */
    public static String getCzcgtz(Double money1, Double money2) {
        //尊敬的用户您好：您在丝路互金网充值XXX元，实际到账XXX元。请您登录丝路互金网查看账户详情。
        String str = "尊敬的用户您好：您在丝路互金网充值" + df.format(money1) + "元，实际到账" + df.format(money2) + "元。请您登录丝路互金网查看账户详情。";
        return str + temp;
    }

    /**
     * 充值失败通知
     *
     * @return
     */
    public static String getCzsbtz() {
        String str = "尊敬的用户您好：您的充值操作失败。请您登录丝路互金网查看账户详情。";
        return str + temp;
    }

    /**
     * 提现成功通知
     *
     * @return
     */
    public static String getTxcgtz(Double money1, Double money2) {
        //尊敬的用户您好：您在丝路互金网提现XXX元，实际到账XXX元。请您登录丝路互金网查看账户详情。
        String str = "尊敬的用户您好：您在丝路互金网提现" + df.format(money1) + "元，实际到账" + df.format(money2) + "元。请您登录丝路互金网查看账户详情。";
        return str + temp;
    }

    /**
     * 逾期通知
     *
     * @return
     */
    public static String getYqtz(Date date, int day, Double money1, Double money2) {
        //尊敬的用户您好：截至XX年XX月XX日，您的借贷产品已逾期XX天，当期逾期金额XX元，逾期总额XX元，请您尽快还款。
        String str = "尊敬的用户您好：截至" + s1.format(date) + "，您的借贷产品已逾期" + day + "天，当期逾期金额" + df.format(money1) + "元，逾期总额" + df.format(money2) + "元，请您尽快还款。";
        return str + temp;
    }

    /**
     * 黑名单列入通知
     *
     * @return
     */
    public static String getHmdlrtz(String s) {
        //尊敬的用户您好：我们很遗憾地通知您，您所代理的企业XXX已被列入丝路互金网黑名单。请您登录丝路互金网查看详情。
        String str = "尊敬的用户您好：我们很遗憾地通知您，您所代理的企业" + s + "已被列入丝路互金网黑名单。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    /**
     * 黑名单解除通知
     *
     * @return
     */
    public static String getHmdjctz(String s) {
        //尊敬的用户您好：您所代理的企业XXX黑名单已解除。请您登录丝路互金网查看详情。
        String str = "尊敬的用户您好：您所代理的企业" + s + "黑名单已解除。请您登录丝路互金网查看详情。";
        return str + temp;
    }

    public static void main(String[] args) {
        System.out.println(getYqtz(new Date(), 3, 3.3, 454564656.245));
    }


    /**
     * *****************************************给机构用户发短信*********************************************
     */


    /**
     * 已投资且融资企业已缴评级费
     *
     * @param amount
     * @return
     */
    public static String getYtzqrzqywjpjf(Double amount) {
        String str = "尊敬的用户您好：您拟投资借贷产品，投资金额为" + df.format(amount) + "元人民币。请您登录丝路互金网，在站内信中查看融资企业联系信息以便签约放款。";
        return str + temp;
    }

    /**
     * 已投资但融资企业未缴评级费 融资企业完成支付时
     *
     * @param financingInformationId
     * @param amount
     * @return
     */
    public static String getRzqiwczfs(Double amount) {
        String str = "尊敬的用户您好：您拟投资借贷产品，投资金额为" + df.format(amount) + "元人民币。请您登录丝路互金网，在站内信中查看融资企业联系信息以便签约放款。";
        return str + temp;
    }

    /**
     * 已投资但融资企业尚未缴评级费
     *
     * @param financingName 借贷产品名称
     * @param amount        投资金额
     * @return
     */
    public static String getYtzwzfpjf(String financingName, Double amount) {
        String str = "尊敬的用户您好：您已接受投资邀约，您拟投资的借贷产品为" + financingName + "，投资金额为" + df.format(amount) + "元人民币。待融资企业支付评级费后，我们会立即通知您融资企业联系信息。";
        return str + temp;
    }

    /**
     * 放款凭证审核未通过
     *
     * @param financingName 借贷产品名称
     */
    public static String getFkpzshsb(String financingName) {
        String str = "尊敬的用户您好，您投资的借贷产品" + financingName + "，上传的放款凭证审核未通过。请您登陆丝路互金网查看未通过原因，并重新上传转账凭证。";
        return str + temp;
    }
}
