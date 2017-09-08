<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/My97DatePicker/calendar.js"></script>
    <script src="${ctxStatic }/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function add() {
            $("#inputForm").submit();
        }
    </script>
</head>

<body>
<table width="901" border="1">
    <tbody>
    <tr>
        <td colspan="6" align="center"><h3>文章发布页——初审</h3></td>
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
    </c:forEach>
    <tr>
        <td colspan="6" align="center">初审意见</td>
    </tr>
    </tbody>
</table>
<form:form id="inputForm" modelAttribute="article" action="${ctx}/cms/article/commit" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <table width="901" border="1">
        <tr>
            <td>审核意见</td>
            <td colspan="2">
                <select id="auditOpinion" name="auditOpinion">
                    <option>同意</option>
                    <option>拒绝</option>
                </select>
            </td>
            <td>不通过原因</td>
            <td colspan="2"><form:textarea path="nthroughReason" htmlEscape="false" rows="1" maxlength="200"
                                           class="input-xxlarge"/>
                </form></td>
        </tr>
        <tr>
            <td>审核时间</td>
            <td colspan="2">
                <div class="control-group">
                    <div class="controls">
                        <fmt:formatDate value="${article.auditTime}" type="both"/>
                    </div>
                </div>
            </td>
            <td>审核人</td>
            <td colspan="2"><form:input path="auditor" htmlEscape="false" maxlength="200" class="input-xlarge"
                                        value="${fns:getUser().name}" readyOnly="true"/></td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <div class="form-actions">
                    <shiro:hasPermission name="cms:article:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                        onclick="add();" type="submit"
                                                                        value="保 存"/>&nbsp;&nbsp;&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
                </div>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>