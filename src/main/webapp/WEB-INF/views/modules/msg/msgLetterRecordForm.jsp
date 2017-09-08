<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>站内信管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#value").focus();
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

        /*  $(document).ready(function() {
         $('#inputForm').submit(function(){
         $('textarea.ckeditor').each(function () {
         var $textarea = $(this);
         $textarea.val(CKEDITOR.instances[$textarea.attr('name')].getData());
         });
         });

         $("#inputForm").validate({
         rules: {
         Content: {
         required: true //表单name为describes的验证规则
         }
         },
         ignore: '',
         errorContainer: "#messageBox",
         errorPlacement: function(error, element) {
         $("#messageBox").text("输入有误，请先更正。");
         if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
         error.appendTo(element.parent().parent());
         } else {
         error.insertAfter(element);
         }
         }
         });
         });  */



        /*  var valdater;
         jQuery(document).ready(function(){
         valdater=jQuery("#inputForm").validate({
         errorPlacement: function(error, element) {
         $("#messageBox").text("输入有误，请先更正。");
         if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
         error.appendTo(element.parent().parent());
         } else {
         error.insertAfter(element);
         }
         },
         meta:"validate",
         rules:{
         Content:{
         required: t	rue
         }
         },
         messages:{
         content:{required:'<s:text name="label.input.message_cn_content" />'}         }
         });
         });
         function doSubmit(){
         CKEDITOR.instances.content.updateElement();
         if(valdater.inputForm()){
         document.inputForm.submit();
         return true;
         }
         return false;
         }  */
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/msg/msgLetterRecord/">站内信列表</a></li>
    <li class="active"><a href="${ctx}/msg/msgLetterRecord/form?id=${msgLetterRecord.id}">站内信添加</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="msgLetterRecord" action="${ctx}/msg/msgLetterRecord/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">发信人：</label>
        <div class="controls">
                <%-- <sys:treeselect id="user" name="user.id" value="${msgLetterRecord.user.id}" labelName="user.name" labelValue="${msgLetterRecord.user.name}"
                    title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true" notAllowSelectParent="true"/> --%>
            <span class="help-inline">${fns:getUser().name}<font color="red">*</font> </span>
            <input type="hidden" name="user.id" value="${fns:getUser().id}"/>
        </div>
    </div>
    </div>
    <div class="control-group">
        <label class="control-label">收信人：</label>
        <div class="controls">
            <sys:treeselect id="recId" name="recId" value="${msgLetterRecord.recId}" labelName="msgLetterRecord.recId"
                            labelValue="${msgLetterRecord.recId}"
                            title="用户" url="/sys/user/treeData2" allowClear="true" notAllowSelectParent="true"
                            checked="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
        <p class="controls">多个收件人用逗号","隔开，超过5人的发送请使用群发功能。</p>
    </div>
    <div class="control-group">
        <label class="control-label">标题：</label>
        <div class="controls">
            <form:input path="title" htmlEscape="false" maxlength="25" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">内容编辑：</label>
        <form:textarea id="Content" path="content" rows="4" maxlength="200"/>
        <sys:ckeditor replace="content" uploadPath="/msg/content"/>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="发送"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>