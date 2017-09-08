<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资记录</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(function () {
            //*******计算到期时间**********
            var deadLine = '${p2pFinancingInformation.raiseTimeLimit}';//募集期限
            var lastPublishTime = $("#lastPublishTime").val();//最新发布时间
            if (lastPublishTime == "") {
                $("#daoqi").text('0');
            } else {
                var arr = lastPublishTime.split('-');
                var date = new Date(arr[0], arr[1] - 1, arr[2], arr[3], arr[4], arr[5]);
                var hasRaiseTime = '${p2pFinancingInformation.hasRaiseTime}';//已募集时间
                var expireDate = deadLine * 24 * 3600 * 1000 + (date.getTime() - hasRaiseTime * 1000);
                expireDate = new Date(expireDate);
                expireDate = expireDate.format("yyyy-MM-dd hh:mm:ss");
                $("#daoqi").text(expireDate);
            }
            //*******计算到期时间**********
        })
    </script>
</head>
<body>
<div class="title"><h3>借贷产品基本信息</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品信息</h4>
<table class="table table-striped table-bordered table-condensed mycenter listtable">
    <tbody>
    <tr>
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品额度(元)</th>
        <th>借贷产品类型</th>
        <th>期限</th>
        <th>还款方式</th>
    </tr>
    <tr>
        <td>${ p2pFinancingInformation.id}</td>
        <td>${ p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
        <td>${ p2pFinancingInformation.finacingName}</td>
        <td>${ p2pFinancingInformation.financingAmount}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
    </tr>
    <tr>
        <th>借贷产品评级</th>
        <th>借贷产品利率</th>
        <th>发布时间</th>
        <th>到期时间</th>
        <th>借贷产品状态</th>
        <th>已募集金额(元)</th>
        <th>剩余募集金额(元)</th>
    </tr>
    <tr>
        <td>${ p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
        <td><fmt:formatNumber
                pattern="#0.00">${ p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
        </td>
        <td>
            <fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
            <input id="lastPublishTime" type="hidden"
                   value="<fmt:formatDate value='${p2pFinancingInformation.lastPublishTime}' pattern='yyyy-MM-dd-HH-mm-ss'/>"/>
        </td>
        <td id="daoqi"></td>
        <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
        <td>${p2pFinancingInformation.hasRaiseAmount}</td>
        <td>${ p2pFinancingInformation.restRaiseMoney}</td>
    </tr>
    </tbody>
</table>
<h4>投资记录</h4>
<c:if test="${p2pFinancingInformation.markType == 1}">
    <table id="contentTable" class="table table-striped table-bordered table-condensed mycenter listtable">
        <thead>
        <tr>
            <th>序号</th>
            <th>投资日期</th>
            <th>投资人</th>
            <th>投资人类型</th>
            <th>投资金额（元）</th>
            <!-- 				<th>放款凭证</th> -->
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
            <tr>
                <!-- 序号 -->
                <td>
                        ${status.count }
                </td>
                <td><fmt:formatDate value="${p2pInvestmentInformation.p2pInvestmentDetails.investmentTime}"
                                    pattern="yyyy-MM-dd HH:mm:dd"/></td>
                <td>${p2pInvestmentInformation.user.name}</td>
                <td>${fns:getDictLabel(p2pInvestmentInformation.p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
                <td><fmt:formatNumber
                        pattern="#,##0.00">${p2pInvestmentInformation.p2pInvestmentDetails.investmentAmount }</fmt:formatNumber></td>
                <!-- 				<td>查看</td> -->
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<c:if test="${p2pFinancingInformation.markType == 2}">
    <table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
        <thead>
        <tr>
            <th>序号</th>
            <th>投资日期</th>
            <th>投资人</th>
            <th>投资金额（元）</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
            <tr>
                <!-- 序号 -->
                <td>
                        ${status.count }
                </td>
                <td><fmt:formatDate value="${p2pInvestmentInformation.p2pInvestmentDetails.investmentTime}"
                                    pattern="yyyy-MM-dd"/></td>
                <td>${p2pInvestmentInformation.user.name}</td>
                <td><fmt:formatNumber
                        pattern="#,##0.00">${p2pInvestmentInformation.p2pInvestmentDetails.investmentAmount }</fmt:formatNumber></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
</body>
</html>

