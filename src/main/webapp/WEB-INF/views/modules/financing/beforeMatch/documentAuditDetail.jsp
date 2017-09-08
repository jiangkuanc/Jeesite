<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料审核详情</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">
        $(document).ready(function () {

            if (${flag == 1}) {
                $("input[value='保存']").attr("disabled", "disabled");
                $("input[type='radio']").attr("disabled", "disabled");
                $("textarea").attr("disabled", "disabled");

                $("#auditOpinion").empty().append("${fns:getDictLabel(p2pApplicationDocuments.auditOpinion, 'audit_opinion', '')}");
                //$("#auditOpinion2").empty().append("${fns:getDictLabel(p2pApplicationDocuments.auditOpinion, 'audit_opinion', '')}");
                $("#auditReason").empty().append("${p2pApplicationDocuments.auditReason}");
                $("#auditTime").empty().append("<fmt:formatDate value='${p2pApplicationDocuments.auditTime }' pattern='yyyy-MM-dd HH:mm:ss' />");
                $("#auditPersonId").empty().append("${p2pApplicationDocuments.user.name}");
                $("#button").empty();
                if (${p2pApplicationDocuments.auditOpinion==202}) {
                    $("#auditOpinion").empty();
                    $("#auditReason").empty();
                    $("#auditTime").empty();
                    $("#auditPersonId").empty();
                    $("#button").empty();
                }

            }
            if (${flag == 2}) {
                $("#button").show();
                var textarea = "";
                $("textarea").each(function () {
                    textarea += this.value;
                });
                $("textarea[name='auditReason']").val(textarea);
            }

            $("#submitForm").validate({
                rules: {
                    auditReason: "required"

                },
                messages: {
                    auditReason: "不能为空"
                },

                submitHandler: function (form) {
                    /*当认证审核意见为成功时，是否通过不能有否*/
                    var temp = 1;
                    if ($("select").find("option:selected").val() == 203) {
                        var radios = $("input[type='radio']:checked");
                        radios.each(function () {
                            if (this.value == 0) {
                                temp = 0;
                            }
                        });
                    }
                    if (temp == 1) {
                        /*********提交审核意见前提交每一个材料意见*********/
                        for (var i = 0; i <=${fn:length(p2pRateDocumentTemplateList)}; i++) {
                            var isReject = $("input[name='isReject" + this.id + "']:checked").val();
                            var reason = $("#rejectReason" + this.id).val();
                            var id = $("#id" + this.id).val();
                            $.ajax({
                                type: 'POST',
                                url: '${ctx}/financing/saveSingleDocument',
                                data: {
                                    isReject: isReject,
                                    reason: reason,
                                    id: id
                                },
                                dataType: 'text',
                                success: function (data) {
                                    //swal(data, "","success");
                                },
                                error: function (data) {
                                    //swal("保存失败！", "","error");
                                }
                            });
                        }

                        swal({
                            title: "确认提交吗？",
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            form.submit();
                        });
                    } else {
                        swal("材料有未通过，审核意见不能成功！", "", "error");
                    }

                }
            });

            /*************单独验证是否通过*******************************************/
            bindOnInput(${fn:length(p2pRateDocumentTemplateList)});
            radioChange();

            $("input[value='保存']").click(function () {
                var isReject = $("input[name='isReject" + this.id + "']:checked").val();
                var reason = $("#rejectReason" + this.id).val();
                var id = $("#id" + this.id).val();
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/financing/saveSingleDocument',
                    data: {
                        isReject: isReject,
                        reason: reason,
                        id: id
                    },
                    dataType: 'text',
                    success: function (data) {
                        swal(data, "", "success");
                    },
                    error: function (data) {
                        swal("保存失败！", "", "error");
                    }
                });
            });

        });

    </script>
</head>

<body>
<h3>审核信息</h3>

<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pEnterpriseCertify.enterpriseName}</td>
        <td>企业组织机构代码</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
    </tr>
    <tr>
        <td>注册号</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
        <td>企业法人</td>
        <td>${p2pEnterpriseCertify.nameOf}</td>
    </tr>
    <tr>
        <td>注册资本</td>
        <td>${p2pEnterpriseCertify.registeredCapital}</td>
        <td>企业类型</td>
        <td>
            ${fns:getDictLabel(fic:getEnterpriseNature(p2pEnterpriseCertify.user.id), 'enterprise_nature', '')}</td>
    </tr>
    <tr>
        <td>经营范围</td>
        <td>${p2pEnterpriseCertify.businessScope}</td>
        <td>对公账户</td>
        <td>——</td>
    </tr>
    <tr>
        <td>实际控制人姓名</td>
        <td>——</td>
        <td>实际控制人身份证号码</td>
        <td>——</td>
    </tr>
    <tr>
        <td>代理人姓名</td>
        <td>${p2pEnterpriseCertify.p2pRegUserCertify.realName}</td>
        <td>代理人身份证号码</td>
        <td>${p2pEnterpriseCertify.p2pRegUserCertify.idNumber}</td>
    </tr>
    </tbody>
</table>
<h4>材料信息</h4>


<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>序号</th>
        <th>材料目录</th>
        <th>材料提交说明</th>
        <th>是否必填</th>
        <th>提交情况</th>
        <th>提交时间</th>
        <th>是否通过初审</th>
        <th>不通过意见</th>
        <th>意见操作</th>
        <th>扫描件查看或下载</th>
    </tr>

    <c:forEach items="${p2pRateDocumentTemplateList }" var="p2pRateDocumentTemplate" varStatus="status">
        <tr>
            <!-- 序号 -->
            <td>${status.count }</td>
            <!-- 材料目录 -->
            <td>${p2pRateDocumentTemplate.name }</td>
            <!-- 材料提交说明  -->
            <td>扫描件</td>
            <!-- 是否必填 -->
            <td>${fns:getDictLabel(p2pRateDocumentTemplate.isRequired, 'yes_no', '')} </td>
            <!-- 提交情况 -->
            <td>
                <c:set var="temp" value="0"></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id}">
                        <c:set var="temp" value="1"></c:set>
                    </c:if>
                </c:forEach>
                <c:if test="${temp == 1 }">已提交</c:if>
                <c:if test="${temp == 0 }">未提交</c:if>
            </td>
            <!-- 提交时间 -->
            <td>
                <c:set var="temp" value="0"></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id && temp == 0}">
                        <c:set var="temp" value="1"></c:set>
                        <fmt:formatDate value="${document.time }" pattern="yyyy-MM-dd hh:mm:ss"/>
                    </c:if>
                </c:forEach>
            </td>
            <!-- 是否通过初审 -->
            <td>
                <c:set var="temp" value="0"></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id && temp == 0}">
                        <c:set var="temp" value="1"></c:set>
                        <input type="hidden" name="id" value="${document.id}"/>
                        <c:choose>
                            <c:when test="${document.isReject == 0 }">
                                <input type="radio" name="isReject${status.count }" value="1"/>是
                                <input type="radio" name="isReject${status.count }" checked="checked" value="0"/>否
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="isReject${status.count }" checked="checked" value="1"/>是
                                <input type="radio" name="isReject${status.count }" value="0"/>否
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
            </td>
            <!-- 不通过意见 -->
            <td>
                <c:set var="temp" value="0"></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id && temp == 0}">
                        <c:set var="temp" value="1"></c:set>
                        <c:choose>
                            <c:when test="${document.isReject == 0 }">
                                <textarea class="mytextarea" id="rejectReason${status.count }"
                                          name="reason">${document.reason }</textarea>
                            </c:when>
                            <c:otherwise>
                                <textarea class="mytextarea" id="rejectReason${status.count }" name="reason"
                                          disabled="disabled">${document.reason }</textarea>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

            </td>
            <!-- 意见操作 -->
            <td>
                <c:set var="temp" value="0"></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id && temp == 0}">
                        <c:set var="temp" value="1"></c:set>
                        <input id="id${status.count }" type="hidden" value="${document.id }"/>
                        <input id="${status.count }" class="btn btn-primary" type="button" value="保存"/>
                    </c:if>
                </c:forEach>
            </td>
            <!-- 扫描件查看或下载 -->
            <td>
                <c:set var="address" value=""></c:set>
                <c:forEach items="${p2pRateDocumentUploadList }" var="document">
                    <c:if test="${document.rateDocumentId == p2pRateDocumentTemplate.id}">
                        <c:choose>
                            <c:when test="${address == ''}">
                                <c:set var="address"
                                       value="${pageContext.request.contextPath}/${document.address }"></c:set>
                            </c:when>
                            <c:otherwise>
                                <c:set var="address"
                                       value="${address},${pageContext.request.contextPath}/${document.address }"></c:set>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <c:if test="${address != ''}">
                    <a onclick="modelViews('${ctx}/image/test?path=${fns:getConfig('filePath')}${address}')">
                        查看</a>
                    <a href="${ctx}/financing/downloads?address=${address}">
                        下载</a>
                </c:if>

            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<h4>审核意见</h4>
<form id="submitForm" action="${ctx}/financing/documentsAudit"
      method="post">
    <input name="id" type="hidden" value="${p2pApplicationDocuments.id }"/>
    <input name="financingInformationId" type="hidden"
           value="${p2pApplicationDocuments.financingInformationId }"/>
    <sys:message content="${message}"/>
    <div class="form-group">
        <table class="table table-striped table-bordered table-condensed opinion">
            <tbody>
            <tr>
                <td>审核意见</td>
                <td id="auditOpinion"><select name="auditOpinion"
                                              class="input-medium-select form-control">
                    <%--<c:forEach items="${fns:getDictList('audit_opinion')}"
                        var="item">
                        <option value="${item.value }">${item.label }</option>
                    </c:forEach>--%>
                    <option value="203">通过</option>
                    <option value="201">不通过</option>
                </select>
                </td>
                <td>说明</td>
                <td id="auditReason"><textarea name="auditReason"
                                               class="form-control"></textarea><span id="auditReasonMessage"></span>
                </td>
            </tr>
            <tr>
                <td>审核时间</td>
                <td id="auditTime"><input name="auditTime" type="text"
                                          readonly="readonly" maxlength="20" class="input-medium Wdate "
                                          value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/>
                </td>
                <td>审核人</td>
                <td id="auditPersonId"><input type="hidden"
                                              name="auditPersonId" value="${fns:getUser().id}"/>
                    ${fns:getUser().name}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row" style="display: none" id="button">
        <div class="text-center">
            <input id="btnCancel" class="btn btn-primary" type="button"
                   value="取消" onclick="history.go(-1)"/> <input id="btnSubmit"
                                                                class="btn btn-primary" type="submit" value="确定"/>
        </div>

    </div>
</form>
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
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>
</html>