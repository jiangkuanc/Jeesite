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
    <script src="${ctxStatic}/common/unslider.min.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
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

        input[type="text"] {
            width: 88%;
            padding: 4px 3px;
            margin-bottom: 0px;
            text-align: right;
            font-size: 12px;
        }

        td {
            border: 1px #BEBEBE solid;
            height: 40px;

        }

        .table td {
            padding: 3px;
            text-align: center;
            word-break: break-all;
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

        #leftData > tbody > tr > td, #leftData > thead > tr > td {
            padding: 5px !important
        }

        .zh-right {
            font-family: "Microsoft YaHei"
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

        .zhzl li.active span,
        .zhzl li:hover span.enterpriseMenuLiSpan {
            color: #ffffff;
        }
    </style>
    <script type="text/javascript">
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
            <%-- <p class="zh-p">信用级别:${financingRatingInfo.ratingLevel}/${financingRatingInfo.rateExpectation==1?'正面':financingRatingInfo.rateExpectation==2?'稳定':financingRatingInfo.rateExpectation==3?'负面':''}<button onclick="payReport();"  class='btn ratBtn pull-right buyReport'>购买报告</button></p> --%>

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
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/creditRecord4Ent?financingInformationId=${financingInformationId}');">
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
        <div class="zh-right pull-left" style="background-color: white;">
            <select class="dropdown" onclick="qiehuan(this)">
                <option value="1">资产负债表</option>
                <option value="2">利润表</option>
                <option value="3">现金流量表</option>
            </select>
            <%--利润表--%>
            <div id="profitData" style="margin:0 auto;display: none">
                <div style="padding: 0px 0px 20px 0px">
                    <ul>
                        <li style="font-size: 20px;color:#000"><span
                                style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>利润表
                        </li>
                    </ul>
                </div>
                <table class="table" style="border-right: 1px solid #DDDDDD">
                    <thead>
                    <tr style="background:#999999;color:#fff;">
                        <td style="width:30px;">行次</td>
                        <td style="width:120px;">项目</td>
                        <c:forEach items="${rateEnterpriseFinancialDatas}" var="rateEnterpriseFinancialData">
                            <td style="width:130px;">${rateEnterpriseFinancialData.reportingTime}</td>
                        </c:forEach>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${profitData}" var="rateFinancialIndicator">
                        <c:choose>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0002001000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002002000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002003000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002004000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002005000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002006000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0002007000'}">
                                <tr style="background:#999999;color:#fff">
                                    <td>${rateFinancialIndicator.orderNum}</td>
                                    <td>${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--现金流量表--%>
            <div id="bstyle" style="margin:0 auto;display: none;">
                <div style="padding: 0px 0px 20px 0px">
                    <ul>
                        <li style="font-size: 20px;color:#000"><span
                                style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>现金流量表
                        </li>
                    </ul>
                </div>
                <table class="table" id="cashData" style="border-right: 1px solid #DDDDDD;">
                    <thead>

                    </thead>
                    <tbody>
                    <tr style="background:#999999;color:#fff;">
                        <td style="width:30px;">行次</td>
                        <td style="width:120px;">报表项目</td>
                        <c:forEach items="${rateEnterpriseFinancialDatas}" var="rateEnterpriseFinancialData">
                            <td style="width:130px;">${rateEnterpriseFinancialData.reportingTime}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${bstyle}" var="rateFinancialIndicator">
                        <c:choose>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0003001000'
					    				|| rateFinancialIndicator.financialIndicatorId=='NON0003002000'
					    				|| rateFinancialIndicator.financialIndicatorId=='NON0003003000'}">
                                <tr style="height:47px">
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                </tr>
                            </c:when>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0003001100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003001200'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003001300'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003002100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003002200'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003002300'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003003100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003003200'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003003300'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003005000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0003006000'}">
                                <tr style="background:#999999;color:#fff">
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--资产负债表--%>
            <div id="allData" style="margin:0 auto">
                <div style="padding: 0px 0px 20px 0px">
                    <ul>
                        <li style="font-size: 20px;color:#000"><span
                                style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>资产负债表
                        </li>
                    </ul>
                </div>
                <table class="table" id="leftData" style="border-right: 1px solid #DDDDDD">
                    <tbody>
                    <tr style="background:#999999;color:#fff">
                        <td style="width:30px;">行次</td>
                        <td style="width:120px;">资产</td>
                        <c:forEach items="${rateEnterpriseFinancialDatas}" var="rateEnterpriseFinancialData">
                            <td style="width:130px;">${rateEnterpriseFinancialData.reportingTime}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${allData}" var="rateFinancialIndicator">
                        <c:choose>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0001001000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001002000'}">
                                <tr style="height:47px">
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                </tr>
                            </c:when>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0001001100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001002100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001000000'}">
                                <tr style="background:#999999;color:#fff">
                                    <td>${rateFinancialIndicator.orderNum}</td>
                                    <td>${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>

                <table class="table" id="rightData"
                       style="border-right: 1px solid #DDDDDD;border-bottom: 1px solid #DDDDDD">
                    <tbody>
                    <tr style="background:#999999;color:#fff;">
                        <td style="width:30px;">行次</td>
                        <td style="width:120px;">负债及所有者权益</td>
                        <c:forEach items="${rateEnterpriseFinancialDatas}" var="rateEnterpriseFinancialData">
                            <td style="width:130px;">${rateEnterpriseFinancialData.reportingTime}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${rateFinancialIndicatorsR}" var="rateFinancialIndicator">
                        <c:choose>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0001013000'
					    				|| rateFinancialIndicator.financialIndicatorId=='NON0001014000'
					    				|| rateFinancialIndicator.financialIndicatorId=='NON0001016001'}">
                                <tr style="height:47px">
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                    <td style="background:#999996;color:#fff">-</td>
                                </tr>
                            </c:when>
                            <c:when test="${rateFinancialIndicator.financialIndicatorId=='NON0001013100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001014100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001015000'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001016013'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001016100'
	    								|| rateFinancialIndicator.financialIndicatorId=='NON0001010000'}">
                                <tr style="background:#999999;color:#fff">
                                    <td>${rateFinancialIndicator.orderNum}</td>
                                    <td>${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.orderNum}</td>
                                    <td style="background:#999999;color:#fff">${rateFinancialIndicator.financialIndicatorName}</td>
                                    <td>${rateFinancialIndicator.periodValue}</td>
                                    <td>${rateFinancialIndicator.firstYearValue}</td>
                                    <td>${rateFinancialIndicator.secondYearValue}</td>
                                    <td>${rateFinancialIndicator.thirdYearValue}</td>
                                    <td>${rateFinancialIndicator.lastYearValue}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--右侧内容区域结束-->
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    function qiehuan(num) {
        if (num.value == '1') {
            $('#allData').show();
            $('#profitData').hide();
            $('#bstyle').hide();
        }
        if (num.value == '2') {
            $('#profitData').show();
            $('#allData').hide();
            $('#bstyle').hide();

        }
        if (num.value == '3') {
            $('#bstyle').show();
            $('#profitData').hide();
            $('#allData').hide();

        }
    }
</script>
</body>

</html>