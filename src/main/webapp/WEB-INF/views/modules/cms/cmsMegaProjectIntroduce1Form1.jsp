<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>大型项目详情管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");

            $("#inputForm").validate({
                rules: {
                    projectName: "required",
                    projectInvestment: "required",
                    projectContractor: "required",
                    projectSchedule: "required",
                    projectLocated: "required",
                    contacts: "required",
                    duty: "required",
                    phone: {
                        required: true,
                        minlength: 11,
                        isMobile: true
                    },
                    industryInvolved: "required",
                    projectEnterprise: "required",
                    workingRange: "required",
                    qualificationRequirement: "required",
                    requirement: "required",
                    fileAccess: "required",
                    fileSubmit: "required",
                    cooperationOpportunities: "required"
                },
                messages: {
                    projectName: "不能为空",
                    projectInvestment: "不能为空",
                    projectContractor: "不能为空",
                    projectSchedule: "不能为空",
                    projectLocated: "不能为空",
                    contacts: "不能为空",
                    duty: "不能为空",
                    phone: {
                        required: "手机号码不能为空",
                        minlength: "确认手机不能小于11个字符",
                        isMobile: "请正确填写手机号码"
                    },
                    industryInvolved: "不能为空",
                    projectEnterprise: "不能为空",
                    workingRange: "不能为空",
                    qualificationRequirement: "不能为空",
                    requirement: "不能为空",
                    fileAccess: "不能为空",
                    fileSubmit: "不能为空",
                    cooperationOpportunities: "不能为空"
                }
            });

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
    <li><a href="${ctx}/cms/cmsMegaProjectIntroduce1/">大型项目详情列表</a></li>
    <li class="active"><a
            href="${ctx}/cms/cmsMegaProjectIntroduce1/form?id=${cmsMegaProjectIntroduce1.id}">大型项目详情<shiro:hasPermission
            name="cms:cmsMegaProjectIntroduce1:edit">${not empty cmsMegaProjectIntroduce1.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsMegaProjectIntroduce1:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsMegaProjectIntroduce1" action="${ctx}/cms/cmsMegaProjectIntroduce1/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">项目名称：</label>
        <div class="controls">
            <form:input type="text" path="projectName" htmlEscape="false" maxlength="64" class="input-xlarge "
                        readonly="readonly "/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">项目投资方：</label>
        <div class="controls">
            <form:input path="projectInvestment" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目承建方：</label>
        <div class="controls">
            <form:input path="projectContractor" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目进度：</label>
        <div class="controls">
            <form:input path="projectSchedule" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目所在地：</label>
        <div class="controls">
            <form:input path="projectLocated" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contacts" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">职务：</label>
        <div class="controls">
            <form:input path="duty" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="64" class="input-xlarge"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属行业：</label>
        <div class="controls">
            <form:input path="industryInvolved" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">有效期至：</label>
        <div class="controls">
            <input name="validity" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${cmsMegaProjectIntroduce1.validity}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目简介：</label>
        <div class="controls">
            <form:textarea path="projectEnterprise" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">工作范围：</label>
        <div class="controls">
            <form:textarea path="workingRange" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">资质要求：</label>
        <div class="controls">
            <form:textarea path="qualificationRequirement" htmlEscape="false" rows="4" maxlength="1000"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">最低设计与咨询经验要求：</label>
        <div class="controls">
            <form:textarea path="requirement" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">招标文件获取：</label>
        <div class="controls">
            <form:textarea path="fileAccess" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">文件提交：</label>
        <div class="controls">
            <form:textarea path="fileSubmit" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目展示：</label>
        <div class="controls">
            <form:hidden id="projectDisplay" path="projectDisplay" htmlEscape="false" maxlength="1000"
                         class="input-xlarge"/>
            <sys:ckfinder input="projectDisplay" type="files" uploadPath="/cms/cmsMegaProjectIntroduce1"
                          selectMultiple="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">合作机会：</label>
        <div class="controls">
            <form:textarea path="cooperationOpportunities" htmlEscape="false" rows="4" maxlength="1000"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsMegaProjectIntroduce1:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                             type="submit"
                                                                             value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>