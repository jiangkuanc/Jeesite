<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>信用记录维护</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#searchForm").validate({
                rules: {},
                messages: {},
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
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="creditRecordInfo" action="${ctx}/creditmanage/creditRecordInfo" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="user.p2pEnterpriseCertify.userId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="user.p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="100"
                        class="input-medium"/>
        </li>
        <li><label>信用记录条数：</label>
            <form:input path="recordNum" htmlEscape="false" maxlength="10" class="input-medium number"/>
        </li>
        <li><label>所属行业：</label>
            <sys:treeselect id="industryId" name="user.p2pEnterpriseCertify.industryCode" value=""
                            labelName="creditReportInfo.user.p2pEnterpriseCertify.industryCode"
                            labelValue="${creditReportInfo.user.p2pEnterpriseCertify.industryCode==''?'---请选择---':(fns:getIndustryclassiName(creditReportInfo.user.p2pEnterpriseCertify.industryCode))}"
                            title="行业" url="/Industry/industryTreeData" cssStyle="width:130px;"
                            notAllowSelectParent="true" allowClear="true"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业编号</th>
        <th>企业名称</th>
        <th>信用记录条数</th>
        <th>所属行业</th>
        <th>角色类型</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="creditRecordInfo">
        <tr>
            <!--序号-->
            <td>${status.count}</td>
            <!--企业编号-->
            <td>${creditRecordInfo.user.p2pEnterpriseCertify.userId}</td>
            <!--企业名称-->
            <td>${creditRecordInfo.user.p2pEnterpriseCertify.enterpriseName}</td>
            <!--信用记录条数-->
            <td>${creditRecordInfo.recordNum}
            </td>
            <!--所属行业-->
            <td>${creditRecordInfo.user.p2pEnterpriseCertify.industryCode}
            </td>
            <!--角色类型-->
            <td>企业
            </td>
            <!--操作-->
            <td>
                <c:choose>
                    <c:when test="${creditRecordInfo.recordNum=='0'}">
                        <a href="${ctx}/creditmanage/creditOverdueInfo/overdueInfo?remarks=edit&user.id=${creditRecordInfo.user.p2pEnterpriseCertify.userId}">添加</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx}/creditmanage/creditOverdueInfo/overdueInfo?remarks=view&user.id=${creditRecordInfo.user.p2pEnterpriseCertify.userId}">查看</a>
                        <a href="${ctx}/creditmanage/creditOverdueInfo/overdueInfo?remarks=edit&user.id=${creditRecordInfo.user.p2pEnterpriseCertify.userId}">修改</a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>