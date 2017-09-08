<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>撮合后债项列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function creditReportDown(src) {
            if (src == "" || src == null || src == undefined) {
                alert("没有添加评级报告");
                return;
            }
            var strs = new Array();
            var newStr = "";
            strs = src.split("/");
            for (var i = 2; i < strs.length; i++) {
                if (i == strs.length - 1) {
                    newStr = newStr + strs[i];
                }
                else {
                    newStr = newStr + strs[i] + "/";
                }
            }
            window.open('${pageContext.request.contextPath}/' + newStr);
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/financing/afterMatchList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>债项编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>债项名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>公司名称：</label>
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>评级级别：</label>
            <form:select path="p2pFinancingRatingInfo.ratingLevel" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>利率：</label>
            <form:input path="p2pFinancingRatingInfo.recommendedRate" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>债项状态：</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <c:forEach items="${fns:getDictList('progress_stage')}" varStatus="status" var="a">
                    <c:if test="${a.value >=800 }">
                        <form:option value="${a.value }">${a.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>债项编号</th>
        <th>债项名称</th>
        <th>企业名称</th>
        <th>债项期限</th>
        <th>评级级别</th>
        <th>利率</th>
        <th>还款方式</th>
        <th>已还款/全部应还款（元）</th>
        <th>当前期数</th>
        <th>本期应还本金（元）</th>
        <th>本期应还利息（元）</th>
        <th>本期应还总金额（元）</th>
        <th>本期还款日倒计时（天）</th>
        <th>债项状态</th>
        <th>逾期次数</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="fi">

        <tr>
            <!--序号-->
            <td>${status.count }</td>
            <!--债项编号-->
            <td>${fi.id }</td>
            <!--债项名称-->
            <td>
                <a href="${ctx }/financing/middleDebtDetails?fiId=${fi.id }">${fi.finacingName }</a>
            </td>
            <!--企业名称-->
            <td>
                <a href="${ctx}/user/p2pEnterpriseCertify/details?id=${fi.p2pEnterpriseCertify.id}">${fi.enterpriseName }</a>
            </td>
            <!-- 债项期限 -->
            <td><a href="${ctx }/financing/repaymentPlan?fiId=${fi.id }">${fi.financingMaturity }个月</a></td>
            <!--评级级别-->
            <td>
                <a href="#"
                   onClick="creditReportDown('${fi.p2pFinancingRatingInfo.creditReport}');return false;">${fi.p2pFinancingRatingInfo.ratingLevel }</a>
            </td>
            <!--利率-->
            <td>${fi.p2pFinancingRatingInfo.recommendedRate*100 }%</td>
            <!-- 还款方式 -->
            <td style="word-break:keep-all;white-space:nowrap;">
                    ${fns:getDictLabel(fi.repaymentMode, 'repayment_mode', '')}
            </td>
            <!-- 已还款/全部应还款 -->
            <td>

                <a href="${ctx }/financing/repaymentRecord?fiId=${fi.id }">
                    <fmt:formatNumber
                            pattern="#,##0.00">${fic:getSum(fi).sumRealAmount }</fmt:formatNumber>/<fmt:formatNumber
                        pattern="#,##0.00">${fic:getSum(fi).sumPrincipal + fic:getSum(fi).sumInterest }</fmt:formatNumber>
                </a>
            </td>
            <!-- 当前期数 -->
            <td>${fic:getCurrentPhase(fi.id)}</td>
            <!-- 本期应还本金 -->
            <td><fmt:formatNumber
                    pattern="#,##0.00">${fic:getCurrentRepayment(fi.id).principal }</fmt:formatNumber></td>
            <!-- 本期应还利息 -->
            <td><fmt:formatNumber pattern="#,##0.00">${fic:getCurrentRepayment(fi.id).interest }</fmt:formatNumber></td>
            <!-- 本期应还总金额 -->
            <td><fmt:formatNumber
                    pattern="#,##0.00">${fic:getCurrentRepayment(fi.id).principal + fic:getCurrentRepayment(fi.id).interest }</fmt:formatNumber>
            </td>
            <!-- 本期还款日倒计时 -->
            <td>${fic:getCurrentRepayment(fi.id).countdownDays }</td>
            <!-- 债项状态 -->
            <td style="word-break:keep-all;white-space:nowrap;">${fns:getDictLabel(fi.currentStage, 'progress_stage', '')}</td>
            <!-- 逾期次数 -->
            <td>${fic:getDaysOfOverdue(fi).countOfOverdue}</td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>