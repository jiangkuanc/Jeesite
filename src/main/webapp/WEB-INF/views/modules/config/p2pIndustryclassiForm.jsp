<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
行业分类
@author Quincy
@version 2016-11-23
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>行业分类管理</title>
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
    <li><a href="${ctx}/config/p2pIndustryclassi/">行业分类列表</a></li>
    <li class="active"><a
            href="${ctx}/config/p2pIndustryclassi/form?id=${p2pIndustryclassi.id}">行业分类<shiro:hasPermission
            name="config:p2pIndustryclassi:edit">${not empty p2pIndustryclassi.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="config:p2pIndustryclassi:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pIndustryclassi" action="${ctx}/config/p2pIndustryclassi/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">行业编号：</label>
        <div class="controls">
            <form:input path="industrynum" htmlEscape="false" maxlength="36" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">行业名称（中文）：</label>
        <div class="controls">
            <form:input path="classinameCn" htmlEscape="false" maxlength="36" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">行业名称（英文）：</label>
        <div class="controls">
            <form:input path="classinameEn" htmlEscape="false" maxlength="36" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">上级行业编号：</label>
        <div class="controls">
            <form:input path="parentnum" htmlEscape="false" maxlength="36" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <form:input path="sort" htmlEscape="false" maxlength="10" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否为子节点：</label>
        <div class="controls">
            <form:input path="isleaf" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">创建时间：</label>
        <div class="controls">
            <input name="createdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pIndustryclassi.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注：</label>
        <div class="controls">
            <form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="config:p2pIndustryclassi:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                         type="submit"
                                                                         value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>