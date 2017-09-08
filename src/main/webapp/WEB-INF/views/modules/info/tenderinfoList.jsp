<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="infTender" action="${ctx}/info/infTender/findTenderinfoList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>项目名称：</label><form:input path="projectName" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
    <label>状态：</label><form:radiobuttons onclick="$('#searchForm').submit();" path="infoStage"
                                         items="${fns:getDictList('info_stage')}" itemLabel="label" itemValue="value"
                                         htmlEscape="false"/>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed tree_table">
    <thead>
    <tr>
        <th>序号</th>
        <th>项目名称</th>
        <th>发布时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="vo">

        <tr>
            <!-- 序号 -->
            <td font-size:5pt>
                    ${status.count }
            </td>
            <!-- 项目名称 -->
            <td font-size:5pt>
                    ${vo.projectName}
            </td>
            <!-- 发布时间-->
            <td font-size:5pt>
                <fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd  HH:mm:ss"/>

                </a>
            </td>
            <!-- 操作 -->
            <td font-size:5pt
            ">
            <c:choose>
                <c:when test="${vo.infoStage eq  '2'}">
                    <a href="${ctx}/info/infTender/toOneTenderinfoPage?id=${vo.id}">审核</a>
                </c:when>
                <c:otherwise>
                    查看
                </c:otherwise>
            </c:choose>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>

</html>