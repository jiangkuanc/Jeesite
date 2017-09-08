<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级信息综合查询信息表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function creditReportDown(src) {
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
            window.open('${pageContext.request.contextPath}/' + newStr);
        }
    </script>
</head>
<body>
<form id="searchForm" class="breadcrumb form-search" method="post"
      action="${ctx}/financing/p2pFinancingInformation/findTheFinancingList">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>融资企业名称：</label>
            <input class="input-medium" type="text" maxlength="64" name="enterpriseName"></li>
        <li><label>融资债项名称：</label>
            <input class="input-medium"
                   type="text" maxlength="64" name="finacingName"></li>
        <li><label>债项评级级别：</label>
            <select class="input-medium-select" name="ratingLevel">
                <option value="无">无</option>
                <option value="AAA">AAA</option>
                <option value="AA">AA</option>
                <option value="AA">A</option>
                <option value="BBB">B</option>
                <option value="BB">BB</option>
                <option value="B">B</option>
                <option value="CCC">CCC</option>
                <option value="CC">CC</option>
                <option value="C">C</option>
            </select>
        </li>
        <li><label>申请融资编号</label>
            <input type="text" name="id">
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary"
                                type="submit" value="筛选"></li>
        <li class="clearfix"></li>
    </ul>
</form>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th width="2%">序号</th>
        <th width="3%">融资申请编号</th>
        <th width="10%">融资企业名称</th>
        <th width="10%">债项名称</th>
        <th width="4%">申请融资额度(元)</th>
        <th width="4%">评级状态</th>
        <th width="10%">准入评级报告</th>
        <th width="6%">债项举债额度</th>
        <th width="8%">债项评级级别</th>
        <th width="8%">债项评级利率</th>
        <th width="8%">是否增信</th>
        <th width="8%">是否待用户确认</th>
        <th width="8%">用户是否同意</th>
        <th width="8%">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="vo" varStatus="status">

        <tr>
            <!-- 序号 -->
            <td style="text-align: center;">
                    ${status.count}
            </td>
            <td style="text-align: center;"><!-- 融资申请编号 -->
                    ${vo.id}
            </td>
            <!-- 企业名称 -->
            <td style="text-align: center;">
                <a href="${ctx}/user/p2pEnterpriseCertify/findEnterpriseDetail?id=${vo.p2pEnterpriseCertify.id}&certiType=${vo.p2pEnterpriseCertify.certificateType}">${vo.p2pEnterpriseCertify.enterpriseName}</a>
            </td>
            <!-- 债项名称 -->
            <td style="text-align: center;">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${vo.id}">
                        ${vo.finacingName}</a></td>
            <td style="text-align: center;"><!-- 申请融资额度 -->
                <fmt:formatNumber pattern='#,##0.00'>  ${vo.financingAmount}</fmt:formatNumber>
            </td>

            <td style="text-align: center;"><!-- 评级状态 -->
                <c:choose>
                    <c:when test="${vo.currentStage eq '203'}">
                        <font align="center">待评级</font>
                    </c:when>
                    <c:otherwise>
                        已评级
                    </c:otherwise>
                </c:choose>
            </td>

            <td id="download" style="text-align: center;">  <!-- 评级报告 -->
                <c:choose>
                    <c:when test="${empty vo.p2pFinancingRatingInfo.commitReport}">
                        <font align="center">—</font>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:;" target="_blank;"
                           onclick="creditReportDown( '${vo.p2pFinancingRatingInfo.commitReport}');return false;">简版</a>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:;" target="_blank;"
                           onclick="creditReportDown( '${vo.p2pFinancingRatingInfo.creditReport}');return false;">完整版</a>
                    </c:otherwise>
                </c:choose>
            </td>
            <td style="text-align: center"><!-- 债项举债额度 -->
                <c:choose>
                    <c:when test="${empty vo.p2pFinancingRatingInfo.debtLimit}">
                        <font align="center">—</font>
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber pattern='#,##0.00'>${vo.p2pFinancingRatingInfo.debtLimit}</fmt:formatNumber>
                    </c:otherwise>
                </c:choose>
            </td>
            <td style="text-align: center;"><!-- 债项评级级别 -->
                <c:choose>
                    <c:when test="${empty vo.p2pFinancingRatingInfo.ratingLevel}">
                        <font align="center">—</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx}/financing/p2pFinancingRatingInfo/showTheCredit?id=${vo.id}">${vo.p2pFinancingRatingInfo.ratingLevel}</a>
                    </c:otherwise>
                </c:choose>
            </td>

            <td style="text-align: center;"><!-- 债项评级利率 -->
                <c:choose>
                    <c:when test="${empty vo.p2pFinancingRatingInfo.recommendedRate}">
                        <font align="center">—</font>
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber
                                pattern='##.0'>   ${vo.p2pFinancingRatingInfo.recommendedRate *100}</fmt:formatNumber>%
                    </c:otherwise>
                </c:choose>
            </td>

            <td style="text-align: center;"><!-- 是否增信 -->
                <c:choose>
                    <c:when test="${empty vo.p2pFinancingRatingInfo.wetherRep}">
                        <font align="center">—</font>
                    </c:when>
                    <c:otherwise>
                        ${vo.p2pFinancingRatingInfo.wetherRep}
                    </c:otherwise>
                </c:choose>
            </td>
            <td style="text-align: center;">是</td>
            <td style="text-align: center;">用</td>
            <!-- 操作 -->
            <td style="text-align: center;">
                <c:choose>
                <c:when test="${vo.currentStage eq '203'}">
                <a href="${ctx}/financing/p2pFinancingRatingInfo/toCreditFormPage?pid=${vo.id}">结果录入</a>
                </c:when>
                <c:otherwise>
                <a href="${ctx}/financing/p2pFinancingRatingInfo/showTheCredit?id=${vo.id}">查看</a>
                </c:otherwise>
                </c:choose>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>