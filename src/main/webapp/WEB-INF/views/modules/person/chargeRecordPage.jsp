<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li>我的位置：</li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active"><a href="#">充值记录</a></li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left ">
        <!--右侧上部左侧-->
        <form class="form-inline" role="form">
            充值额度:<input type="text" class="form-control" name="chargeMoney" id="chargeValue">元
            <input type="button" class="form-control" name="btn_charge" class="btn btn-info" value="充值"/>
        </form>
        <div class="clearfix"></div>
    </div>
    <!--账户总览内容区域结束-->
    <!-- 引入footer文件 -->
    <!--账户总览内容区域结束-->
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {

        /* private Double rechargeAmount;			// 充值金额
         private Date rechargeTime;				// 充值时间
         private String rechargeState;			// 充值状态(recharge_state)
         private Date rechargeSuccessTime;		// 充值成功时间
         private String userId;					//用户编号
         private P2pAccount p2pAccount; */

        //充值的金额
        var rechargeAmount = $(":input[name='chargeMoney']").val();
        record = {"rechargeAmount": rechargeAmount};
        $(":input[name='btn_charge']").click(function () {
            var chargeValue = $("#chargeValue").val();//获取充值额度
            alert(chargeValue);
            if (chargeValue == "" || chargeValue == null || chargeValue == undefined) {
                alert("请输入充值金额");
                return;
            }
            if (chargeValue <= 0) {
                alert("请输入正确的充值额度");
                return;
            }
            //验证有两位小数的正实数：^[0-9]+(.[0-9]{2})?$
            //验证数字的正则
            //：^[0-9]+(.[0-9]{2})?$
            var reg = new RegExp("^[0-9]*$");
            if (!reg.test(chargeValue)) {
                alert("请输入正确的充值金额!");
                return;
            }
            //alert("send data")
            $.post("${ctx}/p2p/user/p2pAccountRechargeRecord/saveChargeRecord", {rechargeAmount: chargeValue}, function (data) {
                var obj = eval('(' + data + ')');
                alert(obj.message);
                if (obj.status == '3' || obj.status == '0') {
                    alert("充值失败");
                    return;
                }

                if (true == confirm("回到充值记录页面！")) {
                    window.location.href = "${ctx}/p2p/user/p2pAccountRechargeRecord/loadRechargeRecord";
                }
            })
        })
    })
</script>
</body>
</html>
  