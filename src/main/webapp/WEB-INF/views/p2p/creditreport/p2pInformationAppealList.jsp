<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
企业信息申诉表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>企业信息申诉表管理</title>
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
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pInformationAppeal/">企业信息申诉表列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pInformationAppeal" action="${ctx}/p2p/creditreport/p2pInformationAppeal/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业用户编号</th>
        <th>信用报告编号</th>
        <th>信用信息类型</th>
        <th>指标编号</th>
        <th>申诉类型</th>
        <th>申诉理由</th>
        <th>上传附件地址</th>
        <th>初审意见</th>
        <th>初审员</th>
        <th>初审说明</th>
        <th>初审时间</th>
        <th>复审意见</th>
        <th>复审员</th>
        <th>复审说明</th>
        <th>复审时间</th>
        <th>申诉审核状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pInformationAppeal">
        <tr style="text-align: left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${p2pInformationAppeal.user.id}
            </td>
            <td>
                    ${p2pInformationAppeal.creditReportId}
            </td>
            <td>
                    ${p2pInformationAppeal.creditInfoType}
            </td>
            <td>
                    ${p2pInformationAppeal.indexId}
            </td>
            <td>
                    ${p2pInformationAppeal.appealCategory}
            </td>
            <td>
                    ${p2pInformationAppeal.appealReason}
            </td>
            <td>
                    ${p2pInformationAppeal.uploadFile}
            </td>
            <td>
                    ${p2pInformationAppeal.firstReviewOpinion}
            </td>
            <td>
                    ${p2pInformationAppeal.firstReviewStaff}
            </td>
            <td>
                    ${p2pInformationAppeal.firstReviewExplain}
            </td>
            <td>
                    ${p2pInformationAppeal.firstReviewTime}
            </td>
            <td>
                    ${p2pInformationAppeal.reviewOpinion}
            </td>
            <td>
                    ${p2pInformationAppeal.reviewOfficer}
            </td>
            <td>
                    ${p2pInformationAppeal.reviewExplain}
            </td>
            <td>
                    ${p2pInformationAppeal.reviewTime}
            </td>
            <td>
                    ${p2pInformationAppeal.appealAuditState}
            </td>
            <td>
                <c:choose>
                    <c:when test="${p2pInformationAppeal.appealAuditState=='1'}">
                        <a href="${ctx}/creditreport/p2pInformationAppeal/p2pInformationAppealForm?id=${p2pInformationAppeal.id}">
                            审核
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx}/creditreport/p2pInformationAppeal/p2pInformationAppealView?id=${p2pInformationAppeal.id}">
                            查看
                        </a>
                    </c:otherwise>
                </c:choose>
            </td>


        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>