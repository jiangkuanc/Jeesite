<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
友情链接
@author Chace
@version 2016-12-23
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>友情链接管理</title>
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

        $(function () {
            var id = '${p2pFriendshipLink.id}';
            var linkState = '${p2pFriendshipLink.linkState}';
            if (id != "") {
                $("#linkState").val(linkState);
            }
            if ('${p2pAdvertiserment.adPicture}' != '') {
                $('#file-0b').removeClass("required");
            }
        })
        var width, height;
        function validate_img(files) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var reader = new FileReader();
                var ret = [];
                reader.onload = function (theFile) {
                    var image = new Image();
                    image.onload = function () {
                        width = this.width;
                        height = this.height;
                        var size = Math.round(file.size / 1024);
                        size = size / 1024;
                        if (size > 5) {
                            swal("上传图片不得超过5M", "", "error");
                            $("#btnSubmit").attr("disabled", true);
                        } else {
                            $("#btnSubmit").attr("disabled", false);
                        }
                        ;
                        if (width != 172 || height != 70) {
                            swal("上传图片分辨率错误", "", "error");
                            $("#btnSubmit").attr("disabled", true);
                        } else {
                            $("#btnSubmit").attr("disabled", false);
                        }
                    };
                    image.src = theFile.target.result;
                }
                reader.readAsDataURL(file);
            }
        }

        $(function () {
            if ('${p2pFriendshipLink.linkIcon}' != '') {
                $('#file-0b').removeClass("required");
            }
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/p2p/config/p2pFriendshipLink/">友情链接列表</a></li>
    <li class="active"><a
            href="${ctx}/p2p/config/p2pFriendshipLink/form?id=${p2pFriendshipLink.id}">友情链接<shiro:hasPermission
            name="p2p:config:p2pFriendshipLink:edit">${not empty p2pFriendshipLink.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:config:p2pFriendshipLink:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pFriendshipLink" action="${ctx}/p2p/config/p2pFriendshipLink/save"
           method="post" class="form-horizontal" enctype="multipart/form-data">
    <sys:message content="${message}"/>
    <input name="token" type="hidden" value="${token}">
    <input id="linkState" type="hidden" name="linkState" value="0"/>
    <input type="hidden" name="id" value="${p2pFriendshipLink.id}"/>
    <div class="control-group">
        <label class="control-label">友情链接单位：</label>
        <div class="controls">
            <form:input path="linkUnit" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">友情链接图片：</label>
        <c:if test="${not empty p2pFriendshipLink.linkIcon}">
            <img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pFriendshipLink.linkIcon}" alt=""
                 style="width:100px;height:100px;">
        </c:if>
        <div class="controls">
            <input id="file-0b" class="file required" type="file" value="" name="file"
                   accept=".jpg,.png,.gif,.jpeg,.bmp" onchange="validate_img(this.files);">
        </div>
        <div class="controls">
            <label>*说明：1、支持上传5M以下jpg、png、gif、jpeg、bmp格式文件；</label></br>
            <label style="margin-left: 45px">2、分辨率：宽*高=172*70</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">友情链接地址：</label>
        <div class="controls">
            <form:input path="linkAddress" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <form:input path="sort" htmlEscape="false" class="input-xlarge required digits"/>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>