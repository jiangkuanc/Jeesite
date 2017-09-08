<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<!-- 引入账户菜单文件 -->
<%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${ctx}">首页</a></li>
        <li class="active"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
    </ol>
</div>
<!--左侧内容区域结束-->
<div class="zh-con">
    <div class="zh-left pull-left">
        <p class="zh-p"><a href="${ctx}/user/p2pUserInformation/accountPermission">账户总览</a></p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="">投资管理</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentGeneral">投资总览</a></li>
                    <li class="tz-active"><a
                            href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentIncome">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentRecord">投资记录</a></li>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=passwordModify">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accountSet">账户设置</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zhright_top">
            <!--左侧-->
            <div class="zh-top_left pull-left">
                <div class="pull-left">
                    <c:if test="${p2pUserPic.userpic==null||''.equals(p2pUserPic.userpic) }">
                        <p>
                            <img style="width:100px" src="${ctxStatic }/dist/images/user.png" alt="">
                        </p>
                    </c:if>
                    <c:if test="${p2pUserPic.userpic!=null || !''.equals(p2pUserPic.userpic)}">
                        <p>
                            <img style="width:100px" src="${pageContext.request.contextPath}/${p2pUserPic.userpic }"
                                 alt="">
                        </p>
                    </c:if>
                    <p class="zh-user">
                        投资人信息
                    </p>
                </div>
                <div class="pull-left top-text">
                    <p class="ninhao">您好，<span>${user.loginName }</span></p>
                    <p>企业名称：<span>${p2pUserInformation.bankname }</span></p>
                    <p>手机：<span>${user.phone }</span><b class="num"></b></p>
                </div>
            </div>
            <!--右侧-->
            <div class="zh-top_right pull-left">
                <!--                     <p class="ljje"> -->
                <!--                	投资金额：<span>${allInvestmentAmount } 元</span> -->
                <!--                     </p> -->
            </div>
            <div class="clearfix"></div>
        </div>
        <!--投资推荐处-->
        <div class="zh-right-bottom">
            <div class="tz" style="margin-bottom: 20px;">
                <h3>还款计划</h3>
            </div>
            <table class="table table-hover table-striped table-bordered table-condensed"
                   style="table-layout: fixed;font-size: 12px;">
                <!--                     <thead> -->
                <!--                     <tr class="active list-th"> -->
                <!--                     	<th>序号</th> -->
                <!--                         <th width="20%">债项名称</th> -->
                <!--                         <th>计划还款日期</th> -->
                <!--                         <th>计划还款金额</th> -->
                <!--                         <th>实际还款日期</th> -->
                <!--                         <th>实际还款金额</th> -->
                <!--                         <th>年化率</th> -->
                <!--                         <th>当前状态</th> -->
                <!--                     </tr> -->
                <!--                     </thead> -->
                <!--                     <tbody id="itemContainer"> -->
                <!--                     <c:if test="${repaymentRecordList[0] == null}"> -->
                <!--                     	<tr > -->
                <!-- 		                   <td colspan="8" rowspan="2" > -->
                <!-- 		                       <div class="cai-text">暂无还款计划</div> -->
                <!-- 		                   </td> -->
                <!-- 		               </tr> -->
                <!--                     </c:if> -->
                <!--                     <c:if test="${repaymentRecordList[0] != null}"> -->
                <!-- 	                    <c:forEach items="${repaymentRecordList}"  var="repaymentRecordList" varStatus="status"> -->
                <!-- 	                    	<input type="hidden" value="${p2pInvestment.id }"/> -->
                <!-- 	                    	<tr> -->
                <!-- 	                    		<td>第 ${status.count} 期</td> -->
                <!-- 		                        <td><a href="javascript:void(0);">${repaymentRecordList.finacingName }</a></td> -->
                <!-- 				                <td><fmt:formatDate value="${repaymentRecordList.p2pRepaymentRecord.planRepaymentDate }" /></td> -->
                <!-- 				                <input id="date1" type="hidden" value="${repaymentRecordList.p2pRepaymentRecord.planRepaymentDate }"> -->
                <!-- 				                <td>${repaymentRecordList.p2pRepaymentRecord.planRepaymentAmount }</td> -->
                <!-- 				                <td><fmt:formatDate value="${repaymentRecordList.p2pRepaymentRecord.realRepaymentDate }" /></td> -->
                <!-- 				                <input id="date2" type="hidden" value="${repaymentRecordList.p2pRepaymentRecord.realRepaymentDate }"> -->
                <!-- 				                <td>${repaymentRecordList.p2pRepaymentRecord.realRepaymentAmount }</td> -->
                <!-- 				                <td>${repaymentRecordList.p2pFinancingRatingInfo.recommendedRate*100 }%</td> -->
                <!-- 			                	<td id="state"></td> -->
                <!-- 		                    </tr> -->
                <!-- 	                    </c:forEach> -->
                <!--                     </c:if> -->

                <!--                     </tbody> -->
                <tbody>
                <tr>
                    <th rowspan="2" width="6%;">账期</th>
                    <th colspan="2" width="22%;">当期还款时间</th>
                    <th colspan="2" width="22%;">当期本金（元）</th>
                    <th colspan="2" width="22%;">当期利息（元）</th>
                    <th colspan="2" width="22%;">当期还款合计（元）</th>
                    <th rowspan="2" width="6%;">本期是否还清</th>
                </tr>
                <tr>
                    <th width="11%;">应还</th>
                    <th width="11%;">实还</th>
                    <th width="11%;">应还</th>
                    <th width="11%;">实还</th>
                    <th width="11%;">应还</th>
                    <th width="11%;">实还</th>
                    <th width="11%;">应还</th>
                    <th width="11%;">实还</th>
                </tr>
                <c:forEach varStatus="status" items="${list }" var="map">
                    <tr>
                        <td>${map.phase }</td>
                        <td><fmt:formatDate value="${map.time }" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${map.realTime }" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatNumber pattern="#,##0.00">${map.principal }</fmt:formatNumber></td>
                        <td><c:if test="${!empty map.realAmount}">${map.principal }</c:if></td>
                        <td><fmt:formatNumber pattern="#,##0.00">${map.interest }</fmt:formatNumber></td>
                        <td><c:if test="${!empty map.realAmount}">${map.interest }</c:if></td>
                        <td><fmt:formatNumber pattern="#,##0.00">${map.principal+map.interest }</fmt:formatNumber></td>
                        <td><a href="javascript:;">${map.realAmount }</a></td>
                        <td><c:if test="${!empty map.realAmount}">是</c:if></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>合计</td>
                    <td></td>
                    <td></td>
                    <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal }</fmt:formatNumber></td>
                    <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealPrincipal }</fmt:formatNumber></td>
                    <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumInterest }</fmt:formatNumber></td>
                    <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealInterest }</fmt:formatNumber></td>
                    <td><fmt:formatNumber
                            pattern="#,##0.00">${sumMap.sumPrincipal+sumMap.sumInterest }</fmt:formatNumber></td>
                    <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumRealAmount }</fmt:formatNumber></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="form-actions">
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
            <div class="holder"></div>
        </div>
        <!--分页-->
    </div>
    <!--右侧内容区域结束-->
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/left.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script type="text/javascript">
    $(function () {
        var time1 = new Date($("#date1").val());
        var time2 = new Date($("#date2").val());
        var flag = parseInt(time1.getTime() - time2.getTime());
        if (flag < 0) {
            $("#state").html("未还款");
        } else {
            $("#state").html("已还款");
        }
    });
    function fenye(content, id) {
        $(content).jPages({
            containerID: id, //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 10, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    }
    fenye("div.holder", "itemContainer")


</script>
</body>
</html>