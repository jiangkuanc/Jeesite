<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>市场确认发布列表</title>
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
    </script>
</head>
<body>
<%-- <ul class="nav nav-tabs">
    <li><a href="${ctx}/financing/p2pFinancingInformation/marketConfirmation">市场审核债项立项</a></li>
    <li class="active"><a href="${ctx}/financing/p2pFinancingInformation/marketConfirmationReleaseDebt">市场确认发布债项</a></li>
</ul><br/> --%>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation"
           action="${ctx}/financing/p2pFinancingInformation/marketConfirmationReleaseDebt" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称:</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品状态:</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value="">全部</form:option>
                <c:forEach items="${fns:getDictList('progress_stage')}" varStatus="status" var="a">
                    <c:if test="${a.value >=250 }">
                        <form:option value="${a.value }">${a.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>申请金额(元)</th>
        <th>申请融资期限</th>
        <th>申请融资利率</th>
        <th>借贷产品级别</th>
        <th>是否增信</th>
        <!-- <th>增信方式</th> -->
        <th>标的类型</th>
        <th>借贷产品状态</th>
        <th>评级费</th>
        <th>市场意见</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">

        <tr style="text-align:left;">
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!-- 融资申请编号 -->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <!-- 融资企业名称-->
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        <%--					<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p2pFinancingInformation.id}&id2=${p2pFinancingInformation.p2pEnterpriseCertify.id}">--%>
                        ${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <!-- 申请债项名称 -->
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.finacingName}
                </a>
            </td>
            <!-- 融资申请金额(元) -->
            <td>
                    ${p2pFinancingInformation.applicationAmount}
            </td>
            <!-- 申请融资期限 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}
            </td>
            <!-- 申请债项利率 -->
            <td>

                <c:if test="${!empty p2pFinancingInformation.applicationRate }">
                    <fmt:formatNumber pattern="#0.00">${p2pFinancingInformation.applicationRate*100}</fmt:formatNumber>%
                </c:if>
            </td>
            <!-- 债项级别 -->
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}
            </td>
            <!-- 是否增信 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.wetherRep,'yes_no','')}
            </td>
            <!-- 标的类型 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.markType,'mark_type','')}
            </td>
            <!-- 债项状态 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.currentStage,'progress_stage','')}
            </td>
            <!-- 债项支付状态 -->
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
            <!-- 市场意见 -->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.p2pMarketConfirmRecord.isPass=='1'}">同意发布</c:when>
                    <c:when test="${p2pFinancingInformation.p2pMarketConfirmRecord.isPass=='0'}">不同意发布</c:when>
                    <c:otherwise>
                        无
                    </c:otherwise>
                </c:choose>
            </td>
            <!-- 市场确认操作-->
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.currentStage=='250'}">
                        <shiro:hasPermission name="x">
                            <a href="${ctx}/financing/p2pFinancingInformation/findFinancingDetailThree?id=${p2pFinancingInformation.id}&name=${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                                确认
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                    <%-- <c:when test="${p2pFinancingInformation.currentStage=='210'}">
                        <a href="${ctx}/financing/p2pFinancingInformation/findFinancingDetailThree?id=${p2pFinancingInformation.id}&name=${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                        查看
                        </a>
                    </c:when> --%>
                    <c:otherwise>
                        <shiro:hasPermission name="y">
                            <a href="${ctx}/financing/p2pFinancingInformation/findFinancingDetailFour?id=${p2pFinancingInformation.id}&name=${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
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
<!-- 	<div class="modal fade" id="myModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="width:450px;display:none;">				  
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