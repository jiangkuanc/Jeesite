<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>问卷添加</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<form:form id="inputForm" modelAttribute="p2pRiskAnswer" action="${ctx}/p2p/risk/p2pRiskPaper/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="page-header">
        <h4>
            问题选项编辑
        </h4>
    </div>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>问题ID</th>
            <th>选项</th>
            <th>选项内容</th>
            <th>分值</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${p2pRiskAnswerList}" varStatus="status" var="p2pRiskAnswer">
            <tr>
                <!--问题ID-->
                <td>${p2pRiskAnswer.paperId }</td>
                <!--选项(risk_option)	-->
                <td>${p2pRiskAnswer.questionType}</td>
                <!--选项内容-->
                <td>${p2pRiskAnswer.questionContent}</td>
                <!--分值-->
                <td>${p2pRiskAnswer.selectWay}</td>
                <!--操作-->
                <td>
                    <c:choose>
                        <c:when test="">
                            <a href="">删除</a>
                        </c:when>
                        <c:otherwise>
                            <a href="">添加</a>
                        </c:otherwise>
                    </c:choose>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>

</body>
</html>