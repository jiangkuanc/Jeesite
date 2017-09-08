<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业认证审核页</title>
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

            $("img").click(function () {
                var src = this.src;
                ;
                modelView(src)
            });

            /*************单独验证是否通过*******************************************/
            bindOnInput(3);
            radioChange();

            /*如果已经认证成功或失败，则查看，失败或待认证，则可以操作*/
            if (${p2pEnterpriseCertify.auditState == 1||p2pEnterpriseCertify.auditState == 2}) {
                $("input[type='radio']").attr("disabled", "disabled");
                $("textarea").attr("disabled", "disabled");
            } else {
                $("#auditOpinion").show();
            }
        });

    </script>

</head>
<body>
<h3>企业资格认证审核页</h3>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>单位类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.unitType, 'unit_type', '')}</td>
        <td>证件类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateType, 'certificate_type', '')}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${p2pEnterpriseCertify.enterpriseName}</td>
        <td>统一社会信用代码（营业执照注册号）</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
    </tr>
    <c:if test="${p2pEnterpriseCertify.certificateType == 0 }">
        <tr>
            <td>组织机构代码</td>
            <td>${p2pEnterpriseCertify.organizationCode}</td>
            <td>税务登记证号</td>
            <td>${p2pEnterpriseCertify.taxRegistrationNum}</td>
        </tr>
    </c:if>
    <tr>
        <td>证照所在地</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')}</td>
        <td>营业期限</td>
        <td><c:choose><c:when test="${p2pEnterpriseCertify.isLongTerm==1 }">长期</c:when><c:otherwise><fmt:formatDate
                value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd"/></c:otherwise></c:choose>
        </td>
    </tr>
    <tr>
        <td>注册地址</td>
        <td>${p2pEnterpriseCertify.registeredAddress}</td>
        <td>注册资金</td>
        <td>${p2pEnterpriseCertify.registeredCapital}</td>
    </tr>
    <tr>
        <td>营业范围</td>
        <td>${p2pEnterpriseCertify.businessScope}</td>
        <td>联系电话</td>
        <td>${p2pEnterpriseCertify.telephoneNum}</td>
    </tr>
    <tr>
        <td>代理人是否为法人</td>
        <td>
            ${fns:getDictLabel(p2pEnterpriseCertify.isEntLegalRep, 'is_ent_legal_rep', '')}</td>
        <td>传真</td>
        <td>${p2pEnterpriseCertify.faxNum}</td>
    </tr>
    </tbody>
</table>
<form id="submitForm" action="${ctx}/user/p2pEnterpriseCertify/backEnterpriseCertify" method="post">
    <h4>企业认证材料</h4>
    <table id="contentTable" class="table table-striped table-bordered table-condensed regUserCertify">
        <thead>
        <tr>
            <th>序号</th>
            <th>材料类型</th>
            <th>材料名称</th>
            <th>材料预览</th>
            <th>提交时间</th>
            <th>是否通过</th>
            <th>驳回意见</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td rowspan="2">法人身份证</td>
            <td>身份证正面</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.idCardFront }"></td>
            <td><fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="idCardFront" type="hidden" value="${p2pEnterpriseCertify.idCardFront}"/>
                <c:choose>
                    <c:when test="${p2pEnterpriseCertify.frontIsReject == 0 }">
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
                          disabled="disabled">${p2pEnterpriseCertify.frontRejectReason}</textarea></td>
        </tr>
        <tr>
            <td>2</td>
            <td>身份证背面</td>
            <td><img style="width:100px"
                     src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.idCardBack }"></td>
            <td><fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input name="idCardBack" type="hidden" value="${p2pEnterpriseCertify.idCardBack}"/>
                <c:choose>
                    <c:when test="${p2pEnterpriseCertify.backIsReject == 0 }">
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
                          disabled="disabled">${p2pEnterpriseCertify.backRejectReason}</textarea></td>
        </tr>


        <tr>
            <td>1</td>
            <td>企业信息认证</td>
            <td>营业执照副本扫描件</td>
            <td>
                <a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense }')">
                    营业执照彩色扫描件</a></td>
            <td>
                <fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <input name="businessLicense" type="hidden" value="${p2pEnterpriseCertify.businessLicense}"/>
                <c:choose>
                    <c:when test="${p2pEnterpriseCertify.licenseIsReject == 0 }">
                        <input type="radio" name="licenseIsReject" value="1"/>是
                        <input type="radio" name="licenseIsReject" checked="checked" value="0"/>否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="licenseIsReject" checked="checked" value="1"/>是
                        <input type="radio" name="licenseIsReject" value="0"/>否
                    </c:otherwise>
                </c:choose>
            </td>
            <td><textarea class="mytextarea" id="rejectReason3" name="licenseRejectReason"
                          disabled="disabled"> ${p2pEnterpriseCertify.licenseRejectReason}</textarea></td>
        </tr>

        </tbody>
    </table>
    <div id="auditOpinion" style="display: none">
        <h4>认证意见</h4>

        <input name="auditType" type="hidden" value="${fns:getDictValue('企业认证', 'audit_type', '')}"/>
        <input name="referenceId" type="hidden" value="${p2pEnterpriseCertify.id}"/> <!-- 企业认证表id -->
        <table id="contentTable" class="table table-striped table-bordered table-condensed opinion">
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