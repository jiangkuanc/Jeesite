<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css/homepage.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#checkbox").click(function () {
                if ($("#checkbox").is(':checked')) {
                    $("#yysj").show();
                } else {
                    $("#yysj").hide();
                }
            });

            /**后退或通过浏览器按钮返回时刷新**/
            refresh();
        });

    </script>
    <style type="text/css">
        .col-md-3 {
            padding: 0px;
        }

        .inner {
            background-color: #eee;
            border: 1px solid #999;
            margin: 5px;
            text-align: center;
            vertical-align: middle;
        }

        .ptop {

            margin-top: 30px;
        }

        .pbottom {
            margin-bottom: 30px;
        }

        .f_left {
            float: left;
        }

        .f_right {
            float: right;
        }
    </style>
</head>
<body>
<sys:message content="${message}"/>
<input type="hidden" value="no" id="refreshed">
<div style="margin:0px 10%;">
    <div style="overflow: hidden;">
        <div style="position: relative;float: right;"><input id="checkbox" type="checkbox" checked="checked">首页显示运营数据
        </div>
    </div>
    <div id="yysj">
        <div class="row">
            <h4>运营数据</h4>
        </div>
        <div class="row">
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">累计注册会员</p>
                    <p class="pbottom">${mCount }人</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">满标借贷产品数量</p>
                    <p class="pbottom">${aCount }个</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">借贷产品融资总额</p>
                    <p class="pbottom">${fCount }元</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">待还总额</p>
                    <p class="pbottom">${pCount }元</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">今日注册用户数</p>
                    <p class="pbottom">${rCount }人</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">今日登陆用户数</p>
                    <p class="pbottom">${tCount }人</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">历史注册用户数</p>
                    <p class="pbottom">${uCount }人</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="inner">
                    <p class="ptop">当前在线用户数</p>
                    <p class="pbottom">${sCount }人</p>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="row">
            <div class="f_left"><h4>材料审核任务池</h4></div>
            <div class="f_right"><a href="${ctx }/p2p/config/homePage/p2pHomePageList1">更多</a></div>
        </div>
        <div>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>项目名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${p2pEnterpriseCertifyList}" var="p2pEnterpriseCertify" varStatus="status">
                    <c:if test="${status.count <= 5}">
                        <tr>
                            <td>${status.count }</td>
                            <td>${p2pEnterpriseCertify.p2pFinancingInformation.finacingName}</td>
                            <td>
                                <a href="${ctx}/document/p2pRateDocumentUpload/findlist?id=${p2pEnterpriseCertify.p2pFinancingInformation.id}">
                                    审核
                                </a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
    <div>
        <div class="row">
            <div class="f_left"><h4>募集期借贷产品预警信息</h4></div>
            <div class="f_right"><a href="${ctx }/p2p/config/homePage/p2pHomePageList2">更多</a></div>
        </div>
        <div>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>借贷产品名称</th>
                    <th>代理人名称</th>
                    <th>联系方式</th>
                    <th>预警事宜</th>
                    <th>发布时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${raiseFrontList}" var="vo" varStatus="status">
                    <c:if test="${status.count <= 5}">
                        <tr>
                            <td>${status.count}</td>
                            <td>${vo.finacingName}</td>
                            <td>${vo.realName}</td>
                            <td>${vo.phone}</td>
                            <td>募集期倒计时<fmt:formatNumber
                                    pattern="#">${vo.warndays}</fmt:formatNumber>天，距满标投资差<fmt:formatNumber
                                    pattern="#,##0.00">${vo.restRaiseMoney}</fmt:formatNumber>元
                            </td>
                            <td><fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="f_left"><h4>还款中借贷产品预警信息</h4></div>
        <div class="f_right"><a href="${ctx }/p2p/config/homePage/p2pHomePageList3">更多</a></div>
    </div>
    <div>
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th>序号</th>
                <th>借贷产品名称</th>
                <th>代理人名称</th>
                <th>联系方式</th>
                <th>预警事宜</th>
                <th>发布时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${p2pRepaymentPlanList}" var="p2pRepaymentPlan" varStatus="status">
                <c:if test="${status.count <= 5}">
                    <tr>
                        <td>${status.count}</td>
                        <td>${p2pRepaymentPlan.p2pFinancingInformation.finacingName}</td>
                        <td>${p2pRepaymentPlan.p2pFinancingInformation.user.name}</td>
                        <td>${p2pRepaymentPlan.p2pFinancingInformation.user.phone}</td>
                        <td>应还款倒计时<fmt:formatNumber
                                pattern="#">${p2pRepaymentPlan.p2pFinancingInformation.warndays}</fmt:formatNumber>天，${p2pRepaymentPlan.phase }期应还本金<fmt:formatNumber
                                pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentPrincipal}</fmt:formatNumber>元，利息<fmt:formatNumber
                                pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentInterest}</fmt:formatNumber>元
                        </td>
                        <td><fmt:formatDate value="${p2pRepaymentPlan.p2pFinancingInformation.publishTime}"
                                            pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>