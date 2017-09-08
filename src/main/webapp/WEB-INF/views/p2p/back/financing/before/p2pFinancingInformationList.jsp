<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>撮合前借贷产品列表</title>
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
        function model_eidt(rsiId) {
            $.ajax({
                url: '${ctx}/rating/ratingDraftSearch/userObjectionView?rsiId=' + rsiId,
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
<%-- <ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/financing/p2pFinancingInformation/">融资信息表列表</a></li>
</ul> --%>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation"
           action="${ctx}/financing/p2pFinancingInformation/relationList" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业名称</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品名称</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品状态</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <c:forEach items="${fns:getDictList('progress_stage')}" varStatus="status" var="a">
                    <c:if test="${a.value <=500 || a.value == 902}">
                        <form:option value="${a.value }">${a.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>

        <li>
            <label>借贷产品编号</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>申请时间</th>
        <th>企业名称</th>
        <th>融资申请用户须知</th>
        <th>借贷产品名称</th>
        <!-- 				<th>大公评级合同编号</th> -->
        <th>大公评级合同</th>
        <th>非正式版评级报告</th>
        <th>正式版评级报告</th>
        <th>用户异议查看</th>
        <th>借贷产品主体信用等级</th>
        <th>评级展望</th>
        <th>借贷产品评级级别</th>
        <th>借贷产品利率</th>
        <th>举债额度(元)</th>
        <th>是否增信</th>
        <!-- 				<th>增信方式</th> -->
        <th>产品类别</th>
        <th>借贷产品状态</th>
        <th>借贷产品支付状态</th>
        <%-- <shiro:hasPermission name="financing:p2pFinancingInformation:edit"><th>操作</th></shiro:hasPermission> --%>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">

        <tr style="text-align:left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!-- 债项编号 -->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <!-- 申请时间 -->
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 融资企业名称 -->
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <!-- 融资申请用户须知 -->
            <td title="大公数据融资申请用户须知">
                <a href="${ctx}/p2p/config/p2pAgreement/agreementShow?agreementType=1">
                        ${fns:abbr("大公数据融资申请用户须知",20)}
                </a>
            </td>
            <!-- 债项名称 -->
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName,15)}
                </a>
            </td>
            <!-- 大公评级合同编号 -->
            <!-- 				<td> -->
            <!-- 				XXX001 -->
            <!-- 				</td> -->
            <!-- 大公评级合同 -->
            <td>
                <a href="${ctx}/p2p/config/p2pAgreement/agreementShow?agreementType=3">
                    大公评级合同
                </a>
            </td>
            <!-- 非正式版评级报告 -->
            <td>
                <shiro:hasPermission name="informal:download">
                    <a href="${ctx}/financing/download2?id=${p2pFinancingInformation.p2pFinancingRatingInfo.id}&type=1">${p2pFinancingInformation.p2pFinancingRatingInfo.commitReportName}</a>
                </shiro:hasPermission>
            </td>
            <!-- 正式版评级报告 -->
            <td>
                <shiro:hasPermission name="formal:download">
                    <a href="${ctx}/financing/download2?id=${p2pFinancingInformation.p2pFinancingRatingInfo.id}&type=2">${p2pFinancingInformation.p2pFinancingRatingInfo.creditReportName}</a>
                </shiro:hasPermission>
            </td>
            <!-- 用户异议查看 -->
            <td>
                <a onclick="model_eidt('${p2pFinancingInformation.id }')" data-toggle="modal"
                   data-target="#myModal_view">
                        ${fns:getDictLabel(p2pFinancingInformation.p2pRatingResultView.viewType, 'view_type', '')}
                </a>
            </td>
            <!-- 借贷产品主体信用等级 -->
            <td>${p2pFinancingInformation.p2pFinancingRatingInfo.mainCreditGrade}</td>
            <!-- 评级展望 -->
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.rateExpectation,'rating_expection','')}</td>
            <!-- 债项评级级别 -->
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}
            </td>
            <!-- 债项利率 -->
            <td>
                <c:if test="${!empty p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate }">
                    <fmt:formatNumber
                            pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                </c:if>
            </td>
            <!-- 举债额度(元) -->
            <td>
                <c:if test="${not empty p2pFinancingInformation.financingAmount }">
                    <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount }">
                        <fmt:formatNumber
                                pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                    </c:if>
                    <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount }">
                        <fmt:formatNumber
                                pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                    </c:if>
                </c:if>
            </td>
            <!-- 是否增信 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.wetherRep,'yes_no', '')}
            </td>
            <!-- 增信方式 -->
            <!-- 				<td> -->
            <!-- 				抵质押增信 -->
            <!-- 				</td> -->
            <!-- 产品对象 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.markType,'mark_type', '')}
            </td>
            <!-- 债项状态 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}
            </td>
            <!-- 债项支付状态 -->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.isHandRateCost=='0'}">
                        未支付
                    </c:when>
                    <c:when test="${p2pFinancingInformation.isHandRateCost=='1'}">
                        已支付
                    </c:when>
                </c:choose>
            </td>
            <!-- 是否担保 -->
                <%-- <td>
                    ${fns:getDictLabel(p2pFinancingInformation.isGuarantee, 'yes_no', '')}
                </td> --%>
            <%--<!-- 进展阶段 -->
				<td>
				<a href="${ctx}/financing/p2pBeforeMatchDebtState/findListByFid?finacingInformationId=${p2pFinancingInformation.id}">
				${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}
				</a>
				</td>
				--%><!-- 债项状态 -->
                <%-- <td>
                <a href="${ctx}/financing/p2pBeforeMatchDebtState/findListByFid?finacingInformationId=${p2pFinancingInformation.id}">
                    ${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}
                    </a>
                </td>
                <!-- 状态时间 -->
                <td>
                <fmt:formatDate value="${p2pFinancingInformation.p2pBeforeMatchDebtState.stateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td> --%>
                <%-- <shiro:hasPermission name="financing:p2pFinancingInformation:edit"><td>
                    <a href="${ctx}/financing/p2pFinancingInformation/form?id=${p2pFinancingInformation.id}">修改</a>
                    <a href="${ctx}/financing/p2pFinancingInformation/delete?id=${p2pFinancingInformation.id}" onclick="return confirmx('确认要删除该融资信息表吗？', this.href)">删除</a>
                </td></shiro:hasPermission> --%>
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