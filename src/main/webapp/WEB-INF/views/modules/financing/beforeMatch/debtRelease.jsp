<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>债项发布列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
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

<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/financing/findDebtReleaseList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>债项名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>公司名称：</label>
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>发布状态</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <form:option value="400">待发布</form:option>
                <form:option value="'500','600','700','701','800','900'">已发布</form:option>
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
        <th>公司名称</th>
        <th>债项类型</th>
        <th>债项级别</th>
        <th>发布状态</th>
        <th>评级报告详情</th>
        <th>申请日期</th>
        <th>签发日期</th>
        <th>发布时间</th>
        <shiro:hasPermission name="financing:financing:edit">
            <th>操作</th>
        </shiro:hasPermission>
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
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${fi.id}">
                        ${fi.finacingName }
                </a>
            </td>
            <!--公司名称-->
            <td>
                <a href="${ctx}/user/p2pEnterpriseCertify/details?id=${fi.p2pEnterpriseCertify.id}">
                        ${fi.enterpriseName }
                </a>
            </td>
            <!--债项类型-->
            <td>信用标</td>
            <!--债项级别-->
            <td>${fi.p2pFinancingRatingInfo.ratingLevel }</td>
            <!--债项状态-->
            <td>${fns:getDictLabel(fi.currentStage, 'progress_stage', '')}</td>
            <!--评级报告详情-->
            <td>
                <a href="#" onClick="creditReportDown('${fi.p2pFinancingRatingInfo.creditReport}');return false;"><img
                        src="${ctxStatic}/dist/images/pdf.jpg"
                        style="width:30px;height:30px;display:block;margin:0 auto;"></a>
            </td>
            <!--申请日期-->
            <td><fmt:formatDate value="${fi.commitTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--签发日期-->
            <td>——</td>
            <!--发布时间-->
            <td><fmt:formatDate value="${fi.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <shiro:hasPermission name="financing:financing:edit">
                <td>
                    <a href="${ctx }/financing/debtReleaseAudit?fiId=${fi.id }&flag=1">查看</a>
                    <c:if test="${fi.currentStage == 400 }">
                        <a href="${ctx }/financing/debtReleaseAudit?fiId=${fi.id }&flag=2">审核</a>
                    </c:if>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>