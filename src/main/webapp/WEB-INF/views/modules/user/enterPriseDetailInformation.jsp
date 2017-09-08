<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业详情</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="$${ctx}/financing/p2pFinancingInformation/">融资信息表列表</a></li>
    <shiro:hasPermission name="financing:p2pFinancingInformation:edit">
        <li><a href="$${ctx}/financing/p2pFinancingInformation/form">融资信息表添加</a></li>
    </shiro:hasPermission>
</ul>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>企业详情</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>企业类型</td>
        <td>${vo.unitType}</td>
        <td>证件类型</td>
        <td>${vo.certificateType}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${vo.enterpriseName}</td>
        <td>统一社会信用代码(营业执照注册号)</td>
        <td>${vo.unifiedSocialCreditCode}</td>
    </tr>
    <tr>
        <td>组织机构代码</td>
        <td>${vo.organizationCode}</td>
        <td>税务登记证号</td>
        <td>${vo.organizationCode}</td>
    </tr>
    <tr>
        <td>证照所在地</td>
        <td>${vo.certificateLocation}</td>
        <td>营业期限</td>
        <td><c:choose>
            <c:when test="${vo.isLongTerm==1 }">长期</c:when>
            <c:otherwise><fmt:formatDate value="${vo.operationPeriod}" pattern="yyyy-MM-dd"/></c:otherwise>
        </c:choose></td>
    </tr>
    <tr>
        <td>注册地址</td>
        <td>${vo.registeredAddress}</td>
        <td>联系电话</td>
        <td>${vo.telephoneNum}</td>
    </tr>
    <tr>
        <td>营业范围</td>
        <td>${vo.businessScope}</td>
        <td>代理人是否为法人</td>
        <td>${vo.isEntLegalRep}</td>
    </tr>
    </tbody>
</table>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>企业非财务材料</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>序号</td>
        <td>材料名称</td>
        <td>是否资料必填</td>
        <td>材料备注</td>
        <td>证件说明</td>
        <td>是否提交</td>
        <td>到期时间</td>
        <td>是否过期</td>
    </tr>
    <tr>
        <td>1</td>
        <td>营业执照</td>
        <td>是</td>
        <td>提供有效期内的材料</td>
        <td>加盖企业公章的复印件</td>
        <td>是</td>
        <td>${vo.operationPeriod}</td>
        <td>否</td>
    </tr>
    </tbody>
</table>
</body>
</html>