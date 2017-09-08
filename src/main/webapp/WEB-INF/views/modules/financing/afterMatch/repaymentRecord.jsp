<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款记录</title>
    <meta name="decorator" content="default"/>
</head>

<body>

<h3>还款记录</h3>
<h4>债项详情</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>债项编号</th>
        <th>债项类型</th>
        <th>还款方式</th>
        <th>级别</th>
        <th>债项名称</th>
        <th>期限</th>
        <th>债项额度（元）</th>
        <th>利率</th>
        <th>应还款总额（元）</th>
        <th>已还金额（元）</th>
        <th>剩余还款总额（元）</th>
        <th>逾期次数</th>
        <th>逾期累计金额（元）</th>
    </tr>
    <tr>
        <td>${fi.id}</td>
        <td>信用标</td>
        <td>${fns:getDictLabel(fi.repaymentMode, 'repayment_mode', '')}</td>
        <td>${fns:getDictLabel(fi.p2pFinancingRatingInfo.ratingLevel, 'rating_level', '')}</td>
        <td>${fi.finacingName }</td>
        <td>${fi.financingMaturity }个月</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount }</fmt:formatNumber></td>
        <td>${fi.p2pFinancingRatingInfo.recommendedRate*100 }%</td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal+sumMap.sumInterest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealAmount }</fmt:formatNumber></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${sumMap.sumPrincipal+sumMap.sumInterest - sumMap.sumRealAmount }</fmt:formatNumber></td>
        <td>
            <c:choose>
                <c:when test="${yuqi.countOfOverdue != 0}">
                    <a href="${ctx }/financing/overdueStatistics?fiId=${fi.id }">${yuqi.countOfOverdue }</a>
                </c:when>
                <c:otherwise>
                    ${yuqi.countOfOverdue }
                </c:otherwise>
            </c:choose>
        </td>
        <td><fmt:formatNumber pattern="#,##0.00">${yuqi.amountOfOverdue }</fmt:formatNumber></td>
    </tr>

    </tbody>
</table>
<h4>还款记录</h4>

<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th rowspan="2">账期</th>
        <th colspan="2">当期还款时间</th>
        <th colspan="2">当期本金（元）</th>
        <th colspan="2">当期利息（元）</th>
        <th colspan="2">当期还款合计（元）</th>
        <th rowspan="2">本期是否还清</th>
    </tr>
    <tr>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
    </tr>
    <c:forEach varStatus="status" items="${list }" var="map">
        <tr>
            <td>${map.phase }</td>
            <td><fmt:formatDate value="${map.time }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${map.realTime }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatNumber pattern="#,##0.00">${map.principal }</fmt:formatNumber></td>
            <td><c:if test="${!empty map.realAmount}">${map.principal }</c:if></td>
            <td><fmt:formatNumber pattern="#,##0.00">${map.interest }</fmt:formatNumber></td>
            <td><c:if test="${!empty map.realAmount}">${map.interest }</c:if></td>
            <td><fmt:formatNumber pattern="#,##0.00">${map.principal+map.interest }</fmt:formatNumber></td>
            <td>
                <a href="${ctx }/financing/currentRepaymentAmountDistribute?phase=${map.phase}&&fiId=${fi.id }">${map.realAmount }</a>
            </td>
            <td><c:if test="${!empty map.realAmount}">是</c:if></td>
        </tr>
    </c:forEach>
    <tr>
        <td>合计</td>
        <td></td>
        <td></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealPrincipal }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumInterest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealInterest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal+sumMap.sumInterest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealAmount }</fmt:formatNumber></td>
        <td></td>
    </tr>
    </tbody>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>

</html>