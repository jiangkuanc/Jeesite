<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资风险问卷管理</title>
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
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList">投资风险问卷管理</a></li>

    <li><a href="${ctx}/p2p/risk/p2pRiskPaper/form">投资风险问卷添加</a></li>

</ul>
<form:form id="searchForm" modelAttribute="p2pRiskPaper" action="${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
</form:form>
<sys:message content="${message}"/>
<c:if test="${QTMessage!=null && QTMessage!='' }">
    <div class="alert alert-success hide" style="display:block">
        <button data-dismiss="alert" class="close">x</button>
            ${QTMessage}
    </div>
</c:if>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>问卷标题</th>
        <th>编制人</th>
        <th>编制时间</th>
        <th>版本号</th>
        <th>问卷状态</th>
        <th>审核人</th>
        <th>审核时间</th>
        <th>发布人</th>
        <th>发布时间</th>
        <th>问卷说明</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pRiskPaper">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!--问卷标题-->
            <td>${p2pRiskPaper.paperTitle}</td>
            <!--编制人-->
            <td>${p2pRiskPaper.user.id}</td>
            <!--编制时间-->
            <td><fmt:formatDate value="${p2pRiskPaper.drawTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--版本号-->
            <td>${p2pRiskPaper.paperVersion}</td>
            <!--问卷状态-->
            <td>${fns:getDictLabel(p2pRiskPaper.paperState,'paper_state','')}</td>

            <!--审核人-->
            <td>${p2pRiskPaper.auditId}</td>
            <!--审核时间-->
            <td><fmt:formatDate value="${p2pRiskPaper.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--发布人-->
            <td>${p2pRiskPaper.publishId}</td>
            <!--发布时间-->
            <td><fmt:formatDate value="${p2pRiskPaper.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--问卷说明-->
            <td>${p2pRiskPaper.paperExplain}</td>
            <!--操作-->
            <td>
                <a href="${ctx}/p2p/risk/p2pRiskPaper/form?paperId=${p2pRiskPaper.id}&id=${p2pRiskPaper.id}&paperState=${p2pRiskPaper.paperState}">
                    <c:if test="${p2pRiskPaper.paperState =='1'}">编辑</c:if>
                    <c:if test="${p2pRiskPaper.paperState =='2'}">审核</c:if>
                    <c:if test="${p2pRiskPaper.paperState =='3'}">发布</c:if>
                    <c:if test="${p2pRiskPaper.paperState =='4'}">查看</c:if>
                    <a href="${ctx}/p2p/risk/p2pRiskPaper/delete?id=${p2pRiskPaper.id}"
                       onclick="return confirmx('确认要删除？', this.href)">删除</a>
                </a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>


<div class="pagination">${page}</div>


</body>
</html>