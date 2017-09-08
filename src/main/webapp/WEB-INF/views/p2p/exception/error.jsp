<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>异常</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(function () {
            console.log('${ex}');
        });
    </script>
</head>

<body>
未知错误<br>
${ex}
</body>
</html>
