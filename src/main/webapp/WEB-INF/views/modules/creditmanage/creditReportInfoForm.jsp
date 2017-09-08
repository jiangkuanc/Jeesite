<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>信用记录举报</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

    </script>
</head>
<body>
<c:choose>
    <c:when test="${creditReportInfo.remarks=='view'}">
        <h4>举报信息查看</h4>
    </c:when>
    <c:otherwise>
        <h4>举报信息审核</h4>
    </c:otherwise>
</c:choose>
<table class="table table-striped table-bordered table-condensed mytable" style="text-align:center">
    <tbody>
    <tr>
        <td>企业组织结构代码</td>
        <td>${creditReportInfo.p2pEnterpriseCertify.organizationCode}</td>
        <td>企业规模</td>
        <td>${fns:getDictLabel(creditReportInfo.p2pEnterpriseCertify.enterpriseScale,'enterprise_scale','')}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${creditReportInfo.p2pEnterpriseCertify.enterpriseName}</td>
        <td>企业类型</td>
        <td>${fns:getDictLabel(creditReportInfo.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
    </tr>
    <tr>
        <td>法人姓名</td>
        <td>${creditReportInfo.p2pEnterpriseCertify.nameOf}</td>
        <td>联系方式</td>
        <td>${creditReportInfo.p2pEnterpriseCertify.telephoneNumOf}</td>
    </tr>
    <tr>
        <td>举报人姓名</td>
        <td>${fns:getUserById(creditReportInfo.reportId).name}</td>
        <td>举报原因</td>
        <td>${fns:getDictLabel(creditReportInfo.reportReason,'report_category','')}</td>
    </tr>
    <tr>
        <td>举报内容</td>
        <td colspan="3">${creditReportInfo.reportExplain}</td>
    </tr>
    <tr>
        <td>附件</td>
        <td colspan="3">
            ${creditReportInfo.attachmentName}&nbsp;&nbsp;&nbsp;
            <c:if test="${creditReportInfo.attachment!=null}">
                <a href="${ctx}/creditmanage/creditReportInfo/download?fileName=${creditReportInfo.attachmentName}&address=${creditReportInfo.attachment}">附件下载</a>
            </c:if>
        </td>
    </tr>
    <!-- 如果有初审  -->
    <c:if test="${creditReportInfo.checkId != null && creditReportInfo.checkId != ''}">
        <tr>
            <td>初审员</td>
            <td colspan="3">${fns:getUserById(creditReportInfo.checkId).name}</td>
        </tr>
        <tr>
            <td>初审意见</td>
            <td colspan="3">${creditReportInfo.checkOpinion}</td>
        </tr>
    </c:if>
    <!-- 如果有复审 -->
    <c:if test="${creditReportInfo.recheckId != null && creditReportInfo.recheckId != ''}">
        <tr>
            <td>复审员</td>
            <td colspan="3">${fns:getUserById(creditReportInfo.recheckId).name}</td>
        </tr>
        <tr>
            <td>复审意见</td>
            <td colspan="3">${creditReportInfo.recheckOpinion}</td>
        </tr>
    </c:if>

    </tbody>
</table>
<c:if test="${creditReportInfo.remarks=='edit'}">
    <form:form id="inputForm" modelAttribute="creditReportInfo"
               action="${ctx}/creditmanage/creditReportInfo/reportAudit" method="post" class="breadcrumb">
        <form:input path="id" type="hidden"/>
        <form:input path="auditStatus" type="hidden"/>
        <c:if test="${creditReportInfo.auditStatus=='1'}">
            <table class="table table-striped table-bordered table-condensed mytable" style="width:40%;">
                <tbody>
                <tr>
                    <td style="font-size:18px;">审核结果</td>
                    <td>
                        <form:select path="recheckId" class="input-mini">
                            <form:options items="${fns:getDictList('isPass')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>审核意见</td>
                    <td>
                        <form:textarea path="recheckOpinion" htmlEscape="false" rows="4" maxlength="64"
                                       class="input-xxlarge"></form:textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </c:if>
        <c:if test="${creditReportInfo.auditStatus=='2'}">
            <table class="table table-striped table-bordered table-condensed mytable" style="width:40%;">
                <tbody>
                <tr>
                    <td style="font-size:18px;">审核结果</td>
                    <td>
                        <form:select path="recheckId" class="input-mini">
                            <form:options items="${fns:getDictList('isPass')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>审核意见</td>
                    <td>
                        <form:textarea path="recheckOpinion" htmlEscape="false" rows="4" maxlength="64"
                                       class="input-xxlarge"></form:textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </c:if>
        <input class="btn btn-primary" style="margin-left:30%;" type="submit" value="提交"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </form:form>
</c:if>
<c:if test="${creditReportInfo.remarks=='view'}">
    <input id="btnCancel" class="btn" style="margin-left:48%;" type="button" value="返 回" onclick="history.go(-1)"/>
</c:if>
</body>
</html>
