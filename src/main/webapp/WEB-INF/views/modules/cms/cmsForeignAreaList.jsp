<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>国外区域管理</title>
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
<sys:message content="${message}"/>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/cms/cmsForeignArea/">国外区域列表aaaa</a></li>
    <li><a href="${ctx}/cms/cmsForeignArea/form">国外区域添加</a></li>
</ul>

<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>区域名称</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsForeignArea">
        <tr>
            <td><a href="${ctx}/cms/cmsForeignArea/form?id=${cmsForeignArea.id}">
                    ${cmsForeignArea.areaname}
            </a></td>
            <td>
                <a href="${ctx}/cms/cmsForeignArea/form?id=${cmsForeignArea.id}">修改</a>
                <a href="${ctx}/cms/cmsForeignArea/delete?id=${cmsForeignArea.id}"
                   onclick="return confirmx('确认要删除该国外区域吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>