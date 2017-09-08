<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级信息综合查询信息表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        $(document).ready(function () {
        });
        /***********************查看有无评级报告后下载**************************************/
        function creditReportDown(report) {
            if (report == null || report == '') {
                alert("没有添加评级报告");
                return false
            } else {
                location.href = "${ctx}/financing/download?address=" + report;
            }
        }
    </script>
</head>
<body>
<!-- 	<form id="searchForm" class="breadcrumb form-search" method="post"action="/jeesite/a/financing/p2pFinancingInformation/findAllAccRaiseAndWarning">
		<ul class="ul-form">
			<li><label>债项名称</label>
			<input id="user.p2pUserInformation.bankname" class="input-medium"type="text" maxlength="64" name="finacingName"></li>
			<li><label>代理人名称</label> <input id="id" class="input-medium"
				type="text" maxlength="64" value="" name="nameOf"></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询"></li>
			<li class="clearfix"></li>
		</ul>
	</form> -->

<table id="contentTable"
       class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="sort-column name">序号</th>
        <th class="sort-column name">债项名称</th>
        <th class="sort-column name">代理人名称</th>
        <th class="sort-column name">联系方式</th>
        <th class="sort-column name">预警事宜</th>
        <th class="sort-column name">发布时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="vo" varStatus="status">

        <tr>
            <!-- 序号 -->
            <td>${status.count}</td>
            <!-- 债项名称 -->
            <td>${vo.finacingName}</td>
            <!-- 代理人名称 -->
            <td>${vo.realName}</td>
            <!-- 联系方式 -->
            <td>${vo.phone}</td>
            <!--预警事宜 -->
            <td>募集期倒计时${vo.warndays}天，距满标投资差额<fmt:formatNumber
                    pattern="#,##0.00">${vo.restRaiseMoney}</fmt:formatNumber>元
            </td>
            <!-- 发布时间 -->
            <td><fmt:formatDate value="${vo.publishTime}"
                                pattern="yyyy-MM-dd"/></td>
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