<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>站内信管理</title>
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
    <li><a href="${ctx}/msg/msgSmsRecord/">短信发送信息列表</a></li>
    <li class="active"><a href="${ctx}/msg/msgSmsRecord/form?id=${msgSmsRecord.id}">短信发送记录<shiro:hasPermission
            name="msg:msgSmsRecord:edit">${not empty msgSmsRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="msg:msgSmsRecord:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="msgSmsRecord" action="${ctx}/msg/msgSmsRecord/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">发件人：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${msgSmsRecord.user.id}" labelName="user.name"
                            labelValue="${msgSmsRecord.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true"
                            notAllowSelectParent="true"/>
            <span class="help-inline">${fns:getUser().name}<font color="red">*</font> </span>
            <input type="hidden" name="user.id" value="${fns:getUser().id}"/>
        </div>
    </div>
    </div>
    <div class="control-group">
        <label class="control-label">收件人：</label>
        <div class="controls">
            <sys:treeselect id="recId" name="recId" value="${msgSmsRecord.recId}" labelName="msgSmsRecord.recId"
                            labelValue="${msgSmsRecord.recId}"
                            title="用户" url="/sys/user/treeData2" cssClass="required" allowClear="true"
                            notAllowSelectParent="true" checked="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
        <p class="controls">多个收件人用逗号","隔开，超过5人的发送请使用群发功能。</p>
    </div>
    <%-- <div class="control-group">
      <label class="control-label">内容编辑：</label>
      <form:textarea id="smsContent" path="content" rows="4" maxlength="200" class="input-xxlarge"/>
          <sys:ckeditor replace="content" uploadPath="/msg/content"/>
  </div>  --%>
    <div class="form-actions">
        <shiro:hasPermission name="msg:msgSmsRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                                 value="发送"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>