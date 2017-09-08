<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>准入评级结果录入页</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<table table width="100%" border="0">
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
                                  value="<fmt:formatNumber pattern='#,##0.00'>${voes.financingAmount}</fmt:formatNumber>元"/>
        </td>
        <td align="right">申请融资期限</td>
        <td align="center"><input name="textfield10" type="text" id="textfield10" readonly="readonly"
                                  value="<c:if test='${!empty voes.raiseTimeLimit}'>${voes.raiseTimeLimit}天</c:if>">
        </td>
    </tr>
    <tr>
        <td align="right">申请债项利率</td>
        <td align="center"><input name="textfield9" type="text" id="textfield9" readonly="readonly"
                                  value="<fmt:formatNumber pattern='##.0'> ${voes.applicationRate *100}</fmt:formatNumber>%"/>
        </td>
        <td align="right" colspan="2"></td>
    </tr>
    <tr>
        <td align="right"><h4>评级结果录入</h4></td>
        <td align="center" colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <td align="right">债项评级级别</td>
        <td align="center">
            <input type="text" value="${voes.p2pFinancingRatingInfo.ratingLevel}" readonly="readonly"></td>
        <td align="right">简版评估报告</td>
        <td align="center">
            <a href="#" onclick="creditReportDown( '${voes.p2pFinancingRatingInfo.commitReport}');return false;"><input
                    type="button" name="button3" id="button3" value="预览" class="btn btn-primary"></a>&nbsp;&nbsp;&nbsp;
            <a href="#"
               onclick="creditReportDown('${voes.p2pFinancingRatingInfo.commitReport}','down');return false;"><input
                    type="button" name="button3" id="button4" value="下载" class="btn btn-primary"></a>
        </td>
    </tr>
    <tr>
        <td align="right">完整版评估报告</td>
        <td align="center">
            <a onclick="creditReportDown( '${voes.p2pFinancingRatingInfo.creditReport}');return false;"><input
                    type="submit" name="button3" id="button3" value="预览" class="btn btn-primary"></a>&nbsp;&nbsp;&nbsp;
            <a onclick="creditReportDown('${voes.p2pFinancingRatingInfo.creditReport}','down');return false;"><input
                    type="submit" name="button3" id="button4" value="下载" class="btn btn-primary"></a>
        </td>
        <td align="right" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td align="right">债项举债额度</td>
        <td align="center"><input name="debtLimit" type="text" id="textfield6"
                                  value="<fmt:formatNumber pattern='#,##0.00'>  ${voes.p2pFinancingRatingInfo.debtLimit }</fmt:formatNumber>"
                                  readonly="readonly"></td>
        <td align="right">债项利率</td>
        <td align="center"><input name="recommendedRate" type="text" id="textfield3"
                                  value="<fmt:formatNumber pattern='##.0'>   ${voes.p2pFinancingRatingInfo.recommendedRate *100}</fmt:formatNumber>%"
                                  readonly="readonly"></td>
    </tr>
    <tr>
        <td align="right">是否需要增信</td>
        <td align="center">
            <input name="textfield3" type="text" id="wetherRep" readonly="readonly" name="wetherRep"
                   value="${voes.p2pFinancingRatingInfo.wetherRep}"></td>
        </td>
        <td align="right">增信额度</td>
        <td align="center"><input name="repCount" type="text" id="textfield4"
                                  value="<fmt:formatNumber pattern='#,##0.00'>  ${voes.p2pFinancingRatingInfo.repCount}</fmt:formatNumber>"
                                  readonly="readonly"></td>
    </tr>
</table>
<script type="text/javascript">
    function creditReportDown(src, wha) {
        if (src == "" || src == null || src == undefined) {
            alert("没有添加评级报告");
            return;
        }
        var strs = new Array();
        var newStr = "";
        strs = src.split("/");
        for (var i = 2; i < strs.length; i++) {
            if (i == strs.length - 1) {
                newStr = newStr + strs[i];
            }
            else {
                newStr = newStr + strs[i] + "/";
            }
        }
        if (wha == 'down') {//进入下载页
            location.href = "${ctx}/financing/download?address=" + encodeURI(newStr);
            return;
        }
        //进入浏览页
        window.open('${pageContext.request.contextPath}/' + newStr);
    }

</script>
</body>
</html>