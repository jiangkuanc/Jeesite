<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>短信发送信息管理</title>
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
    <li class="active"><a href="${ctx}/msg/msgSmsRecord/">短信发送信息列表</a></li>

</ul>
<form:form id="searchForm" modelAttribute="megSmsRecord" action="${ctx}/msg/msgSmsRecord/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
            <%-- <li><label>用户名：</label>
                <sys:treeselect id="user" name="user.id" value="${msgSmsRecord.user.id}" labelName="user.name" labelValue="${msgSmsRecord.user.name}"
                    title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
            </li> --%>
        <li><label>用户名：</label>
                <%-- <sys:treeselect id="recId" name="recId" value="${msgLetterRecord.recId}" labelName="" labelValue="${msgLetterRecord.recId}"
                    title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/> --%>
            <sys:treeselect id="recId" name="recId" value="${msgSmsRecord.recId}" labelName="msgSmsRecord.recId"
                            labelValue="${fns:getUserNameById(msgSmsRecord.recId)}"
                            title="用户" url="/sys/user/treeData2" cssClass="required" allowClear="true"
                            notAllowSelectParent="true" checked="true"/>
            <span class="help-inline"></span>
        </li>
            <%-- <li><label>接收人ID：</label>
                <sys:treeselect id="recId" name="recId" value="${megSmsRecord.recId}" labelName="" labelValue="${megSmsRecord.recId}"
                    title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
            </li> --%>
        <li><label>发送时间：</label>
            <input name="beginSendDate" type="text" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${msgSmsRecord.beginSendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> -
            <input name="endSendDate" type="text" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${msgSmsRecord.endSendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
            <%-- 	<li><label>阅读状态：</label>
                    <form:input path="readState" htmlEscape="false" maxlength="64" class="input-medium"/>
                    <form:select path="readState" class="input-medium-select">
                        <form:option value="" label="全部"/>
                        <form:options items="${fns:getDictList('readState')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                    </form:select>
                </li> --%>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>用户名</th>
        <th>手机号</th>
        <th>状态</th>
        <th style="width:40%">内容</th>
        <th>发送时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="msgSmsRecord" varStatus="Count">
        <tr style="text-align:center;">
            <td>
                    ${Count.count}
            </td>
            <td>
                    ${fns:getUserById(msgSmsRecord.recId).loginName }
                    <%-- ${msgSmsRecord.recId} --%>
            </td>
            <td>
                    ${msgSmsRecord.telnum}
            </td>
            <td>
                    ${fns:getDictLabel(msgSmsRecord.sendState, 'send_state', '')}
            </td>
            <td>
                    ${msgSmsRecord.smsContent}
            </td>
            <td>
                <fmt:formatDate value="${msgSmsRecord.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>


        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>