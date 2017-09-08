<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>评级企业列表</title>
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
        function model_eidt(rsiId, financingName) {
            $.ajax({
                url: '${ctx}/rating/ratingEnterprise/ratingPaydetails',
                data: {rsiId: rsiId, financingName: financingName},
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pRatingServiceInfo" action="${ctx}/rating/ratingEnterprise" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>评级项目编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>评级企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>评级状态：</label>
            <form:select path="currentStage" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:options items="${fns:getDictList('current_stage')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>评级费支付状态：</label>
            <form:select path="isHandRateCost" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="1">已支付</form:option>
                <form:option value="0">未支付</form:option>
            </form:select>
        </li>
        <li><label>主体信用等级：</label>
            <form:select path="p2pFinancingRatingInfo.mainCreditGrade" htmlEscape="false" maxlength="64"
                         class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>评级项目编号</th>
        <th>评级项目名称</th>
        <th>评级申请时间</th>
        <th>评级企业名称</th>
        <th>大公评级合同编号</th>
        <th>非正式版评级报告</th>
        <th>正式版评级报告</th>
        <th>主体信用等级</th>
        <th>评级展望</th>
        <th>评级状态</th>
        <th>评级费金额（元）</th>
        <th>评级费支付状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pRatingServiceInfo">
        <tr>
            <td>${status.count }</td>
            <td>${p2pRatingServiceInfo.id }</td>
            <td>
                <a href="${ctx}/rating/ratingEnterprise/ratingDetails?id=${p2pRatingServiceInfo.id }">
                        ${p2pRatingServiceInfo.ratingName }
                </a>
            </td>
            <td><fmt:formatDate value="${p2pRatingServiceInfo.applyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pRatingServiceInfo.applicantsId }">
                        ${p2pRatingServiceInfo.p2pEnterpriseCertify.enterpriseName }
                </a>
            </td>
            <td>无</td>
            <td>
                <shiro:hasPermission name="informal:report">
                    <a href="${ctx}/financing/download2?id=${p2pRatingServiceInfo.p2pFinancingRatingInfo.id}&type=1">
                            ${p2pRatingServiceInfo.p2pFinancingRatingInfo.commitReportName }
                    </a>
                </shiro:hasPermission>
            </td>
            <td>
                <shiro:hasPermission name="formal:report">
                    <a href="${ctx}/financing/download2?id=${p2pRatingServiceInfo.p2pFinancingRatingInfo.id}&type=2">
                            ${p2pRatingServiceInfo.p2pFinancingRatingInfo.creditReportName }
                    </a>
                </shiro:hasPermission>
            </td>
            <td>${p2pRatingServiceInfo.p2pFinancingRatingInfo.mainCreditGrade }</td>
            <td>${fns:getDictLabel(p2pRatingServiceInfo.p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '') }</td>
            <td>${fns:getDictLabel(p2pRatingServiceInfo.currentStage, 'current_stage', '') }</td>
            <td>4,000.00</td>
            <td>
                <c:if test="${p2pRatingServiceInfo.isHandRateCost == 0 }">未支付</c:if>
                <c:if test="${p2pRatingServiceInfo.isHandRateCost == 1 }">
                    <a onclick="model_eidt('${p2pRatingServiceInfo.id }','${p2pRatingServiceInfo.p2pEnterpriseCertify.enterpriseName }');"
                       data-toggle="modal" data-target="#myModal_view">
                        已支付
                    </a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog" style="width:430px;"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
</body>
</html>