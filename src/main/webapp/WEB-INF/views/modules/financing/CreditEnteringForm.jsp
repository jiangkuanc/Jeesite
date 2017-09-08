<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>准入评级结果录入页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var passRs = "pass";
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });


            $("#select1").change(function () {
                var admittance = $("#select1  option:selected").text();
                if (admittance == "不通过") {
                    passRs = "noPass";
                    $("#tr2").hide();
                    $("#tr3").hide();
                } else {
                    passRs = "pass";
                    $("#tr2").show();
                    $("#tr3").show();
                }
            });

            $("#select2").change(function () {
                    var select2 = $("#select2  option:selected").text();
                    if (select2 == "A" | select2 == "AA" | select2 == "AAA") {
                        $("#whetherRepsir").find("option").eq(1).attr("selected", "selected");
                    }
                    if (select2 == "B" | select2 == "BB" | select2 == "BBB") {
                        $("#whetherRepsir").find("option").eq(0).attr("selected", "selected");
                    }
                }
            );


        });

        function confirm() {
            var flag = false;
            var arr = ['pdf'];
            var filename = $("#commitReport").val();
            if (filename == null || filename == '' || filename == 'undefined') {
                alert("请上传准入评级报告");
                return false;
            }
            var newStrs1 = new Array();
            newStrs1 = filename.split(".pdf");
            if (newStrs1.length > 2) {
                alert("只能上传一份准入评级报告");
                return false;
            }
            var index = filename.lastIndexOf(".");
            var ext = filename.substring(index + 1);
            //循环比较
            for (var i = 0; i < arr.length; i++) {
                if (ext == arr[i]) {
                    flag = true; //一旦找到合适的，立即退出循环
                    break;
                }
            }
            //条件判断
            if (flag == false) {
                alert("请上传PDF格式的文件");
                return false;
            }

            if (passRs == "pass") {
                flag = false;
                var filename2 = $("#creditReport").val();
                index2 = filename2.lastIndexOf(".");
                if (filename2 == null || filename2 == '' || filename2 == 'undefined') {
                    alert("请上传偿债能力评级报告");
                    return false;
                }
                var newStrs2 = new Array();
                newStrs2 = filename2.split(".pdf");
                if (newStrs2.length > 2) {
                    alert("只能上传一份偿债能力评级报告");
                    return false;
                }

                var ext2 = filename2.substring(index2 + 1);
                for (var i = 0; i < arr.length; i++) {
                    if (ext2 == arr[i]) {
                        flag = true; //一旦找到合适的，立即退出循环
                        break;
                    }
                }
                //条件判断
                if (flag == false) {
                    alert("请上传PDF格式的文件");
                    return false;
                }

                var reco = $("#recom").val().toString();
                if (reco == null || reco == '' || reco == 'undefined') {
                    alert("融资利率不能为空");
                    return false;
                }
                var reg = /^\d+(\.\d{1,2})?$/;
                var dshu = parseFloat(reco);
                if (!reg.test(dshu)) {
                    alert("融资利率必须为整数或包含一到两位小数");
                    return false;
                }

            }


            return true;
        }
    </script>
</head>
<body>
<form:form id="inputForm" modelAttribute="p2pFinancingRatingInfo"
           action="${ctx}/financing/p2pFinancingRatingInfo/saveCreditInfo" method="post" class="form-horizontal"
           onSubmit="return confirm()">
    <table table width="100" height="292" border="0"
           class="table table-striped table-bordered table-condensed tree_table">
        <tr style="width:20%">
            <td width="388" align="right"><h4>债项基本信息</h4></td>
            <td width="330" align="center" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td align="right">企业名称</td>
            <td align="center"><input name="textfield" type="text" id="textfield" readonly="readonly" style="width:90;"
                                      value="${voes.p2pEnterpriseCertify.enterpriseName }"></td>
            <td align="right">债项名称</td>
            <td align="center"><input name="textfield2" type="text" id="textfield2" readonly="readonly"
                                      value="${voes.finacingName}"></td>
        </tr>
        <tr>
            <td align="right">申请融资额度</td>
            <td align="center"><input name="textfield9" type="text" id="textfield9" readonly="readonly"
            <c:if test='${!empty voes.financingAmount}'>
                                      value="<fmt:formatNumber pattern='#,##0.00'>${voes.financingAmount}</fmt:formatNumber>元"
            </c:if>></td>
            <td align="right">申请融资期限</td>
            <td align="center"><input name="textfield10" type="text" id="textfield10" readonly="readonly"
                                      value="<c:if test="${!empty voes.raiseTimeLimit}">${voes.raiseTimeLimit}天</c:if>">
            </td>
        </tr>
        <tr>
            <td align="right"><h4>评级结果录入</h4></td>
            <td align="center" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td align="right">评级债项级别</td>
            <td align="center">
                <select maxlength="20" name="ratingLevel" id="select1">
                    <option value="AAA">AAA</option>
                    <option value="AA">AA</option>
                    <option value="AA">A</option>
                    <option value="BBB">BBB</option>
                    <option value="BB">BB</option>
                    <option value="B">B</option>
                    <option value="CCC">CCC</option>
                    <option value="CC">CC</option>
                    <option value="C">C</option>
                </select>
            <td align="right">简版评估报告</td>
            <td align="center">
                <form:input type="hidden" id="commitReport" name="commitReport" path="commitReport" htmlEscape="false"
                            maxlength="255" class="input-xlarge"/>
                <sys:ckfinder input="commitReport" type="files" uploadPath="/financing/p2pFinancingRatingInfo"
                              selectMultiple="true"/>
            </td>
        </tr>
        <tr>
            <td align="right">完整版评估报告</td>
            <td align="center">
                <!--    <input type="submit" name="button3" id="button3" value="预览" class="btn btn-primary">&nbsp;&nbsp;&nbsp;
                   <input type="submit" name="button3" id="button4" value="下载"  class="btn btn-primary"> -->
                <form:input type="hidden" id="creditReport" name="creditReport" path="creditReport" htmlEscape="false"
                            maxlength="255" class="input-xlarge"/>
                <sys:ckfinder input="creditReport" type="files" uploadPath="/financing/p2pFinancingRatingInfo"
                              selectMultiple="true"/>
            </td>
            <td align="right" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td align="right">债项举债额度</td>
            <td align="center"><input name="debtLimit" type="text" id="textfield6"></td>
            <td align="right">债项利率</td>
            <td align="center"><input name="recommendedRate" type="text" id="textfield3"></td>
        </tr>
        <tr>
            <td align="right">是否需要增信</td>
            <td align="center">
                <input type="text" id="wetherRep" readonly="readonly" name="wetherRep" value="否"></td>
            </td>
            <td align="right">增信额度</td>
            <td align="center"><input name="repCount" type="text" id="textfield4"></td>
        </tr>
        <tr>
            <td></td>
            <td align="center">
                <input type="hidden" value="${pid}" name="pid"/>
                <input type="submit" name="button" id="button" value="保存" class="btn btn-primary">&nbsp;&nbsp;&nbsp;
                <input type="submit" name="button2" id="button2" value="取消" class="btn btn-primary"></td>
            <td colspan="2">&nbsp;</td>
            <td align="center"></td>
        </tr>


    </table>
</form:form>
<script type="text/javascript">
    $("#select1").change(function () {
        var res = $("#select1 option:selected").text();
        if (res == "BB" || res == "BBB") {
            $("#wetherRep").val("是");
        } else {
            $("#wetherRep").val("否");
        }
    })
</script>
</body>
</html>