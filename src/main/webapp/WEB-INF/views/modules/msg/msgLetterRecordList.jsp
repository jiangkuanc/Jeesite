<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>站内信管理</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/sweetAlert/sweetalert.css" type="text/css" rel="stylesheet"/>
    <script src="${ctxStatic}/sweetAlert/sweetalert.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function model_eidt(id) {
            //alert(idNumber);
            $.ajax({
                url: '${ctx}/msg/msgLetterRecord/view?id=' + id,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/msg/msgLetterRecord/">站内信列表</a></li>
    <li><a href="${ctx}/msg/msgLetterRecord/form">站内信添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="msgLetterRecord" action="${ctx}/msg/msgLetterRecord/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
            <%-- <li><label>发送人ID：</label>
               <sys:treeselect id="user" name="user.id" value="${msgLetterRecord.user.id}" labelName="user.name" labelValue="${msgLetterRecord.user.name}"
                   title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
           </li> --%>
        <li><label>收信人：</label>
                <%-- <sys:treeselect id="recId" name="recId" value="${msgLetterRecord.recId}" labelName="" labelValue="${msgLetterRecord.recId}"
                    title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/> --%>
            <sys:treeselect id="recId" name="recId" value="${msgLetterRecord.recId}" labelName="msgLetterRecord.recId"
                            labelValue="${fns:getUserNameById(msgLetterRecord.recId)}"
                            title="用户" url="/sys/user/treeData2" cssClass="required" allowClear="true"
                            notAllowSelectParent="true"/>
            <span class="help-inline"></span>
        </li>
        <li><label>发送时间：</label>
            <input name="beginSendDate" type="text" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${msgLetterRecord.beginSendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> -
            <input name="endSendDate" type="text" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${msgLetterRecord.endSendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>阅读状态：</label>
                <%-- <form:input path="readState" htmlEscape="false" maxlength="64" class="input-medium"/> --%>
            <form:select path="readState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('readState')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
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
        <th>序号</th>
        <th>发信人</th>
        <th>收信人</th>
        <th>标题</th>
        <th>发送时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="msgLetterRecord" varStatus="statusCount">
        <tr style="text-align:center;">
            <td>
                    <%-- <a href="${ctx}/msg/msgLetterRecord/form?id=${msgLetterRecord.id}"></a> --%>
                    ${statusCount.count}
            </td>
            <td>
                    ${fns:getUserById(msgLetterRecord.user.id).name}
            </td>
            <td>
                    ${msgLetterRecord.recId}
            </td>
            <td>
                    ${msgLetterRecord.title}
            </td>
            <td>
                <fmt:formatDate value="${msgLetterRecord.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>

            <td>
                    ${fns:getDictLabel(msgLetterRecord.readState, 'readState', '')}
            </td>
            <td>

                <a onclick="model_eidt('${msgLetterRecord.id}');" href="" data-toggle="modal"
                   data-target="#myModal_view">
                    详情
                </a>
                <a href="${ctx}/msg/msgLetterRecord/delete?id=${msgLetterRecord.id}"
                   onclick="return confirm('确认要删除该站内信吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:430px;height:520px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
</div>
<div class="pagination">${page}</div>
</body>
</html>