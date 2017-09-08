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

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<div class="certifyInfo">
    <div>
        <table class="table">
            <tr>
                <td>姓名:</td>
                <td>${name}</td>
            </tr>
            <tr>
                <td>我的身份证号：</td>
                <td>${idCardNo}</td>
            </tr>
            <tr>
                <td>状态:</td>
                <td>${state}</td>
            </tr>
            <tr>
                <td>手持身份证照片:</td>
                <td>
                    <img alt="" src="${handinPic}">
                </td>
            </tr>
            <tr>
                <td>身份证正面照片:</td>
                <td><img alt="" src="${inPic}"></td>
            </tr>
            <tr>
                <td>身份证背面照片:</td>
                <td><img alt="" src="${backinPic}"></td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>