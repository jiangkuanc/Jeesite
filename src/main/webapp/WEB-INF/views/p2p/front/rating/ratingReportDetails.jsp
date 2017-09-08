<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/financing.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/xcConfirm/js/xcConfirm.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        li {
            list-style: none;
        }

        #rating_wrap {
            width: 1100px;
            margin: 0 auto;
        }

        .rating_wrap_title {
            font-size: 22px;
            color: #333;
            font-weight: bold;
            font-family: "Microsoft YaHei";
            text-align: left;
            line-height: 45px;
        }

        .media-left {
            width: 471px;
            height: 315px;
            /* border-left: 2px solid #816e6e; */
        }

        .media-body {
            padding-left: 60px;
        }

        .media-body p {
            height: 50px;
            line-height: 50px;
            color: #666666;
            font-size: 18px;
            margin: 0;
        }

        .button_a a {
            text-align: center;
            display: inline-block;
            width: 230px;
            height: 70px;
            line-height: 70px;
            background: #bf1a20;
            color: #fff;
            font-size: 30px;
            font-weight: bold;
        }

        .button_a a:last-child {
            color: #bf1a20;
            background: #ffeff0;
            border: none;
            margin-left: 36px;
        }

        /*tag*/
        .report_tag {
            margin: 0;
            padding: 0;
            width: 1100px;
            height: 70px;
            border-top: 2px solid #999999;
            cursor: default;
            border-bottom: 2px solid #dad5d5;
        }

        .report_tag li {
            top: -2px;
            position: relative;
            margin: 0;
            padding: 0;;
            cursor: default;;
            float: left;
            width: 115px;
            height: 70px;
            line-height: 70px;
            font-size: 20px;
            font-weight: bold;
            color: #666666;
            text-align: center;
        }

        .report_tag .active-color:before {
            position: absolute;
            top: 0;
            left: 48%;
            content: "";
            display: block;
            width: 9px;
            height: 4px;
            background: url("${ctxStatic}/dist/images/jiantou_06.png") no-repeat center;
        }

        .report_tag .active-color {
            border-left: 1px solid #dad5d5;
            border-right: 1px solid #dad5d5;
            border-top: 2px solid #bf1a20;
        }

        .report_tag_show li {
            width: 1100px;
            background: #fff;
            display: none;
        }

        .report_tag_show_title {
            color: #333;
            background: #dedede;
            font-size: 20px;
            font-family: "Microsoft YaHei";
            height: 60px;
            line-height: 60px;
            text-align: center;
            font-weight: 500;
        }

        .report_tag_show_p {
            color: #333;
            background: #fff;
            font-size: 20px;
            font-family: "Microsoft YaHei";
            height: 26px;
            line-height: 26px;
            text-align: center;
            font-weight: 500;
        }

        .report_tag_show_p a {
            font-size: 24px;
            color: #467de1;
        }

        .report_tag_show_p a:hover {
            color: #045bfa;
        }

        .panel-default {
            background: #f4f4f4;
        }

        .panel-default, .panel-body {
            border: none;
        }

        .panel-default > .panel-heading + .panel-collapse > .panel-body {
            border: none;
        }

        .tag_show_md {
            position: relative;
            top: -10px;
            left: -15px;
            display: block;
            margin: 0;
            background: #dedede;;
            text-indent: 440px;
            width: 1100px;
            height: 32px;
            line-height: 32px;
            font-size: 20px;
            color: #333;
            font-family: "Microsoft YaHei";
        }

        .tag_show_md2 {
            position: relative;
            top: -10px;
            left: 0;
            display: block;
            margin: 0;
            background: #dedede;;
            text-indent: 440px;
            width: 1100px;
            height: 32px;
            line-height: 32px;
            font-size: 20px;
            color: #333;
            font-family: "Microsoft YaHei";
        }

        .panel-body p {
            font-size: 18px;
            text-indent: 500px;
            margin: 0;
            padding: 0;
            height: 32px;
            line-height: 32px;
        }

        .panel-body p:last-child {
            margin-bottom: 20px;
        }

        .panel-body {
            margin: 0;
            padding: 0;
        }

        .panel-title {
            height: 0;
        }

        #get-in-wrap {
            width: 669px;
            height: 431px;
            margin: 0 auto;
            position: relative;
            left: -62px;
            top: 25px;
        }

        .get-in {
            width: 669px;
            height: 315px;
            border-bottom: 2px solid #ff0000;
            border-top: 2px solid #ff0000;
            margin: 0 auto;
        }

        .get-in h4 {
            font-size: 24px;
            color: #333;
            font-weight: bold;
            width: 100%;
            text-align: center;
            margin: 0;
            padding: 0;
            height: 174px;
            line-height: 174px;
        }

        .get-in a {
            margin: 0 auto;
            font-size: 18px;
            font-weight: bold;
            background: #bf1a20;
            display: block;
            text-align: center;
            width: 135px;
            height: 40px;
            line-height: 40px;
            color: #fff;
            font-family: "Microsoft YaHei";
        }

        #get-in-wrap .get-in p {
            background: url("dist-wyrz/imgs/wenhao_03.png") no-repeat 185px center !important;;
            height: 66px !important;
            line-height: 66px !important;
            color: #333;
            font-size: 14px !important;
            text-align: center !important;
            margin: 0;
            padding: 0;
        }

        .table-ul-con li {
            text-align: left
        }

        .breadcrumb > li + li:after {
            padding: 0;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<style type="text/css">
    /*弹窗样式修改*/
    .xcConfirm-pay .popBox {
        width: 744px;
        height: 529px;
        border-radius: 0;
    }

    .xcConfirm-pay .popBox {
        top: 40%;
        left: 48%;
    }

    .xcConfirm-pay .popBox .ttBox {
        border: none;
    }

    .xcConfirm-pay .popBox .ttBox .tt {
        top: 30px;
        left: 145px;
    }

    .xcConfirm-pay .popBox .txtBox p {
        float: left;
        width: 574px;
        height: 401px;
        margin-top: 16px;
        line-height: 26px;
        overflow-x: inherit;
        overflow-y: inherit;
    }

    .xcConfirm-pay .popBox .txtBox {
        margin: 40px 100px;
        height: 289px;
        overflow: inherit;
    }

    .xcConfirm-pay .popBox .btnArea {
        border: none;
    }

    .xcConfirm-pay .popBox .sgBtn.ok {
        opacity: 0;
        border-radius: 0;
        position: absolute;
        top: 271px;
        left: 305px;
        z-index: 1000;
        background: #bf1a20;
        font-size: 18px;
        font-weight: bold;
        width: 135px;
        height: 40px;
        line-height: 40px;
        color: #fff;
        font-family: "Microsoft YaHei";
    }

    .xcConfirm-pay .popBox .ttBox .tt {
        font-size: 24px;
        font-family: "Microsoft YaHei";
        font-weight: bold;
        left: 120px;
    }
</style>
<div class="touzizq-content">
    <!--左侧内容区域-->
    <div class="zh">
        <ol class="breadcrumb update">
            <li><b>当前位置：</b>
            </li>
            <li><a
                    href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a>
            </li>
            <li class="lg-active"><strong>评级报告购买</strong>
            </li>
        </ol>
    </div>
    <!--左侧内容区域结束-->
    <div id="rating_wrap">
        <h3 class="rating_wrap_title">${p2pFinancingRatingInfo.reportName}</h3>
        <div style="height: 24px;"></div>
        <div class="bs-example" data-example-id="default-media">
            <div class="media">
                <div class="media-left">
                    <a href="#"><img style="width: 471px;height: 315px;" class="media-object"
                                     src="${p2pFinancingRatingInfo.p2pEnterpriseCertify.businessLicense}" alt="营业执照">
                    </a>
                </div>
                <div class="media-body">

                    <c:choose>
                        <c:when test="${prefix == 'DG6'}">
                            <p>
                                借贷产品等级：<span style="color:#bf1a20;">${p2pFinancingRatingInfo.ratingLevel}</span>
                            </p>
                            <p>
                                主体信用等级：<span style="color:#bf1a20;">${p2pFinancingRatingInfo.mainCreditGrade}</span>&nbsp;&nbsp;&nbsp;
                                主体评级展望：<span
                                    style="color:#1671ec;">${fns:getDictLabel(p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '')}</span>
                            </p>
                            <p>
                                受评主体：<span
                                    style="color:#333333;">${p2pFinancingRatingInfo.p2pEnterpriseCertify.enterpriseName}</span>
                            </p>
                            <p>
                                评级类型：<span style="color:#333333;">借贷产品评级</span>&nbsp;&nbsp;&nbsp;
                                评级时间：<span style="color:#333333;"><fmt:formatDate
                                    value="${p2pFinancingRatingInfo.publishTime}" pattern="yyyy-MM-dd"/></span>
                            </p>
                            <div style="height: 40px;"></div>
                            <div class="button_a">
                                <a href="javascript:void(0)" style="background:#ccc;cursor: no-drop;">即将上架</a>
                                <!-- 									<a href="javascript:void(0)" id="pay">立即购买</a><a href="###">￥1&nbsp;元/份</a> -->
                            </div>
                            <div id="amount" class="hide">1</div>
                        </c:when>
                        <c:otherwise>
                            <p>
                                主体信用等级：<span style="color:#bf1a20;">${p2pFinancingRatingInfo.mainCreditGrade}</span>
                                &nbsp;&nbsp;&nbsp;
                                主体评级展望：<span
                                    style="color:#1671ec;">${fns:getDictLabel(p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '')}</span>
                            </p>
                            <p>
                                评级类型：<span style="color:#333333;">主体评级</span>
                            </p>
                            <p>
                                受评主体：<span
                                    style="color:#333333;">${p2pFinancingRatingInfo.p2pEnterpriseCertify.enterpriseName}</span>
                            </p>
                            <p>
                                评级时间：<span style="color:#333333;"><fmt:formatDate
                                    value="${p2pFinancingRatingInfo.publishTime}" pattern="yyyy-MM-dd"/></span>
                            </p>
                            <div style="height: 40px;"></div>
                            <div class="button_a">
                                <a href="javascript:void(0)" style="background:#ccc;cursor: no-drop;">即将上架</a>
                                <!-- 									<a href="javascript:void(0)" id="pay">立即购买</a><a href="###">￥1&nbsp;元/份</a> -->
                            </div>
                            <div id="amount" class="hide">1</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div style="height: 85px;"></div>
        <!--tag-->
        <ul class="report_tag">
            <li class="active-color">评级详情</li>
            <li>企业信息</li>
        </ul>
        <!--显示区域-->
        <ul class="report_tag_show">
            <li style="display: block">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne"
                                   aria-expanded="true" aria-controls="collapseOne">评级观点 </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <p>—主要优势/机遇</p>
                                <p>—主要风险/挑战</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne2"
                                   aria-expanded="true" aria-controls="collapseOne">大公信用评级报告声明
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne2" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!--<p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne3"
                                   aria-expanded="true" aria-controls="collapseOne">受评主体</a>
                            </h4>
                        </div>
                        <div id="collapseOne3" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!--<p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne4"
                                   aria-expanded="true" aria-controls="collapseOne">
                                    宏观经济和政策环境 </a>
                            </h4>
                        </div>
                        <div id="collapseOne4" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!--<p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne5"
                                   aria-expanded="true" aria-controls="collapseOne">
                                    行业及区域经济环境 </a>
                            </h4>
                        </div>
                        <div id="collapseOne5" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!-- <p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne6"
                                   aria-expanded="true" aria-controls="collapseOne"> 经营与竞争 </a>
                            </h4>
                        </div>
                        <div id="collapseOne6" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <p>—工程施工业务</p>
                                <p>—其他业务</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne7"
                                   aria-expanded="true" aria-controls="collapseOne"> 公司治理与管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne7" class="panel-collapse collapse in"
                             role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <p>—产权状况和公司治理</p>
                                <p>—战略与管理</p>
                                <p>—抗风险能力</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapseOne8"
                                   aria-expanded="true" aria-controls="collapseOne"> 财务分析 </a>
                            </h4>
                        </div>
                        <div id="collapseOne8" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <p>—资产质量</p>
                                <p>—资本结构</p>
                                <p>—盈利能力</p>
                                <p>—现金流</p>
                                <p>—债偿能力</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne9"
                                   aria-expanded="true" aria-controls="collapseOne"> 债务履约能力 </a>
                            </h4>
                        </div>
                        <div id="collapseOne9" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!--<p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading tag_show_md2" role="tab">
                            <h4 class="panel-title">
                                <a class="tag_show_md" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne10"
                                   aria-expanded="true" aria-controls="collapseOne"> 结论 </a>
                            </h4>
                        </div>
                        <div id="collapseOne10" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <!--<p>—主要优势/机遇</p>
                        <p>—主要风险/挑战</p>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height: 176px;"></div>
            </li>
            <li>
                <c:choose>
                    <c:when test="${user.id == null || user.id == ''}">
                        <p class="report_tag_show_p">
                            <span style="margin-right: 20%;">更多企业信息，请 <a href="${ctx}/sys/user/preUserLogin">登录</a>以后查看</span>
                        </p>
                    </c:when>
                    <c:when test="${user.id != null && user.id != '' && user.roleList[0].id == 104 && p2pFinancingRatingInfo.p2pUserInformation.certificateState == 1001}">
                        <h3>更多企业信息，请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>以后查看</h3>
                    </c:when>
                    <c:when test="${user.id != null && user.id != '' && user.roleList[0].id == 104 && p2pFinancingRatingInfo.p2pUserInformation.certificateState == 2001}">
                        <h3>更多企业信息，请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>以后查看</h3>
                    </c:when>
                    <c:when test="${user.id != null && user.id != '' && user.roleList[0].id == 104 && p2pFinancingRatingInfo.p2pUserInformation.certificateState == 3001}">
                        <h3>更多企业信息，请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>以后查看
                        </h3>
                    </c:when>
                    <c:when test="${user.id != null && user.id != '' && user.roleList[0].id == 102 && p2pFinancingRatingInfo.p2pUserInformation.certificateState == 101}">
                        <h3>更多企业信息，请完成<a
                                href="${ctx}/user/p2pUserInformation/accountPermission?mode=userCertify">实名认证</a>以后查看
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <h4 class="report_tag_show_title">企业基本信息</h4>
                        <table width="100%" border="0">
                            <tr>
                                <td height="45" align="right" width="20%">企业名称：</td>
                                <td height="45" colspan="3"
                                    width="30%">${p2pFinancingRatingInfo.p2pEnterpriseCertify.enterpriseName}</td>
                                <td height="45" align="right" width="20%">成立时间：</td>
                                <td height="45" colspan="3" width="30%"><fmt:formatDate
                                        value="${p2pFinancingRatingInfo.p2pEnterpriseCertify.companyFoundDate}"
                                        pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <tr>
                                <td height="45" align="right" width="20%">企业性质：</td>
                                <td height="45" colspan="3"
                                    width="30%">${fns:getDictLabel(p2pFinancingRatingInfo.p2pEnterpriseCertify.enterpriseNature, 'enterprise_nature', '')}</td>
                                <td height="45" align="right" width="20%">企业规模：</td>
                                <td height="45" colspan="3"
                                    width="30%">${fns:getDictLabel(p2pFinancingRatingInfo.p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}</td>
                            </tr>
                            <tr>
                                <td height="45" align="right" width="20%">注册资本：</td>
                                <td height="45" colspan="3" width="30%"><fmt:formatNumber
                                        pattern="#,##0.00">${p2pFinancingRatingInfo.p2pEnterpriseCertify.registeredCapital}</fmt:formatNumber>元
                                </td>
                                <td height="45" align="right" width="20%">注册地址：</td>
                                <td height="45" colspan="3"
                                    width="30%">${p2pFinancingRatingInfo.p2pEnterpriseCertify.registeredAddress}</td>
                            </tr>
                            <tr>
                                <td height="45" align="right" width="20%">实缴资本：</td>
                                <td height="45" colspan="3" width="30%"><fmt:formatNumber
                                        pattern="#,##0.00">${p2pFinancingRatingInfo.p2pEnterpriseCertify.realCapital}</fmt:formatNumber>元
                                </td>
                                <td height="45" align="right" width="20%">所在地：</td>
                                <td id="szd" height="45" colspan="3" width="30%"></td>
                            </tr>
                            <tr>
                                <td height="45" align="right" width="20%">所属行业：</td>
                                <td height="45" colspan="3"
                                    width="30%">${p2pFinancingRatingInfo.p2pIndustryclassi.classinameCn}</td>
                                <td height="45" align="right" width="20%">经营区域：</td>
                                <td height="45" colspan="3"
                                    width="30%">${p2pFinancingRatingInfo.p2pEnterpriseCertify.businessArea}</td>
                            </tr>
                        </table>
                        <h4 class="report_tag_show_title">法定代表人信息</h4>
                        <table width="100%" border="0">
                            <tr>
                                <td height="45" align="right" width="20%">姓名：</td>
                                <td height="45" colspan="3"
                                    width="30%">${p2pFinancingRatingInfo.p2pEnterpriseCertify.nameOf}</td>
                                <td height="45" align="right" width="20%">身份证号：</td>
                                <td height="45" colspan="3" width="30%">
                                    <c:if test="${p2pFinancingRatingInfo.p2pEnterpriseCertify.idNumberOf!=null}">
                                        ${p2pFinancingRatingInfo.p2pEnterpriseCertify.idNumberOf.replaceAll("(\\d{4})\\d{10}(\\w{4})","$1*****$2")}
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td height="45" align="right" width="20%">联系电话：</td>
                                <td height="45" colspan="3" width="30%">
                                    <c:if test="${p2pFinancingRatingInfo.p2pEnterpriseCertify.telephoneNumOf!=null}">
                                        ${p2pFinancingRatingInfo.p2pEnterpriseCertify.telephoneNumOf.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}
                                    </c:if>
                                </td>
                                <td height="45" align="right" width="20%"></td>
                                <td height="45" colspan="3" width="30%"></td>
                            </tr>
                        </table>
                    </c:otherwise>
                </c:choose>
                <div style="height: 176px;"></div>
            </li>
        </ul>
    </div>
</div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">

    $(function () {
        var provinceCode = '${p2pFinancingRatingInfo.p2pEnterpriseCertify.provincialArea}';
        var cityCode = '${p2pFinancingRatingInfo.p2pEnterpriseCertify.municipalArea}';
        $.ajax({
            url: "${ctx}/financing/p2pFinancingInformation/findArea?provinceCode=" + provinceCode + "&cityCode=" + cityCode,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var province = data[0].provincialArea;
                var city = data[0].municipalArea;
                var areaStr = province + "-" + city;
                $("#szd").html(areaStr);
            }
        });

        /* var roleId0 = '
        ${user.roleList[0].id}';
         //101
         if (roleId0 == 101) {
         $("#pay").html("查看报告");
         //102
         } else if (roleId0 == 102) {
         $("#pay").html("立即购买");
         }else {
         $("#pay").html("登录后购买");
         } */
    })
    //tag
    $(".report_tag li").each(function (index, item) {
        $(this).click(function () {
            $(item).addClass("active-color").siblings("li").removeClass("active-color");
            $(".report_tag_show li").hide().eq(index).show();
        })
    })
    //弹窗
    $("#11111111").click(function () {
        /*     $("#pay").click(function () { */
        var userId = '${user.id}';
        var roleId = '${user.roleList[0].id}';
        var certificateState = '${p2pFinancingRatingInfo.p2pUserInformation.certificateState}';
        var isOrNoself = '${p2pFinancingRatingInfo.isOrNoself}';
        var isOrNoBuyed = '${p2pFinancingRatingInfo.isOrNoBuyed}';
        var isPaying = findIsPaying();
        var title = '${p2pFinancingRatingInfo.reportName}';
        if (title.length > 20) {
            title = title.substring(0, 9) + "..." + title.substring(title.length - 6, title.length);
        }
        var ratingLevel = '${p2pFinancingRatingInfo.ratingLevel}';
        var prefix = '${prefix}'
        if (userId == null || userId == '') {
            window.location.href = '${ctx}/sys/user/preUserLogin';
        } else if (roleId == 102 || roleId == 101) {
            //用户角色101不用购买 start
            if (roleId == 101) {
                window.open("${p2pFinancingRatingInfo.commitReport}");
                /* var html = '<div id="get-in-wrap">'+
                 '<div class="get-in">'+
                 '<h4>本账户报告，无需购买！</h4>'+
                 '<a class="ok" href="###">确定</a>'+
                 '</div>'+
                 '</div>';
                 var option = {
                 title:title,
                 onOk:function () {
                 }
                 }
                 window.wxc.xcConfirm(html,option);
                 $(".xcConfirm").addClass("xcConfirm-pay"); */
                return;
            }
            //用户角色101不用购买 end
            if (isOrNoself == 1) {
                var html = '<div id="get-in-wrap">' +
                    '<div class="get-in">' +
                    '<h4>本账户报告，无需购买！</h4>' +
                    '<a class="ok" href="###">确定</a>' +
                    '</div>' +
                    '</div>';
                var option = {
                    title: title,
                    onOk: function () {
                    }
                }
            } else if (isOrNoBuyed == 1) {
                var html = '<div id="get-in-wrap">' +
                    '<div class="get-in">' +
                    '<h4>您已购买此报告，无需再次购买！</h4>' +
                    '<a class="ok" href="###">确定</a>' +
                    '</div>' +
                    '</div>';
                var option = {
                    title: title,
                    onOk: function () {
                    }
                }
            } else if (isPaying == true) {
                var html = '<div id="get-in-wrap">' +
                    '<div class="get-in">' +
                    '<h4>购买处理中，请耐心等待...</h4>' +
                    '<a class="ok" href="###">确定</a>' +
                    '</div>' +
                    '</div>';
                var option = {
                    title: title,
                    onOk: function () {
                    }
                }
            } else {
                var obj = initOrder();
                var orderNo = obj.orderNo;
                var orderTime = obj.orderTimeView;
                var paymentAmount = obj.paymentAmount + '00';
                //var paymentAmount = 1;
                var uid = '${user.loginName}';
                if (prefix == 'DG6') {
                    var html = '<div id="get-in-wrap">' +
                        '<div class="get-in">' +
                        '<h4>应付金额 ： <span>1</span>元</h4>' +
                        '<a class="ok" href="###">确认支付</a>' +
                        '</div>' +
                        '</div>';
                } else {
                    var html = '<div id="get-in-wrap">' +
                        '<div class="get-in">' +
                        '<h4>应付金额 ： <span>1</span>元</h4>' +
                        '<a class="ok" href="###">确认支付</a>' +
                        '</div>' +
                        '</div>';
                }
                var option = {
                    title: title,
                    onOk: function () {
                        post('${ctx}/financing/payment/enterPay', {
                            orderNo: orderNo,
                            orderDatetime: orderTime,
                            orderAmount: paymentAmount,
                            product: '购买评级报告',
                            paymentId: uid
                        });
                    }
                }
            }
        } else {
            var html = '<div id="get-in-wrap">' +
                '<div class="get-in">' +
                    /* '<h4>您不是融资（评级）企业用户，无法购买评级报告！</h4>'+ */
                '<h4>当前用户，无法购买评级报告！</h4>' +
                '<a class="ok" href="###">确定</a>' +
                '</div>' +
                '</div>';
            var option = {
                title: title,
                onOk: function () {
                }
            }
        }
        window.wxc.xcConfirm(html, option);
        $(".xcConfirm").addClass("xcConfirm-pay");
    })


    /**
     *搜索
     */
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

    /*
     * 初始化订单
     */
    function initOrder() {
        var obj;
        var fid = '${p2pFinancingRatingInfo.financingInformationId}';
        var amount = $('#amount').html();
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctx}/RatingFee/initOrder',
            data: {financingInformationId: fid, paymentAmount: amount},
            success: function (data) {
                obj = eval("(" + data + ")");
            }
        });
        return obj;
    }

    function findIsPaying() {
        var fid = '${p2pFinancingRatingInfo.financingInformationId}';
        var result;
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctx}/RatingFee/findIsPaying',
            data: {financingInformationId: fid},
            success: function (data) {
                console.log(data);
                result = data;
            }
        });
        return result;
    }
</script>
</body>
</html>