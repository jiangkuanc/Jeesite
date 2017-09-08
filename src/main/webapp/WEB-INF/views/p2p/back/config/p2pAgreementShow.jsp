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
    <title>协议查看</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#agreementContent").html('${p2pAgreement.agreementContent}');
        });
    </script>


</head>
<body>
<div class="container">
    <div style="text-align: center;"><h3 style="margin: 10px 0px 0px 0px">${p2pAgreement.agreementMainTitle }</h3></div>
    <div style="text-align: center;"><h4 style="margin: 0px 0px 10px 0px">${p2pAgreement.agreementSubTitle }</h4></div>
    <input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
    <div id="agreementContent">
        ${p2pAgreement.agreementContent}
    </div>
</div>
</body>
</html>