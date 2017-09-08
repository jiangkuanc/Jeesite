<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/gywm.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/companyProfile">关于我们</a></li>
        <li class="lg-active">运营数据</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">关于我们</a></p>
        <ul class="zhzl">
            <li data-i="0" class="zhzllevel1">
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/companyProfile">公司简介</a></li>
                    <li><a href="${ctx}/cms/article/cydiaProfile">平台简介</a></li>
                    <li><a href="${ctx}/cms/article/safetyGuarantee">安全保障</a></li>
                    <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/operationData">运营数据</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <h3 class="gudgsj" style="border-bottom: 5px solid #eeeeee;padding-bottom: 5px;">运营数据</h3>
        <div class="gywm-content gywm-content-yysj">
            <ul>
                <li><h4>1）、交易总额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.tradeTotalAmount}"
                                                  pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>2）、交易总笔数：<fmt:formatNumber value="${p2pPlatformOperationDataShow.tradeTotalNumber}"
                                                   pattern="#,###"></fmt:formatNumber>笔</h4></li>
                <li><h4>3）、融资人总数：<fmt:formatNumber value="${p2pPlatformOperationDataShow.financingTotalPeople}"
                                                   pattern="#,###"></fmt:formatNumber>人</h4></li>
                <li><h4>4）、投资人总数：<fmt:formatNumber value="${p2pPlatformOperationDataShow.investmentTotalPeople}"
                                                   pattern="#,###"></fmt:formatNumber>人</h4></li>
                <li><h4>5）、待偿金额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.compensatoryAmount}"
                                                  pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>6）、逾期金额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.overdueAmount}"
                                                  pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>7）、项目逾期率：<fmt:formatNumber pattern="##.00"
                                                   value="${p2pPlatformOperationDataShow.projectOverdueRate*100}"></fmt:formatNumber>%</h4>
                </li>
                <li><h4>8）、金额逾期率：<fmt:formatNumber pattern="##.00"
                                                   value="${p2pPlatformOperationDataShow.amountOverdueRate*100}"></fmt:formatNumber>%</h4>
                </li>
                <li><h4>9）、逾期项目数：<fmt:formatNumber value="${p2pPlatformOperationDataShow.overdueProjectNumber}"
                                                   pattern="#,###.00"></fmt:formatNumber>个</h4></li>
                <li><h4>10）、人均累计融资金额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.renjunFinancingAmount}"
                                                       pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>11）、人均累计投资金额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.renjunInvestmentAmount}"
                                                       pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>12）、笔均融资金额：<fmt:formatNumber value="${p2pPlatformOperationDataShow.bijunFinancingAmount}"
                                                     pattern="#,###.00"></fmt:formatNumber>元</h4></li>
                <li><h4>13）、最大单户融资余额占比：<fmt:formatNumber pattern="##.00"
                                                         value="${p2pPlatformOperationDataShow.maxSingleRzyezb*100}"/>%</h4>
                </li>
                <li><h4>14）、最大十户融资余额占比：<fmt:formatNumber pattern="##.00"
                                                         value="${p2pPlatformOperationDataShow.maxTenRzyezb*100}"/>%</h4>
                </li>
                <li><h4>15）、投资收益：<fmt:formatNumber value="${p2pPlatformOperationDataShow.financingEarn}"
                                                   pattern="#,###.00"></fmt:formatNumber>元</h4></li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>