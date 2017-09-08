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
            var comeRs = $("#select1  option:selected").text();
            if (comeRs == "不通过") {
                $("#tr2").hide();
                $("#tr3").hide();
                passRs = "nopass"
            }
            $("#select1").change(function () {
                var admittance = $("#select1  option:selected").text();
                if (admittance == "不通过") {
                    $("#tr2").hide();
                    $("#tr3").hide();
                    passRs = "nopass";
                    //$("#div1"). ;
                } else {
                    $("#tr2").show();
                    $("#tr3").show();
                    passRs = "pass";
                }
            });

            /* 	$("#select2").change(function(){
             var select2=$("#select2  option:selected").text();
             if(select2=="A"||select2=="AA"||select2=="AAA"){
             $("#whetherRepsir option[text='否']").attr("selected",true);
             }if(select2=="B"||select2=="BB"||select2=="BBB"){
             $("#whetherRepsir option[text='是']").attr("selected",true);
             }}
             ); */

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
           action="${ctx}/financing/p2pFinancingRatingInfo/repCreditInfo" method="post" class="form-horizontal"
           onSubmit="return confirm()">
    <table width="100%" height="292" border="0">
        <tr>
            <td height="50" colspan="3" align="center"><h3>评&nbsp;&nbsp; 级&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;修&nbsp;&nbsp;改</h3>
            </td>
            <td height="50" align="center">&nbsp;</td>
            <td height="50" align="center">&nbsp;</td>
            <td height="50" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td width="140" height="50" align="left">准入评级结果：</td>
            <td width="207" height="50" align="left">
                <select id="select1" class="input-medium" maxlength="20" name="currentState">
                    <option value="pass" <c:if test="${voes.creditState=='1'}">selected="selected"</c:if>>通过</option>
                    <option value="noPass" <c:if test="${voes.creditState=='3'}">selected="selected"</c:if>>不通过</option>
                </select>
            </td>
            <td width="148" height="50" align="right">准入评级报告：</td>
            <td width="257" height="50" align="left">
                <form:input type="hidden" id="commitReport" name="commitReport" path="commitReport" htmlEscape="false"
                            maxlength="255" class="input-xlarge"/>
                <sys:ckfinder input="commitReport" type="files" uploadPath="/financing/p2pFinancingRatingInfo"
                              selectMultiple="true"/>
            </td>
            <td width="91" height="50" align="left">准入分析师：</td>
            <td width="784" height="50" align="left">
                <select name="commitPerson">
                    <c:forEach items="${listCommit}" var="vo">
                        <option value="${vo.name}"
                                <c:if test="${vo.name==voes.commitPerson}">selected="selected"</c:if>>${vo.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr id="tr2">
            <td height="50" align="left">偿债能力评估结果：</td>
            <td height="50" align="left">
                <select class="input-medium" maxlength="20" id="select2" name="ratingLevel">
                    <option value="AAA"
                            <c:if test="${voes.ratingLevel=='AAA'}">selected="selected"</c:if>>${voes.ratingLevel}</option>
                    <option value="AA" <c:if test="${voes.ratingLevel=='AA'}">selected="selected"</c:if>>AA</option>
                    <option value="AA" <c:if test="${voes.ratingLevel=='A'}">selected="selected"</c:if>>A</option>
                    <option value="BBB" <c:if test="${voes.ratingLevel=='BBB'}">selected="selected"</c:if>>BBB</option>
                    <option value="BB" <c:if test="${voes.ratingLevel=='BB'}">selected="selected"</c:if>>BB</option>
                    <option value="B" <c:if test="${voes.ratingLevel=='B'}">selected="selected"</c:if>>B</option>
                    <option value="CCC" <c:if test="${voes.ratingLevel=='CCC'}">selected="selected"</c:if>>CCC</option>
                    <option value="CC" <c:if test="${voes.ratingLevel=='CC'}">selected="selected"</c:if>>CC</option>
                    <option value="C" <c:if test="${voes.ratingLevel=='C'}">selected="selected"</c:if>>C</option>
                </select>
            </td>
            <td height="50" align="right">偿债能力评级报告：</td>
            <td height="50" align="left">
                <form:input type="hidden" id="creditReport" name="creditReport" path="creditReport" htmlEscape="false"
                            maxlength="255" class="input-xlarge"/>
                <sys:ckfinder input="creditReport" type="files" uploadPath="/financing/p2pFinancingRatingInfo"
                              selectMultiple="true"/>
            </td>
            <td height="50" align="left">偿债分析师：</td>
            <td height="50" align="left">
                <select class="control-label" name="creditPerson">
                    <c:forEach items="${listCredit}" var="vo">
                        <option value="${vo.name}"
                                <c:if test="${vo.name==voes.creditPerson}">selected="selected"</c:if>>${vo.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr id="tr3">
            <td height="50" align="left">融资利率：</td>
            <td height="50" align="left">

                <input type="text" name="recommendedRate" id="recom"
                       value='<fmt:formatNumber type="number" value="${voes.recommendedRate*100}" maxFractionDigits="2"/>'
                       style="width:40px;">%
            </td>
            <td height="50">&nbsp;</td>
            <td height="50">&nbsp;</td>
            <td height="50">&nbsp;</td>
            <td height="50">&nbsp;</td>
        </tr>
        <tr>
            <td height="50" colspan="3" align="center">
                <input type="hidden" value="${pid}" name="pid"/>
                <input type="hidden" value="${id}" name="id"/>
                <input type="submit" value="确认修改" class="btn btn-primary">
            </td>
            <td height="50" align="center">&nbsp;</td>
            <td height="50" align="center">&nbsp;</td>
            <td height="50" align="center">&nbsp;</td>
        </tr>
    </table>
</form:form>
</body>
</html>