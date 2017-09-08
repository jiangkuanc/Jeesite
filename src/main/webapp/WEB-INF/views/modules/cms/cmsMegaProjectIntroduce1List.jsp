<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>大型项目详情管理</title>
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
    <style type="text/css">
        table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        table {
            table-layout: fixed;
        }
    </style>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/cms/cmsMegaProjectIntroduce1/">大型项目详情列表</a></li>
    <shiro:hasPermission name="cms:cmsMegaProjectIntroduce1:edit">
        <li><a href="${ctx}/cms/cmsMegaProjectIntroduce1/selectProjectList">大型项目详情添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsMegaProjectIntroduce1" action="${ctx}/cms/cmsMegaProjectIntroduce1/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>项目名称：</label>
            <form:input path="projectName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>

        <li><label>项目所在地：</label>
            <form:input path="projectLocated" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>项目名称</th>
        <th>项目投资方</th>
        <th>项目承建方</th>
        <th>项目进度</th>
        <th>项目所在地</th>
        <th>联系人</th>
        <th>职务</th>
        <th>联系电话</th>
        <th>所属行业</th>
        <!-- 				<th>有效期至</th> -->
        <!-- 				<th>项目简介</th> -->
        <!-- 				<th>工作范围</th> -->
        <!-- 				<th>资质要求</th> -->
        <!-- 				<th>最低设计与咨询经验要求</th> -->
        <!-- 				<th>招标文件获取</th> -->
        <!-- 				<th>文件提交</th> -->
        <!-- 				<th>项目展示</th> -->
        <!-- 				<th>合作机会</th> -->
        <shiro:hasPermission name="cms:cmsMegaProjectIntroduce1:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsMegaProjectIntroduce1">
        <tr>
            <td title="${cmsMegaProjectIntroduce1.projectName}">
                <a href="${ctx}/cms/cmsMegaProjectIntroduce1/form?id=${cmsMegaProjectIntroduce1.id}">
                        ${cmsMegaProjectIntroduce1.projectName}
                </a>
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.projectInvestment}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.projectContractor}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.projectSchedule}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.projectLocated}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.contacts}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.duty}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.phone}
            </td>
            <td>
                    ${cmsMegaProjectIntroduce1.industryInvolved}
            </td>
            <shiro:hasPermission name="cms:cmsMegaProjectIntroduce1:edit">
                <td>
                    <a href="${ctx}/cms/cmsMegaProjectIntroduce1/form?id=${cmsMegaProjectIntroduce1.id}">修改</a>
                    <a href="${ctx}/cms/cmsMegaProjectIntroduce1/delete?id=${cmsMegaProjectIntroduce1.id}"
                       onclick="return confirmx('确认要删除该大型项目详情吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>