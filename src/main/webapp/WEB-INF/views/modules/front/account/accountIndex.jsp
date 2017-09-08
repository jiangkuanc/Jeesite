<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }

        .tablist li {
            border-bottom: 1px solid #bf1a20;
        }

        .tablist .currents {
            display: block;
            position: relative;
            color: #bf1a20;
        }

        .tablist .currents span {
            border-top: 2px solid #bf1a20;
            color: #bf1a20;
            border-right: 1px solid #bf1a20;
        }

        .tablist .botm-line {
            width: 50%;
            float: left;
            height: 44px;
        }
    </style>
    <script type="text/javascript">
        function post(url, params) {
            var temp = document.createElement('form');
            temp.action = url;
            temp.method = 'post';
            temp.style.display = 'none';
            for (var x in params) {
                var opt = document.createElement('input');
                opt.name = x;
                opt.value = params[x];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }
        function sendForm(statu) {
            if (statu == -1) {
                post('${ctx}/user/p2pUserInformation/accountPermission');
            } else {
                post('${ctx}/user/p2pUserInformation/accountPermission', {
                    currentStage: statu
                });
            }
        }
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="zhright_top">
        <!--左侧-->
        <div class="zh-top_left pull-left">
            <div class="pull-left">
                <c:if test="${p2pUserInformation.userpic != null}">
                    <p>
                        <img
                                src="${p2pUserInformation.userpic}"
                                alt="" style="width:88px;">
                    </p>
                </c:if>
                <p class="zh-user">
                    <a
                            href="${ctx}/user/p2pUserInformation/accountPermission?mode=setUserpic">设置头像</a>
                </p>
            </div>
            <div class="pull-left top-text">
                <p class="ninhao">
                    您好，<span>${user.loginName}</span>
                </p>
                <p
                        style="width: 236px; word-wrap:break-word;word-break:break-all; ">
                    企业名称：<span> <c:if
                        test="${p2pEnterpriseCertify.auditState == null}">
                    无 <a href="${ctx}/user/p2pUserInformation/financingPermission"
                         style="color: blue">进行企业认证</a>
                </c:if> <c:if test="${p2pEnterpriseCertify.auditState == 3}">
                    审核中
                </c:if> <c:if test="${p2pEnterpriseCertify.auditState == 1}">
                    <span title="${p2pEnterpriseCertify.enterpriseName}">${fns:abbr(p2pEnterpriseCertify.enterpriseName,23)}</span>
                </c:if> <c:if test="${p2pEnterpriseCertify.auditState == 2}">
                    未通过认证 <a
                        href="${ctx}/user/p2pUserInformation/financingPermission"
                        style="color: blue">进行企业认证</a>
                </c:if> </span>
                </p>
                <p
                        style="width: 236px; word-wrap:break-word;word-break:break-all; ">
                    账户名称：<span> <c:if
                        test="${p2pRegUserCertify.auditState == null}">
                    未进行实名认证 <a style="color: blue"
                               href="${ctx}/user/p2pUserInformation/financingPermission">立即认证</a>
                </c:if> <c:if test="${p2pRegUserCertify.auditState == 1}">
                    ${p2pRegUserCertify.realName}
                </c:if> <c:if test="${p2pRegUserCertify.auditState == 3}">
                    实名认证审核中
                </c:if> <c:if test="${p2pRegUserCertify.auditState == 2}">
                    实名认证审核未通过 <a style="color: blue"
                                 href="${ctx}/user/p2pUserInformation/accountPermission?mode=userCertify">请补充材料</a>
                </c:if> </span>
                </p>
                <p>
                    手机：<span><c:if
                        test="${user.phone!=null}">${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}</c:if></span>
                </p>
            </div>
        </div>
        <!--右侧-->
        <div class="zh-top_right pull-left rongzizh"
             style="margin-left: 50px">
            <p class="ljtzje">
                累计融资金额：<span><fmt:formatNumber pattern="#,###,##0.00"
                                               value="${allFinancingAmount}"/>元</span>
            </p>
            <p class="dhje">
                待还款金额：<span><c:choose>
                <c:when test="${notPaid != 0}">
                    <fmt:formatNumber pattern="#,###,###.00" value="${notPaid}"/>
                </c:when>
                <c:otherwise>0.00</c:otherwise>
            </c:choose>元</span>
            </p>
            <p class="wyjk">
                <a href="${ctx}/user/p2pUserInformation/financingPermission">
                    <button
                            class="btn">我要借款
                    </button>
                </a>
            </p>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="zh-right-bottom  rz-right-bottom">
        <div class="tabs " id="tabs" style="width:100%">
            <!-- <div class="tz">
                    <h3>我的借款项目</h3>
                </div> -->
            <ul class="tablist">
                <li class="two currents"><span>我的借款项目</span>
                </li>
                <li class="two"><span>我的评级项目</span>
                </li>
                <li class="botm-line"></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="tabInfo">
                <%-- <div class="rz-time">
                    <form id="dateQueryForm" action="${ctx}/user/p2pUserInformation/accountPermission" method="post" style="float: left;">
                            <!-- <span class="chaxun">按时间查询：</span>
                            <input type="text" id="beginDate" name="beginDate" placeholder="请选择日期"  class="mh_date" readonly>
                            <b>至</b>
                            <input type="text" id="endDate" name="endDate" placeholder="请选择日期"  class="mh_date" readonly> -->
                        </form>
                    <span class="ztchaxun">按状态查询：</span> <a
                        href="javascript:sendForm(500)">募集中</a> <a
                        href="javascript:sendForm(800)">还款中</a> <a
                        href="javascript:sendForm(900)">已完成</a> <a
                        href="javascript:sendForm(-1)">全部</a>
                </div> --%>

                <c:if test="${fn:length(list) == 0 && flag == null}">
                    <table class="table cai-table">
                        <thead style="height:37px">
                        <tr class="active list-th">
                            <th width="17%">借款项目名称</th>
                            <th width="10%">信用等级</th>
                            <th width="8%">金额</th>
                            <th width="14%">利率(年化)</th>
                            <th width="10%">期限</th>
                            <th width="17%">评级报告</th>
                            <th width="15%">起息时间</th>
                            <th width="9%">状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="8" rowspan="2">
                                <div class="cai-text">
                                    暂无借款信息，立即 <a
                                        href="${ctx}/user/p2pUserInformation/financingPermission">申请借款。</a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${fn:length(list) == 0 && flag != null}">
                    <table class="table cai-table">
                        <thead style="height:37px">
                        <tr class="active list-th">
                            <th width="17%">借款项目名称</th>
                            <th width="10%">信用等级</th>
                            <th width="8%">金额</th>
                            <th width="14%">利率(年化)</th>
                            <th width="10%">期限</th>
                            <th width="17%">评级报告</th>
                            <th width="15%">起息时间</th>
                            <th width="9%">状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="8" rowspan="2">
                                <div class="cai-text">
                                    当前查询状态无借款信息。</a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </c:if>
                <c:choose>
                    <c:when
                            test="${fn:length(list) == 1 && list[0].currentStage < '500'}">
                        <c:if
                                test="${list[0].currentStage == '101' || list[0].currentStage == '201' || list[0].currentStage == '200'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">
                                            借款正在进行中，继续<a
                                                href="${ctx}/user/p2pUserInformation/financingPermission">提交材料</a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '202'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">借款正在进行中，大公正在为您进行材料审核</div>
                                        <div class="cai-text">
                                            将在<span>2个工作日内</span>完成，请等待...
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '210'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">借款正在进行中，大公正在为您进行评级</div>
                                        <div class="cai-text">
                                            将在<span>2个工作日内</span>完成，请等待...
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '211'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">评级已完成，请您确认评级结果</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if
                                test="${list[0].currentStage == '212' || list[0].currentStage == '220'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">正在对您的评级报告进行修改</div>
                                        <div class="cai-text">
                                            将在<span>2个工作日内</span>完成，请等待...
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '230'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">借款正在进行中，请您继续提交增信证明</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '250'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">借款正在进行中，请您支付评级费</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '302'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">借款正在进行中，请您确认借款项目信息</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${list[0].currentStage == '400'}">
                            <table class="table cai-table">
                                <thead style="height:37px">
                                <tr class="active list-th">
                                    <th width="17%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="8%">金额</th>
                                    <th width="14%">利率(年化)</th>
                                    <th width="10%">期限</th>
                                    <th width="17%">评级报告</th>
                                    <th width="15%">起息时间</th>
                                    <th width="9%">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="8" rowspan="2">
                                        <div class="cai-text">正在对您的借款项目进行发布审核，请耐心等待</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div id="div">
                            <c:forEach items="${list}" var="p2p" end="${i}">
                                <c:if test="${p2p.currentStage >= '500'}">
                                    <table class="table table-hover">
                                        <thead style="height:37px">
                                        <tr class="active list-th">
                                            <th width="17%" class="noWrap">借款项目名称</th>
                                            <th width="10%" class="noWrap">信用等级</th>
                                            <th width="8%" class="noWrap">金额</th>
                                            <th width="14%" class="noWrap">利率(年化)</th>
                                            <th width="10%" class="noWrap">期限</th>
                                            <th width="17%" class="noWrap">评级报告</th>
                                            <th width="15%" class="noWrap">起息时间</th>
                                            <th width="9%" class="noWrap">状态</th>
                                        </tr>
                                        </thead>
                                        <tbody id="itemContainer">
                                        <c:forEach items="${list}" var="p2p">
                                            <c:if test="${p2p.currentStage >= '500'}">
                                                <tr class="tr">
                                                    <td title="${p2p.finacingName}"
                                                        style="color: #333">${fns:abbr(p2p.finacingName,40)}</td>
                                                    <td><c:choose>
                                                        <c:when test="${p2p.p2pFinancingRatingInfo.ratingLevel == null}">-</c:when>
                                                        <c:otherwise>${p2p.p2pFinancingRatingInfo.ratingLevel}</c:otherwise>
                                                    </c:choose></td>
                                                    <td><c:choose>
                                                        <c:when test="${p2p.p2pFinancingRatingInfo.recommendedAmount == 0}">-</c:when>
                                                        <c:otherwise>
                                                            <!-- 申请金额和批复金额，那个数值小，用那个 -->
                                                            <fmt:formatNumber
                                                                    value="${(p2p.p2pFinancingRatingInfo.recommendedAmount>p2p.applicationAmount?p2p.applicationAmount:p2p.p2pFinancingRatingInfo.recommendedAmount)/10000}"
                                                                    pattern="#,###"/>万</c:otherwise>
                                                    </c:choose></td>
                                                    <td><fmt:formatNumber
                                                            pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                                    </td>
                                                    <td>${p2p.financingMaturity}个月</td>
                                                    <td><a title="点击下载" style="color: #2f84d7"
                                                           href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${p2p.id}">${fns:abbr(p2p.finacingName,40)}</a>
                                                    </td>
                                                    <td><c:choose>
                                                        <c:when test="${!empty p2p.givingOutTime}">
                                                            <fmt:formatDate value="${p2p.givingOutTime}"
                                                                            pattern="yyyy-MM-dd"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>
                                                    </c:choose></td>
                                                    <td><c:if test="${p2p.currentStage == '900'}">
                                                        <input class="hkz rz-but" type="button" value="已完成"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '500'}">
                                                        <input class="mjz rz-but" type="button" value="募集中"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '901'}">
                                                        <input class="yqwh rz-but" type="button" value="流标"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '902'}">
                                                        <input class="yqwh rz-but" type="button" value="结项"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '600'}">
                                                        <input class="yqwh rz-but" type="button" value="满标待审核"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '700'}">
                                                        <input class="hkz rz-but" type="button" value="待放款"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if test="${p2p.currentStage == '800'}">
                                                        <input class="yhk rz-but" type="button" value="还款中"
                                                               style="border: none;border-radius:4px">
                                                    </c:if> <c:if
                                                            test="${p2p.currentStage == '909' || p2p.currentStage == '999'}">
                                                        <input class="yqwh rz-but" type="button" value="流标"
                                                               style="border: none;border-radius:4px">
                                                    </c:if></td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="holder"></div>
                                    <c:set value="0" var="i"/>
                                </c:if>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tabInfo" style="display: none;">

                <table class="table">
                    <thead style="height:37px">
                    <tr class="active list-th">
                        <th width="17%">项目名称</th>
                        <th width="10%">主体信用等级</th>
                        <th width="8%">展望</th>
                        <th width="14%">评级时间</th>
                        <th width="10%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list2}" var="rating">
                        <tr>
                            <c:if test="${rating.p2pRatingServiceInfo != null}">
                                <td style="color: #333">${rating.p2pRatingServiceInfo.ratingName}</td>
                            </c:if>
                            <c:if test="${rating.p2pFinancingInformation != null}">
                                <td style="color: #333">${rating.p2pFinancingInformation.finacingName}</td>
                            </c:if>

                            <td>${rating.p2pFinancingRatingInfo.mainCreditGrade}</td>
                            <td>${fns:getDictLabel(rating.p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '')}</td>
                            <td><fmt:formatDate value="${rating.p2pFinancingRatingInfo.publishTime}"
                                                pattern="yyyy/MM/dd"/></td>
                            <c:if test="${rating.p2pRatingServiceInfo != null}">
                                <td><a style="color: #2f84d7"
                                       href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport2?fid=${rating.p2pRatingServiceInfo.id}">下载</a>
                                </td>
                            </c:if>
                            <c:if test="${rating.p2pFinancingInformation != null}">
                                <td><a style="color: #2f84d7"
                                       href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${rating.p2pFinancingInformation.id}">下载</a>
                                </td>
                            </c:if>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    function fenye(content, id) {
        $(content).jPages({
            containerID: id, //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 2, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20
            //分页时动画持续时间，0表示无动画
        });
    }
    fenye("div.holder", "itemContainer");

    $(function () {
        $("input.mh_date").manhuaDate({
            Event: "click",//可选
            Left: 0,//弹出时间停靠的左边位置
            Top: -16,//弹出时间停靠的顶部边位置
            fuhao: "-",//日期连接符默认为-
            isTime: false,//是否开启时间值默认为false
            beginY: 1980,//年份的开始默认为1949
            endY: 2025
            //年份的结束默认为2049
        });
    });

    $(".tablist").on(
        "click",
        ".two",
        function () {
            $(this).addClass("currents").siblings(".two").removeClass(
                "currents");
            $(".tabInfo").eq($(this).index()).show().siblings(
                ".tabInfo").hide();
        })
</script>
</body>
</html>