<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>担保公司</title>
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
<form:form id="searchForm" modelAttribute="user" action="${ctx}/user/userList/guaranteeList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>公司编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>公司名称：</label>
            <form:input path="p2pGuarantee.name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>用户来源：</label>
            <form:select path="p2pUserInformation.userFrom" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('user_from')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><a class="btn btn-primary" type="button" href="${ctx}/user/userList/guaranteeRegisterForm">添加担保公司</a>
        </li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>公司编号</th>
        <th>公司名称</th>
        <th>注册地址</th>
        <th>用户来源</th>
        <th>是否认证</th>
        <th>业务范围</th>
        <th>战略合作协议</th>
        <th>公司网站</th>
        <th>对接人姓名</th>
        <th>对接人电话</th>
        <th>对接人邮箱</th>
        <th>账户昵称</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <!-- <th>登录账号状态</th>
        <th>密码锁定时间</th> -->
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${user.id}
            </td>
            <td>
                <a href="${ctx}/user/userList/guaranteeBaseInfo?userid=${user.id}">
                        ${user.p2pGuarantee.name}
                </a>
            </td>
            <td title="${user.p2pGuarantee.address }">${fns:abbr(user.p2pGuarantee.address,50)}</td>
            <td>${fns:getDictLabel(user.p2pUserInformation.userFrom, 'user_from', '')}</td>
            <td>${fns:getDictLabel(user.p2pGuarantee.isCertify, 'yes_no', '')}</td>
            <td>${user.p2pGuarantee.businessScope }</td>
            <td><a onclick="modelView('${user.p2pGuarantee.cooperationPlan }')">战略合作协议</a></td>
            <td>${user.p2pGuarantee.webSite }</td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
            <td>${user.loginName}</td>
            <td><fmt:formatDate value="${user.p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${user.loginDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <%-- <td>${fns:getDictLabel(user.p2pUserInformation.lockState, 'lock_state', '')}</td>
                <td><fmt:formatDate value="${user.p2pUserInformation.lockTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
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