<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>融资申请材料管理</title>
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
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/financing/p2pApplicationDocuments/">融资申请材料列表</a></li>
    <shiro:hasPermission name="financing:p2pApplicationDocuments:edit">
        <li><a href="${ctx}/financing/p2pApplicationDocuments/form">融资申请材料添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pApplicationDocuments" action="${ctx}/financing/p2pApplicationDocuments/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>融资申请材料ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>融资信息ID：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>申请材料(打包上传)，相对路径：</label>
            <form:input path="applicationDocuments" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>材料说明：</label>
            <form:input path="documentsExplain" htmlEscape="false" class="input-medium"/>
        </li>
        <li><label>材料提交时间：</label>
            <input name="commitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pApplicationDocuments.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>审核时间：</label>
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pApplicationDocuments.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>审核意见：</label>
            <form:input path="auditOpinion" htmlEscape="false" class="input-medium"/>
        </li>
        <li><label>审核人，是某为运营人员的ID：</label>
            <form:input path="auditPersonId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>融资申请材料ID</th>
        <th>融资信息ID</th>
        <th>申请材料(打包上传)，相对路径</th>
        <th>材料说明</th>
        <th>材料提交时间</th>
        <th>审核时间</th>
        <th>审核意见</th>
        <th>审核人，是某为运营人员的ID</th>
        <shiro:hasPermission name="financing:p2pApplicationDocuments:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pApplicationDocuments">
        <tr>
            <td><a href="${ctx}/financing/p2pApplicationDocuments/form?id=${p2pApplicationDocuments.id}">
                    ${p2pApplicationDocuments.id}
            </a></td>
            <td>
                    ${p2pApplicationDocuments.financingInformationId}
            </td>
            <td>
                    ${p2pApplicationDocuments.applicationDocuments}
            </td>
            <td>
                    ${p2pApplicationDocuments.documentsExplain}
            </td>
            <td>
                <fmt:formatDate value="${p2pApplicationDocuments.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${p2pApplicationDocuments.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pApplicationDocuments.auditOpinion}
            </td>
            <td>
                    ${p2pApplicationDocuments.auditPersonId}
            </td>
            <shiro:hasPermission name="financing:p2pApplicationDocuments:edit">
                <td>
                    <a href="${ctx}/financing/p2pApplicationDocuments/form?id=${p2pApplicationDocuments.id}">修改</a>
                    <a href="${ctx}/financing/p2pApplicationDocuments/delete?id=${p2pApplicationDocuments.id}"
                       onclick="return confirmx('确认要删除该融资申请材料吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>