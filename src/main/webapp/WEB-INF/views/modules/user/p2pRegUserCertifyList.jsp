<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>注册用户的身份认证状态及材料管理</title>
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
    <li class="active"><a href="${ctx}/user/p2pRegUserCertify/">注册用户的身份认证状态及材料列表</a></li>
    <shiro:hasPermission name="user:p2pRegUserCertify:edit">
        <li><a href="${ctx}/user/p2pRegUserCertify/form">注册用户的身份认证状态及材料添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pRegUserCertify" action="${ctx}/user/p2pRegUserCertify/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>身份认证ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>注册用户ID：</label>
            <sys:treeselect id="user" name="user.id" value="${p2pRegUserCertify.user.id}" labelName="user.name"
                            labelValue="${p2pRegUserCertify.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>真实姓名：</label>
            <form:input path="realName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>身份证号，仅支持大陆身份证：</label>
            <form:input path="idNumber" htmlEscape="false" maxlength="18" class="input-medium"/>
        </li>
        <li><label>自动认证状态，姓名与身份证号是否匹配：</label>
            <form:input path="autoCertifyState" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>手持身份证照片，相对路径：</label>
            <form:input path="idCardInhand" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>身份证正面照片，相对路径：</label>
            <form:input path="idCardFront" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>身份证背面照片，相对路径：</label>
            <form:input path="idCardBack" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>是否为企业法人：</label>
            <form:input path="isEntLegalRep" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>企业委托书扫描件，相对路径：</label>
            <form:input path="powerOfAttorney" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>材料提交时间：</label>
            <input name="submitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>身份认证审核状态：认证通过，认证不通过：</label>
            <form:input path="auditState" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>认证状态审核说明：</label>
            <form:input path="auditExplain" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li><label>审核时间：</label>
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pRegUserCertify.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>审核人员ID：</label>
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
        <th>身份认证ID</th>
        <th>注册用户ID</th>
        <th>真实姓名</th>
        <th>身份证号，仅支持大陆身份证</th>
        <th>自动认证状态，姓名与身份证号是否匹配</th>
        <th>手持身份证照片，相对路径</th>
        <th>身份证正面照片，相对路径</th>
        <th>身份证背面照片，相对路径</th>
        <th>是否为企业法人</th>
        <th>企业委托书扫描件，相对路径</th>
        <th>材料提交时间</th>
        <th>身份认证审核状态：认证通过，认证不通过</th>
        <th>认证状态审核说明</th>
        <th>审核时间</th>
        <th>审核人员ID</th>
        <shiro:hasPermission name="user:p2pRegUserCertify:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pRegUserCertify">
        <tr>
            <td><a href="${ctx}/user/p2pRegUserCertify/form?id=${p2pRegUserCertify.id}">
                    ${p2pRegUserCertify.id}
            </a></td>
            <td>
                    ${p2pRegUserCertify.user.name}
            </td>
            <td>
                    ${p2pRegUserCertify.realName}
            </td>
            <td>
                    ${p2pRegUserCertify.idNumber}
            </td>
            <td>
                    ${p2pRegUserCertify.autoCertifyState}
            </td>
            <td>
                    ${p2pRegUserCertify.idCardInhand}
            </td>
            <td>
                    ${p2pRegUserCertify.idCardFront}
            </td>
            <td>
                    ${p2pRegUserCertify.idCardBack}
            </td>
            <td>
                    ${p2pRegUserCertify.isEntLegalRep}
            </td>
            <td>
                    ${p2pRegUserCertify.powerOfAttorney}
            </td>
            <td>
                <fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRegUserCertify.auditState}
            </td>
            <td>
                    ${p2pRegUserCertify.auditExplain}
            </td>
            <td>
                <fmt:formatDate value="${p2pRegUserCertify.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRegUserCertify.auditPersonId}
            </td>
            <shiro:hasPermission name="user:p2pRegUserCertify:edit">
                <td>
                    <a href="${ctx}/user/p2pRegUserCertify/form?id=${p2pRegUserCertify.id}">修改</a>
                    <a href="${ctx}/user/p2pRegUserCertify/delete?id=${p2pRegUserCertify.id}"
                       onclick="return confirmx('确认要删除该注册用户的身份认证状态及材料吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>