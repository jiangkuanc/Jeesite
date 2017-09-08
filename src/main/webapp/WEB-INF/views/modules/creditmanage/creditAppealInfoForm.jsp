<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>信用记录申诉</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

    </script>
</head>
<body>
<c:choose>
    <c:when test="${creditAppealInfo.remarks=='view'}">
        <h4>申诉信息查看</h4>
    </c:when>
    <c:otherwise>
        <h4>申诉信息审核</h4>
    </c:otherwise>
</c:choose>
<table class="table table-striped table-bordered table-condensed mytable" style="text-align:center">
    <tbody>
    <tr>
        <td>企业组织结构代码</td>
        <td>${creditAppealInfo.user.p2pEnterpriseCertify.organizationCode}</td>
        <td>企业规模</td>
        <td>${fns:getDictLabel(creditAppealInfo.user.p2pEnterpriseCertify.enterpriseScale,'enterprise_scale','')}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${creditAppealInfo.user.p2pEnterpriseCertify.enterpriseName}</td>
        <td>企业类型</td>
        <td>${fns:getDictLabel(creditAppealInfo.user.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
    </tr>
    <tr>
        <td>法人姓名</td>
        <td>${creditAppealInfo.user.p2pEnterpriseCertify.nameOf}</td>
        <td>联系方式</td>
        <td>${creditAppealInfo.user.p2pEnterpriseCertify.telephoneNumOf}</td>
    </tr>
    <tr>
        <td>申诉人姓名</td>
        <td>${creditAppealInfo.user.p2pRegUserCertify.realName}</td>
        <td>申诉人身份证号</td>
        <td>${creditAppealInfo.user.p2pRegUserCertify.idNumber}</td>
    </tr>
    <tr>
        <td>申诉人联系方式</td>
        <td>${creditAppealInfo.user.phone}</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>申诉原因</td>
        <td colspan="3">${fns:getDictLabel(creditAppealInfo.appealReason,'appeal_category','')}</td>
    </tr>
    <tr>
        <td>描述</td>
        <td colspan="3">${creditAppealInfo.appealExplain}</td>
    </tr>
    <tr>
        <td>附件</td>
        <td colspan="3">
            ${creditAppealInfo.attachmentName}&nbsp;&nbsp;&nbsp;
            <c:if test="${creditAppealInfo.attachment!=null}">
                <a href="${ctx}/creditmanage/creditAppealInfo/attachmentDownload?attachmentName=${creditAppealInfo.attachmentName}&attachment=${creditAppealInfo.attachment}">附件下载</a>
            </c:if>
        </td>
    </tr>
    <!-- 如果有初审  -->
    <c:if test="${creditAppealInfo.checkId != null && creditAppealInfo.checkId != ''}">
        <tr>
            <td>初审员</td>
            <td colspan="3">${fns:getUserById(creditAppealInfo.checkId).name}</td>
        </tr>
        <tr>
            <td>初审意见</td>
            <td colspan="3">${creditAppealInfo.checkOpinion}</td>
        </tr>
    </c:if>
    <!-- 如果有复审 -->
    <c:if test="${creditAppealInfo.recheckId != null && creditAppealInfo.recheckId != ''}">
        <tr>
            <td>复审员</td>
            <td colspan="3">${fns:getUserById(creditAppealInfo.recheckId).name}</td>
        </tr>
        <tr>
            <td>复审意见</td>
            <td colspan="3">${creditAppealInfo.recheckOpinion}</td>
        </tr>
    </c:if>

    </tbody>
</table>
<c:if test="${creditAppealInfo.remarks=='edit'}">
    <form:form id="inputForm" modelAttribute="creditAppealInfo"
               action="${ctx}/creditmanage/creditAppealInfo/appealAudit" method="post" class="breadcrumb">
        <form:input path="id" type="hidden"/>
        <form:input path="auditStatus" type="hidden"/>
        <form:input path="checkId" type="hidden"/>
        <form:input path="checkOpinion" type="hidden"/>
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
        <input class="btn btn-primary" style="margin-left:30%;" type="submit" value="提交"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </form:form>
</c:if>
<c:if test="${creditAppealInfo.remarks=='view'}">
    <input id="btnCancel" class="btn" style="margin-left:48%;" type="button" value="返 回" onclick="history.go(-1)"/>
</c:if>
</body>
</html>
