<%@page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业详情</title>
    <meta name="decorator" content="default"/>
    <script>
        function model_eidt(idNumber) {
            //alert(idNumber);
            $.ajax({
                url: '${ctx}/user/p2pEnterpriseCertify/formView?id=' + idNumber,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });
        }

    </script>
</head>

<body>
<h3>企业详情</h3>
<jsp:include page="/WEB-INF/views/p2p/back/user/userList/p2pEnterpriseBaseInfo.jsp"></jsp:include>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>统一社会信用代码（营业执照注册号）</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
        <td>组织结构代码</td>
        <td><c:choose><c:when
                test="${empty p2pEnterpriseCertify.organizationCode}">无</c:when><c:otherwise>${p2pEnterpriseCertify.organizationCode}</c:otherwise></c:choose></td>
    </tr>
    <tr>
        <td>税务登记号</td>
        <td><c:choose><c:when
                test="${empty p2pEnterpriseCertify.taxRegistrationNum}">无${p2pEnterpriseCertify.taxRegistrationNum}</c:when><c:otherwise>${p2pEnterpriseCertify.taxRegistrationNum}</c:otherwise></c:choose></td>
        <td>企业名称</td>
        <td>
            ${p2pEnterpriseCertify.enterpriseName}
        </td>
    </tr>
    <tr>
        <td>单位类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.unitType, 'unit_type', '')}</td>
        <td>证件类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateType, 'certificate_type', '')}</td>
    </tr>
    <tr>
        <!-- 营业执照注册号 -->
        <td>营业执照注册号</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
        <td>营业执照所在地</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')} </td>
    </tr>
    <tr>
        <td>联系电话</td>
        <td>${p2pEnterpriseCertify.telephoneNum}</td>
        <td>公司成立日期</td>
        <td>
            <fmt:formatDate value="${p2pEnterpriseCertify.companyFoundDate}" pattern="yyyy-MM-dd"/>
        </td>
    </tr>
    <tr>
        <td>营业期限</td>
        <td>
            <c:choose>
                <c:when test="${p2pEnterpriseCertify.isLongTerm==1 }">长期</c:when>
                <c:otherwise><fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}"
                                             pattern="yyyy-MM-dd"/></c:otherwise>
            </c:choose>
        </td>
        <td>注册地址</td>
        <td>${p2pEnterpriseCertify.registeredAddress}</td>
    </tr>
    <tr>
        <td>企业法人联系电话</td>
        <td>${p2pEnterpriseCertify.telephoneNumOf}</td>
        <td>组织机构代码</td>
        <td>123</td>
    </tr>
    <tr>
        <td>营业范围</td>
        <td title="${p2pEnterpriseCertify.businessScope}">${fns:abbr(p2pEnterpriseCertify.businessScope,50)}</td>
        <td>注册资金</td>
        <td>${p2pEnterpriseCertify.registeredCapital}</td>
    </tr>
    <tr>
        <td>传真</td>
        <td>${p2pEnterpriseCertify.faxNum}</td>
        <td>代理人是否为企业法定代表人</td>
        <td>
            ${fns:getDictLabel(p2pEnterpriseCertify.isEntLegalRep, 'is_ent_legal_rep', '')}
        </td>
    </tr>
    <tr>
        <td>企业法定代表人姓名</td>
        <td>${p2pEnterpriseCertify.nameOf}</td>
        <td>企业法定代表人身份证号</td>
        <td>${p2pEnterpriseCertify.idNumberOf}</td>
    </tr>
    <tr>
        <td>实缴资本</td>
        <td>${p2pEnterpriseCertify.realCapital}</td>
        <td>经营区域</td>
        <td>${p2pEnterpriseCertify.businessArea}</td>
    </tr>
    <%-- <tr>
        <td>企业名称</td><td>${p2pEnterpriseCertify.enterpriseName}</td>
        <td>统一社会信用代码（营业执照注册号）</td><td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
    </tr>
    <c:if test="${p2pEnterpriseCertify.certificateType == 0 }">
        <tr>
            <td>组织机构代码</td><td><c:choose><c:when test="${empty p2pEnterpriseCertify.organizationCode}">无</c:when><c:otherwise>${p2pEnterpriseCertify.organizationCode}</c:otherwise></c:choose></td>
            <td>税务登记证号</td><td><c:choose><c:when test="${empty p2pEnterpriseCertify.taxRegistrationNum}">无${p2pEnterpriseCertify.taxRegistrationNum}</c:when><c:otherwise>${p2pEnterpriseCertify.taxRegistrationNum}</c:otherwise></c:choose></td>
        </tr>
    </c:if>
    <tr>
        <td>证件照所在地</td><td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')} </td>
        <td>营业期限</td><td>	<c:choose>
                <c:when test="${p2pEnterpriseCertify.isLongTerm==1 }">长期</c:when>
                <c:otherwise><fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd"/></c:otherwise>
            </c:choose></td><!-- (年月日)，如为(长期)，此字段为空', -->
    </tr>
    <tr>
        <td>注册地址</td><td>${p2pEnterpriseCertify.registeredAddress}</td>
        <td>注册资金</td><td>${p2pEnterpriseCertify.registeredCapital}</td>
    </tr>
    <tr>
        <td>营业范围</td><td title="${p2pEnterpriseCertify.businessScope}">${fns:abbr(p2pEnterpriseCertify.businessScope,50)}</td>
    </tr>
    <tr>
        <td>代理人是否为法人</td><td>
        ${fns:getDictLabel(p2pEnterpriseCertify.isEntLegalRep, 'is_ent_legal_rep', '')}</td>
        <td>传真</td><td>${p2pEnterpriseCertify.faxNum}</td>
    </tr> --%>
    </tbody>
</table>

<table class="table table-striped table-bordered table-condensed">
    <H4>企业材料清单</H4>
    <thead>
    <th>序号</th>
    <th>材料目录</th>
    <th>材料提交说明</th>
    <th>材料说明</th>
    <th>是否必填</th>
    <th>提交情况</th>
    <th>提交文件个数</th>
    <th>提交时间</th>
    <th>材料审核历史记录</th>
    <th>扫描件下载</th>
    </thead>
    <tbody>
    <tr style="text-align:center;">
        <!-- 序号 -->
        <td>1</td>
        <!-- 材料目录 -->
        <td>
            <%-- <a  onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }')"> --%>
            营业执照
            <!-- </a> -->
        </td>
        <!-- 材料提交说明 -->
        <td>加盖企业公章的复印件</td>
        <!-- 材料说明 -->
        <td>
            -
        </td>
        <!-- 是否必填 -->
        <td>
            是
        </td>
        <!-- 提交情况 -->
        <td>
            <c:if test="${!empty p2pEnterpriseCertify.businessLicense }">已提交</c:if>
            <c:if test="${empty p2pEnterpriseCertify.businessLicense }">未提交</c:if>
        </td>
        <!-- 提交文件个数 -->
        <td>
            <%-- <a  href="javascript:void(0);" onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }')"> --%>
            <a href="" data-toggle="modal" data-target="#myModal_Image">
                1
            </a>
        </td>
        <!-- 提交时间 -->
        <td>
            <fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd"/>
        </td>
        <%-- <td >
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
        </td> --%>
        <td>
            <a onclick="model_eidt('${p2pEnterpriseCertify.id}');" href="" data-toggle="modal"
               data-target="#myModal_view">
                查看
            </a>
        </td>
        <td>
            <a href="${ctx}/user/p2pEnterpriseCertify/download?address=${p2pEnterpriseCertify.businessLicense}">下载</a>
        </td>
    </tr>

    </tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:430px;height:520px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
</div>
<div class="modal fade" id="myModal_Image" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:430px;height:520px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">营业执照</h4>
            </div>
            <div class="modal-body">
                <img alt="营业执照"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }"
                     id="img_yyzz">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>