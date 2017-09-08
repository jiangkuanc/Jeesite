<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>站内信管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
        //查看详情模态框
        function model_view(idNumber) {
            alert(idNumber);
            $.ajax({
                url: '${ctx}/msg/msg/formView?id=' + idNumber,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    alert(data);
                    $("#myModal_viewXiang").html(data);
                    $("#myModal_viewXiang").show();
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</head>
<body>
<sys:message content="${message}"/>
<div class="page-header">
    <h1>您的站内信消息：</h1>
</div>
<table id="contentTable" class="table table-striped table-bordered table-condensed" style="width:100%;">
    <thead>
    <tr>
        <!-- <th>序号</th> -->
        <th style="text-align: center;">标题</th>
        <th style="text-align: center;">发送时间</th>
        <th style="text-align: center;">发件人</th>
        <th style="text-align: center;">状态</th>
        <th style="text-align:center;">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="msgLetterRecord">
        <tr style="text-align:center;">
            <td>
                    ${msgLetterRecord.title}
            </td>
            <td>
                <fmt:formatDate value="${msgLetterRecord.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${msgLetterRecord.user.name}
            </td>
            <td>
                    ${fns:getDictLabel(msgLetterRecord.readState, 'readState', '')}
            </td>
            <td>
                <a href="" onclick="model_view('${msgLetterRecord.id}');">详情</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="myModal_viewXiang" style="display:none;">
</div>
<div class="pagination">${page}
</div>
<button type="button" class="btn btn-primary" data-dismiss="modal" style="float:right;">关闭</button>
</body>
</html>