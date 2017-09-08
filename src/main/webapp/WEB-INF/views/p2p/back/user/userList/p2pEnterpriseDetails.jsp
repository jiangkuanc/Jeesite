<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>企业基本信息</title>
    <meta name="decorator" content="default"/>
    <script>
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

    </script>
</head>
<body>
<div class="title"><h3>企业详情</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>

<jsp:include page="/WEB-INF/views/p2p/back/user/userList/p2pEnterpriseBaseInfo.jsp"></jsp:include>

<table class="table table-striped table-bordered table-condensed">
    <h4>企业非财务材料</h4>
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
    <tr>
        <td>1</td>
        <td>
            <!-- 按钮触发模态框 -->
            <a onclick="modelView('${p2pEnterpriseCertify.businessLicenseView }')">
                营业执照
            </a>
        </td>
        <td>加盖企业公章的扫描件</td>
        <td>-</td>
        <td>是</td>
        <td>
            <c:if test="${!empty p2pEnterpriseCertify.businessLicense }">已提交</c:if>
            <c:if test="${empty p2pEnterpriseCertify.businessLicense }">未提交</c:if>
        </td>
        <td>
            <c:if test="${!empty p2pEnterpriseCertify.businessLicense }">1</c:if>
            <c:if test="${empty p2pEnterpriseCertify.businessLicense }">0</c:if>
        </td>

        <td>
            <fmt:formatDate value="${p2pEnterpriseCertify.submitTime }" pattern="yyyy-MM-dd"/>
        </td>
        <td>
            <a onclick="model_eidt2('${p2pEnterpriseCertify.id}');" data-toggle="modal" data-target="#myModal_view">
                查看
            </a>
        </td>
        <td>
            <shiro:hasPermission name="annex:download">
                <a href="${ctx}/financing/download?address=${p2pEnterpriseCertify.businessLicense }">下载</a>
            </shiro:hasPermission>
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
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:430px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
</div>
</body>
</html>

