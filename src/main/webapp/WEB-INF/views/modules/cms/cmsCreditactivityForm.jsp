<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
生成用户报名信息
@author summer
@version 2016-11-15
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>用户报名信息管理</title>
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
    <li><a href="${ctx}/cms/cmsCreditactivity/">用户报名信息列表</a></li>
    <li class="active"><a href="${ctx}/cms/cmsCreditactivity/form?id=${cmsCreditactivity.id}">用户报名信息<shiro:hasPermission name="cms:cmsCreditactivity:edit">${not empty cmsCreditactivity.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsCreditactivity:edit">查看</shiro:lacksPermission></a></li>
</ul><br/> --%>
<form:form id="inputForm" modelAttribute="cmsCreditactivity" action="${ctx}/cms/cmsCreditactivity/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">教育活动编号：</label>
        <div class="controls">
            <form:input path="articleId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户编号：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${cmsCreditactivity.user.id}" labelName="user.name"
                            labelValue="${cmsCreditactivity.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户真实姓名：</label>
        <div class="controls">
            <form:input path="realName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">手机号：</label>
        <div class="controls">
            <form:input path="tel" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">报名时间：</label>
        <div class="controls">
            <input name="registrationTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${cmsCreditactivity.registrationTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>