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
        <div class="zh-right pull-left" style="background-color: white">
            <div class="zh-right-bottom  rz-right-bottom">
                <c:if test="${ not empty industryAnalysis || not empty areaAnalysis }">
                    ${industryAnalysis }
                    ${areaAnalysis }
                </c:if>
                <c:if test="${empty industryAnalysis && empty areaAnalysis }">
                    <h4 align="center">没有记录！</h4>
                </c:if>
            </div>
        </div>
        <!--右侧内容区域结束-->
        <div class="clearfix"></div>
    </div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        var href = window.location.href;
        var liMark = href.split("&analysisType=")[1];
        if (liMark == 1) {
            $("#enterpriseMenu").find("li").removeClass("active");
            $("#enterpriseMenu").find("li").eq(3).addClass("active");
        } else if (liMark == 2) {
            $("#enterpriseMenu").find("li").removeClass("active");
            $("#enterpriseMenu").find("li").eq(4).addClass("active");
        }
    });
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


</script>
</body>

</html>