<%@page import="java.util.*" %>
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
                url: '${ctx}/document/p2pRateDocumentAuditRecord/formView?rateDocumentUploadId=' + idNumber,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });
        }
        function model_eidt2(idNumber) {
            //alert(idNumber);
            $.ajax({
                url: '${ctx}/document/p2pRateDocumentAuditRecord/formView2?id=' + idNumber,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
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
                System.out.println(entry.getKey() + "----" + entry.getValue().size());
                listStr.add(entry.getKey());
                listAll.add(entry.getValue().size());
            }
        }
        request.setAttribute("listStr", listStr);
        request.setAttribute("listAll", listAll);
    %>
</head>

<body>
<div class="title"><h3>企业详情</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>

<jsp:include page="/WEB-INF/views/p2p/back/user/userList/p2pEnterpriseBaseInfo.jsp"></jsp:include>

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
            <a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }')">
                营业执照
            </a>
        </td>
        <!-- 材料提交说明 -->
        <td>加盖企业公章的扫描件</td>
        <!-- 材料说明 -->
        <td>
            --
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
            1
        </td>
        <!-- 提交时间 -->
        <td>
            <fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd"/>
        </td>
        <td>
            <a onclick="model_eidt2('${p2pEnterpriseCertify.id}');" data-toggle="modal" data-target="#myModal_view">
                查看
            </a>
        </td>
        <td>
            <a href="${ctx}/user/p2pEnterpriseCertify/download?address=${p2pEnterpriseCertify.businessLicense}">扫描件下载</a>
        </td>
    </tr>
    <%int i = 0; %><%int a = 1; %>
    <c:forEach items="${list2}" varStatus="status" var="p2pRateDocumentAudit">
        <tr style="text-align:center;">
            <!-- 序号 -->
            <td>
                    ${status.index+2}
            </td>
            <!-- 材料目录 -->
            <td>
                <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">${list2[status.index].tempName}</a>
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
                    <c:when test="${status.index=='5'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='6'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='7'}">三年一期，带附注</c:when>
                    <c:when test="${status.index=='9'}">期末借方余额和期末贷方余额</c:when>
                    <c:when test="${status.index=='14'}">企业从社保局调取</c:when>
                    <c:when test="${status.index=='15'}">企业从社保局调取</c:when>
                    <c:when test="${status.index=='16'}">企业从社保局调取</c:when>
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
                    <%-- <%
                        if(listAll.get(i)!=null){
                     %>
                     <%=listAll.get(i)%>
                     <%
                         }else{
                         out.println("无");
                     %>
                     <%}%> --%>
                <c:if test="${!empty listAll}">已提交</c:if>
                <c:if test="${empty  listAll}">未提交</c:if>
            </td>
            <!-- 提交个数 -->
            <td>
                <%
                    if (listStr.get(i).equals("" + a)) {
                %>
                <%=listAll.get(i)%>
                <%
                    }
                %>
                <%
                    i++;
                    a++;
                %>
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
                <a href="${ctx}/financing/downloads?financingInformationId=${list[status.index].financingInformationId}&rateDocumentTempId=${list[status.index].rateDocumentTempId}">扫描件下载</a>
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
</body>
</html>