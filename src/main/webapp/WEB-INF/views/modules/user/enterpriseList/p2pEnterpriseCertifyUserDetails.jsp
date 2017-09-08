<%@page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业详情</title>
    <meta name="decorator" content="default"/>

</head>

<body>
<h3>企业详情</h3>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>单位类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.unitType, 'unit_type', '')}</td>
        <td>证件类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateType, 'certificate_type', '')}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${p2pEnterpriseCertify.enterpriseName}</td>
        <td>统一社会信用代码（营业执照注册号）</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
    </tr>
    <%--<c:if test="${p2pEnterpriseCertify.certificateType == 0 }">--%>
    <tr>
        <td>组织机构代码</td>
        <td><c:choose><c:when
                test="${empty p2pEnterpriseCertify.organizationCode}">无</c:when><c:otherwise>${p2pEnterpriseCertify.organizationCode}</c:otherwise></c:choose></td>
        <td>税务登记证号</td>
        <td><c:choose><c:when
                test="${empty p2pEnterpriseCertify.taxRegistrationNum}">无${p2pEnterpriseCertify.taxRegistrationNum}</c:when><c:otherwise>${p2pEnterpriseCertify.taxRegistrationNum}</c:otherwise></c:choose></td>
    </tr>
    <%--</c:if>--%>
    <tr>
        <td>证件照所在地</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')} </td>
        <td>营业期限</td>
        <td><c:choose>
            <c:when test="${p2pEnterpriseCertify.isLongTerm==1 }">长期</c:when>
            <c:otherwise><fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}"
                                         pattern="yyyy-MM-dd"/></c:otherwise>
        </c:choose></td><!-- (年月日)，如为(长期)，此字段为空', -->
    </tr>
    <tr>
        <td>注册地址</td>
        <td>${p2pEnterpriseCertify.registeredAddress}</td>
        <td>注册资金</td>
        <td>${p2pEnterpriseCertify.registeredCapital}</td>
    </tr>
    <tr>
        <td>营业范围</td>
        <td title="${p2pEnterpriseCertify.businessScope}">${fns:abbr(p2pEnterpriseCertify.businessScope,50)}</td>
        <td>联系电话</td>
        <td>${p2pEnterpriseCertify.telephoneNum}</td>
    </tr>
    <tr>
        <td>代理人是否为法人</td>
        <td>
            ${fns:getDictLabel(p2pEnterpriseCertify.isEntLegalRep, 'is_ent_legal_rep', '')}</td>
        <td>传真</td>
        <td>${p2pEnterpriseCertify.faxNum}</td>
    </tr>
    </tbody>
</table>

<table class="table table-striped table-bordered table-condensed">
    <H4>企业非财务材料</H4>
    <thead>
    <th>序号</th>
    <th>材料名称</th>
    <%--<th>是否融资（必填）</th>
    <th>材料备注</th>
    --%>
    <th>证件说明</th>
    <th>提交状态</th>
    <th>到期时间</th>
    <th>是否过期</th>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>
            <!-- 按钮触发模态框 -->
            <a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }')">
                营业执照
            </a>
        </td>

        <%--<td>——</td>
        <td>——</td>
        --%>
        <td>加盖企业公章的复印件</td>
        <td>
            <c:if test="${!empty p2pEnterpriseCertify.businessLicense }">已提交</c:if>
            <c:if test="${empty p2pEnterpriseCertify.businessLicense }">未提交</c:if>
        </td>
        <td>
            <fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod }" pattern="yyyy-MM-dd"/>
        </td>
        <td>
            <c:set var="nowDate">
                <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd " type="date"/>
            </c:set>
            <c:set var="createDate">
                <fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd " type="date"/>
            </c:set>

            <c:if test="${nowDate < createDate }">
                否
            </c:if>
            <c:if test="${nowDate > createDate }">
                是
            </c:if>
        </td>
    </tr>

    </tbody>
</table>
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
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>