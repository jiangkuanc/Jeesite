<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>产品详情管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");

            //传真
            jQuery.validator.addMethod("chuanzhen", function (value, element) {
                var tel = /^(\d{3,4}-)?\d{7,8}$/;
                return this.optional(element) || (tel.test(value));
            }, "格式为xxx-1234567或xxx-12345678或xxxx-1234567或xxxx-12345678");

            $("#inputForm").validate({
                rules: {
                    productContent: "required",
                    phone: {
                        required: true,
                        minlength: 11,
                        isMobile: true
                    },
                    fax: {
                        required: true,
                        chuanzhen: true
                    },

                    mailbox: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    productContent: "不能为空",
                    phone: {
                        required: "手机号码不能为空",
                        minlength: "确认手机不能小于11个字符",
                        isMobile: "请正确填写手机号码"
                    },
                    fax: {
                        required: "传真不能为空",
                        chuanzhen: "请填写正确的传真"
                    },
                    mailbox: {
                        required: "不能为空",
                        email: "邮箱格式不正确"
                    }
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
    <li><a href="${ctx}/cms/cmsReport/">产品报告信息列表</a></li>
    <li class="active"><a href="${ctx}/cms/cmsReport/form?id=${cmsReport.id}">产品报告信息<shiro:hasPermission
            name="cms:cmsReport:edit">${not empty cmsReport.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsReport:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsReport" action="${ctx}/cms/cmsReport/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">信息产品名称：</label>
        <div class="controls">
            <select name="articleId" class="input-xlarge ">
                <c:forEach items="${articleList}" var="vo">
                    <option value="${vo.id}">${vo.title}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">信息产品简介：</label>
        <div class="controls">
            <form:textarea path="productContent" htmlEscape="false" rows="4" maxlength="10000" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">产品展示：</label>
        <div class="controls">
            <form:hidden id="productDisplay" path="productDisplay" htmlEscape="false" maxlength="1000"
                         class="input-xlarge"/>
            <sys:ckfinder input="productDisplay" type="files" uploadPath="/cms/cmsMegaProjectIntroduce1"
                          selectMultiple="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">电话：</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">传真：</label>
        <div class="controls">
            <form:input path="fax" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">邮箱：</label>
        <div class="controls">
            <form:input path="mailbox" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsReport:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                              value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>