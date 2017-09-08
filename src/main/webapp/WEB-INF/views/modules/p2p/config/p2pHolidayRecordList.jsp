<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
假期管理
@author Quincy
@version 2017-02-08
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>假期管理管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            var date = new Date();
            var lastYear = date.getFullYear() - 1;
            var thisYear = date.getFullYear();
            var nextYear = date.getFullYear() + 1;
            $("#lastYear").val(lastYear);
            $("#lastYear").text(lastYear);
            $("#lastYear").attr("selected", false);
            $("#thisYear").val(thisYear);
            $("#thisYear").text(thisYear);
            $("#thisYear").attr("selected", true);
            $("#nextYear").val(nextYear);
            $("#nextYear").text(nextYear);
            $("#nextYear").attr("selected", false);
            $(".select2-chosen").text(${p2pHolidayRecord.getYear});

            var error = '${error}';
            if (error == 'error') {
                swal("国务院尚未公布，无法生成!", "", "error");
            }
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
    <li class="active"><a href="${ctx}/config/p2pHolidayRecord/">假期管理列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pHolidayRecord" action="${ctx}/config/p2pHolidayRecord/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>年份：</label>
            <form:select path="getYear" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option value="" id="lastYear"></form:option>
                <form:option value="" id="thisYear"></form:option>
                <form:option value="" id="nextYear"></form:option>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>年份</th>
        <th>月份</th>
        <th>假期日</th>
        <th>修改人</th>
        <th>修改时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="temp" value="0"></c:set>
    <c:forEach items="${list}" var="p2pHolidayRecord" varStatus="status" begin="0" end="11">
        <tr>
            <c:if test="${temp == '0' }">
                <c:set var="temp" value="1"></c:set>
                <td rowspan="12">${p2pHolidayRecord.getYear}</td>
            </c:if>
            <td>${p2pHolidayRecord.month}</td>
            <td>
                    ${p2pHolidayRecord.getDay}
            </td>
            <td>
                    ${p2pHolidayRecord.operationPerson}
            </td>
            <td>
                <fmt:formatDate value="${p2pHolidayRecord.operateTime}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                <c:if test="${empty p2pHolidayRecord.getDay}">
                    <a href="javascript:void(0);"
                       onclick="sendForm('${p2pHolidayRecord.getYear}','${p2pHolidayRecord.month}');">生成假日信息</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script type="text/javascript">
    function post(url, params) {
        var temp = document.createElement('form');
        temp.action = url;
        temp.method = 'post';
        temp.style.display = 'none';
        for (var x in params) {
            var opt = document.createElement('input');
            opt.name = x;
            opt.value = params[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
    function sendForm(getYear, month) {
        post('${ctx}/config/p2pHolidayRecord/save', {getYear: getYear, month: month});
    }
</script>
</body>
</html>