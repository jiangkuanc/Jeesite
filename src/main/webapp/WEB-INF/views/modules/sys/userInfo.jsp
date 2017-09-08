<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>个人信息</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic }/myback/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic }/myback/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic }/myback/fileinput_locale_zh.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#file").fileinput({
                language: 'zh', //设置语言
                showUpload: true, //是否显示上传按钮
                showRemove: false,
                showCaption: true,//是否显示标题
                dropZoneEnabled: false,
                showPreview: false,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                uploadUrl: '${ctx}/sys/user/uploadPhoto',
                allowedFileExtensions: ['png', 'jpg', 'gif'],
                overwriteInitial: false,
                maxFileSize: 10240,
                maxFileCount: 1,
                slugCallback: function (filename) {
                    return filename.replace('(', '_').replace(']', '_');
                }
            }).on("fileuploaded", function (event, data) {
// 				alert(1);
                location.reload();
//     			document.getElementById('uploadId').disabled = true;
//     			document.getElementById('selectId').disabled = true;
            });


            $("#inputForm").validate({
                rules: {
                    phone: {
                        required: true,
                        isPhone: true
                    },
                    mobile: {
                        required: true,
                        telphone: true
                    }
                },
                messages: {
                    phone: {
                        required: "不能为空",
                        isPhone: "请输入有效电话号码"
                    },
                    mobile: {
                        required: "不能为空",
                        telphone: "请输入有效手机号码"
                    }
                },

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

        // 电话号码验证
        jQuery.validator.addMethod("isPhone", function (value, element) {
            var tel = /^0\d{2,3}-?\d{7,9}$/; //电话号码格式010-12345678
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的电话号码");
        // 电话号码验证
        jQuery.validator.addMethod("telphone", function (value, element) {
            var tel = /^1[3|4|5|7|8]\d{9}$/; //电话号码格式010-12345678
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的手机号码");

        $("input[name='file']").fileinput({
            'allowedFileExtensions': ['jpg', 'png', 'gif', 'jpeg', 'bmp'],
            showCaption: false,
            maxFileSize: 100
        });
        function refresh() {
            window.location.href = '${ctx}';
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
    <li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/info" method="post" class="form-horizontal"><%--
		<form:hidden path="email" htmlEscape="false" maxlength="255" class="input-xlarge"/>
		<sys:ckfinder input="email" type="files" uploadPath="/mytask" selectMultiple="false"/> --%>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">头像:</label>
        <div class="controls">
            <div style="border: solid 1px #ccc;width: 100px;height: 100px;">
                <img alt="找不到图片" style="width: 100px;height: 100px;" src="${user.photo}">
            </div>
            <div>
                <input type="file" name="file" id="file" data-overwrite-initial="false" data-min-file-count="1"/>
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">归属公司:</label>
        <div class="controls">
            <label class="lbl">${user.company.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">归属部门:</label>
        <div class="controls">
            <label class="lbl">${user.office.name}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">姓名:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">邮箱:</label>
        <div class="controls">
            <form:input path="email" htmlEscape="false" maxlength="50" class="email"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">电话:</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">手机:</label>
        <div class="controls">
            <form:input path="mobile" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户类型:</label>
        <div class="controls">
            <label class="lbl">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户角色:</label>
        <div class="controls">
            <label class="lbl">${user.roleNames}</label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">上次登录:</label>
        <div class="controls">
            <label class="lbl">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate
                    value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
    </div>
</form:form>
</body>
</html>