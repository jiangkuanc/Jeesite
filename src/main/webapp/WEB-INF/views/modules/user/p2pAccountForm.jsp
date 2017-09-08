<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
账户表
@author Joe
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>账户表管理</title>
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
<!-- 右部分部分区域,绑定银行卡 -->
<div id="confirmCertificationInfo">
    <span class="confirmBg"></span>
    <span>已提交成功 ,我们会在1个工作日内进行审核</span><br/>
    <span>请耐心等待</span><br/>
    <div>
        <a href="${ctx}/user/p2pAccount/list" role="button">确定</a>
    </div>

</div>
</body>
</html>