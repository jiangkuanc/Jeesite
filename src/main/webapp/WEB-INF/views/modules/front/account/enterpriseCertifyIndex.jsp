<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->

<c:if test="${p2pEnterpriseCertify.auditState == null}">
    <div class="zh-right pull-left zhaimima ">
        <div class="mima">
            <h3 class="zhai-mima">企业认证</h3>
            <table class="table qyrz-table" style="margin-left: -5%">
                <tr class="qyrz-tr">
                    <td>单位类型：</td>
                    <td>无</td>
                </tr>
                <tr class="qyrz-tr">
                    <td>状态：</td>
                    <td>未认证 <a href="${ctx}/user/p2pUserInformation/financingPermission" class="qyrz-a ">
                        <button class="btn">立即认证</button>
                    </a></td>
                </tr>
                <tr class="qyrz-tr">
                    <td>企业基本信息：</td>
                    <td></td>
                </tr>
                <tr>
                    <td>企业名称：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>注册号：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>营业执照所在地：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>营业期限：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>注册地址：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>注册资金：</td>
                    <td>无</td>
                </tr>
                <tr>
                    <td>审核说明：</td>
                    <td>无</td>
                </tr>
            </table>

            <div class="clearfix"></div>
        </div>
    </div>
</c:if>
<c:if test="${p2pEnterpriseCertify.auditState == 2}">
    <div class="zh-right pull-left zhaimima ">
        <div class="mima">
            <h3 class="zhai-mima">企业认证</h3>
            <table class="table qyrz-table" style="margin-left: 5%">
                <tr class="qyrz-tr">
                    <td>单位类型：</td>
                    <td><c:if test="${p2pEnterpriseCertify.unitType == 1}">个体工商户</c:if>
                        <c:if test="${p2pEnterpriseCertify.unitType == 2}">企业</c:if>
                    </td>
                </tr>
                <tr class="qyrz-tr">
                    <td>状态：</td>
                    <td>未通过 <a href="${ctx}/user/p2pUserInformation/financingPermission" class="qyrz-a ">
                        <button class="btn">立即认证</button>
                    </a></td>
                </tr>
                <tr class="qyrz-tr">
                    <td class="noWrap">企业基本信息：</td>
                    <td></td>
                </tr>
                <tr>
                    <td>企业名称：</td>
                    <td style="word-wrap:break-word;word-break:break-all;">${p2pEnterpriseCertify.enterpriseName}</td>
                </tr>
                <tr>
                    <td>注册号：</td>
                    <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
                </tr>
                <tr>
                    <td class="noWrap">营业执照所在地：</td>
                    <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')}</td>
                </tr>
                <tr>
                    <td>营业期限：</td>
                    <td>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.isLongTerm==1}">
                                长期
                            </c:when>
                            <c:otherwise>
                                <fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td>注册地址：</td>
                    <td style="word-wrap:break-word;word-break:break-all;">${p2pEnterpriseCertify.registeredAddress}</td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                        <%--  <td>${p2pEnterpriseCertify.telephoneNum}</td> --%>
                    <td>
                        <c:if test="${p2pEnterpriseCertify.telephoneNum!=null}">${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}</c:if>
                    </td>

                </tr>
                <tr>
                    <td>注册资金：</td>
                    <td><fmt:formatNumber value="${p2pEnterpriseCertify.registeredCapital}" pattern="#,###"/>元</td>
                </tr>
                <tr>
                    <td>审核说明：</td>
                    <td id="biaohong">${p2pEnterpriseCertify.auditExplain}</td>
                </tr>
            </table>

            <div class="clearfix"></div>
        </div>
    </div>

</c:if>
<c:if test="${p2pEnterpriseCertify.auditState == 3}">
    <div class="zh-right pull-left zhaimima ">
        <div class="mima">
            <h3 class="zhai-mima">企业认证</h3>
            <table class="table qyrz-table" style="margin-left: 5%">
                <tr class="qyrz-tr">
                    <td>单位类型：</td>
                    <td><c:if test="${p2pEnterpriseCertify.unitType == 1}">个体工商户</c:if>
                        <c:if test="${p2pEnterpriseCertify.unitType == 2}">企业</c:if></td>
                </tr>
                <tr class="qyrz-tr">
                    <td>状态：</td>
                    <td>审核中 <a href="" class="qyrz-shen "> </a></td>
                </tr>
                <tr class="qyrz-tr">
                    <td class="noWrap">企业基本信息：</td>
                    <td></td>
                </tr>
                <tr>
                    <td>企业名称：</td>
                    <td style="word-wrap:break-word;word-break:break-all;">${p2pEnterpriseCertify.enterpriseName}</td>
                </tr>
                <tr>
                    <td>注册号：</td>
                    <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
                </tr>
                <tr>
                    <td class="noWrap">营业执照所在地：</td>
                    <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')}</td>
                </tr>
                <tr>
                    <td>营业期限：</td>
                    <td>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.isLongTerm==1}">
                                长期
                            </c:when>
                            <c:otherwise>
                                <fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td>注册地址：</td>
                    <td style="word-wrap:break-word;word-break:break-all;">${p2pEnterpriseCertify.registeredAddress}</td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                        <%--  <td>${p2pEnterpriseCertify.telephoneNum}</td> --%>
                    <td>
                        <c:if test="${p2pEnterpriseCertify.telephoneNum!=null}">${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}</c:if>
                    </td>
                </tr>
                <tr>
                    <td>注册资金：</td>
                    <td><fmt:formatNumber value="${p2pEnterpriseCertify.registeredCapital}" pattern="#,###"/>元</td>
                </tr>
                <tr>
                    <td>审核说明：</td>
                    <td>无</td>
                </tr>
            </table>

            <div class="clearfix"></div>
        </div>

    </div>
</c:if>
<c:if test="${p2pEnterpriseCertify.auditState == 1}">
    <div class="zh-right pull-left zhaimima ">
        <div class="mima">
            <h3 class="zhai-mima">企业认证</h3>
            <table class="table qyrz-table" style="margin-left: 5%">
                <tr class="qyrz-tr">
                    <td>单位类型：</td>
                    <td><c:if test="${p2pEnterpriseCertify.unitType == 1}">个体工商户</c:if>
                        <c:if test="${p2pEnterpriseCertify.unitType == 2}">企业</c:if></td>
                </tr>
                <tr class="qyrz-tr">
                    <td>状态：</td>
                    <td>已认证 <a href="" class="qyrz-a "></a></td>
                </tr>
                <tr class="qyrz-tr">
                    <td class="noWrap">企业基本信息：</td>
                    <td></td>
                </tr>
                <tr>
                    <td>企业名称：</td>
                    <td>${p2pEnterpriseCertify.enterpriseName}</td>
                </tr>
                <tr>
                    <td>注册号：</td>
                    <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
                </tr>
                <tr>
                    <td class="noWrap">营业执照所在地：</td>
                    <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation,'provincial_area','')}</td>
                </tr>
                <tr>
                    <td>营业期限：</td>
                    <td>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.isLongTerm==1}">
                                长期
                            </c:when>
                            <c:otherwise>
                                <fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td>注册地址：</td>
                    <td style="word-wrap:break-word;word-break:break-all;">${p2pEnterpriseCertify.registeredAddress}</td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                        <%--  <td>${p2pEnterpriseCertify.telephoneNum}</td> --%>
                    <td>
                        <c:if test="${p2pEnterpriseCertify.telephoneNum!=null}">${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}</c:if>
                    </td>
                </tr>
                <tr>
                    <td>注册资金：</td>
                    <td><fmt:formatNumber value="${p2pEnterpriseCertify.registeredCapital}" pattern="#,###"/>元</td>
                </tr>
                <tr>
                    <td>审核说明：</td>
                    <td>无</td>
                </tr>
            </table>

            <div class="clearfix"></div>
        </div>

    </div>
</c:if>
<div class="clearfix"></div>
</div>
<!--内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">

</script>


</body>
</html>
