<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        function add() {
            $("#inputForm").submit();
            alert("文章发布成功");
        }
    </script>
</head>

<body>
<sys:message content="${message}"/>
<table width="901" border="1">
    <tbody>
    <tr>
        <td colspan="6" align="center"><h3>文章发布审核查看页——复审</h3></td>
    </tr>
    <c:forEach items="${page.list}" var="article">
        <tr>
            <td width="94">栏目：</td>
            <td width="196"><a href="javascript:"
                               onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}
            </td>
            <td width="93">文章标题：</td>
            <td width="202">${fns:abbr(article.title,40)}</td>
            <td width="90">作者：</td>
            <td width="186">${article.speaker }</td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td><fmt:formatDate value="${article.createDate}" type="both"/></td>
            <td>来源：</td>
            <td>${article.articleData.copyfrom }</td>
            <td>关键字：</td>
            <td>${article.keywords}</td>
        </tr>
        <tr>
            <td colspan="6" align="center">文章摘要</td>
        </tr>
        <tr>
            <td height="200" colspan="6">${article.description}</td>
        </tr>
        <tr>
            <td colspan="6" align="center">文章内容</td>
        </tr>
        <tr>
            <td height="1000" colspan="6">${article.articleData.content}</td>
        </tr>
        <tr>
            <td colspan="6" align="center">复审意见</td>
        </tr>
        <tr>
            <td>审核意见:</td>
            <td colspan="2">${article.reviewOpinions }</td>
            <td>不通过原因:</td>
            <td colspan="2">${article.nthroughReason }</td>
        </tr>
        <tr>
            <td>审核时间:</td>
            <td colspan="2"><fmt:formatDate value="${article.reviewTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>审核人:</td>
            <td colspan="2">${article.reauditor }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<form:form id="inputForm" modelAttribute="article" action="${ctx}/cms/article/publish" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <table width="901" border="1">
        <tr>
            <td colspan="6" align="center">
                <div class="form-actions">
                    <shiro:hasPermission name="cms:article:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                        onclick="add();" type="submit"
                                                                        value="发布"/>&nbsp;&nbsp;&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
                </div>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>