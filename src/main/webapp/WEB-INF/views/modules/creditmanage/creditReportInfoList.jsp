<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用记录举报管理
@author Zazh
@version 2017-02-20
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用记录举报管理管理</title>
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
<form:form id="searchForm" modelAttribute="creditReportInfo" action="${ctx}/creditmanage/creditReportInfo" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="beReportedId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="100"
                        style="width:175px;"/>
        </li>
        <li><label>举报原因：</label>
            <form:select path="reportReason" style="width:177px">
                <form:option value="" label="---请选择---"/>
                <form:options items="${fns:getDictList('report_category')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>举报人：</label>
            <form:input path="user.name" htmlEscape="false" maxlength="30" class="input-medium"/>
        </li>
        <li><label>所属行业：</label>
            <sys:treeselect id="industryId" name="p2pEnterpriseCertify.industryCode" value=""
                            labelName="creditReportInfo.p2pEnterpriseCertify.industryCode"
                            labelValue="${creditReportInfo.p2pEnterpriseCertify.industryCode==''?'---请选择---':(fns:getIndustryclassiName(creditReportInfo.p2pEnterpriseCertify.industryCode))}"
                            title="行业" url="/Industry/industryTreeData" cssStyle="width:130px;"
                            notAllowSelectParent="true" allowClear="true"/>
        </li>
        <li><label>举报时间：</label>
            <input id="reportTime" name="reportTime" type="text" readonly="readonly" maxlength="20"
                   class="input-mini Wdate"
                   value="<fmt:formatDate value="${creditReportInfo.reportTime}" pattern="yyyy-MM-dd"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>-
            <input id="reportTime2" name="reportTime2" type="text" readonly="readonly" maxlength="20"
                   class="input-mini Wdate"
                   value="<fmt:formatDate value="${creditReportInfo.reportTime2}" pattern="yyyy-MM-dd"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
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
        <th>企业编号</th>
        <th>企业名称</th>
        <th>所属行业</th>
        <th>角色类型</th>
        <th>举报原因</th>
        <th>举报人</th>
        <th>举报时间</th>
        <th>企业类型</th>
        <th>举报信息(操作)</th>
        <th>被举报申诉信息(操作)</th>
        <th>状态</th>
        <th>初审员</th>
        <th>复审员</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="creditReportInfo">
        <tr>
            <td>${status.index+1}</td>
            <td>${creditReportInfo.beReportedId}</td>
            <td>${creditReportInfo.p2pEnterpriseCertify.enterpriseName}</td>
            <td>${creditReportInfo.p2pIndustryclassi.classinameCn}</td>
            <td>${creditReportInfo.role.name}</td>
            <td>${fns:getDictLabel(creditReportInfo.reportReason,'report_category','')}</td>
            <td>${fns:getUserById(creditReportInfo.reportId).name}</td>
            <td><fmt:formatDate value="${creditReportInfo.reportTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></td>
            <td>${fns:getDictLabel(creditReportInfo.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
            <td>
                <a href="${ctx}/creditmanage/creditReportInfo/form?remarks=view&id=${creditReportInfo.id}">查看</a>
                <c:choose>
                    <c:when test="${creditReportInfo.auditStatus=='1'||creditReportInfo.auditStatus=='2'}">
                        <a href="${ctx}/creditmanage/creditReportInfo/form?remarks=edit&id=${creditReportInfo.id}">审核</a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty creditReportInfo.creditAppealInfo}">
                        <c:choose>
                            <c:when test="${creditReportInfo.creditAppealInfo.auditStatus=='1'||creditReportInfo.creditAppealInfo.auditStatus=='2'}">
                                <a href="${ctx}/creditmanage/creditAppealInfo/form?remarks=view&id=${creditReportInfo.beReportedId}">查看</a>
                                <a href="${ctx}/creditmanage/creditAppealInfo/form?remarks=edit&id=${creditReportInfo.beReportedId}">审核</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}/creditmanage/creditAppealInfo/form?remarks=view&id=${creditReportInfo.beReportedId}">查看</a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        --
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${fns:getDictLabel(creditReportInfo.auditStatus,'report_audit_state','')}</td>
            <td>${fns:getUserById(creditReportInfo.checkId).name}</td>
            <td>${fns:getUserById(creditReportInfo.recheckId).name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>