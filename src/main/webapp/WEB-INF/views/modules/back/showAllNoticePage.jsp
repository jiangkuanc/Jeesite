<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>区域管理</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
</head>
<body>
<table id="treeTableTpl" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="sort-column name">代办消息类型</th>
        <th class="sort-column name">消息内容</th>
        <th class="sort-column name">时间</th>
    </tr>
    </thead>
    <tbody id="itemContainer">
    <c:if test="${not empty p2pRegUserCertify}">
        <c:forEach items="${p2pRegUserCertify}" var="vo">
            <tr>
                <td>实名认证待审</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.submitTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty p2pFullscaleNameAndTime}">
        <c:forEach items="${p2pFullscaleNameAndTime}" var="vo">
            <tr>
                <td>满标确标审核</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty p2pCreditNameAndTime}">
        <c:forEach items="${p2pCreditNameAndTime}" var="vo">
            <tr>
                <td>评级审核</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty p2pFlowNameAndTime}">
        <c:forEach items="${p2pFlowNameAndTime}" var="vo">
            <tr>
                <td>流标审核</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty p2pReleaseNameAndTime}">
        <c:forEach items="${p2pReleaseNameAndTime}" var="vo">
            <tr>
                <td>发布债项审核</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.commitTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty overdueNorepayNameAndTime}">
        <c:forEach items="${overdueNorepayNameAndTime}" var="vo">
            <tr>
                <td>逾期未还</td>
                <td>${vo.enterpriseName}公司材料需要审核</td>
                <td><fmt:formatDate value="${vo.givingOutTime}" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </c:if>

    </tbody>
</table>
<div class="holder"></div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
<script id="treeTableTpl">
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id, //显示数据所在的块的ID
                first: '首页',
                last: '尾页',
                previous: '上页',
                next: '下页',
                perPage: 10, //每页显示数据为多少行
                startPage: 1, //起始页
                startRange: 2, //开始页码为2个
                midRange: 6, //最多显示几个页码页码,其余用..代替e
                ndRange: 10, //结束页码为2个
                keyBrowse: true,
                delay: 20 //分页时动画持续时间，0表示无动画
            });
        }

        fenye("div.holder", "itemContainer")
    });
</script>
</body>
</html>