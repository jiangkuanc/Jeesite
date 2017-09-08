<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>借贷产品发布前确认审核回显</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(function () {
            $('#handleResult').attr("readonly", "readonly");
        });
        function changeInput(value) {
            if (value == '0') {
                $('#handleResult').removeAttr("readonly");
            }
            if (value == '1') {
                $('#handleResult').attr("readonly", "readonly");
            }
        };
    </script>
</head>
<body>
<div class="page-header">
    <h4>
        借贷产品发布前确认详情
    </h4>
</div>
<h4>借贷产品信息</h4>
<table id="table1" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>借款期限</td>
        <td>${fns:getDictLabel(vo.financingMaturity,'financing_maturity','')}</td>
        <td>借款金额</td>
        <td>${vo.applicationAmount}元</td>
    </tr>
    <tr>
        <td>筹集期限</td>
        <td>${vo.raiseTimeLimit}天</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(vo.repaymentMode,'repayment_mode','')}</td>
    </tr>
</table>
<h4>企业简介</h4>
<table id="table2" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>企业名称</td>
        <td>${vo.p2pEnterpriseCertify.enterpriseName}</td>
        <td>注册地址</td>
        <td>${vo.p2pEnterpriseCertify.registeredAddress}</td>
    </tr>
    <tr>
        <td>企业规模</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.enterpriseScale,'enterprise_scale','')}</td>
        <td>企业性质</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
    </tr>
    <tr>
        <td>所属行业</td>
        <td>${vo.p2pEnterpriseCertify.industryCode}</td>
        <td>实缴资本</td>
        <td><fmt:formatNumber pattern="#,##0.00">${vo.p2pEnterpriseCertify.realCapital}</fmt:formatNumber>元</td>
    </tr>
    <tr>
        <td>经营区域</td>
        <td>${vo.p2pEnterpriseCertify.businessArea}</td>
        <td>所在地</td>
        <td>${vo.p2pEnterpriseCertify.provincialArea}${vo.p2pEnterpriseCertify.municipalArea}</td>
    </tr>
    <tr>
        <td>企业经营范围</td>
        <td>${vo.p2pEnterpriseCertify.businessScope}</td>
        <td>是否存在境外交易</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.isOffshoreTransaction,'yes_no','')}</td>
    </tr>
    <tr>
        <td>营业执照登记机关</td>
        <td>${vo.p2pEnterpriseCertify.registrationAuthority}</td>
        <td>营业执照登记状态</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.registrationState,'registration_state','')}</td>
    </tr>
    <tr>
        <td style="text-align:right;">营业执照核准日期</td>
        <td colspan="4"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.p2pEnterpriseCertify.quasiNuclearDate}"/></td>
    </tr>
</table>
<h4>借款用途</h4>
<table id="table3" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>用途类别</td>
        <td>${fns:getDictLabel(vo.purposeClassification,'purpose_classification','')}</td>
        <td>用途说明</td>
        <td>${vo.purposeExplain}</td>
    </tr>
</table>
<table id="table4" class="table table-striped table-bordered table-condensed mytable">
    <h4>还款来源</h4>
    <tr>
        <td>第一还款来源<b style="color:#C1181D;font-size:16px;">&nbsp*</b></td>
        <td>${vo.repaymentFirstSource}</td>
        <td>第二还款来源</td>
        <td>${vo.repaymentSecondSource}</td>
    </tr>
    <tr>
        <td>第三还款来源</td>
        <td>${vo.repaymentThirdSource}</td>
        <td>其他还款来源</td>
        <td>${vo.repaymentOtherSource}</td>
    </tr>
</table>

<!-- 评级信息 -->
<c:if test="${not empty p2pFinancingRatingInfo}">
    <h4>评级信息</h4>
    <table id="table5" class="table table-striped table-bordered table-condensed">
        <tr>
            <th>信用评级级别</th>
            <th>评级利率</th>
            <th>借款额度（元）</th>
            <th>是否增信</th>
            <th>增信额度（元）</th>
            <th>标的类型</th>
            <th>借贷产品名称</th>
        </tr>
        <tr>
            <td>${p2pFinancingRatingInfo.ratingLevel}</td>
            <td><fmt:formatNumber pattern="#0.00">${p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%</td>
            <td>${p2pFinancingRatingInfo.recommendedAmount}</td>
            <td>${fns:getDictLabel(p2pFinancingRatingInfo.wetherRep,'yes_no','')}</td>
            <td>${p2pFinancingRatingInfo.repCount}</td>
            <td>${fns:getDictLabel(p2pFinancingRatingInfo.markType,'mark_type','')}</td>
            <td>${vo.finacingName}</td>
        </tr>
    </table>
</c:if>
<!--评估结果  -->
<c:if test="${not empty p2pAssetValuationRecord}">
    <h4>评估结果</h4>
    <table id="table6" class="table table-striped table-bordered table-condensed mytable">
        <tr>
            <td>评估结果时间</td>
            <td><fmt:formatDate value="${p2pAssetValuationRecord.commitTime}" pattern="yyyy-MM-dd"/></td>
            <td>联系人</td>
            <td>${fns:getUserById(p2pAssetValuationRecord.assetCompanyId).name}</td>
        </tr>
        <tr>
            <td>资产评估额（元）</td>
            <td>${p2pAssetValuationRecord.assetValuation}</td>
            <td>资产评估报告</td>
            <td>
                <a onclick="modelView('${p2pAssetValuationRecord.assessmentReport }')" href="#">
                    查看
                </a>
            </td>
        </tr>
        <tr>
            <td>资产评估合同</td>
            <td colspan="3">
                <a onclick="modelView('${p2pAssetValuationRecord.evaluationContract }')" href="#">
                    查看
                </a>
            </td>
        </tr>
    </table>
</c:if>
<!-- 担保结果 -->
<c:if test="${not empty p2pGuaranteeRecord}">
    <h4>担保结果</h4>
    <table id="table7" class="table table-striped table-bordered table-condensed mytable">
        <tr>
            <td>担保结果录入时间</td>
            <td><fmt:formatDate value="${p2pAssetValuationRecord.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>操作人</td>
            <td>${p2pGuaranteeRecord.rejectPerson}</td>
        </tr>
        <tr>
            <td>担保函</td>
            <td>
                <a onclick="modelView('${p2pGuaranteeRecord.letterIntent }')" href="#">
                    查看
                </a>
            </td>
            <td>担保合同</td>
            <td>
                <a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pGuaranteeRecord.guaranteeContract }')"
                   href="#">
                    查看
                </a>
            </td>
        </tr>
    </table>
</c:if>
<%-- <form action="${ctx}/financing/p2pBeforeMatchDebtState/debtFinal" id="debtFinal" method="post" modelAttribute="p2pBeforeMatchDebtState"> --%>
<h4>市场意见</h4>
<table class="table table-striped table-bordered table-condensed mytable" id="table8">
    <tr style="text-align: center;">
        <%-- <input type="hidden" name="financingInformationId" value="${vo.id}"/> --%>
        <td>操作人</td>
        <td>
            ${p2pMarketConfirmRecord.operateId}
        </td>
        <td>操作时间</td>
        <td>
            <fmt:formatDate value="${p2pMarketConfirmRecord.operateTime}" pattern="yyyy-MM-dd"/>
        </td>
    </tr>
    <tr style="text-align: center;">
        <td>市场发布意见</td>
        <td>
            <c:choose>
                <c:when test="${p2pMarketConfirmRecord.isPass=='1'}">同意发布</c:when>
                <c:when test="${p2pMarketConfirmRecord.isPass=='0'}">不同意发布</c:when>
            </c:choose>
            <!-- <select  id="progress_stage" name="progress_stage" class="input-medium-select" onchange="changeInput(this.options[this.options.selectedIndex].value)">
                <option  value="1">同意发布</option>
                <option  value="0">不同意发布</option>
            </select> -->
        </td>
        <td>不同意发布意见说明</td>
        <td>
            <c:choose>
                <c:when test="${not empty p2pMarketConfirmRecord.operateExplain}">
                    ${p2pMarketConfirmRecord.operateExplain}
                </c:when>
                <c:otherwise>
                    无
                </c:otherwise>
            </c:choose>
            <!-- <input type="text" name="handleResult" id="handleResult" value=""/> -->

        </td>
    </tr>
</table>
<!-- </form> -->
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
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
</body>
</html>