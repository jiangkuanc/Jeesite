<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>逾期情况统计</title>
    <meta name="decorator" content="default"/>
</head>

<body>
<h3>逾期情况统计</h3>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>企业名称</th>
        <td>${p2pEnterpriseCertify.enterpriseName }</td>
        <th>企业组织机构代码</th>
        <td>${p2pEnterpriseCertify.organizationCode }</td>
    </tr>
    <tr>
        <th>注册号</th>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode }</td>
        <th>法人</th>
        <td>${p2pEnterpriseCertify.nameOf }</td>
    </tr>
    <tr>
        <th>注册资本</th>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pEnterpriseCertify.registeredCapital }</fmt:formatNumber></td>
        <th>企业类型</th>
        <td>${p2pFinancingInformation.enterpriseNature }</td>
    </tr>
    <tr>
        <th>经营范围</th>
        <td>${p2pEnterpriseCertify.businessScope }</td>
        <th>对公账户</th>
        <td></td>
    </tr>
    </tbody>
</table>
<h4>债项信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>债项名称</th>
        <td>${p2pFinancingInformation.enterpriseName }</td>
        <th>融资金额</th>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount }</fmt:formatNumber></td>
    </tr>
    <tr>
        <th>融资期限</th>
        <td>${p2pFinancingInformation.financingMaturity }</td>
        <th>还款方式</th>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
    </tr>
    <tr>
        <th>借款用途类别</th>
        <td>${fns:getDictLabel(p2pFinancingInformation.purposeClassification, 'purpose_classification', '')}</td>
        <th>用途说明</th>
        <td>${p2pFinancingInformation.purposeExplain }</td>
    </tr>
    <tr>
        <th>第一笔还款来源</th>
        <td>${p2pFinancingInformation.repaymentFirstSource }</td>
        <th>第二笔还款来源</th>
        <td>${p2pFinancingInformation.repaymentSecondSource }</td>
    </tr>
    <tr>
        <th>第三笔还款来源</th>
        <td>${p2pFinancingInformation.repaymentThirdSource }</td>
        <th>其他还款来源</th>
        <td>${p2pFinancingInformation.repaymentOtherSource }</td>
    </tr>
    <tr>
        <th>是否担保</th>
        <td>${fns:getDictLabel(p2pFinancingInformation.isGuarantee , 'yes_no', '')}</td>
        <th>担保资质</th>
        <td>——</td>
    </tr>
    <tr>
        <th>评级级别</th>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel }</td>
        <th>利率</th>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate }</td>
    </tr>
    </tbody>
</table>
<h4>债项逾期情况</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>逾期累计次数</th>
        <td>${yuqi.countOfOverdue }</td>
        <th>最后一次逾期时间</th>
        <td>${fic:getLastOverdueDate(p2pFinancingInformation)}</td>
    </tr>
    <tr>
        <th>累计逾期金额</th>
        <td><fmt:formatNumber pattern="#,##0.00">${yuqi.amountOfOverdue }</fmt:formatNumber></td>
        <th>偿还金额</th>
        <td><fmt:formatNumber pattern="#,##0.00">${yuqi.repayAmountOfOverdue }</fmt:formatNumber></td>
    </tr>
    <tr>
        <th>待还逾期金额</th>
        <td><fmt:formatNumber pattern="#,##0.00">${yuqi.waitRepayAmount }</fmt:formatNumber></td>
        <th></th>
        <td></td>
    </tr>
    <tr>
        <th>连续逾期天数</th>
        <td>${fic:getLXYQTS(p2pFinancingInformation)}</td>
        <th>累计逾期天数</th>
        <td>${yuqi.daysOfOverdue }</td>
    </tr>
    </tbody>
</table>
<h4>逾期记录</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>序号</th>
        <th>期数</th>
        <th>应还款日期</th>
        <th>应还款本金</th>
        <th>应还款利息</th>
        <th>实际还款日期</th>
        <th>实际还款金额</th>
        <th>逾期天数</th>
    </tr>
    <c:forEach items="${overdueRecord }" var="ormap" varStatus="status">
        <tr>
            <td>${status.count }</td>
            <td>${ormap.phase }</td>
            <td><fmt:formatDate value="${ormap.time }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatNumber pattern="#,##0.00">${ormap.principal }</fmt:formatNumber></td>
            <td><fmt:formatNumber pattern="#,##0.00">${ormap.interest }</fmt:formatNumber></td>
            <td><fmt:formatDate value="${ormap.realTime }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatNumber pattern="#,##0.00">${ormap.realAmount }</fmt:formatNumber></td>
            <td>${ormap.OverdueDays }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>

</html>