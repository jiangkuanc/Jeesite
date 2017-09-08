<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
广告
@author Chace
@version 2016-12-19
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>广告管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    swal({
                        title: "确认提交吗？",
                        showCancelButton: true,
                        type: "info",
                    }, function (inputValue) {
                        if (inputValue === false) {
                            return false;
                        }
                        loading('正在提交，请稍等...');
                        form.submit();
                    });
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


            $("input[name='isEnableLink']").change(function () {
                if (this.value == 0) {
                    $("#linkAddress").hide();
                    $("#openWay").hide();
                }
                if (this.value == 1) {
                    $("#linkAddress").show();
                    $("#openWay").show();
                }
            });
        });

        $(function () {
            var id = '${p2pAdvertiserment.id}';
            var isEnable = '${p2pAdvertiserment.isEnable}';
            var isEnableLink = '${p2pAdvertiserment.isEnableLink}';
            if (id != "") {
                $("#isEnable").val(isEnable);
                if (isEnableLink == '0') {
                    $("#noo").prop('checked', true);
                    $("#linkAddress").hide();
                    $("#openWay").hide();
                } else if (isEnableLink == '1') {
                    $("#yess").prop('checked', true);
                    $("#linkAddress").show();
                    $("#openWay").show();
                }
            }
        })
        $(function () {
            if ('${p2pAdvertiserment.adPicture}' != '') {
                $('#file-0b').removeClass("required");
            }
        });
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
                        var txt = $("#position").val();
                        if (txt == 1) {
                            /* if(width != 1424 || height != 400){
                             swal("上传图片分辨率错误", "", "error");
                             $("#btnSubmit").attr("disabled",true);
                             }else{
                             $("#btnSubmit").attr("disabled",false);
                             } */
                            $("#btnSubmit").attr("disabled", false);
                        } else {
                            if (width != 140 || height != 300) {
                                swal("上传图片分辨率错误", "", "error");
                                $("#btnSubmit").attr("disabled", true);
                            } else {
                                $("#btnSubmit").attr("disabled", false);
                            }
                        }
                    };
                    image.src = theFile.target.result;
                }
                reader.readAsDataURL(file);
            }
        }
        function cleanFile() {
            document.getElementById("img").innerHTML = '<input id="file-0b" class="file required" type="file" value="" name="file" accept=".jpg,.png,.gif,.jpeg,.bmp" onchange="validate_img(this.files);">';
        }
    </script>
    <style type="text/css">
        .input-xlarge-select {
            width: 284px;
        }
    </style>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/p2p/config/p2pAdvertiserment/">广告列表</a></li>
    <li class="active"><a
            href="${ctx}/p2p/config/p2pAdvertiserment/form?id=${p2pAdvertiserment.id}">广告${not empty p2pAdvertiserment.id?'修改':'添加'}</a>
    </li>
</ul>
<br/>
<form:form id="inputForm" enctype="multipart/form-data" modelAttribute="p2pAdvertiserment"
           action="${ctx}/p2p/config/p2pAdvertiserment/save" method="post" class="form-horizontal">
    <sys:message content="${message}"/>
    <input name="token" type="hidden" value="${token}">
    <input id="isEnable" type="hidden" name="isEnable" value="0"/>
    <input type="hidden" name="id" value="${p2pAdvertiserment.id}"/>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <form:input path="serialNumber" htmlEscape="false" class="input-xlarge required digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所在位置：</label>
        <div class="controls">
            <form:select path="position" htmlEscape="false" maxlength="100" class="input-xlarge-select"
                         onchange="cleanFile();">
                <form:options items="${fns:getDictList('position')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">广告图片：</label>
        <c:if test="${not empty p2pAdvertiserment.adPicture}">
            <img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pAdvertiserment.adPicture}" alt=""
                 style="width:100px;height:100px;">
        </c:if>
        <div class="controls" id="img">
            <input id="file-0b" class="file required" type="file" value="" name="file"
                   accept=".jpg,.png,.gif,.jpeg,.bmp" onchange="validate_img(this.files);">
        </div>
        <div class="controls">
            <label>*说明：1、支持上传5M以下jpg、png、gif、jpeg、bmp格式文件；</label></br>
            <label style="margin-left: 45px">2、分辨率：上部滚动广告栏宽*高=1424*400，左侧广告和右侧广告位宽*高=140*340</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否启用链接：</label>
        <div class="controls">
            <input id="yess" type="radio" name="isEnableLink" value="1" checked>是
            <input id="noo" type="radio" name="isEnableLink" value="0">否
            <!-- 				<form:select path="isEnableLink" htmlEscape="false" maxlength="100" class="input-xlarge-select"> -->
            <!-- 					<form:option selected="selected" value="">---请选择---</form:option> -->
            <!-- 					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/> -->
            <!-- 				</form:select> -->
        </div>
    </div>
    <div id="linkAddress" class="control-group">
        <label class="control-label">链接地址：</label>
        <div class="controls">
            <form:input path="linkAddress" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
        </div>
    </div>
    <div id="openWay" class="control-group">
        <label class="control-label">打开方式：</label>
        <div class="controls">
            <form:select path="openWay" htmlEscape="false" maxlength="64" class="input-xlarge-select">
                <form:options items="${fns:getDictList('open_way')}" itemLabel="label" itemValue="value"
                              htmlEscape="false" class="required"/>
            </form:select>
        </div>
    </div>
    <!-- <div class="control-group"> -->
    <!-- <label class="control-label">是否启用：</label> -->
    <!-- <div class="controls"> -->
    <!-- <form:select path="isEnable" htmlEscape="false" maxlength="100" class="input-xlarge-select"> -->
    <!-- <form:option selected="selected" value="">---请选择---</form:option> -->
    <!-- <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/> -->
    <!-- </form:select> -->
    <!-- </div> -->
    <!-- </div> -->
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>