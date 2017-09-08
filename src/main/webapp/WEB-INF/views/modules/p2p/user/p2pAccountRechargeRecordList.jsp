<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
充值记录
@author Chace
@version 2016-11-21
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>充值记录管理</title>
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
    <li class="active"><a href="${ctx}/p2p/user/p2pAccountRechargeRecord/">充值记录列表</a></li>
    <shiro:hasPermission name="p2p:user:p2pAccountRechargeRecord:edit">
        <li><a href="${ctx}/p2p/user/p2pAccountRechargeRecord/form">充值记录添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pAccountRechargeRecord" action="${ctx}/p2p/user/p2pAccountRechargeRecord/"
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
        <shiro:hasPermission name="p2p:user:p2pAccountRechargeRecord:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pAccountRechargeRecord">
        <tr>
            <shiro:hasPermission name="p2p:user:p2pAccountRechargeRecord:edit">
                <td>
                    <a href="${ctx}/p2p/user/p2pAccountRechargeRecord/form?id=${p2pAccountRechargeRecord.id}">修改</a>
                    <a href="${ctx}/p2p/user/p2pAccountRechargeRecord/delete?id=${p2pAccountRechargeRecord.id}"
                       onclick="return confirmx('确认要删除该充值记录吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>