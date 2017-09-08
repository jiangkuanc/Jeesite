<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>个人</title>
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
<%--<ul class="nav nav-tabs">
    <li ><a href="${ctx}/user/userList/enterpriseList">企业</a></li>
    <li><a href="${ctx}/user/userList/agencyList">投资机构</a></li>
    <li class="active"><a href="${ctx}/user/userList/personalList">个人</a></li>
</ul>
--%>
<form:form id="searchForm" modelAttribute="user" action="${ctx}/user/userList/personalList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>个人编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>用户姓名：</label>
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>是否实名：</label>
            <form:select path="p2pRegUserCertify.auditState" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="1">是</form:option>
                <form:option value="2">否</form:option>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
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
        <th>个人编号</th>
        <th>昵称</th>
        <th>用户姓名</th>
        <th>注册协议</th>
        <th>是否绑定银行卡</th>
        <th>注册手机号码</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <!-- <th>登录账号状态</th>
        <th>密码锁定时间</th> -->
        <th>是否实名认证</th>
        <th>是否会员</th>
        <th>用户风险评测分数</th>
        <th>风险偏好</th>
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
                <a href="${ctx}/user/userList/personalBaseInfo?userid=${user.id}">
                        ${user.loginName}
                </a>
            </td>
            <td>${user.name}</td>
            <td><a href="${ctx}/p2p/config/p2pAgreement/agreementShow?agreementType=4">平台服务协议</a></td>
            <td>${fns:getDictLabel(user.p2pUserInformation.isBindBankCard, 'yes_no', '')}</td>
            <td>${user.phone}</td>
            <td><fmt:formatDate value="${user.p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${user.loginDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <%-- <td>${fns:getDictLabel(user.p2pUserInformation.lockState, 'lock_state', '')}</td>
                <td><fmt:formatDate value="${user.p2pUserInformation.lockTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
            <td>
                <c:choose>
                    <c:when test="${user.p2pRegUserCertify.auditState==1}">
                        <a href="${ctx}/user/certifyManage/personalCertify?userid=${user.id}">是</a>
                    </c:when>
                    <c:otherwise>否</c:otherwise>
                </c:choose>
            </td>
            <td><c:choose>
                <c:when test="${user.p2pUserInformation.certificateState == '1040'}">
                    是
                </c:when>
                <c:otherwise>否</c:otherwise>
            </c:choose>
            </td>
            <td>${user.p2pRiskRecord.totalScore}</td>
            <td>暂无</td>
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