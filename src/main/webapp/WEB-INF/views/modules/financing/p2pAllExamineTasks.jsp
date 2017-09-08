<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级信息综合查询信息表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        $(document).ready(function () {
        });
    </script>
</head>
<body>
<form id="searchForm" class="breadcrumb form-search" method="post"
      action="${ctx}/financing/p2pFinancingInformation/findAllAccFinaNameAndID">
    <ul class="ul-form">
        <li><label>债项名称</label>
            <input id="user.p2pUserInformation.bankname" class="input-medium" type="text" maxlength="64"
                   name="finacingName"></li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary"
                                type="submit" value="查询"></li>
        <li class="clearfix"></li>

    </ul>
</form>
<table id="contentTable"
       class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="sort-column name">序号</th>
        <th class="sort-column name">债项名称</th>
        <th class="sort-column name">审核</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="vo" varStatus="status">

        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!-- 债项名称 -->
            <td>${vo.finacingName}</td>
            <!-- 审核 -->
            <td><a href="${ctx}/financing/getEnterpriseBaseInfo?userId=${vo.applicantsId}&fiId=${vo.id}&flag=2">审核</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" onclick="history.go(-1)" value="返 回">
</div>

</body>
</html>