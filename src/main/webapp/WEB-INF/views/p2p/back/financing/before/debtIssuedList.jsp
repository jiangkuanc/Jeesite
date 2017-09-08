<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>待发布借贷产品管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert('${page.list}[0]');
        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function selectSome() {
            var checkBoxs = document.getElementsByClassName("checkBoxx");
            var flag = false;
            for (var i = 0; i < checkBoxs.length; i++) {
                var checkbox = checkBoxs[i];
                if (checkbox.checked) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                swal("请至少选择一条借贷产品进行批量发布!", "", "error");
                return;
            }
            var ids = [];
            for (var j = 0; j < checkBoxs.length; j++) {
                //对选中项进行操作
                if (checkBoxs[j].checked) {
                    var $cc = $(checkBoxs[j]);
                    var id = $cc.parent().parent().find("td:eq(1)").text().trim();
                    var currentStage = $("#muji" + id).val();
                    var publishTime = $("#publishTime" + id).val();
                    var isFinalized = $("#isFinalized" + id).val();
                    var zhaixiang = $("#zhaixiang" + id).val();
                    if (currentStage == 500) {
                        swal(zhaixiang + "已经发布，请重新选择！", "", "error");
                        return;
                    }
                    if (currentStage == 400 && publishTime != "") {
                        swal(zhaixiang + "已经定时发布，请重新选择！", "", "error");
                        return;
                    }
                    if (isFinalized == 0) {
                        swal(zhaixiang + "未定稿，请重新选择！", "", "error");
                        return;
                    }
                    ids.push(id);
                }
            }
            window.location.href = "${ctx}/financing/p2pFinancingInformation/batchReleasePage?ids=" + ids;
        }
        function isPass(str) {
            var fl = false;
            if (str == 0) {
                swal("评级结果未定稿,无法发布借贷产品!", "", "error");
                fl = false;
            } else if (str == 1) {
                fl = true;
            }
            return fl;
        }


    </script>
</head>
<body>
<%-- <ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/financing/p2pFinancingInformation/marketConfirmation">市场审核债项立项页</a></li>
    <li><a href="${ctx}/sys/user/modifyPwd">市场确认发布债项页</a></li>
</ul><br/> --%>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation"
           action="${ctx}/financing/p2pFinancingInformation/debtIssued" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
            <%-- <li><label>借贷产品编号：</label>
                <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
            </li> --%>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>发布状态：</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value="">全部</form:option>
                <form:option value="400">${fns:getDictLabel('400', 'progress_stage','')}</form:option>
                <form:option value="500">${fns:getDictLabel('500', 'progress_stage','')}</form:option>
            </form:select>
        </li>
        <li><label>是否增信：</label>
            <form:select path="p2pFinancingRatingInfo.wetherRep" class="input-medium-select">
                <form:option value="">全部</form:option>
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><shiro:hasPermission name="batch:release"><input id="btnSubmit" class="btn btn-primary"
                                                                          type="button" value="批量发布"
                                                                          onclick="selectSome();"/></shiro:hasPermission>
        </li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>是否增信</th>
        <th>借贷产品主体信用等级</th>
        <th>评级展望</th>
        <th>借贷产品级别</th>
        <th>借贷产品利率</th>
        <th>融资金额(元)</th>
        <th>评级费支付状态</th>
        <th>申请时间</th>
        <th>发布时间</th>
        <th>发布状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">
        <input type="hidden" id="isFinalized${p2pFinancingInformation.id}"
               value="${p2pFinancingInformation.p2pFinancingRatingInfo.isFinalized}"/>
        <input type="hidden" id="publishTime${p2pFinancingInformation.id}"
               value="${p2pFinancingInformation.publishTime}"/>
        <input type="hidden" id="muji${p2pFinancingInformation.id}" value="${p2pFinancingInformation.currentStage}"/>
        <input type="hidden" id="zhaixiang${p2pFinancingInformation.id}"
               value="${p2pFinancingInformation.finacingName}"/>
        <tr style="text-align:center;">
            <!-- 序号 -->
            <td>
                <input type="checkbox" id="${status.count}" class="checkBoxx"/>
                    ${status.count}
            </td>
            <!-- 融资申请编号 -->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <!-- 融资企业名称-->
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        <%--					<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p2pFinancingInformation.id}&id2=${p2pFinancingInformation.p2pEnterpriseCertify.id}">--%>
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName ,25)}
                </a>
            </td>
            <!-- 申请债项名称 -->
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName ,25)}
                </a>
            </td>
            <!-- 是否增信 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.wetherRep,'yes_no','')}
            </td>
            <!-- 借贷产品主体信用等级 -->
            <td>${p2pFinancingInformation.p2pFinancingRatingInfo.mainCreditGrade}</td>
            <!-- 评级展望 -->
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.rateExpectation,'rating_expection','')}</td>
            <!-- 债项级别-->
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}
            </td>
            <!-- 债项利率 -->
            <td>
                <c:if test="${!empty p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate }">
                    <fmt:formatNumber
                            pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                </c:if>

            </td>
            <!-- 融资额度(元) -->
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                </c:if>
            </td>
            <!-- 评级费支付状态 -->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.isHandRateCost=='1'}">
                        是
                    </c:when>
                    <c:when test="${p2pFinancingInformation.isHandRateCost=='0'}">
                        否
                    </c:when>
                </c:choose>
            </td>
            <!-- 融资申请时间 -->
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.commitTime}" pattern="yyyy-MM-dd"/>
            </td>
            <!-- 债项发布时间-->
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd"/>
            </td>
            <!-- 债项发布状态 -->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.currentStage=='400' and not empty p2pFinancingInformation.publishTime}">
                        已定时发布
                    </c:when>
                    <c:otherwise>
                        ${fns:getDictLabel(p2pFinancingInformation.currentStage,'progress_stage','')}
                    </c:otherwise>
                </c:choose>
            </td>
            <!-- 操作 -->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.currentStage=='400' and empty p2pFinancingInformation.publishTime}">
                        <shiro:hasPermission name="product:release">
                            <a id="fabu" href="${ctx}/financing/p2pFinancingInformation/findFinancingDetailFive?
							id=${p2pFinancingInformation.id}&name=${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}"
                               onclick="return isPass(${p2pFinancingInformation.p2pFinancingRatingInfo.isFinalized});">
                                发布
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:otherwise>
                        <shiro:hasPermission name="product:view">
                            <a href="${ctx}/financing/p2pFinancingInformation/findFinancingDetailSix?id=${p2pFinancingInformation.id}&name=${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                                查看
                            </a>
                        </shiro:hasPermission>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<!-- <div class="modal fade" id="myModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="width:450px;display:none;">
                <div class="modal-content">
                  <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> × </button>
                    <h4 class="modal-title">大公数据评级服务协议</h4>
                  </div>
                  <div class="modal-body" style="width:100%;">
                       <h4>甲方：申请人</h4>
                       <h4>乙方：大公信用数据有限责任公司</h4>
                       <p>“本公司”指大公信用数据有限责任公司
                       <br>
                             “平台”指由大公信用数据有限责任公司所有并发布信息、撮合交易的“一带一路”互联网
                            <br>
                             金融信用信息服务平台(www.xxxxxx.com)（以下简称平台）
                       </p>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="model_delete()">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                  </div>
                </div>
        </div> -->
</body>
</html>