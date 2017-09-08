<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户招商管理</title>
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
<ul class="nav nav-tabs">
    <li><a href="${ctx}/info/infTender/">用户招商列表</a></li>
    <li class="active"><a href="${ctx}/info/infTender/form?id=${infTender.id}">用户招商<shiro:hasPermission
            name="info:infTender:edit">${not empty infTender.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="info:infTender:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="infTender" action="${ctx}/info/infTender/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">项目名称：</label>
        <div class="controls">
            <form:input path="projectName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">有效期至：</label>
        <div class="controls">
            <input name="termOfValidity" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${infTender.termOfValidity}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目所在地：</label>
        <div class="controls">
            <form:input path="projectLocation" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资方：</label>
        <div class="controls">
            <form:input path="investmentSide" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">承建方：</label>
        <div class="controls">
            <form:input path="constructionSide" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">行业：</label>
        <div class="controls">
            <form:input path="industry" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目进度：</label>
        <div class="controls">
            <form:input path="envyProgress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">承建方logo：</label>
        <div class="controls">
            <form:input path="constructionSiteLogo" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contactsPerson" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">职位：</label>
        <div class="controls">
            <form:input path="positionPerson" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="telphone" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">招标内容：</label>
        <div class="controls">
            <form:input path="biddingContent" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">发布时间：</label>
        <div class="controls">
            <input name="publishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${infTender.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="info:infTender:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                               value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>