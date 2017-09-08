<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/jquery-tabletojson/jquery.tabletojson.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function exportExcel(fileName, tableId) {
            var table = $("#" + tableId).tableToJSON();
            //console.log(table);
            var json = JSON.stringify(table);
            var nodes = $("#" + tableId + " thead tr").children();
            var headers = "";
            $.each(nodes, function (i, item) {
                headers += item.innerHTML + ",";
            })

            //调用post方法
            post('${ctx}/user/p2pUserInformation/exportExcel', {fileName: fileName, headers: headers, json: json});
        }
        function post(url, params) {
            var temp = document.createElement("form");
            temp.action = url;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in params) {
                var opt = document.createElement("input");
                opt.name = x;
                opt.value = params[x];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }

    </script>
</head>
<body>

<form:form id="searchForm" modelAttribute="p2pUserInformation" action="${ctx}/user/p2pUserInformation/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>主体类型：</label>
            <form:select path="userBodyType" class="input-medium-select">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('user_body_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>认证状态：</label>
            <form:select path="certificateState" class="input-medium-select">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('certificate_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><input class="btn btn-primary" type="button"
                                onclick="exportExcel('yonghuliebiao','contentTable')" value="导出"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>用户编号</th>
        <th>昵称</th>
        <th>真实姓名</th>
        <th>联系方式</th>
        <th>邮箱</th>
        <th>主体类型</th>
        <th>注册日期</th>
        <th>认证状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pUserInformation">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td><a href="${ctx}/user/p2pUserInformation/form?id=${p2pUserInformation.id}">
                    ${p2pUserInformation.id}
            </a></td>
            <td>
                <a href="${ctx}/user/p2pUserInformation/form?id=${p2pUserInformation.id}">
                        ${p2pUserInformation.user.loginName}
                </a>
            </td>
            <td>${p2pUserInformation.user.name}</td>
            <td>${p2pUserInformation.user.phone}</td>
            <td>${p2pUserInformation.user.email}</td>
            <td>
                    ${fns:getDictLabel(p2pUserInformation.userBodyType, 'user_body_type', '')}
            </td>
            <td>
                <fmt:formatDate value="${p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${fns:getDictLabel(p2pUserInformation.certificateState, 'certificate_state', '')}
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>