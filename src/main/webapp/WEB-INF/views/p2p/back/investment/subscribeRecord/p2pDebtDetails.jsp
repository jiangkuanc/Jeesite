<%@page import="com.thinkgem.jeesite.common.mapper.JsonMapper" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@page import="java.util.*" %>
<html>
<head>
    <title>借贷产品详情</title>
    <meta name="decorator" content="default"/>
    <script>
        function model_eidt(idNumber) {
            $.ajax({
                url: '${ctx}/document/p2pRateDocumentAuditRecord/formView?rateDocumentUploadId=' + idNumber,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });
        }

        //企业基本信息
        function model_enterpriseBaseInfo(financingInformationId) {
            $.ajax({
                url: '${ctx}/document/p2pRateDocumentAuditRecord/enBaseInfoModal?financingInformationId=' + financingInformationId,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#model_enterpriseBaseInfo").html(data);
                    $("#model_enterpriseBaseInfo").modal();
                }
            });
        }
        function imgViews(financingInformationId, rateDocumentTempId) {
            if (financingInformationId != null && financingInformationId != "" && rateDocumentTempId != null && rateDocumentTempId != "") {
                $.ajax({
                    url: '${ctx}/document/p2pRateDocumentUpload/modelViews?financingInformationId=' + financingInformationId + '&&rateDocumentTempId=' + rateDocumentTempId,
                    dataType: 'text',
                    type: 'post',
                    success: function (data) {
                        modelViews(data);
                    }
                });
            }
        }
    </script>
    <%
        Map<String, List> mapAll = (Map<String, List>) request.getAttribute("mapAll");
        List<String> listStr = new ArrayList<String>();
        List listAll = new ArrayList();
        if (mapAll != null) {
            for (Map.Entry<String, List> entry : mapAll.entrySet()) {
                listStr.add(entry.getKey());
                listAll.add(entry.getValue().size());
            }
        }
        //map的key：文件类型编号
        request.setAttribute("listStr", listStr);
        //map的value：文件个数
        request.setAttribute("listAll", listAll);
    %>
</head>
<body>
<div class="title"><h3>申请借贷产品详情</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>借款期限</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>申请金额</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount }</fmt:formatNumber>元</td>
    </tr>
    <tr>
        <td>筹集期限</td>
        <td>${p2pFinancingInformation.raiseTimeLimit}天</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode , 'repayment_mode', '')}</td>
    </tr>
    </tbody>
</table>
<h4>企业简介</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName }</td>
        <td>注册地址</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.registeredAddress }</td>
    </tr>
    <tr>
        <td>企业规模</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseScale , 'enterprise_scale', '')}</td>
        <td>企业性质</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseNature , 'enterprise_nature', '')}</td>
    </tr>
    <tr>
        <td>所属行业</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.p2pIndustryclassi.classinameCn}</td>
        <td>实缴资本</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pFinancingInformation.p2pEnterpriseCertify.realCapital}</fmt:formatNumber>元
        </td>
    </tr>
    <tr>
        <td>所在地</td>
        <td>${area }</td>
        <td>经营区域</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.businessArea}</td>
    </tr>
    <tr>
        <td>营业执照登记机关</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.registrationAuthority}</td>
        <td>营业执照登记状态</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.registrationState, 'registration_state', '')}</td>
    </tr>
    <tr>
        <td>营业执照准核日期</td>
        <td><fmt:formatDate value="${p2pFinancingInformation.p2pEnterpriseCertify.quasiNuclearDate}"
                            pattern="yyyy-MM-dd"/></td>
        <td>是否存在境外交易</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.isOffshoreTransaction, 'yes_no', '')}</td>
    </tr>
    <tr>
        <td>企业经营范围</td>
        <td colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.businessScope}</td>
    </tr>
    </tbody>
</table>
<h4>借款用途</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>用途类别</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.purposeClassification , 'purpose_classification', '')}</td>
        <td>用途说明</td>
        <td>${p2pFinancingInformation.purposeExplain }</td>
    </tr>
    </tbody>
</table>
<h4>还款来源</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>第一还款来源<b style="color:#C1181D;font-size:16px;">&nbsp*</b></td>
        <td>${p2pFinancingInformation.repaymentFirstSource }</td>
        <td>第二还款来源</td>
        <td>${p2pFinancingInformation.repaymentSecondSource }</td>
    </tr>
    <tr>
        <td>第三还款来源</td>
        <td>${p2pFinancingInformation.repaymentThirdSource }</td>
        <td>其他还款来源</td>
        <td>${p2pFinancingInformation.repaymentOtherSource }</td>
    </tr>
    </tbody>
</table>


<H4>企业材料清单</H4>
<table class="table table-striped table-bordered table-condensed">
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
    <c:forEach items="${list}" varStatus="status" var="p2pRateDocumentAudit">
        <tr style="text-align:center;">
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!-- 材料目录 -->
            <td>
                <c:choose>
                    <c:when test="${listAll[status.index]>0 }">
                        <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">${list[status.index].p2pRateDocumentTemplate.tempName}</a>
                    </c:when>
                    <c:when test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 3}">
                        <a onclick="model_enterpriseBaseInfo('${p2pFinancingInformation.id}')">
                                ${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempName}
                        </a>
                    </c:when>
                    <c:otherwise>${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempName}</c:otherwise>
                </c:choose>
            </td>
            <!-- 材料提交说明 -->
            <td>
                加盖企业公章的扫描件
            </td>
            <!-- 材料说明 -->
            <td>
                <c:choose>
                    <c:when test="${status.index=='0'}">包括管理机制、管理机构、管理制度三个方面</c:when>
                    <c:when test="${status.index=='1'}">了解公司股东构成情况</c:when>
                    <c:when test="${status.index=='7'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='8'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='9'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='11'}">期末借方余额和期末贷方余额</c:when>
                    <c:when test="${status.index=='23'}">企业从社保局调取</c:when>
                    <c:when test="${status.index=='25'}">“三证合一”证件信息（工商营业执照、组织机构代码证和税务登记证信息）</c:when>
                    <c:otherwise>
                        --
                    </c:otherwise>
                </c:choose>
            </td>
            <!-- 是否必填 -->
            <td>
                是
            </td>
            <!-- 提交情况 -->
            <td>
                <c:if test="${empty list}">待提交</c:if>
                <c:if test="${not empty list}">
                    已提交
                </c:if>
            </td>
            <!-- 提交个数 -->
            <td>
                <c:choose>
                    <c:when test="${listAll[status.index]>0 }">
                        ${listAll[status.index] }
                    </c:when>
                    <c:otherwise>--</c:otherwise>
                </c:choose>
            </td>
            <!-- 提交时间 -->
            <td>
                <fmt:formatDate value="${list[status.index].uploadTime}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                <a onclick="model_eidt('${list[status.index].id}');" href="" data-toggle="modal"
                   data-target="#myModal_view">
                    查看
                </a>
            </td>
            <td>
                <shiro:hasPermission name="material:list"><a
                        href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${list[status.index].financingInformationId}&rateDocumentTempId=${list[status.index].rateDocumentTempId}">扫描件下载</a></shiro:hasPermission>
                    <%-- <a href="${ctx}/financing/download?address=${p2pEnterpriseCertify.businessLicense }">下载</a> --%>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:430px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="model_enterpriseBaseInfo" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:800px;margin-left: -400px"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
</body>
</html>

