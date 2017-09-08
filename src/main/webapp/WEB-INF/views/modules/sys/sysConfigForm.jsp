<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
系统配置信息
@author Summer
@version 2016-12-05
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>系统配置信息管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<%-- <ul class="nav nav-tabs">
    <li><a href="${ctx}/config/sysConfig/">系统配置信息列表</a></li>
    <li class="active"><a href="${ctx}/config/sysConfig/form?id=${sysConfig.id}">系统配置信息<shiro:hasPermission name="config:sysConfig:edit">${not empty sysConfig.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="config:sysConfig:edit">查看</shiro:lacksPermission></a></li>
</ul><br/> --%>
<form:form id="inputForm" modelAttribute="sysConfig" action="${ctx}/sys/sysConfig/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <legend>系统配置信息</legend>
    <c:if test="${not empty sysConfig.sysId }">
        <div class="control-group">
            <label class="control-label">系统编号:</label>
            <div class="controls">
                    ${sysConfig.sysId}
            </div>
        </div>
    </c:if>
    <c:if test="${empty sysConfig.sysId }">
        <div class="control-group">
            <label class="control-label">系统编号:</label>
            <div class="controls">
                <form:input path="sysId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
            </div>
        </div>
    </c:if>
    <div class="control-group">
        <label class="control-label">常量名称:</label>
        <div class="controls">
            <form:input path="constantName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <c:if test="${not empty sysConfig.constantKey }">
        <div class="control-group">
            <label class="control-label">key:</label>
            <div class="controls">
                    ${sysConfig.constantKey}
            </div>
        </div>
    </c:if>
    <c:if test="${empty sysConfig.constantKey }">
        <div class="control-group">
            <label class="control-label">key:</label>
            <div class="controls">
                <form:input path="constantKey" htmlEscape="false" maxlength="64" class="input-xlarge "/>
            </div>
        </div>
    </c:if>
    <div class="control-group">
        <label class="control-label">value:</label>
        <div class="controls">
            <form:input path="constantValue" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="constantComment" htmlEscape="false" rows="1" maxlength="200" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序:</label>
        <div class="controls">
            <form:input path="sort" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>