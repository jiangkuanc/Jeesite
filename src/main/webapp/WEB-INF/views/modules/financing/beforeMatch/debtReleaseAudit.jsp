<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>债项发布审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    handleResult: "required"

                },
                messages: {
                    handleResult: "不能为空"
                },

                submitHandler: function (form) {
                    swal({
                        title: "确认发布吗？",
                        showCancelButton: true,
                        type: "info",
                    }, function (inputValue) {
                        if (inputValue === false) {
                            return false;
                        }
                        form.submit();
                    });

                }
            });

            if (${flag == 1}) {
                var text = $("#caozuo1").text();
                $("td[id='caozuo']").empty().append(text);
                $("td[id='handleResult']").empty().append("${p2pBeforeMatchDebtState.handleResult}");
                $("td[id='stateTime']").empty().append("<fmt:formatDate value='${p2pBeforeMatchDebtState.stateTime }' pattern='yyyy-MM-dd HH:mm:ss' />");
                $("td[id='operatorId']").empty().append("${p2pBeforeMatchDebtState.user.name}");
                $("#button").empty();
            }
            ;
            if (${flag == 2}) {
                $("#button").show();
            }
        });
    </script>
</head>

<body>

<h3>发布债项审核页</h3>

<h4>债项信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${fi.enterpriseName}</td>
        <td>债项名称</td>
        <td>${fi.finacingName }</td>
    </tr>
    <tr>
        <td>申请金额</td>
        <td><c:if test="${!empty fi.financingAmount}">${fi.financingAmount}元</c:if></td>
        <td>融资期限</td>
        <td><c:if test="${!empty fi.raiseTimeLimit}">${fi.raiseTimeLimit}天</c:if></td>
    </tr>
    <tr>
        <td>申请人</td>
        <td>${regUserCertify.realName }</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(fi.repaymentMode,'repayment_mode','')}</td>
    </tr>
    <tr>
        <td>申请利率</td>
        <td>${fi.applicationRate }</td>
        <td>申请利率还款金额</td>
        <td><c:if test="${!empty applyAmount}">${applyAmount}元</c:if></td>
    </tr>
    <tr>
        <td>借款时长</td>
        <td><c:if test="${!empty fi.financingMaturity }">${fi.financingMaturity }个月</c:if></td>
        <td>实际利率还款金额</td>
        <td><c:if test="${!empty fic:getRepaymentAmount(fi)}">${fic:getRepaymentAmount(fi)}元</c:if></td>
    </tr>
    <tr>
        <td>借款用途类别</td>
        <td>${fns:getDictLabel(fi.purposeClassification,'purpose_classification','')}</td>
        <td>用途说明</td>
        <td>${fi.purposeExplain}</td>
    </tr>
    <tr>
        <td>第一笔还款来源</td>
        <td>${fi.repaymentFirstSource}</td>
        <td>第二笔还款来源</td>
        <td>${fi.repaymentSecondSource}</td>
    </tr>
    <tr>
        <td>第三笔还款来源</td>
        <td>${fi.repaymentThirdSource}</td>
        <td>其他还款来源</td>
        <td>${fi.repaymentOtherSource}</td>
    </tr>
    <tr>
        <td>是否担保</td>
        <td>${fns:getDictLabel(fi.isGuarantee,'is_guarantee','')}</td>
        <td>债项状态</td>
        <td>${fns:getDictLabel(fi.currentStage,'progress_stage','')}</td>
    </tr>
    </tbody>
</table>
<h4>评级信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th></th>
        <th>级别</th>
        <th>利率</th>
        <th>评级报告</th>
        <th>发布时间</th>
    </tr>
    <tr>
        <td>大公评级</td>
        <td>${fri.ratingLevel }</td>
        <td>${fri.recommendedRate }</td>
        <td><a href="${ctx}/financing/download?address=${fri.creditReport }">下载</a></td>
        <td><fmt:formatDate
                value="${fri.publishTime }"
                pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
    </tr>
    <tr>
        <td>用户选择的级别和利率</td>
        <td>——</td>
        <td>${fi.applicationRate }</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<h4>发布意见</h4>
<form id="submitForm" action="${ctx}/financing/debtReleaseSubmit" method="post" class="opinion">
    <input name="finacingInformationId" type="hidden" value="${fi.id}"/>
    <sys:message content="${message}"/>
    <table class="table table-striped table-bordered table-condensed">
        <tbody>
        <tr>
            <td>操作</td>
            <td id="caozuo"><select name="paymentStatus" class="input-medium-select">
                <option id="caozuo1" value="500">发布</option>
            </select></td>
            <td>说明</td>
            <td id="handleResult"><textarea name="handleResult"></textarea>
            </td>
        </tr>
        <tr>
            <td>发布时间</td>
            <td id="stateTime"><input name="stateTime" type="text" readonly="readonly"
                                      maxlength="20" class="input-medium Wdate "
                                      value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/>
            </td>
            <td>发布人</td>
            <td id="operatorId"><input type="hidden" name="operatorId"
                                       value="${fns:getUser().id}"/> ${fns:getUser().name}</td>
        </tr>
        </tbody>
    </table>
    <div class="row" style="display: none" id="button">
        <div class="text-center">

            <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
            <input id="btnCancel" class="btn btn-primary" type="button"
                   value="取消" onclick="history.go(-1)"/>
        </div>

    </div>
</form>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>
</html>