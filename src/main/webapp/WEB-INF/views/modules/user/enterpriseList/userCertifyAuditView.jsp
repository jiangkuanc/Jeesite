<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>身份认证审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    auditResult: {
                        required: true,
                        maxlength: 200
                    }
                },
                messages: {
                    auditResult: {
                        required: true,
                        maxlength: "不能超过200个字符"
                    }
                },

                submitHandler: function (form) {
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
                            form.submit();
                        });
                    } else {
                        swal("身份信息认证有未通过，审核意见不能成功！", "", "error");
                    }

                }
            });
            /*如果已经认证成功，则查看，失败或待认证，则可以操作*/
            if (${p2pRegUserCertify.auditState == 1 || p2pRegUserCertify.auditState == 2 }) {
                $("input[type='radio']").attr("disabled", "disabled");
                $("textarea").attr("disabled", "disabled");

            } else {
                $("#auditOpinion").show();
            }


            $("img").click(function () {
                var src = this.src;
                ;
                modelView(src)
            });

            /*************单独验证是否通过*******************************************/
            bindOnInput(4);
            radioChange();
        });

    </script>

</head>
<body>
<h3>企业代理人身份认证审核页</h3>
<h4>代理人身份信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>代理人姓名</td>
        <td>${p2pRegUserCertify.realName}</td>
        <td>代理人身份证号</td>
        <td>${p2pRegUserCertify.idNumber }</td>
        <td>实名认证状态</td>
        <td>${fns:getDictLabel(p2pRegUserCertify.autoCertifyState, 'yes_no', '')}</td>
    </tr>
    </tbody>
</table>
<form id="submitForm" action="${ctx}/user/p2pRegUserCertify/backUserCertify" method="post">
    <h4>身份信息认证</h4>
    <table id="contentTable" class="table table-striped table-bordered table-condensed regUserCertify">
        <thead>
        <tr>
            <th>序号</th>
            <th>材料类型</th>
            <th>代理人提交材料名称</th>
            <th>材料预览</th>
            <th>提交时间</th>
            <th>是否通过</th>
            <th>驳回意见</th>
            <%--	<th>到期时间</th>
            --%></tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td rowspan="3">身份证</td>
            <td>身份证正面</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardFront }"></td>
            <td><fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="idCardFront" type="hidden" value="${p2pRegUserCertify.idCardFront}"/>
                <c:choose>
                    <c:when test="${p2pRegUserCertify.frontIsReject == 0 }">
                        <input type="radio" name="frontIsReject" value="1"/>是
                        <input type="radio" name="frontIsReject" checked="checked" value="0"/>否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="frontIsReject" checked="checked" value="1"/>是
                        <input type="radio" name="frontIsReject" value="0"/>否
                    </c:otherwise>
                </c:choose>
            </td>
            <td><textarea class="mytextarea" id="rejectReason1" name="frontRejectReason"
                          disabled="disabled">${p2pRegUserCertify.frontRejectReason}</textarea></td>
            <%--  <td>——</td>
          --%></tr>
        <tr>
            <td>2</td>
            <td>身份证背面</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardBack }"></td>
            <td><fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="idCardBack" type="hidden" value="${p2pRegUserCertify.idCardBack}"/>
                <c:choose>
                    <c:when test="${p2pRegUserCertify.backIsReject == 0 }">
                        <input type="radio" name="backIsReject" value="1"/>是
                        <input type="radio" name="backIsReject" checked="checked" value="0"/>否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="backIsReject" checked="checked" value="1"/>是
                        <input type="radio" name="backIsReject" value="0"/>否
                    </c:otherwise>
                </c:choose>
            </td>
            <td><textarea class="mytextarea" id="rejectReason2" name="backRejectReason"
                          disabled="disabled">${p2pRegUserCertify.backRejectReason}</textarea></td>
            <%--    <td>——</td>
          --%></tr>
        <tr>
            <td>3</td>
            <td>手持身份证</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardInhand }"></td>
            <td><fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="idCardInhand" type="hidden" value="${p2pRegUserCertify.idCardInhand}"/>
                <c:choose>
                    <c:when test="${p2pRegUserCertify.inhandIsReject == 0 }">
                        <input type="radio" name="inhandIsReject" value="1"/>是
                        <input type="radio" name="inhandIsReject" checked="checked" value="0"/>否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="inhandIsReject" checked="checked" value="1"/>是
                        <input type="radio" name="inhandIsReject" value="0"/>否
                    </c:otherwise>
                </c:choose>
            </td>
            <td><textarea class="mytextarea" id="rejectReason3" name="inhandRejectReason"
                          disabled="disabled">${p2pRegUserCertify.inhandRejectReason}</textarea></td>
            <%--    <td>——</td>
            --%></tr>
        <tr>
            <td>4</td>
            <td>委托书</td>
            <td>企业委托书扫描件</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.powerOfAttorney }">
            </td>
            <td><fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="powerOfAttorney" type="hidden" value="${p2pRegUserCertify.powerOfAttorney}"/>
                <c:choose>
                    <c:when test="${p2pRegUserCertify.attorneyIsReject == 0 }">
                        <input type="radio" name="attorneyIsReject" value="1"/>是
                        <input type="radio" name="attorneyIsReject" checked="checked" value="0"/>否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="attorneyIsReject" checked="checked" value="1"/>是
                        <input type="radio" name="attorneyIsReject" value="0"/>否
                    </c:otherwise>
                </c:choose>
            </td>
            <td><textarea class="mytextarea" id="rejectReason4" name="attorneyRejectReason"
                          disabled="disabled">${p2pRegUserCertify.attorneyRejectReason}</textarea></td>
            <%--  <td>——</td>
          --%></tr>
        </tbody>
    </table>
    <div id="auditOpinion" style="display: none" class="opinion">
        <h4>认证意见</h4>

        <input name="auditType" type="hidden" value="${fns:getDictValue('身份认证', 'audit_type', '')}"/>
        <input name="referenceId" type="hidden" value="${p2pRegUserCertify.id}"/> <!-- 企业认证表id -->
        <table id="contentTable" class="table table-striped table-bordered table-condensed">
            <tr>
                <td>认证审核意见</td>
                <td>
                    <select name="auditOpinion" class="input-medium-select">
                        <%--<c:forEach items="${fns:getDictList('audit_state')}" var="item">
                            <option value="${item.value }">${item.label }</option>
                        </c:forEach>--%>
                        <option value="1" selected="selected">成功</option>
                        <option value="2">失败</option>
                    </select>
                </td>
                <td>说明<b style="color:#C1181D;font-size:16px;">&nbsp*</b></td>
                <td><textarea name="auditResult"></textarea></td>
            </tr>
            <tr>
                <td>操作人</td>
                <td><input type="hidden" name="auditPersonId"
                           value="${fns:getUser().id}"/> ${fns:getUser().name}</td>
                <td>操作时间</td>
                <td><input name="auditTime" type="text" readonly="readonly"
                           maxlength="20" class="input-medium Wdate "
                           value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/></td>
            </tr>
        </table>
        <div class="row" id="button">
            <div class="text-center">

                <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
                <input id="btnCancel" class="btn btn-primary" type="button"
                       value="取消" onclick="history.go(-1)"/>
            </div>
        </div>

    </div>
</form>
<h4>认证历史记录</h4>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>认证类别</th>
        <th>认证意见</th>
        <th>原因</th>
        <th>审核人</th>
        <th>审核时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pAuditRecord">
        <tr>
            <td>${status.count }</td>
            <td>${fns:getDictLabel(p2pAuditRecord.auditType, 'audit_type', '')}</td>
            <td>${fns:getDictLabel(p2pAuditRecord.auditOpinion, 'audit_state', '')}</td>
            <td>${p2pAuditRecord.auditResult }</td>
            <td>${p2pAuditRecord.user.name}</td>
            <td><fmt:formatDate value="${p2pAuditRecord.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
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