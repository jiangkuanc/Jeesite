<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>债项详情</title>
    <meta name="decorator" content="default"/>
</head>

<body>
<h3>债项详情</h3>
<h4>债项基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td width="6%">企业名称</td>
        <td width="44%">${p2pFinancingInformation.enterpriseName}</td>
        <td width="6%">债项名称</td>
        <td width="44%">${p2pFinancingInformation.finacingName}</td>
    </tr>
    <tr>
        <td>融资金额(元)</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber></td>
        <td>融资期限(月)</td>
        <td>${p2pFinancingInformation.financingMaturity }</td>
    </tr>
    <tr>
        <td>还款方式</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
        <td>预计还款金额(元)</td>
        <td>${fic:getRepaymentAmount(p2pFinancingInformation)}</td>
    </tr>
    <tr>
        <td>借款用途类别</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.purposeClassification, 'purpose_classification', '')}</td>
        <td>用途说明</td>
        <td>${p2pFinancingInformation.purposeExplain}</td>
    </tr>
    <tr>
        <td>第一笔还款来源</td>
        <td>${p2pFinancingInformation.repaymentFirstSource}</td>
        <td>第二笔还款来源</td>
        <td>${p2pFinancingInformation.repaymentSecondSource}</td>
    </tr>
    <tr>
        <td>第三笔还款来源</td>
        <td>${p2pFinancingInformation.repaymentThirdSource}</td>
        <td>其他还款来源</td>
        <td>${p2pFinancingInformation.repaymentOtherSource}</td>
    </tr>
    <tr>
        <td>是否担保</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.isGuarantee, 'yes_no', '')}</td>
        <td>债项状态</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
    </tr>
    </tbody>
</table>
<br>
<h4>募集信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>发布日期</th>
        <th>募集到期日期</th>
        <th>是否满标</th>
        <th>满标日期</th>
        <th>是否流标</th>
        <th>流标日期</th>
        <th>应募集金额（元）</th>
        <th>已募集金额（元）</th>
    </tr>
    <tr>
        <td><fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td><fmt:formatDate value="${fic:debtRaiseTime(p2pFinancingInformation.id)}"
                            pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td><c:if test="${fic:isFullDebt(p2pFinancingInformation.id)}">是</c:if><c:if
                test="${!fic:isFullDebt(p2pFinancingInformation.id)}">否</c:if></td>
        <td><fmt:formatDate value="${fic:fullDebtTime(p2pFinancingInformation.id)}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td><c:if test="${fic:isFlowDebt(p2pFinancingInformation.id)}">是</c:if><c:if
                test="${!fic:isFlowDebt(p2pFinancingInformation.id)}">否</c:if></td>
        <td><fmt:formatDate value="${fic:flowDebtTime(p2pFinancingInformation.id)}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.restRaiseMoney}</fmt:formatNumber></td>
    </tr>
    </tbody>
</table>
<br>
<h4>还款情况统计</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>应还款总额（元）</th>
        <th>实际还款总额（元）</th>
        <th>是否逾期</th>
        <th>最近一次连续逾期天数（天）</th>
        <th>累计逾期天数（天）</th>
        <th>逾期次数（次）</th>
        <th>逾期类别</th>
        <th>代缴纳总罚金（元）</th>
        <th>实际缴纳罚金（元）</th>
        <th>是否加入黑名单</th>
    </tr>

    <tr>
        <td><fmt:formatNumber
                pattern="#,##0.00">${fic:getSum(p2pFinancingInformation).sumPrincipal+fic:getSum(p2pFinancingInformation).sumInterest}</fmt:formatNumber></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${fic:getSum(p2pFinancingInformation).sumRealAmount}</fmt:formatNumber></td>
        <td>
            <c:choose>
                <c:when test="${fic:getDaysOfOverdue(p2pFinancingInformation).countOfOverdue != 0 || fic:getDaysOfOverdue(p2pFinancingInformation).countOfOverdue == null}">是</c:when>
                <c:otherwise>否</c:otherwise>
            </c:choose>
        </td>
        <td>${fic:getLXYQTS(p2pFinancingInformation)}</td>
        <td>${fic:getDaysOfOverdue(p2pFinancingInformation).daysOfOverdue}</td>
        <td>${fic:getDaysOfOverdue(p2pFinancingInformation).countOfOverdue}</td>
        <td>——</td>
        <td>——</td>
        <td>——</td>
        <td>——</td>
    </tr>

    </tbody>
</table>
<br>
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
                <a href="${ctx }/financing/currentRepaymentAmountDistribute?phase=${map.phase}&&fiId=${p2pFinancingInformation.id }">${map.realAmount }</a>
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
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>