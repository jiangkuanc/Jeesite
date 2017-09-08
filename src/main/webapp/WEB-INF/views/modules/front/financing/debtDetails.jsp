<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhaixiang.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shenqing.css">
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var b = '${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate}' / 12;//月利率
            var n = '${p2pFinancingInformation.financingMaturity}';//期限
            var m = '${p2pFinancingInformation.repaymentMode}';//还款方式

            var p1 = '${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedAmount}';//批复金额
            var p2 = '${p2pFinancingInformation.applicationAmount}';//申请金额
            var p;
            if (parseInt(p1) <= parseInt(p2)) {
                p = p1;
            } else {
                p = p2;
            }
            if (m == 2) {
                complicatedCalc(b, p, n);
            } else {
                simpleCalc(b, p, n);
            }

        });
        function simpleCalc(b, p, n) {
            var allAmount = p * (1 + n * b);
            var arr = fmoney(parseInt(allAmount), 3).split(".");
            $('#allAmount').html(arr[0]);
        }
        function complicatedCalc(b, p, n) {
            var x = Math.pow(1 + b, n);
            var y = Math.pow(1 + b, n) - 1
            var amount = x / y;
            var allAmount = amount * b * p * n;
            var arr = fmoney(parseInt(allAmount), 3).split(".");
            $('#allAmount').html(arr[0]);
        }
        function fmoney(s, n) {
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            var l = s.split(".")[0].split("").reverse(),
                r = s.split(".")[1];
            t = "";
            for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            var rate = '${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate}';
            rate = parseFloat(rate);
            $('#rate').val(rate);
            var str = '';
            for (i = 0; i <= 20; i++) {
                var num = rate + i / 1000;
                num = num.toFixed(3);//隐藏利率值
                var num2 = num * 100;
                num2 = num2.toFixed(1);//显示利率百分比
                str += '<option value="' + num + '">' + num2 + '</option>';
            }
            $('#selrate').html(str);
        });
        function changeRate() {
            $('#rate').val($('#selrate').val());
        }
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content" style="width: 100%">
    <!-- 		    <a href="" class="pull-left"><span style="color:#bf1a20;"><<</span>　取消</a> -->
    <!-- 		    <a href="" class="pull-right">下一步　<span style="color:#bf1a20;">>></span></a> -->
    <div class="clearfix"></div>
    <h2 style="padding-left: 12%">债项信息预览：</h2>
</div>
<h4 class="zxylh4">债项信息</h4>
<div class="zxxinxiyulan">
    <table class="chenghui pull-left">
        <tr>
            <td align="left"><span class="hcc">信用等级：${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</span>
            </td>
        </tr>
        <tr>
            <td align="left"><span class="hcc">申请借款总额：</span><fmt:formatNumber
                    value="${p2pFinancingInformation.applicationAmount}" pattern="#,###,###"/>元
            </td>
        </tr>
        <tr>
            <td align="left"><span class="hcc">可借款总额：</span>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedAmount > p2pFinancingInformation.applicationAmount}">
                        <fmt:formatNumber value="${p2pFinancingInformation.applicationAmount}" pattern="#,###,###"/>元
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedAmount}"
                                          pattern="#,###,###"/>元
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td align="left"><span class="hcc">还款总额：</span><span id="allAmount"></span>元</td>
        </tr>
        <tr>
            <td align="left"><span class="hcc">借款利率（年化）：</span>
                <select id="selrate" onchange="changeRate()"></select>%
                <%-- <fmt:formatNumber pattern="##.00" value="${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}"/>% --%>
            </td>
        </tr>
    </table>
    <table class="pull-left weilehui">
        <tr>
            <td align="left" title="${p2pFinancingInformation.finacingName}"><span
                    class="ouou">债项名称：</span>${fns:abbr(p2pFinancingInformation.finacingName,27)}</td>
        </tr>
        <tr>
            <td align="left"><span class="ouou">借款期限：</span>${p2pFinancingInformation.financingMaturity}个月</td>
        </tr>
        <tr>
            <td align="left"><span class="ouou">募集期限：</span>${p2pFinancingInformation.raiseTimeLimit}天</td>
        </tr>
        <tr>
            <td align="left"><span
                    class="ouou">还款方式：${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</span>
            </td>
        </tr>
        <tr>
            <td align="left"><span
                    class="ouou">标的类型：</span>${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.markType, 'mark_type', '')}
            </td>
        </tr>
    </table>
    <div class="clearfix"></div>
</div>
<h4 class="zxylh4">企业信息</h4>
<div class="zxxinxiyulan">
    <table border="0" style="width:93.5%" class="weilehui">
        <tr>
            <td width="10%" class="ouou">企业名称：</td>
            <td width="10%" colspan="2"
                title="${p2pEnterpriseCertify.enterpriseName}">${fns:abbr(p2pEnterpriseCertify.enterpriseName,27)}</td>
            <td width="15%" class="ouou">申请人：</td>
            <td width="10%" colspan="2">${p2pEnterpriseCertify.p2pRegUserCertify.realName}</td>
            <td width="10%" class="ouou">法定代表人：</td>
            <td width="19%">${p2pEnterpriseCertify.nameOf}</td>
        </tr>
        <tr>
            <td class="ouou">所属行业：</td>
            <td colspan="2">${p2pEnterpriseCertify.p2pIndustryclassi.classinameCn}</td>
            <td class="ouou">注册地址：</td>
            <td colspan="2"
                title="${p2pEnterpriseCertify.registeredAddress}">${fns:abbr(p2pEnterpriseCertify.registeredAddress,27)}</td>
            <td class="ouou">注册资本：</td>
            <td><fmt:formatNumber value="${p2pEnterpriseCertify.registeredCapital}" pattern="#,###,###"/>元</td>
        </tr>
        </tr>
        <tr>
            <td class="ouou">实缴资本：</td>
            <td colspan="2"><fmt:formatNumber value="${p2pEnterpriseCertify.realCapital}" pattern="#,###,###"/>元</td>
            <td class="ouou">经营区域：</td>
            <td colspan="4">${p2pEnterpriseCertify.businessArea}</td>
        </tr>
        <tr>
            <td class="ouou">企业规模：</td>
            <td colspan="2">${fns:getDictLabel(p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}</td>
            <td class="ouou">经营范围：</td>
            <td colspan="4">${p2pEnterpriseCertify.businessScope}</td>
        </tr>
        <tr>
            <td class="ouou">借款用途：</td>
            <td colspan="7">${fns:getDictLabel(p2pFinancingInformation.purposeClassification, 'purpose_classification', '')}</td>
        </tr>
        <tr>
            <td class="ouou" style="word-break:keep-all;white-space:nowrap;">第一还款来源：</td>
            <td colspan="7"
                style="min-height:40px;word-wrap:break-word;word-break:break-all;">${p2pFinancingInformation.repaymentFirstSource}</td>
        </tr>
        <%-- <tr>
          <td class="ouou">企业证明：</td>
          <td align="center">营业执照</td>
          <td align="center">组织机构代码证</td>
          <td align="center">税务登记证</td>
          <td align="center">房屋产权证</td>
          <td align="center">法人储蓄证明</td>
          <td align="center">担保证明</td>
          <td align="center">担保合同</td>
        </tr>
        <tr>
          <td></td>
          <td width="12.5%" align="center"><img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pEnterpriseCertify.businessLicense}" alt="" height="85%" width="85%"></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
          <td width="12.5%" align="center"><img src="" alt=""></td>
        </tr> --%>
    </table>

</div>
<div class="qianyue">
    <form action="${ctx}/financing/p2pFinancingInformation/confirmDebt" method="post">
        <input type="hidden" name="token" value="${token}"/>
        <input type="hidden" name="id" value="${p2pFinancingInformation.id}"/>
        <input type="hidden" id="rate" name="newRate" value=""/>
        <input type="hidden" name="recommendedRate"
               value="${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate}"/>
        <input type="submit" value="确定" class="btn btn-default zh_btn quxiao" style="background:#f14349;color:#fff">
        <input type="button" value="放弃发布" style="width:100px" class="btn btn-default zh_btn queren" onclick="edg()">
        <input type="button" value="取消" style="width:70px" class="btn btn-default zh_btn queren" onclick="abc()">
    </form>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    function abc() {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }
    function edg() {
        var url = '${p2pFinancingInformation.id}';
        window.location.href = "${ctx}/DebtDetails/modifyStageIsExpired?financingInformationId=" + url;
    }
</script>
</html>
