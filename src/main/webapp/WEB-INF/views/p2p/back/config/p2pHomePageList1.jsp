<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css/homepage.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            alert("page");
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
    <style type="text/css">
        .f_left {
            float: left;
        }

        .f_right {
            float: right;
        }
    </style>
</head>
<body>
<div style="margin:0px 10%;">
    <div>
        <div class="row">
            <div class="f_left">
                <h4>材料审核任务池</h4>
                <input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </div>


        <div>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>项目名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="p2pEnterpriseCertify" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td>${p2pEnterpriseCertify.p2pFinancingInformation.finacingName}</td>
                        <td>
                            <a href="${ctx}/document/p2pRateDocumentUpload/findlist?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}">审核 </a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <div class="pagination">${page}</div>
        </div>
    </div>
</div>
</body>
</html>