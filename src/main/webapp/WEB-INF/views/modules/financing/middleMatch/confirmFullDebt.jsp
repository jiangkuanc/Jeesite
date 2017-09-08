<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>满标确标审核</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    handleResult: "required",
                    investorAccount: "required",
                    givingOutAmount: {
                        required: true,
                        number: true,
                        equalTo: "#financingAmount"
                    },
                    givingOutTime: "required",
                    financierAccount: "required",
                    receiveAmount: {
                        required: true,
                        number: true,
                        equalTo: "#givingOutAmount"

                    },
                    receiveAmountTime: {
                        required: true
                    }
                },
                messages: {
                    handleResult: "不能为空",
                    investorAccount: "不能为空",
                    givingOutAmount: {
                        required: "不能为空",
                        number: "必须输入数字",
                        equalTo: "必须与投资金额一致"

                    },
                    givingOutTime: "不能为空",
                    financierAccount: "不能为空",
                    receiveAmount: {
                        required: "不能为空",
                        number: "必须输入数字",
                        equalTo: "金额必须一致"

                    },
                    receiveAmountTime: {
                        required: "不能为空"
                    }
                },

                submitHandler: function (form) {
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

                }
            });

            if (${flag == 1}) {
                $("#submitDiv").show();
                var text = $("#caozuo1").text();
                $("td[id='caozuo']").empty().append(text);
                $("td[id='handleResult']").empty().append("${p2pBeforeMatchDebtState.handleResult}");
                $("td[id='stateTime']").empty().append("<fmt:formatDate value='${p2pBeforeMatchDebtState.stateTime }' pattern='yyyy-MM-dd HH:mm:ss' />");
                $("td[id='operatorId']").empty().append("${fns:getUserById(p2pBeforeMatchDebtState.operatorId).name}");
                $("#button").empty();
            }
            ;
            if (${flag == 2}) {
                $("#submitDiv").show();
                $("#button").show();
            }
        });
    </script>
</head>

<body>
<h3>满标确标审核</h3>
<h4>债项基本信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>债项编号</th>
        <th>债项名称</th>
        <th>企业名称</th>
        <th>债项额度（元）</th>
        <th>债项类型</th>
        <th>期限（月）</th>
        <th>还款方式</th>
    </tr>
    <tr>
        <td>${fi.id}</td>
        <td>${fi.finacingName }</td>
        <td>${fi.enterpriseName }</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount }</fmt:formatNumber></td>
        <td>信用标</td>
        <td>${fi.financingMaturity }</td>
        <td>${fns:getDictLabel(fi.repaymentMode, 'repayment_mode', '')}</td>
    </tr>
    <tr>
        <th>债项评级</th>
        <th>债项利率</th>
        <th>发布时间</th>
        <th>到期时间</th>
        <th>债项状态</th>
        <th>已募集金额（元）</th>
        <th>剩余募集金额（元）</th>
    </tr>
    <tr>
        <td>${fi.p2pFinancingRatingInfo.ratingLevel }</td>
        <td>${fi.p2pFinancingRatingInfo.recommendedRate*100 }%</td>
        <td><fmt:formatDate value="${fi.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td><fmt:formatDate value="${fi.raiseDeadTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>${fns:getDictLabel(fi.currentStage, 'progress_stage', '')}</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.hasRaiseAmount }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.restRaiseMoney}</fmt:formatNumber></td>
    </tr>

    </tbody>
</table>
<h4>投资记录</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>序号</th>
        <th>时间</th>
        <th>投资人</th>
        <th>投资人类型</th>
        <th>投资金额（元）</th>
        <th>放款凭证</th>
    </tr>
    <c:forEach items="${page.list }" var="ii" varStatus="status">
        <tr>
            <td>${status.count }</td>
            <td><fmt:formatDate value="${ii.investmentAgreementTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${ii.user.name }</td>
            <td>${fns:getDictLabel(ii.user.p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
            <td><fmt:formatNumber pattern="#,##0.00">${ii.investmentAmount }</fmt:formatNumber>
                <input type="text" style="display: none" id="financingAmount" value="${ii.investmentAmount }"/>
            </td>

            <td>——</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="submitDiv" style="display: none">
    <h4>确标意见</h4>

    <form id="submitForm" action="${ctx}/financing/confirmFullDebtSubmit" method="post" class="opinion">

        <input name="financingInformationId" type="hidden" value="${fi.id}"/>
        <input name="investmentInformationId" type="hidden" value="${page.list[0].id }"/>
        <input name="givingOutPerson" type="hidden" value="${page.list[0].user.id }"/>
        <input name="receiveAmoutPerson" type="hidden" value="${fi.applicantsId}"/>
        <table class="table table-striped table-bordered table-condensed">
            <tbody>
            <tr>
                <td>投资人账户</td>
                <td><input name="investorAccount" type="text"/></td>
                <td>放款金额（元）</td>
                <td><input id="givingOutAmount" name="givingOutAmount" type="text"/></td>
                <td>放款时间</td>
                <td>
                    <input name="givingOutTime" type="date" readonly="readonly" maxlength="20"
                           class="input-medium Wdate"
                           value="<fmt:formatDate value="${timeOfPayment}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                </td>
            </tr>
            <tr>
                <td>融资人账户</td>
                <td><input name="financierAccount" type="text"/></td>
                <td>收款金额（元）</td>
                <td><input name="receiveAmount" type="text"/></td>
                <td>收款时间</td>
                <td>
                    <input name="receiveAmountTime" type="date" readonly="readonly" maxlength="20"
                           class="input-medium Wdate"
                           value="<fmt:formatDate value="${timeOfPayment}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                </td>
            </tr>
            </tbody>

        </table>


        <input name="finacingInformationId" type="hidden" value="${fi.id}"/>
        <sys:message content="${message}"/>
        <table class="table table-striped table-bordered table-condensed">
            <tbody>
            <tr>
                <td>操作</td>
                <td id="caozuo"><select name="paymentStatus" class="input-medium-select">
                    <option id="caozuo1" value="701">满标确标</option>
                </select></td>
                <td>说明</td>
                <td id="handleResult"><textarea name="handleResult"></textarea>
                </td>
            </tr>
            <tr>
                <td>确标时间</td>
                <td id="stateTime"><input name="stateTime" type="text" readonly="readonly"
                                          maxlength="20" class="input-medium Wdate "
                                          value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/>
                </td>
                <td>确标人</td>
                <td id="operatorId"><input type="hidden" name="operatorId"
                                           value="${fns:getUser().id}"/> ${fns:getUser().name}</td>
            </tr>
            </tbody>
        </table>
        <div class="row" style="display: none" id="button">
            <div class="text-center">
                <input id="btnCancel" class="btn btn-primary" type="button"
                       value="取消" onclick="history.go(-1)"/>
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="确标"/>
            </div>
        </div>
    </form>
</div>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>
</html>