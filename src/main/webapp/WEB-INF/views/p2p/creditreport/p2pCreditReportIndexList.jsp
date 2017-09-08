<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用报告指标表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用报告指标表管理</title>
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
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/">信用报告指标表列表</a></li>
    <shiro:hasPermission name="p2p:creditreport:p2pCreditReportIndex:edit">
        <li><a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/form">信用报告指标表添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pCreditReportIndex" action="${ctx}/p2p/creditreport/p2pCreditReportIndex/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <shiro:hasPermission name="p2p:creditreport:p2pCreditReportIndex:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pCreditReportIndex">
        <tr>
            <shiro:hasPermission name="p2p:creditreport:p2pCreditReportIndex:edit">
                <td>
                    <a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/form?id=${p2pCreditReportIndex.id}">修改</a>
                    <a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/delete?id=${p2pCreditReportIndex.id}"
                       onclick="return confirmx('确认要删除该信用报告指标表吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>