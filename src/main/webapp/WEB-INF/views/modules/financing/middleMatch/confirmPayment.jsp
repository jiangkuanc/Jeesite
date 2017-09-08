<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>确认缴纳评级费</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    paymentAmount: {
                        required: true,
                        min: 0
                    },
                    timeOfPayment: "required"

                },
                messages: {
                    paymentAmount: {
                        required: "不能为空",
                        min: "请输入不小于0的数值"
                    },
                    timeOfPayment: "缴费时间不能为空"

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
                $("td[id='paymentStatus']").empty().append("已缴费");
                $("td[id='paymentAmount']").empty().append("${porc.paymentAmount}");
                $("td[id='timeOfPayment']").empty().append("<fmt:formatDate value='${porc.timeOfPayment }' pattern='yyyy-MM-dd' />");
                $("td[id='operatorId']").empty().append("${fns:getUserById(porc.operatorId).name}");
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
<h3>缴纳评级费</h3>
<h4>基本信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <td>债项编号</td>
        <td>${fi.id}</td>
        <td>债项名称</td>
        <td>${fi.finacingName }</td>
        <td>企业名称</td>
        <td>${fi.enterpriseName }</td>
    </tr>

    </tbody>
</table>
<h4>缴费意见</h4>
<form id="submitForm" action="${ctx}/financing/confirmPaymentSubmit" method="post" class="opinion">
    <input name="financingInformationId" type="hidden"
           value="${fi.id}"/>
    <sys:message content="${message}"/>
    <table class="table table-striped table-bordered table-condensed">
        <tbody>
        <tr>
            <td>缴费意见</td>
            <td id="paymentStatus"><select class="input-medium-select">
                <option id="caozuo1" value="700">已缴费</option>
            </select></td>
            <td>缴费金额（元）</td>
            <td id="paymentAmount"><input name="paymentAmount" type="text">
            </td>
        </tr>
        <tr>
            <td>缴费时间111</td>
            <td id="timeOfPayment">
                <input name="timeOfPayment" type="date" readonly="readonly" maxlength="20" class="input-medium Wdate"
                       value="<fmt:formatDate value="${timeOfPayment}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/></td>
            <td>操作人</td>
            <td id="operatorId"><input type="hidden" name="operatorId"
                                       value="${fns:getUser().id}"/>23 ${fns:getUser().name}</td>
        </tr>
        </tbody>
    </table>
    <div class="row" style="display: none" id="button">
        <div class="text-center">
            <input id="btnCancel" class="btn btn-primary" type="button"
                   value="取消" onclick="history.go(-1)"/>
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="确认缴费"/>
        </div>

    </div>
</form>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>
</html>