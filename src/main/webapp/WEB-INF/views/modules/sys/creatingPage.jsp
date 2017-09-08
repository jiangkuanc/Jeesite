<%@ page contentType="text/html;charset=UTF-8" %>
<%--
	开发中提示页面
	@author MIET
	@version 2016-12-05
	版权所有: 大公信用软件有限公司
	http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>开发中...</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        var i = 0;
        var strSet = ['', '.', '..', '...', '... .', '... ..', '... ...']

        window.onload = function () {
            setInterval(
                function () {
                    setInnerHTML();
                },
                500
            );
        }

        function setInnerHTML() {
            i++;
            var myId = document.getElementById('myId');
            myId.innerHTML = '此功能开发中' + strSet[i % 7];
        }
    </script>
</head>
<body>
<br><br><br>
<h5>
    <center>
        <div id="myId">此功能开发中</div>
    </center>
</h5>
</body>
</html>