<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用记录申诉管理
@author Zazh
@version 2017-02-20
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用记录申诉管理管理</title>
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
<form:form id="searchForm" modelAttribute="creditAppealInfo" action="${ctx}/creditmanage/creditAppealInfo" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="appealId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="user.p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="100"
                        style="width:175px;"/>
        </li>
        <li><label>申诉原因：</label>
            <form:select path="appealReason" style="width:177px">
                <form:option value="" label="---请选择---"/>
                <form:options items="${fns:getDictList('appeal_category')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>申诉人：</label>
            <form:input path="user.p2pRegUserCertify.realName" htmlEscape="false" maxlength="10" class="input-medium"/>
        </li>
        <li><label>所属行业：</label>
            <sys:treeselect id="industryId" name="user.p2pEnterpriseCertify.industryCode" value=""
                            labelName="creditReportInfo.user.p2pEnterpriseCertify.industryCode"
                            labelValue="${creditReportInfo.user.p2pEnterpriseCertify.industryCode==''?'---请选择---':(fns:getIndustryclassiName(creditReportInfo.user.p2pEnterpriseCertify.industryCode))}"
                            title="行业" url="/Industry/industryTreeData" cssStyle="width:130px;"
                            notAllowSelectParent="true" allowClear="true"/>
        </li>
        <li><label>申诉时间：</label>
            <input id="appealTime" name="appealTime" type="text" readonly="readonly" maxlength="20"
                   class="input-mini Wdate"
                   value="<fmt:formatDate value="${creditAppealInfo.appealTime}" pattern="yyyy-MM-dd"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>-
            <input id="appealTime2" name="appealTime2" type="text" readonly="readonly" maxlength="20"
                   class="input-mini Wdate"
                   value="<fmt:formatDate value="${creditAppealInfo.appealTime2}" pattern="yyyy-MM-dd"/>"
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
        <th>申诉原因</th>
        <th>申诉人</th>
        <th>申诉时间</th>
        <th>企业类型</th>
        <th>操作</th>
        <th>状态</th>
        <th>初审员</th>
        <th>复审员</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="creditAppealInfo">
        <tr>
            <td>${status.index+1}</td>
            <td>${creditAppealInfo.appealId}</td>
            <td>${creditAppealInfo.user.p2pEnterpriseCertify.enterpriseName}</td>
            <td>${fns:getIndustryclassiName(creditAppealInfo.user.p2pEnterpriseCertify.industryCode)}</td>
            <td>企业</td>
            <td>${fns:getDictLabel(creditAppealInfo.appealReason,'appeal_category','')}</td>
            <td>${creditAppealInfo.user.p2pRegUserCertify.realName}</td>
            <td><fmt:formatDate value="${creditAppealInfo.appealTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></td>
            <td>${fns:getDictLabel(creditAppealInfo.user.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
            <td>
                <a href="${ctx}/creditmanage/creditAppealInfo/form?remarks=view&id=${creditAppealInfo.id}">查看</a>
                <c:choose>
                    <c:when test="${creditAppealInfo.auditStatus=='1'||creditAppealInfo.auditStatus=='2'}">
                        <a href="${ctx}/creditmanage/creditAppealInfo/form?remarks=edit&id=${creditAppealInfo.id}">审核</a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${fns:getDictLabel(creditAppealInfo.auditStatus,'appeal_audit_state','')}</td>
            <td>${fns:getUserById(creditAppealInfo.checkId).name}</td>
            <td>${fns:getUserById(creditAppealInfo.recheckId).name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>