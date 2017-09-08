<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>撮合前债项状态进展情况详情页</title>
    <meta name="decorator" content="default"/>
</head>

<body>
<h3>撮合前债项状态进展情况详情页</h3>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>债项名称</th>
        <th colspan="5">${p2pFinancingInformation.finacingName}</th>
    </tr>
    <tr>
        <th>记录号</th>
        <th>进展阶段</th>
        <th>债项状态</th>
        <th>状态时间</th>
        <th>操作人</th>
        <th>处理结果</th>
    </tr>

    <c:forEach items="${page.list}" varStatus="status" var="p2pBeforeMatchDebtState">

        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!-- 进展阶段  -->
            <td>
                    ${fns:getDictLabel(p2pBeforeMatchDebtState.progressStage, 'progress_stage', '')}
            </td>
            <!-- 债项状态  -->
            <td>
                    ${fns:getDictLabel(p2pBeforeMatchDebtState.progressStage, 'progress_stage', '')}
            </td>
            <!-- 状态时间  -->
            <td>
                <fmt:formatDate value="${p2pBeforeMatchDebtState.stateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 操作人  -->
            <td>
                    ${p2pBeforeMatchDebtState.user.name }
            </td>
            <!-- 处理结果  -->
            <td>
                    ${p2pBeforeMatchDebtState.handleResult }
            </td>
        </tr>
    </c:forEach>


    </tbody>
</table>


<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>