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

    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/financing.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/fileinput.css">

    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/common/unslider.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>

    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }

        .zh-right {
            padding: 3%;
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

        .banner {
            position: relative;
            text-align: center;
        }

        .banner li {
            list-style: none;
        }

        .banner ul li {
            float: left;
        }

        .dots {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 20px;
        }

        .dots li {
            display: inline-block;
            width: 10px;
            height: 10px;
            margin: 0 4px;
            text-indent: -999em;
            border: 2px solid #fff;
            border-radius: 6px;
            cursor: pointer;
            opacity: .4;
            -webkit-transition: background .5s, opacity .5s;
            -moz-transition: background .5s, opacity .5s;
            transition: background .5s, opacity .5s;
        }

        ul, ol {
            padding: 0;
        }

        .dots li.active {
            background: #fff;
            opacity: 1;
        }

        .arrow {
            position: absolute;
            top: 45%;
        }

        #al {
            left: 15px;
        }

        #ar {
            right: 15px;
        }

        .enterpriseMenuLi {
            padding: 10px 0;
            font-size: 18px;
            text-shadow: rgba(237, 125, 79, 0.647) 1px 1px 5px;
            background: rgb(240, 240, 240);
            -webkit-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            -moz-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            box-shadow: 6px 6px 6px rgb(220, 220, 220);
        }

        .enterpriseMenuLiSpan {
            padding: 10px 0;
            font-size: 18px;
            font-weight: bold;
            color: #ED7D4F;
        }

        .enterpriseMenuLiClick {
            padding: 10px 0;
            font-size: 20px;
            text-shadow: rgba(0, 0, 0, 0.647) 1px 1px 5px;
            background: rgb(237, 125, 79);
            -webkit-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            -moz-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            box-shadow: 6px 6px 6px rgb(220, 220, 220);
        }

        .enterpriseMenuLiSpanClick {
            padding: 10px 0;
            font-size: 18px;
            font-weight: bold;
            color: rgb(255, 255, 255);
        }

        .zh-con {
            border: none;
            padding-top: 20px
        }

        .zh-right {
            width: 78%;
            margin-left: 2%;
            border: none;
        }

        .zh-left .zh-p {
            padding: 10px 0
        }

        .zh-left .qymc {
            background: #ED7D4F;
            color: #fff;
            padding: 20px 0
        }

        .tabs {
            padding-left: 0px;
        }

        .btn-default {
            padding: 20px 0;
            overflow: hidden;
        }

        <!--
        -------------added by dingguolei---------------------- >
        * {
            margin: 0;
            padding: 0;
        }

        #table-wrap {
            width: 100%;
            margin: 0 auto;
        }

        #table-wrap h2 {
            font-size: 22px;
            color: #333;
            font-weight: bold;
            line-height: 22px;
            margin: 0;
            text-align: center;
            font-family: "Microsoft YaHei";
            padding: 0;
        }

        .table-show {

        }

        .table-show h3 {
            color: #bf1a20;
            font-size: 20px;
            font-weight: bold;
            text-indent: 23px;
            margin: 0;
            padding: 0;
        }

        .table {
            border-radius: 5px;
            border: 1px solid #dadada;
            width: 100%;
            margin: 0 auto;
            position: relative;
            margin-left: 2%
        }

        .table > tbody > tr > td {
            vertical-align: inherit;
            border: none;
            border-bottom: 1px solid #dadada;
        }

        #myModal1 .table > tbody > tr > td, #myModal2 .table > tbody > tr > td, #myModal3 .table > tbody > tr > td {
            border: 1px solid #dadada;
        }

        .table tr {
            height: 60px;
            text-align: center;
            border-top: 0;
            border-bottom: 0px solid #dadada;
        }

        .table tr td {
            height: 60px;
            line-height: 60px;
            border-bottom: 1px solid #dadada;
        }

        .table > tbody > tr > .same-td {
            background: #fddede;
            color: #640303;
            font-size: 14px;
            text-align: center;
            font-weight: bold;
            border-bottom: 1px solid #fff;
        }

        .report {
            width: 100%;
            height: 20px;
            display: block;
            margin-left: 90%;
            color: #ea5e0a;
            background: url("${ctxStatic}/dist/images/warning_03.png") no-repeat 80px center;
        }

        /*遮罩层*/
        #exampleModal div {
            color: #333;
            font-size: 16px;
        }

        #exampleModal .col-lg-4 {
            text-align: right;
            line-height: 42px;
            height: 42px;
            margin: 0;
            padding: 0;
        }

        #exampleModal .col-lg-8 {
            text-align: left;
            line-height: 42px;
            height: 42px;
            margin: 0;
            padding: 0;
        }

        #exampleModal .col-lg-4 span {
            color: #bf1a20;
            vertical-align: -4px;
        }

        .dropdown-menu {
            width: 160px;
            left: 28px;
            top: 32px;
            border-radius: 0;
        }

        .dropdown-menu li {
            width: 160px;
            height: 24px;
            text-align: left;
            color: #333;
            font-size: 14px;
            line-height: 24px;
            text-indent: 5px;
        }

        .dropdown-menu li:hover {
            background: #e0e0e0;
        }

        .dropdown {
            display: inline-block;
        }

        .modal-footer {
            border: none;
        }

        #exampleModal .modal-footer button {
            width: 88px;
            height: 30px;
            line-height: 0;
            background: #f2434a;
            font-size: 16px;
            text-align: center;
            border: none;
            margin: 0 auto;
        }

        #exampleModal .modal-footer button:last-child {
            margin-right: 257px;
        }

        .breadcrumb > li + li:after {
            padding: 0;
        }

        .modal-header .close {
            margin-top: -13px;
        }

        .file-input {
            overflow-x: initial;
            display: inline-block;
            vertical-align: top;
            width: 71%;
        }

        /*信用级别  */
        .xyjb-p {
            padding: 6% 1% 6% 2%;
            font-size: 16px;
            font-weight: 700;
            float: left
        }

        .ratBtn {
            margin-top: 6px;
            font-size: 14px;
            height: 27px;
            line-height: 14px;
            padding-top: 0;
            padding: 6px !important
        }

        .btn-default {
            padding: 20px 0;
            overflow: hidden;
        }

        .ratBtn:hover {
            color: #fff;
            background: #ED7D4F;
        }

        @media (max-width: 1417px) {
            .xyjb-p {
                padding-left: 5%;
                font-size: 14px
            }

            .ratBtn {
                font-size: 13px;
            }
        }

        @media (max-width: 1320px) {
            .xyjb-p {
                padding-left: 0;
                font-size: 13px
            }

            .ratBtn {
                font-size: 12px;
            }
        }

        .zh-right {
            font-family: "Microsoft YaHei"
        }

        .touzizq-content {
            margin-bottom: 50px;
        }

        ul.zhzl li {
            font-size: 18px;
            font-weight: 800;
            padding: 10px 0;
            cursor: pointer;
        }

        .rz-right-bottom p {
            line-height: 1.5;
            margin-bottom: 5px;
        }

        .zhzl li.active, .zhzl li:hover {
            background-color: #ED7D4F;
            color: #ffffff;
        }

        .zhzl li.active, .zhzl li:hover {
            background-color: #ED7D4F;
            color: #ffffff;
        }

        .zhzl li.active span, .zhzl li:hover span.enterpriseMenuLiSpan {
            color: #ffffff;
        }

        #inputfile {
            display: inline-block
        }

        <!--
        -------------added by dingguolei---------------------- >
    </style>
    <script type="text/javascript">
        function unslider() {

        }
        function tiaozhuan(url) {
            window.location.href = url;
        }
        function payReport() {
            window.location.href = '${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=${financingRatingInfo.id}';
        }
    </script>
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/financing/p2pFinancingInformation/preLoadFinancingList"> 我要投资</a></li>
        <li><a href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${financingInformationId}"> 产品详情</a>
        </li>
        <li>企业数据库</li>
    </ol>
</div>
<!-- 引入账号菜单文件 -->
<div class="clearfix"></div>
</div>

<div style="background-color: #F6F6F6">
    <div class="zh-con">
        <!--左侧内容区域-->
        <div class="zh-left pull-left" style="background-color: white">
            <p class="zh-p qymc">${enterpriseName}</p>
            <%-- <p class="zh-p">信用级别:${financingRatingInfo.ratingLevel}/${financingRatingInfo.rateExpectation==1?'正面':financingRatingInfo.rateExpectation==2?'稳定':financingRatingInfo.rateExpectation==3?'负面':''}<button onclick="payReport();"  class='btn ratBtn pull-right buyReport'>购买报告</button></p>--%>
            <p class="xyjb-p pull-left">
                信用级别:${financingRatingInfo.ratingLevel}/${financingRatingInfo.rateExpectation==1?'正面':financingRatingInfo.rateExpectation==2?'稳定':financingRatingInfo.rateExpectation==3?'负面':''}</p>
            <button onclick="payReport();" class='btn ratBtn pull-right buyReport'>购买报告</button>

            <ul class="zhzl" id="enterpriseMenu">
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/list?financingInformationId=${financingInformationId}');">
                    <span>Ⅰ 基本数据</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/financial?financingInformationId=${financingInformationId}');">
                    <span>Ⅱ 财报数据</span>
                </li>
                <li class="active"
                    onclick="tiaozhuan('${ctx}/enterpriseDatabase/creditRecord4Ent?financingInformationId=${financingInformationId}');">
                    <span>Ⅲ 信用记录</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/induAreaAnalysisByFinacId?financingInformationId=${financingInformationId}&analysisType=1')">
                    <span>Ⅳ 行业分析</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/induAreaAnalysisByFinacId?financingInformationId=${financingInformationId}&analysisType=2')">
                    <span>Ⅴ 区域分析</span>
                </li>
            </ul>
        </div>
        <!--右侧内容区域-->
        <div class="zh-right pull-left" style="background-color: white">
            <div class="  rz-right-bottom">
                <div class="touzizq-content">
                    <div id="table-wrap">
                        <!-- 				<div style="height: 65px;"></div> -->
                        <h2>${p2pEnterpriseCertify.enterpriseName}信用报告 (简版)</h2>
                        <div style="height: 69px;"></div>
                        <div class="table-show">
                            <h3>一、信用等级</h3>
                            <div style="height: 20px;"></div>
                            <table class="table"
                                   style="border-radius: 5px;border-collapse: separate">
                                <tbody>
                                <tr>
                                    <td class="same-td col-lg-2">等 级</td>
                                    <td class="same-td-2 col-lg-9">
                                        <c:choose>
                                            <c:when test="${not empty p2pEnterpriseCertify.p2pFinancingRatingInfo.mainCreditGrade}">
                                                ${p2pEnterpriseCertify.p2pFinancingRatingInfo.mainCreditGrade}
                                            </c:when>
                                            <c:otherwise>无</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="same-td">评级年月</td>
                                    <td class="same-td-2">
                                        <c:choose>
                                            <c:when test="${not empty p2pEnterpriseCertify.p2pFinancingRatingInfo.publishTime}">
                                                <fmt:formatDate
                                                        value="${p2pEnterpriseCertify.p2pFinancingRatingInfo.publishTime}"
                                                        pattern="yyyy年MM月"/>
                                            </c:when>
                                            <c:otherwise>无</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="height: 52px;"></div>
                        <!--政府监管信息-->
                        <div class="table-show">
                            <h3>二、政府监管信息</h3>
                            <div style="height: 20px;"></div>
                            <table class="table" style="border-radius: 5px;border-collapse: separate">
                                <tbody>
                                <tr style="background:#cc484d;color:#fff;font-size:20px;">
                                    <td colspan="2">企业基本信息</td>
                                </tr>
                                <tr>
                                    <td class="same-td col-lg-2">注册号/统一社会信用代码</td>
                                    <td class="same-td-2 col-lg-9">
                                        <c:choose>
                                            <c:when test="${not empty p2pEnterpriseCertify.unifiedSocialCreditCode}">
                                                已提供
                                            </c:when>
                                            <c:otherwise>无</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="same-td">组织机构代码</td>
                                    <td class="same-td-2">
                                        <c:choose>
                                            <c:when test="${not empty p2pEnterpriseCertify.organizationCode}">
                                                已提供
                                            </c:when>
                                            <c:otherwise>无</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="same-td">税务登记代码</td>
                                    <td class="same-td-2">
                                        <c:choose>
                                            <c:when test="${not empty p2pEnterpriseCertify.taxRegistrationNum}">
                                                已提供
                                            </c:when>
                                            <c:otherwise>无</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="height: 52px;"></div>
                        <div class="table-show">
                            <h3>三、金融信贷信息</h3>
                            <div style="height: 20px;">
                                <c:choose>
                                    <c:when test="${user.id != null && user.id != '' && user.id != reportUserId}">
                                        <a data-toggle="modal" data-target="#exampleModal" class="report"
                                           href="javascript:;">举报此信息</a>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <table class="table" style="border-radius: 5px;border-collapse: separate">
                                <tbody>
                                <tr>
                                    <td class="col-lg-2"></td>
                                    <td class="same-td-2 col-lg-9"
                                        style="color:#640303;font-size:25px;font-weight: bold;">风险条数
                                    </td>
                                </tr>
                                <tr>
                                    <td class="same-td">大公平台借贷信息</td>
                                    <c:choose>
                                        <c:when test="${countDagong == 0}">
                                            <td class="same-td-2">${countDagong}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="same-td-2" style="color:#568eea;"><a onclick="view('1')"
                                                                                            class="showModal"
                                                                                            style="cursor: pointer; color:blue">${countDagong}</a>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                <tr>
                                    <td class="same-td">银行借贷信息</td>
                                    <c:choose>
                                        <c:when test="${countBank == 0}">
                                            <td class="same-td-2">${countBank}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="same-td-2" style="color:#568eea;"><a onclick="view('2')"
                                                                                            class="showModal"
                                                                                            style="cursor: pointer; color:blue">${countBank}</a>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                <tr>
                                    <td class="same-td">其他渠道借款信息</td>
                                    <c:choose>
                                        <c:when test="${countOther == 0}">
                                            <td class="same-td-2">${countOther}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="same-td-2" style="color:#568eea;"><a onclick="view('3')"
                                                                                            class="showModal"
                                                                                            style="cursor: pointer; color:blue">${countOther}</a>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 大公一带一路平台逾期信息模态框 -->
                    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true" style="margin-top: 0">
                        <div class="modal-dialog" style="width:60%">
                            <div class="modal-content" style="margin-top: 25%">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                                           style="background: #ffffff;width:100%">
                                        <thead>
                                        <tr>
                                            <td>处置机构</td>
                                            <td>笔数(笔)</td>
                                            <td>币种</td>
                                            <td>逾期金额(元)</td>
                                            <td>逾期年月</td>
                                            <td>逾期持续月数(月)</td>
                                            <td>最近一次还款日期</td>
                                            <td>处置完成日期</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${dagongList}" var="creditOverdueInfo">
                                            <tr>
                                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency, 'disposal_agency', '')}</td>
                                                <td>${creditOverdueInfo.pens}</td>
                                                <td>${fns:getDictLabel(creditOverdueInfo.currency, 'currency', '')}</td>
                                                <td><fmt:formatNumber
                                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.overdueDate}"
                                                        pattern="yyyy-MM"/>
                                                </td>
                                                <td>${creditOverdueInfo.overdueMonths}</td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                                <!--尾部按钮-->
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    <!-- 银行信贷信息模态框 -->
                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true" style="margin-top: 0">
                        <div class="modal-dialog" style="width:60%">
                            <div class="modal-content" style="margin-top: 25%">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                                           style="background: #ffffff;width:100%">
                                        <thead>
                                        <tr>
                                            <td>处置机构</td>
                                            <td>笔数(笔)</td>
                                            <td>币种</td>
                                            <td>逾期金额(元)</td>
                                            <td>逾期年月</td>
                                            <td>逾期持续月数(月)</td>
                                            <td>最近一次还款日期</td>
                                            <td>处置完成日期</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${bankList}" var="creditOverdueInfo">
                                            <tr>
                                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                                        'disposal_agency', '')}</td>
                                                <td>${creditOverdueInfo.pens}</td>
                                                <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                                        'currency', '')}</td>
                                                <td><fmt:formatNumber
                                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.overdueDate}"
                                                        pattern="yyyy-MM"/>
                                                </td>
                                                <td>${creditOverdueInfo.overdueMonths}</td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                                <!--尾部按钮-->
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    <!-- 其他借贷平台逾期模态框 -->
                    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true" style="margin-top: 0">
                        <div class="modal-dialog" style="width:60%">
                            <div class="modal-content" style="margin-top: 25%">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                                           style="background: #ffffff;width:100%">
                                        <thead>
                                        <tr>
                                            <td>处置机构</td>
                                            <td>笔数(笔)</td>
                                            <td>币种</td>
                                            <td>逾期金额(元)</td>
                                            <td>逾期年月</td>
                                            <td>逾期持续月数(月)</td>
                                            <td>最近一次还款日期</td>
                                            <td>处置完成日期</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${otherList}" var="creditOverdueInfo">
                                            <tr>
                                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                                        'disposal_agency', '')}</td>
                                                <td>${creditOverdueInfo.pens}</td>
                                                <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                                        'currency', '')}</td>
                                                <td><fmt:formatNumber
                                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.overdueDate}"
                                                        pattern="yyyy-MM"/>
                                                </td>
                                                <td>${creditOverdueInfo.overdueMonths}</td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                                <td><fmt:formatDate
                                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                                        pattern="yyyy-MM-dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                                <!--尾部按钮-->
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
                </div>

                <!-- <div class="tabs " id="tabs" style="width:100%">
                    <div style="padding: 0px 0px 20px 0px">
                        <ul>
                            <li style="font-size: 20px;color:#000"><span
                                    style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>信用等级
                            </li>
                        </ul>
                    </div>
                    
                    <table>
                    	
                    </table>
                    
                    <div class="btn-group" style="width: 100%;">
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase10')" style="width: 20%">
                            行政许可信息
                        </button>
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase13')" style="width: 80%">
                            列入严重违法失信企业名单信息
                        </button>
                        
                    </div>
                    
                </div> -->
            </div>

        </div>
        <!--右侧内容区域结束-->
        <div class="clearfix"></div>
    </div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<!-- added by dingguolei -->
<!--举报弹窗部分开始-->
<div id="exampleModal" class="modal fade bs-example-modal-sm shenshu" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 600px;">
            <form id="shensu" method="post" action="${ctx}/creditmanage/creditReportInfoFront/save"
                  enctype="multipart/form-data">
                <h4 style="color:#bf1a20;font-size:22px;line-height: 50px;font-weight: bold;text-align: center;">
                    举报信息</h4>
                <input type="hidden" id="beReportedId" name="beReportedId" value="${p2pEnterpriseCertify.userId}"/>

                <div class="form-group" style="width: 100%;padding-left:40px;">
                    <label class="control-label"
                           style="width:101px;display:inline-block;text-align:right;">信用记录类型:</label>
                    <select class="form-control form-control-static" style="width: 200px; display: inline-block;">
                        <option value="1">金融信贷信息</option>
                    </select>
                    <select id="reportInfoType" name="reportInfoType" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">银行信贷信息</option>
                        <option value="2">大公平台信贷信息</option>
                        <option value="3">其他借贷信息</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">举报原因:</label>
                    <select id="reportReason" name="reportReason" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">欠款</option>
                        <option value="2">信息造假</option>
                        <option value="3">隐匿信息</option>
                        <option value="4">信用历史记录</option>
                        <option value="5">其他</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class="control-label"
                           style="width:100px;display:inline-block;text-align:right;line-height:39px;vertical-align:113px;">描述:</label>
                    <textarea name="reportExplain" class="form-control required" rows="6"
                              style="width:400px;resize: none;border-radius:10px;display: inline-block;"></textarea>
                </div>
                <div class="form-group" style="width: 95%;">
                    <label name="attachment" class=" control-label"
                           style="width: 139px;display: inline-block;text-align: right;">附件:</label>
                    <input type="hidden" id="attachmentName" name="attachmentName"/>
                    <input type="hidden" id="attachment" name="attachment"/>
                    <input id="inputfile" type="file" name="file"/>
                </div>

                <div class="form-group" style="width: 100%;">
                    <p style="width: 100%;padding-left: 246px;">
                        <input type="hidden" name="id" id="id"/>
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<!--举报弹窗部分结束-->
<!-- ended by dinguolei -->

<script type="text/javascript">
    function qiehuan(num) {
        $('#photo-05').empty();
        var ul = '<ul id="photo-05ul"></ul>';
        $('#photo-05').append(ul);
        <c:forEach items="${photo}"  var="m">
        var key = '${m.key}';
        if (key == num) {
            <c:forEach items="${m.value}" var="path">
            $('#photo-05ul').append('<li><img id="" src="${path}" style="width:100%"></li>')
            </c:forEach>
        }
        </c:forEach>
        var left = '<a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="${ctxStatic}/images/arrowl.png" alt="prev" width="20" height="35"></a>';
        var right = ' <a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="${ctxStatic}/images/arrowr.png" alt="next" width="20" height="37"></a>';
        $('#photo-05').append(left);
        $('#photo-05').append(right);
        photoView(5);
    }
    $(function () {
        for (var i = 2; i < 5; i++) {
            photoView(i);
        }
    })
    function photoView(num) {
        var data04;
        var unslider04 = $('#photo-0' + num).unslider({
                speed: 500,
                delay: false,
                init: 100,
                complete: function () {
                },
                keys: true,
                dots: true,
                fluid: false
            }),
            data04 = unslider04.data('unslider');
        $('.unslider-arrow04').click(function () {
            var fn = this.className.split(' ')[1];
            data04[fn]();
        });

    }

    //added by dingguolei
    function view(param) {
        if (param == 1) {
            $("#myModal1").modal("show")
        }
        if (param == 2) {
            $("#myModal2").modal("show")
        }
        if (param == 3) {
            $("#myModal3").modal("show")
        }
    }

    $('#inputfile').fileinput({
        showUpload: false, //是否显示上传按钮
        showRemove: false,
        showCaption: false,//是否显示标题
//        	showPreview: false,
        maxFileSize: 10240,
        maxFileCount: 1
    }).on("fileuploaded", function (event, data) {

    });

    //ended by dingguolei
</script>
</body>

</html>