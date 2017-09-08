<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shenqing.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left jianjie shenq" style="width:72.5%;padding-bottom:30px;">
    <p class="shenqp pull-left">您好,<span>${p2pRegUserCertify.realName}</span>,我们已将您的联系信息发送给投资人，请耐心等待</p><br/><br/>
    <h2>申请进度：</h2>
    <div class="onlyone">
        <c:if test="${page == 1}"><img src="${ctxStatic}/dist/images/jindu/7-11.jpg" alt=""
                                       style="margin-left: 7%;margin-top: 5%"></c:if>
        <c:if test="${page == 2}"><img src="${ctxStatic}/dist/images/jindu/7-5.jpg" alt=""
                                       style="margin-left: 7%;margin-top: 5%"></c:if>
        <c:if test="${page == 3}"><img src="${ctxStatic}/dist/images/jindu/7-15.jpg" alt=""
                                       style="margin-left: 7%;margin-top: 5%"></c:if>
        <c:if test="${page == 4}"><img src="${ctxStatic}/dist/images/jindu/7-19.jpg" alt=""
                                       style="margin-left: 7%;margin-top: 5%"></c:if>
        <span class="span1"><br></span>
        <span class="span2"><br></span>
        <span class="span3"><br></span>
        <span class="span4"><br></span>
        <span class="span5"><br></span>
        <span class="span6"><br></span>
        <span class="span7"><br></span>
        <span class="span8"><br></span>
        <span class="span9"><br></span>
        <span class="span10"><br></span>
        <span class="span11"><br></span>
        <span class="span12"></span>
    </div>
    <div class="tabs">
        <ul>
            <li class="two currents current"><span class="border border-top">已提交的材料</span></li>
            <li class="two border"><span>待提交的材料</span></li>
            <li class="two border "><span>评级结果</span></li>
            <li class="two border"><span>我的订单</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu">
            <div class="one current2">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>材料名称</th>
                        <th>提交时间</th>
                        <th>状态</th>
                        <th>操作</th>
                        <th>审核详情</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rateDocument0}" var="doc">
                        <c:choose>
                            <c:when test="${doc.p2pRateDocumentTemplate.tempType == 3}">
                                <tr>
                                    <td>${doc.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td><a href="javascript:sony('${doc.financingInformationId}','${doc.id}')">查看</a>
                                    </td>
                                    <td>无</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>${doc.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td>
                                        <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${doc.financingInformationId}&rateDocumentTempId=${doc.rateDocumentTempId}">下载</a>
                                    </td>
                                    <td>无</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    </tbody>
                </table>

            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>材料名称</th>
                        <th>提交时间</th>
                        <th>状态</th>
                        <th>操作</th>
                        <th>审核详情</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>

            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>借款项目名称</th>
                        <th>完成时间</th>
                        <th>状态</th>
                        <th>级别</th>
                        <th>评级报告</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td title="${ratingInfo.p2pFinancingInformation.finacingName}">${fns:abbr(ratingInfo.p2pFinancingInformation.finacingName,20)}</td>
                        <td><fmt:formatDate value="${ratingInfo.publishTime}" pattern="yyyy-MM-dd"/></td>
                        <td>已完成</td>
                        <td>${ratingInfo.ratingLevel}</td>
                        <td title="${ratingInfo.p2pFinancingInformation.finacingName}">${fns:abbr(ratingInfo.p2pFinancingInformation.finacingName,20)}</td>
                        <td>
                            <a href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${ratingInfo.p2pFinancingInformation.id}">下载</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>订单类别</th>
                        <th>生成时间</th>
                        <th>费用额度（元）</th>
                        <th>状态</th>
                        <th>支付时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody id="orderOld">

                    <c:forEach items="${orderList}" var="orderInfo">
                        <c:choose>
                            <c:when test="${orderInfo.delFlag!=1 }">
                                <tr>
                                    <td style="text-align: left;"><c:choose>
                                        <c:when test="${!empty orderInfo.orderNo}">${orderInfo.orderNo}</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td style="text-align: left;">评级费</td>
                                    <td style="text-align: left;"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                  value="${orderInfo.orderTime}"/></td>
                                    <td style="text-align: left;"><fmt:formatNumber pattern="#,###.00"
                                                                                    value="${orderInfo.paymentAmount}"/></td>
                                    <td style="text-align: left;">
                                        <c:if test="${orderInfo.paymentStatus == 0}">未支付</c:if>
                                        <c:if test="${orderInfo.paymentStatus == 1}">已支付</c:if>
                                        <c:if test="${orderInfo.paymentStatus == 3}">支付中</c:if>
                                    </td>
                                    <td style="text-align: left;"><c:choose>
                                        <c:when test="${!empty orderInfo.timeOfPayment}">
                                            <fmt:formatDate pattern="yyyy-MM-dd"
                                                            value="${orderInfo.timeOfPayment}"/></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose></td>
                                    <td style="text-align: left;"><c:choose>
                                        <c:when test="${orderInfo.paymentStatus == 1 || orderInfo.paymentStatus == 3}">-</c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${orderInfo.delFlag!=1 }">
                                                    <a href="javascript:payFee('${orderInfo.orderNo}','${orderInfo.orderTime}')"><input
                                                            type="button" value="支付费用"/></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="button" value="过期订单"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
                            </c:when>

                            <c:when test="${orderInfo.delFlag ==1 }">
                                <tr>
                                    <td style="text-align: left;"><c:choose>
                                        <c:when test="">-</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td style="text-align: left;">评级费</td>
                                    <td style="text-align: left;">
                                        -
                                    </td>
                                    <td style="text-align: left;">
                                        <fmt:formatNumber pattern="#,###.00" value="${orderInfo.paymentAmount}"/>
                                    </td>
                                    <td style="text-align: left;">
                                        <c:if test="${orderInfo.paymentStatus == 0}">未支付</c:if>
                                        <c:if test="${orderInfo.paymentStatus == 1}">已支付</c:if>
                                        <c:if test="${orderInfo.paymentStatus == 3}">支付中</c:if>
                                    </td>
                                    <td style="text-align: left;"><c:choose>
                                        <c:when test="${!empty orderInfo.timeOfPayment}">
                                            <fmt:formatDate pattern="yyyy-MM-dd"
                                                            value="${orderInfo.timeOfPayment}"/></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose></td>
                                    <td style="text-align: left;">
                                        <c:choose>
                                            <c:when test="${orderInfo.paymentStatus == 1 || orderInfo.paymentStatus == 3}">-</c:when>
                                            <c:otherwise>
                                                <a href="javascript:createOrder('repay')"><input type="button"
                                                                                                 value="重新支付"/></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>

                    </tbody>


                </table>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/tabs.js"></script>
<script type="text/javascript">
    /* function payFee(){
     var	uid = '${user.loginName}';
     var orderNo = '${orderInfo.orderNo}';
     var orderTime = '${orderInfo.orderTimeView}';
     var paymentAmount = '${orderInfo.paymentAmount}';
     paymentAmount = paymentAmount.split('.')[0] + '00';
     post('${ctx}/financing/payment/enterPay',{orderNo:orderNo,orderDatetime:orderTime,orderAmount:paymentAmount,product:'支付评级费',paymentId:uid});
     } */
    //支付20170724
    function payFee(orderNo, orderTime) {
        var paymentId = '${user.loginName}';
        var uid = '${user.id}';
        //var orderNo = '${orderList[0].orderNo}';
        //var orderTime = '${orderList[0].orderTimeView}';
        //var orderOldTime = '${orderList[0].orderTime}';
        var paymentAmount = '${orderList[0].paymentAmount}';
        var financingInformationId = '${orderList[0].financingInformationId}';
        paymentAmount = paymentAmount.split('.')[0] + '00';
        //paymentAmount = 2;//支付0.01元
        //alert("评级费:测试地址："+paymentAmount+"分");
        post('${ctx}/financing/payment/enterPay',
            {
                orderNo: orderNo,
                orderDatetime: orderTime,
                orderAmount: paymentAmount,
                product: '支付评级费',
                paymentId: paymentId,
                //orderExpireDatetime:1,
                orderExpireDatetime: 24 * 60 * 60,
                financingInformationId: financingInformationId,
                uid: uid,
                payWhat: "debt"
            });
    }
    function createOrder(str) {
        var paymentId = '${user.loginName}';
        var uid = '${user.id}';
        var orderNo = '${orderList[0].orderNo}';
        var orderTime = '${orderList[0].orderTimeView}';
        var orderOldTime = '${orderList[0].orderTime}';
        var paymentAmount = '${orderList[0].paymentAmount}';
        var financingInformationId = '${orderList[0].financingInformationId}';
        $.ajax({
            type: "POST",
            url: "${ctx}/financing/payment/createNewDebtOrder",
            dataType: 'json',
            data: {
                orderNo: orderNo,
                orderDatetime: orderTime,
                orderOldDatetime: orderOldTime,
                orderAmount: paymentAmount,
                product: '支付评级费',
                paymentId: paymentId,
                repay: str,
                financingInformationId: financingInformationId,
                uid: uid
            },
            success: function (data) {
                var orderNo = data.orderNo;
                var date = new Date();
                var orderTime = data.orderTime;

                if (data.paymentStatus == 0) {
                    paymentStatu = '未支付';
                } else if (data.paymentStatus == 1) {
                    paymentStatu = '已支付';
                } else if (data.paymentStatus == 3) {
                    paymentStatu = '支付中';
                }
                var timeOfPayment = data.timeOfPayment;
                if (timeOfPayment = undefined || timeOfPayment == null) {
                    timeOfPayment = '-';
                }
                var paymentAmount = data.reportName;

                var html = '<tr><td style="text-align: left;">' +
                    data.orderNo +
                    '</td>' +
                    '<td style="text-align: left;">评级费</td>' +
                    '<td style="text-align: left;">' +
                    data.orderTimeView +
                    '</td>' +
                    '<td style="text-align: left;">' +
                    paymentAmount +
                    '</td>' +
                    '<td style="text-align: left;">' +
                    paymentStatu +
                    '</td>' +
                    '<td style="text-align: left;">' +
                    timeOfPayment +
                    '</td>' +
                    '<td style="text-align: left;">' +
                    "<a href=javascript:payFee('" + orderNo + "','" + orderTime + "')>" +
                    '<input type="button" value="支付费用"/></a>' +
                    '</td></tr>'
                $('#orderOld').html(html);
            },
            error: function () {
                alert(2);
            }
        });
    }


    function post(url, params) {
        var temp = document.createElement('form');
        temp.action = url;
        temp.method = 'post';
        temp.style.display = 'none';
        for (var x in params) {
            var opt = document.createElement('input');
            opt.name = x;
            opt.value = params[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
    function sony(fid, rdid) {
        post('${ctx}/application/viewAppInfo', {financingInformationId: fid, rateDocumentId: rdid})
    }
</script>
</body>
</html>
