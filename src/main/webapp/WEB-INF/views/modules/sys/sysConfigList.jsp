<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
系统配置信息
@author Summer
@version 2016-12-05
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>系统配置信息管理</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>系统编号</th>
        <th>常量名称</th>
        <th>key</th>
        <th>value</th>
        <th>备注</th>
        <th>排序</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${sysConfigList}" var="sysConfig">
        <tr>
            <td width="15%">${sysConfig.sysId}</td>
            <td width="15%">
                    ${sysConfig.constantName}
            </td>
            <td width="15%">
                    ${sysConfig.constantKey}
            </td>
            <td width="15%">
                    ${sysConfig.constantValue}
            </td>
            <td width="25%">
                    ${sysConfig.constantComment}
            </td>
            <td width="5%">
                    ${sysConfig.sort}
            </td>
            <td width="5%">
                <a href="${ctx}/sys/sysConfig/form?id=${sysConfig.id}">修改</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>