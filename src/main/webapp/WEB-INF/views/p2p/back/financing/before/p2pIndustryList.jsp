<%@page import="java.util.*,com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料初审页</title>
    <meta name="decorator" content="default"/>
    <style type="text/css">
        td {
            padding: 0px;
            margin: 0px;
        }
    </style>
    <script>
        $(function () {
            var list = ${json};
            for (i in list) {
                if (list[i].isReject != 0 && list[i].isReject != 1) {
                    $("#cailiaoML" + i).css('color', 'red');
                } else {
                    $("#isReject" + i).find("input[type=radio]").attr('disabled', true);
                    $("#savedOne" + i).find("input[type=button]").attr('disabled', true);
                    //$("#savedOne"+i).find("input[type=button]").eq(i).attr('disabled',true);
                }
            }

            radioChange1();
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

        function issubmit(fiId) {
            //验证是否全部确定
            $.ajax({
                url: '${ctx}/document/p2pRateDocumentUpload/validateIfAuditAll?fiId=' + fiId,
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    if (data.length > 0) {
                        var msg = "";
                        for (i in data) {
                            msg += (data[i].p2pRateDocumentTemplate.tempName + "、").replace("<br/>", "")
                        }
                        msg = msg.substring(0, msg.length - 1);
                        msg += "没有进行确认操作！";
                        swal("操作有误！", msg, "error");
                    } else {
                        /*当认证审核意见为成功时，是否通过不能有否*/
                        var temp = 1;
                        if ($("select").find("option:selected").val() == 1) {
                            var radios = $("input[type='radio']:checked");
                            radios.each(function () {
                                if (this.value == 0) {
                                    temp = 0;
                                }
                            });
                        }

                        if (temp == 1) {
                            swal({
                                title: "确认提交吗？",
                                showCancelButton: true,
                                type: "info",
                            }, function (inputValue) {
                                if (inputValue === false) {
                                    return false;
                                }
                                $("#renzhengFinal").submit();
                            });
                        } else {
                            swal("材料认证有未通过，审核意见不能为通过认证！", "", "error");
                        }
                    }
                },
                error: function () {
                    swal("操作有误！", "", "error");
                }
            });
        }

        function formSubmit(index) {
            if ($("#isReject" + index + " input[type='radio']").eq(0).attr("checked") == "checked" || $("#isReject" + index + " input[type='radio']").eq(1).attr("checked") == "checked") {
                $.ajax({
                    url: '${ctx}/document/p2pRateDocumentAuditRecord/addOne',
                    dataType: 'text',
                    data: $("#formAdd" + index).serialize(),// 你的formid
                    type: 'post',
                    success: function (data) {
                        swal(data, "", "success");
                        $("#cailiaoML" + index).css('color', 'black');
                        $("#isReject" + index).find("input[type=radio]").attr('disabled', true);
                        $("#savedOne" + index).find("input[type=button]").attr('disabled', true);
                    },
                    error: function () {
                        swal("操作有误！", "", "error");
                    }
                });
            } else {
                swal("请选择是否通过初审");
            }
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
        Map<String, List<P2pDocumentUploadRecord>> mapAll = (Map<String, List<P2pDocumentUploadRecord>>) request.getAttribute("mapAll");
        List<String> listStr = new ArrayList<String>();
        List listAll = new ArrayList();
        List listAddress = new ArrayList();
        if (mapAll != null) {
            for (Map.Entry<String, List<P2pDocumentUploadRecord>> entry : mapAll.entrySet()) {
                listStr.add(entry.getKey());
                listAll.add(entry.getValue().size());
                listAddress.add(entry.getValue());
            }
        }
        request.setAttribute("listStr", listStr);
        request.setAttribute("listAll", listAll);
        request.setAttribute("listAddress", listAddress);
        int a = 1;
        int b = 1;
    %>
</head>

<body>
<!-- <h3>材料初审页</h3> -->
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab" id="homehome">
            单位基本资料
        </a>
    </li>
    <li><a href="#ios" data-toggle="tab" id="iosios">财务相关资料</a></li>
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
                <th>审核意见操作</th>
                <th>历史审核记录</th>
                <th>扫描件下载</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" varStatus="status" var="p2pRateDocumentAudit">
                <c:if test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 1}">
                    <tr style="text-align:center;" class="tr1">
                        <!-- 序号 -->
                        <td>
                            <%=a++ %>
                        </td>
                        <!-- 材料目录 -->
                        <td id="cailiaoML${status.index }">
                                ${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempName}
                        </td>
                        <!-- 材料提交说明 -->
                        <td>
                            扫描件
                        </td>
                        <td>
                            <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">
                                    ${listAll[status.index] }
                            </a>
                        </td>
                        <td>
                            <c:if test="${empty list}">待提交</c:if>
                            <c:if test="${not empty list}">
                                已提交
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${list[status.index].uploadTime}" pattern="yyyy-MM-dd"/>
                        </td>
                        <form action="${ctx}/document/p2pRateDocumentAuditRecord/addOne" id="formAdd${status.index }"
                              method="post">
                            <td id="isReject${status.index }">
                                <input type="hidden" value="${list[status.index].id}" name="id">
                                <input type="hidden" value="${list[status.index].financingInformationId}"
                                       name="financingInformationId">
                                <c:choose>
                                    <c:when test="${list[status.index].isReject == 0 }">
                                        <input type="radio" name="isReject" value="1"/>是
                                        <input type="radio" name="isReject" checked="checked" value="0"/>否
                                    </c:when>
                                    <c:when test="${list[status.index].isReject == 1 }">
                                        <input type="radio" name="isReject" checked="checked" value="1"/>是
                                        <input type="radio" name="isReject" value="0"/>否
                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" name="isReject" checked="checked" value="1"/>是
                                        <input type="radio" name="isReject" value="0"/>否
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <textarea class="mytextarea" id="rejectReason1" name="rejectReason"
                                          disabled="disabled">${list[status.index].rejectReason}</textarea>
                            </td>
                            <td id="savedOne${status.index }">
                                <input onclick="formSubmit(${status.index})" type="button" class="btn btn-primary"
                                       value="保存"/>
                            </td>
                        </form>
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
    <!-- 单位基本资料列表结束 -->
    <div class="tab-pane fade" id="ios">
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
                <th>审核意见操作</th>
                <th>历史审核记录</th>
                <th>扫描件下载</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" varStatus="status" var="p2pRateDocumentAudit">
                <c:if test="${p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 2 || p2pRateDocumentAudit.p2pRateDocumentTemplate.tempType == 3}">
                    <tr style="text-align:center;" class="tr2">
                        <!-- 序号 -->
                        <td>
                            <%=b++ %>
                        </td>
                        <!-- 材料目录 -->
                        <td id="cailiaoML${status.index }">
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
                            <a onclick="imgViews('${list[status.index].financingInformationId}','${list[status.index].rateDocumentTempId}')">
                                    ${listAll[status.index] }
                            </a>
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
                        <form action="${ctx}/document/p2pRateDocumentAuditRecord/addOne" id="formAdd${status.index }"
                              method="post">
                            <td id="isReject${status.index }">
                                <input type="hidden" value="${list[status.index].id}" name="id">
                                <input type="hidden" value="${list[status.index].financingInformationId}"
                                       name="financingInformationId">
                                <c:choose>
                                    <c:when test="${list[status.index].isReject == 0 }">
                                        <input type="radio" name="isReject" value="1"/>是
                                        <input type="radio" name="isReject" checked="checked" value="0"/>否
                                    </c:when>
                                    <c:when test="${list[status.index].isReject == 1 }">
                                        <input type="radio" name="isReject" checked="checked" value="1"/>是
                                        <input type="radio" name="isReject" value="0"/>否
                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" name="isReject" checked="checked" value="1"/>是
                                        <input type="radio" name="isReject" value="0"/>否
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <textarea class="mytextarea" name="rejectReason"
                                          disabled="disabled">${list[status.index].rejectReason}</textarea>
                            </td>
                            <td id="savedOne${status.index }">
                                <input onclick="formSubmit(${status.index})" type="button" class="btn btn-primary"
                                       value="保存"/>
                            </td>
                        </form>
                        <td>
                            <a onclick="model_eidt('${list[status.index].id}');" href="" data-toggle="modal"
                               data-target="#myModal_view">
                                查看
                            </a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${list[status.index].p2pRateDocumentTemplate.tempName != '借贷产品基本信息'}">
                                    <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${list[status.index].financingInformationId}&rateDocumentTempId=${list[status.index].rateDocumentTempId}">下载</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)">--</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>

    </div>
    <form action="${ctx}/financing/p2pBeforeMatchDebtState/renzhengFinal" id="renzhengFinal" method="post">
        <input type="hidden" name="finacingInformationId" value="${list[0].financingInformationId}">
        <input type="hidden" name="paymentId" value="${paymentId}">
        <h4>审核意见</h4>
        <table class="table table-striped table-bordered table-condensed opinion" id="table3">
            <tr>
                <td>是否认证通过</td>
                <td>
                    <select class="input-medium-select" name="progress_stage">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </td>
                <td>备注说明（选填）</td>
                <td>
                    <textarea rows="4" name="handleResult" id="handleResult" style="width:80%;"></textarea>
                </td>
            </tr>
            <tr>
                <td>审核人</td>
                <td><input type="hidden" name="operatorId"
                           value="${fns:getUser().id}"/> ${fns:getUser().name}</td>
                <td>评审时间</td>
                <td><input name="stateTime" type="text" readonly="readonly"
                           maxlength="20" class="input-medium Wdate"
                           value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/></td>
            </tr>
        </table>
        <input id="btnSubmit03" onclick="issubmit('${list[0].financingInformationId}')" class="btn btn-primary"
               type="button" value="提交"/>
    </form>
</div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog" style="width:430px;"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
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
<div class="modal fade" id="model_enterpriseBaseInfo" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;width:800px;margin-left: -400px"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
</body>
</html>