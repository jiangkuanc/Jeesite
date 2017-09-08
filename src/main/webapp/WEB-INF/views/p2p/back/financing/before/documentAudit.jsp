<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料审核</title>
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
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pEnterpriseCertify" action="${ctx}/financing/findDocumentAuditList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="p2pFinancingInformation.id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品状态：</label>
            <form:select path="p2pFinancingInformation.currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <form:option value="202">${fns:getDictLabel('202','progress_stage','')}</form:option>
                <form:option value="201">${fns:getDictLabel('201','progress_stage','')}</form:option>

                <c:forEach items="${fns:getDictList('progress_stage')}" var="list">
                    <c:if test="${list.value > 202}">
                        <form:option value="${list.value }">${list.label }</form:option>
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
        <!-- <th>企业编号</th> -->
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>申请金额(元)</th>
        <th>申请期限</th>
        <th>申请利率</th>
        <th>借贷产品状态</th>
        <th>操作</th>
        <!-- <th>企业法人</th>
        <th>注册号</th>
        <th>法人身份证号码</th>
        <th>身份证复印件</th>
        <th>企业认证状态</th> -->
        <!-- <th>审核状态</th> -->
        <%-- <shiro:hasPermission name="financing:financing:edit"><th>操作</th></shiro:hasPermission> --%>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pEnterpriseCertify">

        <tr style="text-align: left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
                <%-- <!--企业编号-->
                <td>
                    ${p2pEnterpriseCertify.p2pUserInformation.id }
                </td> --%>
            <!--融资申请编号-->
            <td>
                    ${p2pEnterpriseCertify.p2pFinancingInformation.id}
            </td>
            <!--融资企业名称-->
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pEnterpriseCertify.user.id}">
                        <%--					<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}&id2=${p2pEnterpriseCertify.id}">--%>
                        ${p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <!-- 申请债项名称 -->
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}">
                        ${p2pEnterpriseCertify.p2pFinancingInformation.finacingName}
                </a>
            </td>
            <!-- 融资申请金额(元) -->
            <td>${p2pEnterpriseCertify.p2pFinancingInformation.applicationAmount}</td>
            <!-- 申请融资期限 -->
            <td>${fns:getDictLabel(p2pEnterpriseCertify.p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
            <!-- 申请债项利率 -->
            <td>
                <c:if test="${!empty p2pEnterpriseCertify.p2pFinancingInformation.applicationRate }">
                    <fmt:formatNumber
                            pattern="#0.00">${p2pEnterpriseCertify.p2pFinancingInformation.applicationRate*100}</fmt:formatNumber>%
                </c:if>

            </td>
            <!-- 融资材料初审状态 -->
            <td>${fns:getDictLabel(p2pEnterpriseCertify.p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <!-- 审核操作 -->
            <td>
                <c:choose>
                    <c:when test="${p2pEnterpriseCertify.p2pFinancingInformation.currentStage == 202}">
                        <shiro:hasPermission name="material:audit">
                            <a href="${ctx}/document/p2pRateDocumentUpload/findlist?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}&paymentId=${p2pEnterpriseCertify.user.id}">
                                审核
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:otherwise>
                        <shiro:hasPermission name="material:see">
                            <a href="${ctx}/document/p2pRateDocumentUpload/findlistAudit?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}">
                                查看
                            </a>
                        </shiro:hasPermission>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>