<%@page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料初审未通过查看页</title>
    <meta name="decorator" content="default"/>
    <style type="text/css">
        td {
            padding: 0px;
            margin: 0px;
        }
    </style>
    <script>
        $(function () {
            $(".radio").click(function () {
                if ($(this).attr('checked')) {
                    $(this).parent().next().find('.text').attr('readonly', 'readonly');
                }
            });

            $(".radioNo").click(function () {
                if ($(this).attr('checked')) {
                    $(this).parent().next().find('.text').removeAttr('readonly');
                }
            });
        });

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
                url: '${ctx}/document/p2pRateDocumentAuditRecord/enBaseInfoModal2?financingInformationId=' + financingInformationId,
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
        request.setAttribute("listStr", listStr);
        request.setAttribute("listAll", listAll);
        int a = 1;
        int b = 1;
    %>
</head>

<body>
<!-- <h3>材料初审页</h3> -->
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab">
            单位基本资料
        </a>
    </li>
    <li><a href="#ios" data-toggle="tab">财务相关资料</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <!-- 单位基本资料列表 -->
        <table id="contentTable" class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th>序号</th>
                <th>材料目录</th>
                <th>材料提交说明</th>
                <th>文件份数</th>
                <th>提交情况</th>
                <th>提交时间</th>
                <th>是否通过初审</th>
                <th>不通过意见</th>
                <!-- 				<th>审核意见操作</th> -->
                <th>历史审核记录</th>
                <th>扫描件下载</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" varStatus="status" var="p2pRateDocumentAudit">
                <c:if test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 1}">
                    <tr style="text-align:center;">
                        <!-- 序号 -->
                        <td>
                            <%=a++ %>
                        </td>
                        <!-- 材料目录 -->
                        <td>
                                ${list[status.index].p2pRateDocumentTemplate.tempName}
                        </td>
                        <!-- 材料提交说明 -->
                        <td>
                            扫描件
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${listAll[status.index]>0 }">
                                    <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">
                                            ${listAll[status.index] }
                                    </a>
                                </c:when>
                                <c:otherwise>--</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${empty list[status.index]}">待提交</c:if>
                            <c:if test="${not empty list[status.index]}">
                                已提交
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${list[status.index].uploadTime}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${list[status.index].isReject=='1'}">
                                    是
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${list[status.index].isReject =='0'}">
                                    否
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty list[status.index].rejectReason}">--</c:when>
                                <c:otherwise>${list[status.index].rejectReason}</c:otherwise>
                            </c:choose>
                        </td>
                        <!-- 				<td> -->
                        <!-- 					<input id="btnSubmit" class="btn btn-default" type="submit" value="保存" /> -->
                        <!-- 				</td> -->
                        <!-- </form> -->
                        <td>
                            <a onclick="model_eidt('${list[status.index].id}');" href="" data-toggle="modal"
                               data-target="#myModal_view">
                                查看
                            </a>
                        </td>
                        <td>
                            <shiro:hasPermission name="material:download">
                                <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${list[status.index].financingInformationId}&rateDocumentTempId=${list[status.index].rateDocumentTempId}">下载</a>
                            </shiro:hasPermission>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
        <!-- 单位基本资料列表结束 -->
    </div>
    <div class="tab-pane fade" id="ios">
        <table id="contentTable2" class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th>序号</th>
                <th>材料目录</th>
                <th>材料提交说明</th>
                <th>文件份数</th>
                <th>提交情况</th>
                <th>提交时间</th>
                <th>是否通过初审</th>
                <th>不通过意见</th>
                <!-- 				<th>审核意见操作</th> -->
                <th>历史审核记录</th>
                <th>扫描件下载</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" varStatus="status" var="p2pRateDocumentAudit">
                <c:if test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 2 || p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 3}">
                    <tr style="text-align:center;">
                        <!-- 序号 -->
                        <td>
                            <%=b++ %>
                        </td>
                        <!-- 材料目录 -->
                        <td>
                            <c:choose>
                                <c:when test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 3}">
                                    <a onclick="model_enterpriseBaseInfo('${financingInformationId}')">
                                            ${list[status.index].p2pRateDocumentTemplate.tempName}
                                    </a>
                                </c:when>
                                <c:otherwise>${list[status.index].p2pRateDocumentTemplate.tempName}</c:otherwise>
                            </c:choose>
                        </td>
                        <!-- 材料提交说明 -->
                        <td>
                            扫描件
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${listAll[status.index]>0 }">
                                    <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">
                                            ${listAll[status.index] }
                                    </a>
                                </c:when>
                                <c:otherwise>--</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${empty p2pRateDocumentAudit}">待提交</c:if>
                            <c:if test="${not empty p2pRateDocumentAudit}">
                                已提交
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${list[status.index].uploadTime}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${list[status.index].isReject=='1'}">
                                    是
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${list[status.index].isReject =='0'}">
                                    否
                                </c:when>
                            </c:choose>
                        </td>
                        <td>

                            <c:choose>
                                <c:when test="${empty list[status.index].rejectReason}">--</c:when>
                                <c:otherwise>${list[status.index].rejectReason}</c:otherwise>
                            </c:choose>
                        </td>
                        <!-- 				<td> -->
                        <!-- 					<input id="btnSubmit02" class="btn btn-default" type="submit" value="保存" /> -->
                        <!-- 				</td> -->
                        <td>
                            <a onclick="model_eidt('${list[status.index].id}');" href="" data-toggle="modal"
                               data-target="#myModal_view">
                                查看
                            </a>
                        </td>
                        <td>
                            <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${list[status.index].financingInformationId}&rateDocumentTempId=${list[status.index].rateDocumentTempId}">下载</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <h4>认证意见</h4>
    <table class="table table-striped table-bordered table-condensed" id="table3">

        <thead>
        <tr>
            <th>序号</th>
            <th>审核时间</th>
            <th>审核人</th>
            <th>初审是否通过</th>
            <th>备注说明</th>
        </tr>
        </thead>
        <c:forEach items="${list3}" varStatus="status" var="p2pBeforeMatchDebtState">
            <tr>
                <td class="modal1">${status.count}</td>
                <td class="modal1">
                    <fmt:formatDate value="${p2pBeforeMatchDebtState.stateTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="modal1">${fns:getUserById(p2pBeforeMatchDebtState.operatorId).name}</td>
                <td class="modal1">
                    <c:choose>
                        <c:when test="${p2pBeforeMatchDebtState.progressStage=='201'}">否</c:when>
                        <c:when test="${p2pBeforeMatchDebtState.progressStage=='300'}">是</c:when>
                    </c:choose>
                </td>
                <td>${p2pBeforeMatchDebtState.handleResult}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
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