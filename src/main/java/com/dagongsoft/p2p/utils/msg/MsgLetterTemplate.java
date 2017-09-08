package com.dagongsoft.p2p.utils.msg;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.User;


/**
 * 站内信模板
 *
 * @author Chace
 */
public class MsgLetterTemplate {
    private static SimpleDateFormat s1 = new SimpleDateFormat("yyyy年MM月dd日");
    private static SimpleDateFormat s2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
    private static DecimalFormat df = new DecimalFormat("###,##0.00");
    private static P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao = SpringContextHolder.getBean(P2pEnterpriseCertifyDao.class);
    private static P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao = SpringContextHolder.getBean(P2pBeforeMatchDebtStateDao.class);

    /**
     * 企业代理人身份认证失败
     *
     * @return
     */
    public static Map<String, String> getQysfrzsb() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "企业代理人身份认证失败通知";
        String content = "&lt;p&gt;尊敬的用户，您的企业代理人身份认证失败。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=userCertify&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 企业认证失败
     *
     * @return
     */
    public static Map<String, String> getQyrzsb() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "企业认证失败通知";
        String content = "&lt;p&gt;尊敬的用户，您的企业认证失败。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=enterpriseCertify&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 企业代理人身份认证成功
     *
     * @return
     */
    public static Map<String, String> getQysfrzcg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "企业代理人身份认证成功通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您的企业代理人身份认证已审核通过，感谢您对我司的支持，相信有您的支持我们会做的更好！&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 企业认证成功
     *
     * @return
     */
    public static Map<String, String> getQyrzcg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "企业认证成功通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您的企业认证已审核通过。您离完成融资前准备工作就差一步啦，请您登录后完成操作。&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 成为免费会员
     *
     * @return
     */
    public static Map<String, String> getCwmfhy() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "会员通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您成为免费会员。&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 会员到期前三天提醒
     *
     * @return
     */
    public static Map<String, String> getHydqqsttx() {
        Map<String, String> map = new HashMap<String, String>();
        return map;
    }

    /**
     * 会员到期前一天提醒
     *
     * @return
     */
    public static Map<String, String> getHydqyttx() {
        Map<String, String> map = new HashMap<String, String>();
        return map;
    }

    /**
     * 会员已到期
     *
     * @return
     */
    public static Map<String, String> getHyydq() {
        Map<String, String> map = new HashMap<String, String>();
        return map;
    }

    /**
     * 评级材料审核失败
     *
     * @return
     */
    public static Map<String, String> getPjclshsb() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级材料审核未通过通知";
        String content = "&lt;p&gt;尊敬的用户，您提交的评级材料审核未通过。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级材料收费通知
     *
     * @return
     */
    public static Map<String, String> getPjfsftz() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级费支付通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您提交的评级材料审核已通过！为加快评级进度，请尽快&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 未支付且市场立项未通过
     *
     * @return
     */
    public static Map<String, String> getWzfsclxwtg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，很遗憾，由于您未在有效时间内支付评级费用，借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认通知
     *
     * @return
     */
    public static Map<String, String> getPjjgqrtz(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级结果确认通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）信用评级已完成，请在5个工作日内确认评级结果。如届时仍未确认，系统将自动默认您对评级结果无异议。&lt;br/&gt;点击立即&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;确认评级结果&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认时间即将到期提醒通知
     *
     * @return
     */
    public static Map<String, String> getPjjgjjdq(String financingName, Date date) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级结果确认时间即将到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）信用评级已完成，请及时确认评级结果。确认时间截止到" + s2.format(date) + "。如届时仍未确认，系统将自动默认您对评级结果无异议。立即&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;确认评级结果&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认时间已经到期通知
     *
     * @return
     */
    public static Map<String, String> getPjjgyjdq() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级结果确认时间到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，由于您未在有效时间内确认评级结果，系统已自动默认您对评级结果无异议。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 无异议且级别BB以下
     *
     * @return
     */
    public static Map<String, String> getWyyjbBB(String financingName, String level) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）信用评级已完成，信用级别为" + level + "。由于您未达到融资所需的最低信用级别BB-级，我们很遗憾的通知您借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 有异议且复评结果BB以下
     *
     * @return
     */
    public static Map<String, String> getYyyjbBB(String financingName, String level) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）复评已完成，信用级别为" + level + "。由于您未达到融资所需的最低信用级别BB-级，我们很遗憾地通知您借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认无异议且级别在BB-A
     *
     * @return
     */
    public static Map<String, String> getWyyjbBB_A(String id, String financingName, String level) {
        Map<String, String> map = new HashMap<String, String>();
        //判断债项是否经过复评
        List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateDao.isOrNoFuPing(id);
        String fuPing = "";
        if (list != null && list.size() > 0) {
            fuPing = "复评";
        } else {
            fuPing = "信用评级";
        }
        String title = "增信机构选择通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）" + fuPing + "已完成，信用级别为" + level + "。根据您的信用级别，为加快您的融资申请进度，请您&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;选择增信机构&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认有异议且复评级别在BB-A
     *
     * @return
     */
    public static Map<String, String> getYyyjbBB_A(String financingName, String level) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "增信机构选择通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）复评已完成，信用级别为" + level + "。为加快您的融资申请进度，请您&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;选择增信机构&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 增信材料审核未通过通知
     *
     * @return
     */
    public static Map<String, String> getZxclshwtg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "增信材料审核未通过通知";
        String content = "&lt;p&gt;尊敬的用户，很遗憾，您提交的增信材料审核未通过。请在材料提交页面中修改增信材料并重新提交。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 增信材料审核未通过结项通知
     *
     * @return
     */
    public static Map<String, String> getZxclshwtgjx(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，我们很遗憾地通知您，您的借贷产品（借贷产品名称" + financingName + "）增信申请被驳回，借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认无异议且级别在A以上
     *
     * @return
     */
    public static Map<String, String> getWyyjbA(String id, String financingName) {
        //判断债项是否经过复评
        List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateDao.isOrNoFuPing(id);
        String fuPing = "";
        if (list != null && list.size() > 0) {
            fuPing = "复评";
        } else {
            fuPing = "信用评级";
        }
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级费支付通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）" + fuPing + "已完成。为加快您的融资申请进度，请尽快&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 评级结果确认有异议且复评级别在A以上
     *
     * @return
     */
    public static Map<String, String> getYyyjbA(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级费支付通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）复评已完成。为加快您的融资申请进度，请尽快&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 增信材料审核通过
     *
     * @return
     */
    public static Map<String, String> getZxclshtg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级费支付通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您提交的增信材料审核已通过！为加快您的融资申请进度，请尽快&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 未支付且市场发布确认未通过
     *
     * @return
     */
    public static Map<String, String> getWzfscfbwtg() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，很遗憾，由于您未在有效时间内支付评级费用，借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 借贷产品信息确认通知
     *
     * @return
     */
    public static Map<String, String> getJdcpxxqr(String financingInformationId) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "借贷产品信息确认通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您已进入借贷产品信息确认阶段。为加快您的融资申请进度，请及时&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;确认借贷产品信息&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 借贷产品发布通知
     *
     * @return
     */
    public static Map<String, String> getJdcpfbtz(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "借贷产品发布通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）已成功发布，恭喜您进入借贷产品募集期！&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 借贷产品发布未通过
     *
     * @return
     */
    public static Map<String, String> getJdcpfbwtg(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "结项通知";
        String content = "&lt;p&gt;尊敬的用户，由于您的借贷产品（借贷产品名称" + financingName + "）发布审核未通过，我们很遗憾地通知您借贷产品申请结束。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集暂停通知
     *
     * @return
     */
    public static Map<String, String> getMjzttz() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "募集暂停通知";
        String content = "&lt;p&gt;尊敬的用户，根据平台风险监控情况，我们发现存在可能影响您融资进度的信用事件，需暂停您的资金募集并进一步调查，给您带来的不便敬请谅解。&lt;br/&gt;如有疑问请致电：010-57278038&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集恢复通知
     *
     * @return
     */
    public static Map<String, String> getMjhftz() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "募集恢复通知";
        String content = "&lt;p&gt;尊敬的用户，根据平台风险应急处理措施，我们已排除信用事件对您融资进度的影响，并已恢复您的资金募集，感谢您的理解与配合。&lt;br/&gt;如有疑问请致电：010-57278038&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集终止通知（流标）
     *
     * @return
     */
    public static Map<String, String> getMjzztz() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "流标通知";
        String content = "&lt;p&gt;尊敬的用户，根据平台风险监控情况以及风险应急处理措施，我们很抱歉地通知您，信用事件已导致您的借贷产品无法继续募集资金，您的借贷产品已流标。&lt;br/&gt;如有疑问请致电：010-57278038&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集期到期提醒通知(还有三天)
     *
     * @return
     */
    public static Map<String, String> getMjdqst(String financingName, Date date) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "募集期到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）募集截止时间为" + s2.format(date) + "，还有3天即将到期，请您随时关注认购进度！&lt;br/&gt;点此&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集期到期提醒通知(还有一天)
     *
     * @return
     */
    public static Map<String, String> getMjdqyt(String financingName, Date date) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "募集期到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）募集截止时间为" + s2.format(date) + "，还有1天即将到期，请您随时关注认购进度！&lt;br/&gt;点此&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 募集期满仍未满标
     *
     * @return
     */
    public static Map<String, String> getMjdqwmb(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "流标通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）由于在募集期限内未满标，我们很遗憾地通知您，您的借贷产品已流标。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 已满标未缴费时支付询问
     *
     * @return
     */
    public static Map<String, String> getMbwjftz(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "评级费支付通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您的借贷产品（借贷产品名称" + financingName + "）已满标。为加快您的放款进度，请及时&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 已满标未缴费时支付询问后仍未交费
     *
     * @return
     */
    public static Map<String, String> getMbwjflb(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "流标通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）由于未在有效时间内支付评级费，我们很遗憾地通知您，您的借贷产品已流标。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 机构标满标时通知融资企业
     *
     * @param financingName 借贷产品名称
     * @param name          机构名称
     * @param address       机构地址
     * @param contacts      机构联系人姓名
     * @param department    联系人部门
     * @param position      联系人职位
     * @param phone         联系人电话
     * @return
     */
    public static Map<String, String> getJgmbtzqy(String financingName, String name, String address, String contacts, String department, String position, String phone) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "满标通知";
        String content = "尊敬的用户，恭喜您，您的借贷产品（借贷产品名称" + financingName + "）已获得投资邀约。以下为投资机构联系信息：&lt;br/&gt;投资机构名称：" + name + "&lt;br/&gt;投资机构地址：" + address + "&lt;br/&gt;联系人：" + contacts + "&lt;br/&gt;联系人部门：" + department + "&lt;br/&gt;联系人职位：" + position + "&lt;br/&gt;联系电话：" + phone + "&lt;br/&gt;请您及时与投资方联系以便顺利获得资金。";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 个人标满标时通知融资企业
     *
     * @param financingName   借贷产品名称
     * @param financingAmount 募集金额
     * @return
     */
    public static Map<String, String> getGrmbtzqy(String financingName, Double financingAmount) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "满标通知";
        String content = "&lt;p&gt;尊敬的用户，恭喜您，您的借贷产品（借贷产品名称" + financingName + "）已满标。总计募集金额" + df.format(financingAmount) + "元，待平台放款审核通过后开始放款计息，请您留意！&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 个人标放款审核未通过
     *
     * @return
     */
    public static Map<String, String> getGrbfkwtg(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "流标通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）由于放款审核未通过，我们很遗憾地通知您，您的借贷产品已流标。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 个人标放款审核已通过
     *
     * @return
     */
    public static Map<String, String> getGrbfkytg(String financingName, Double amount) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "放款通知";
        String content = "&lt;p&gt;尊敬的用户，您的借贷产品（借贷产品名称" + financingName + "）已放款，总金额为" + df.format(amount) + "元，即日开始计息，进入还款期。请您关注还款日历，按时还款。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myDebt&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 还款日到期提醒通知  剩三天
     *
     * @param financingName 借贷产品名称
     * @param date          还款日期
     * @param sumAmount     应还款额
     * @param principal     本金
     * @param interest      利息
     * @return
     */
    public static Map<String, String> getHkrstdq(String financingName, Date date, Double sumAmount, Double principal, Double interest) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "还款日到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，" + s1.format(date) + "是您本期借贷产品（借贷产品名称" + financingName + "）的还款日，共计还款金额" + df.format(sumAmount) + "元，应还本金" + df.format(principal) + "元，应还利息" + df.format(interest) + "元。目前距离还款日还有3天，请您关注还款日历，按时还款。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 还款日到期提醒通知 最后一天
     *
     * @param financingName 借贷产品名称
     * @param sumAmount     应还款额
     * @param principal     本金
     * @param interest      利息
     * @return
     */
    public static Map<String, String> getHkrzhyt(String financingName, Double sumAmount, Double principal, Double interest) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "还款日到期提醒通知";
        String content = "&lt;p&gt;尊敬的用户，今天是您本期借贷产品（借贷产品名称" + financingName + "）的最后还款日，共计应还款" + df.format(sumAmount) + "元，应还本金" + df.format(principal) + "元，应还利息" + df.format(interest) + "元。为保证您的良好还款记录、避免逾期给您带来的不便，请您及时还款。如已还款请忽略此消息。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 还款凭证审核未通过通知(只针对机构标)
     *
     * @return
     */
    public static Map<String, String> getHkpzshwtg(Date date) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "还款凭证审核未通过通知";
        String content = "&lt;p&gt;尊敬的用户，您" + s1.format(date) + "上传的还款凭证审核未通过。请在还款凭证上传页面中重新上传还款凭证。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 缴费已完成
     *
     * @param name   产品名
     * @param amount 金额
     * @return
     */
    public static Map<String, String> getJfywc(String name, Double amount) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "支付成功通知";
        String content = "&lt;p&gt;尊敬的用户，您购买" + name + "产品的" + df.format(amount) + "元已成功支付。&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 第三方支付—支付中断
     *
     * @param name 产品名
     * @return
     */
    public static Map<String, String> getDsfzfsb(String name) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "支付失败通知";
        String content = "&lt;p&gt;尊敬的用户，您购买" + name + "产品支付失败，为保证您的正常使用，请及时&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myFinancApp&quot;&gt;支付评级费。&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 充值成功通知
     *
     * @param amount1 充值金额
     * @param amount2 实际到账金额
     * @return
     */
    public static Map<String, String> getCzcgtz(Double amount1, Double amount2) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "充值成功通知";
        String content = "尊敬的用户，您在丝路互金网充值" + df.format(amount1) + "元，实际到账" + df.format(amount2) + "元。";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 充值失败通知
     *
     * @return
     */
    public static Map<String, String> getCzsbtz() {
        Map<String, String> map = new HashMap<String, String>();
        String title = "充值失败通知";
        String content = "尊敬的用户，您的充值操作失败。点击查看账户详情。（备注：链接至账户充值页面）";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 提现成功通知
     *
     * @param amount1 提现金额
     * @param amount2 实际到账金额
     * @return
     */
    public static Map<String, String> getTxcgtz(Double amount1, Double amount2) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "提现成功通知";
        String content = "尊敬的用户，您在丝路互金网提现" + df.format(amount1) + "元，实际到账" + df.format(amount2) + "元。";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 逾期通知
     *
     * @param financingName 借贷产品名称
     * @param date          截止日期
     * @param days          逾期天数
     * @param thisAmount    当期逾期金额
     * @param principal     本金
     * @param interest      利息
     * @param fine          罚金
     * @param sumAmount     逾期总额
     * @return
     */
    public static Map<String, String> getYqtz(String financingName, Date date, int days, Double thisAmount, Double principal, Double interest, Double fine, Double sumAmount) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "逾期通知";
        String content = "&lt;p&gt;尊敬的用户，截至" + s1.format(date) + "，您的借贷产品（借贷产品名称" + financingName + "）已逾期" + days + "天，当期逾期金额" + df.format(thisAmount) + "元，其中本金" + df.format(principal) + "元、利息" + df.format(interest) + "元、罚金" + df.format(fine) + "元，逾期总额" + df.format(sumAmount) + "元，为避免造成更严重的后果，请您尽快还款。&lt;br/&gt;点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 黑名单列入通知
     *
     * @return
     */
    public static String getHmdlrtz() {
        return "";
    }

    /**
     * 黑名单解除通知
     *
     * @return
     */
    public static String getHmdjctz() {
        return "";
    }


    /**
     * **********************************给机构用户发消息*********************************
     */

    /**
     * 已投资且融资企业已缴评级费
     *
     * @param financingInformationId 借贷产品id
     * @param amount                 投资金额
     * @return
     */
    public static Map<String, String> getYtzqrzqywjpjf(String financingInformationId, Double amount) {
        P2pEnterpriseCertify pec = p2pEnterpriseCertifyDao.getContactByFinancingId(financingInformationId);
        P2pFinancingInformation p2pFinancingInformation = pec.getP2pFinancingInformation();
        P2pRegUserCertify p2pRegUserCertify = pec.getP2pRegUserCertify();
        User user = pec.getUser();
        Map<String, String> map = new HashMap<String, String>();
        String title = "投资邀约通知";
        String content = "&lt;p&gt;";
        content += "尊敬的用户，您拟投资借贷产品（借贷产品名称" + p2pFinancingInformation.getFinacingName() + "），投资金额为" + df.format(amount) + "元人民币。以下为融资企业联系信息：&lt;br/&gt;";
        content += "融资企业名称：" + pec.getEnterpriseName() + "&lt;br/&gt;";
        content += "融资企业地址：" + pec.getRegisteredAddress() + "&lt;br/&gt;";
        content += "融资企业电话：" + pec.getTelephoneNum() + "&lt;br/&gt;";
        if (pec.getP2pUserInformation() != null && pec.getP2pUserInformation().getContactName() != null && !"".equals(pec.getP2pUserInformation().getContactName()) && pec.getP2pUserInformation().getContactPhone() != null && !"".equals(pec.getP2pUserInformation().getContactPhone())) {
            content += "联系人：" + pec.getP2pUserInformation().getContactName() + "&lt;br/&gt;";
            content += "联系人电话：" + pec.getP2pUserInformation().getContactPhone() + "&lt;br/&gt;";
        } else {
            content += "代理人：" + p2pRegUserCertify.getRealName() + "&lt;br/&gt;";
            content += "代理人电话：" + user.getPhone() + "&lt;br/&gt;";
        }
        content += "请您联系融资企业签约放款。&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 已投资但融资企业未缴评级费 融资企业完成支付时
     *
     * @param financingInformationId 借贷产品id
     * @param amount                 投资金额
     * @return
     */
    public static Map<String, String> getRzqiwczfs(String financingInformationId, Double amount) {
        P2pEnterpriseCertify pec = p2pEnterpriseCertifyDao.getContactByFinancingId(financingInformationId);
        P2pFinancingInformation p2pFinancingInformation = pec.getP2pFinancingInformation();
        P2pRegUserCertify p2pRegUserCertify = pec.getP2pRegUserCertify();
        User user = pec.getUser();
        Map<String, String> map = new HashMap<String, String>();
        String title = "投资邀约通知";
        String content = "&lt;p&gt;";
        content += "尊敬的用户，您拟投资借贷产品（借贷产品名称" + p2pFinancingInformation.getFinacingName() + "），投资金额为" + df.format(amount) + "元人民币。以下为融资企业联系信息：&lt;br/&gt;";
        content += "融资企业名称：" + pec.getEnterpriseName() + "&lt;br/&gt;";
        content += "融资企业地址：" + pec.getRegisteredAddress() + "&lt;br/&gt;";
        content += "融资企业电话：" + pec.getTelephoneNum() + "&lt;br/&gt;";
        if (pec.getP2pUserInformation() != null && pec.getP2pUserInformation().getContactName() != null && !"".equals(pec.getP2pUserInformation().getContactName()) && pec.getP2pUserInformation().getContactPhone() != null && !"".equals(pec.getP2pUserInformation().getContactPhone())) {
            content += "联系人：" + pec.getP2pUserInformation().getContactName() + "&lt;br/&gt;";
            content += "联系人电话：" + pec.getP2pUserInformation().getContactPhone() + "&lt;br/&gt;";
        } else {
            content += "代理人：" + p2pRegUserCertify.getRealName() + "&lt;br/&gt;";
            content += "代理人电话：" + user.getPhone() + "&lt;br/&gt;";
        }
        content += "请您联系融资企业签约放款。&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 已投资但融资企业尚未缴评级费
     *
     * @param financingName 借贷产品名称
     * @param amount        投资金额
     * @return
     */
    public static Map<String, String> getYtzwzfpjf(String financingName, Double amount) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "投资邀约通知";
        String content = "&lt;p&gt;尊敬的用户，您已接受投资邀约，您拟投资的借贷产品为" + financingName + "，投资金额为" + df.format(amount) + "元人民币。待融资企业支付评级费后，我们会立即通知您融资企业联系信息。&lt;br/&gt;";
        content += "点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/Institution/ctrlMenu?mode=investmentGeneral&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

    /**
     * 放款凭证审核未通过
     *
     * @param financingName 借贷产品名称
     */
    public static Map<String, String> getFkpzshsb(String financingName) {
        Map<String, String> map = new HashMap<String, String>();
        String title = "转账凭证审核未通过通知";
        String content = "&lt;p&gt;尊敬的用户，您投资的借贷产品" + financingName + "，上传的转账凭证审核未通过。请在转账凭证上传页面中重新上传转账凭证。&lt;br/&gt;";
        content += "点击&lt;a style=&quot;color:blue&quot; href=&quot;/dagongp2p/a/user/Institution/ctrlMenu?mode=investmentGeneral&quot;&gt;查看详情&lt;/a&gt;&lt;/p&gt;";
        map.put("title", title);
        map.put("content", content);
        return map;
    }

}
