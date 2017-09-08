<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
协议表
@author Zeus
@version 2016-11-21
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>协议添加</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                rules: {
                    agreementMainTitle: {
                        required: true,
                        rangelength: [3, 20]
                    },
                    agreementSubTitle: {
                        rangelength: [3, 20]
                    }
                },
                messages: {
                    agreementMainTitle: {
                        required: "协议主标题不能为空",
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    agreementSubTitle: {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
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


    </script>


</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/p2p/config/p2pAgreement/">协议管理</a></li>
    <li class="active"><a
            href="${ctx}/p2p/config/p2pAgreement/form?id=${p2pAgreement.id}">协议${not empty p2pAgreement.id?'修改':'添加'}</a>
    </li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pAgreement" action="${ctx}/p2p/config/p2pAgreement/save" method="post"
           class="form-horizontal">
<form:hidden path="id"/>
<sys:message content="${message}"/>
<div class="control-group">
    <label class="control-label">主标题：</label>
    <div class="controls">
        <form:input path="agreementMainTitle" htmlEscape="false" maxlength="64"
                    class="input-xxlarge measure-input required "/>
    </div>
</div>
<div class="control-group">
    <label class="control-label">副标题：</label>
    <div class="controls">
        <form:input path="agreementSubTitle" htmlEscape="false" maxlength="64" class="input-xxlarge "/>
    </div>
</div>
<div class="control-group">
    <label class="control-label">协议类别：</label>
    <div class="controls">
        <form:select path="agreementType" class="input-medium-select">
            <form:options items="${fns:getDictList('agreement_type')}" itemLabel="label" itemValue="value"
                          htmlEscape="false"/>
        </form:select>
    </div>
</div>
<div class="control-group">
    <label class="control-label">协议内容：</label>
    <div class="controls">
        <!-- 加载编辑器的容器 -->
        <script id="editor" name="agreementContent" type="text/plain" style="width:1024px;height:500px;">
        </script>
        </
        div >

        < / div >
        < div
        class
        = "control-group" >
            < label
        class
        = "control-label" > 备注信息
        ：</
        label >
        < div
        class
        = "controls" >
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
            < / div >
            < / div >
            < div
        class
        = "form-actions" >
            < input
        id = "btnSubmit"
        class
        = "btn btn-primary"
        type = "submit"
        value = "保 存" / >
            < input
        id = "btnCancel"
        class
        = "btn"
        type = "button"
        value = "返 回"
        onclick = "history.go(-1)" / >
            < / div >
            </form:form>
            <!-- 配置文件 -->
            < script
        type = "text/javascript"
        src = "${ctxStatic}/ueditor/ueditor.config.js" ></script>
        <!-- 编辑器源码文件 -->
        <script type="text/javascript" src="${ctxStatic}/ueditor/ueditor.all.js"></script>
        <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
        <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
        <script type="text/javascript" charset="utf-8" src="${ctxStatic}/ueditor/lang/zh-cn/zh-cn.js"></script>
        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var editor = UE.getEditor('editor', {
                //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
                toolbars: [['fullscreen', 'source', '|', 'undo', 'redo', '|',
                    'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                    'directionalityltr', 'directionalityrtl', 'indent', '|',
                    'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                    'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                    'emotion', 'map', 'insertframe', 'insertcode', 'pagebreak', 'template', 'background', '|',
                    'horizontal', 'date', 'time', 'spechars', '|',
                    'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                    'print', 'preview', 'searchreplace', 'drafts', 'help']],
                enableAutoSave: false,
                maximumWords: 60000
                //更多其他参数，请参考ueditor.config.js中的配置项
            });
            editor.ready(function () {
                //设置编辑器的内容
                var agreementContent = '${p2pAgreement.agreementContent}';
                editor.setContent(agreementContent);

            });

        </script>
</body>

</html>