<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>丝路互金网</title>
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
<div class="zh-right pull-left jianjie shenq"
     style="width:72.5%;padding-bottom:30px;">
    <p class="shenqp pull-left">
        您好,<span>${p2pRegUserCertify.realName}</span>,我们正在对您的评级报告进行最后确认。
    </p>
    <br/>
    <br/>
    <h2>申请进度：</h2>
    <div class="onlyone">
        <c:if test="${page == 1}">
            <img src="${ctxStatic}/dist/images/jindu2/8.jpg" alt=""
                 style="margin-left: 7%;margin-top: 5%">
        </c:if>
        <c:if test="${page == 0}">
            <img src="${ctxStatic}/dist/images/jindu2/7.jpg" alt=""
                 style="margin-left: 7%;margin-top: 5%">
        </c:if>
        <span class="span1"><br>
			</span> <span class="span2"><br>
			</span> <span class="span3"><br>
			</span> <span class="span4"><br>
			</span> <span class="span5"><br>
			</span> <span class="span6"><br>
			</span> <span class="span7"><br>
			</span> <span class="span8"><br>
			</span> <span class="span9"><br>
			</span> <span class="span10"><br>
			</span> <span class="span11"><br>
			</span> <span class="span12"></span>
    </div>
    <div class="tabs">
        <ul>
            <li class="two currents current"><span
                    class="border border-top">已提交的材料</span>
            </li>
            <li class="two border"><span>待提交的材料</span>
            </li>
            <li class="two border "><span>评级结果</span>
            </li>
            <li class="two border"><span>我的订单</span>
            </li>

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
                        <th>债项名称</th>
                        <th>完成时间</th>
                        <th>状态</th>
                        <th>级别</th>
                        <th>评级报告</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td title="${ratingInfo.p2pRatingServiceInfo.ratingName}">${fns:abbr(ratingInfo.p2pRatingServiceInfo.ratingName,20)}</td>
                        <td><fmt:formatDate value="${ratingInfo.publishTime}"
                                            pattern="yyyy-MM-dd"/>
                        </td>
                        <td>修改中</td>
                        <td>${ratingInfo.mainCreditGrade}</td>
                        <td title="${ratingInfo.p2pRatingServiceInfo.ratingName}">${fns:abbr(ratingInfo.p2pRatingServiceInfo.ratingName,20)}</td>
                        <td><a
                                href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport2?fid=${ratingInfo.p2pRatingServiceInfo.id}">下载</a>
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
                    <tbody>
                    <tr>
                        <td style="text-align: left;"><c:choose>
                            <c:when test="${!empty orderInfo.orderNo}">${orderInfo.orderNo}</c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                        </td>
                        <td style="text-align: left;">评级费</td>
                        <td style="text-align: left;"><fmt:formatDate
                                pattern="yyyy-MM-dd" value="${orderInfo.orderTime}"/>
                        </td>
                        <td style="text-align: left;"><fmt:formatNumber
                                pattern="#,###.00" value="${orderInfo.paymentAmount}"/>
                        </td>
                        <td style="text-align: left;"><c:if
                                test="${orderInfo.paymentStatus == 0}">未支付</c:if> <c:if
                                test="${orderInfo.paymentStatus == 1}">已支付</c:if></td>
                        <td style="text-align: left;"><c:choose>
                            <c:when test="${!empty orderInfo.timeOfPayment}">
                                <fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${orderInfo.timeOfPayment}"/>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                        </td>
                        <td style="text-align: left;"><c:choose>
                            <c:when test="${orderInfo.paymentStatus == 1}">-</c:when>
                            <c:otherwise>
                                <a href="javascript:payFee('${financingInformationId}')"><input
                                        type="button" value="支付费用"/>
                                </a>
                            </c:otherwise>
                        </c:choose></td>
                    </tr>
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
    function payFee(fid) {
        alert('正在进行支付操作，请勿关闭窗口！');
        $.ajax({
            type: 'POST',
            url: '${ctx}/rating/front/payRatingFee',
            data: {
                financingInformationId: fid
            },
            success: function (result) {
                window.location.reload();
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
        post('${ctx}/rating/front/viewAppInfo', {financingInformationId: fid, rateDocumentId: rdid})
    }
</script>
</body>
</html>