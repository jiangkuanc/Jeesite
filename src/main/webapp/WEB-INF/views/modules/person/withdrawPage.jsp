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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">

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
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active"><a href="#">提现记录</a></li>
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
        <!-- 提现页面 -->
        <div>
            <h3 style="font-family:''微软雅黑'';font-size:14px;">
                <span style="font-size:14px;">账户余额：${"100.00"}元</span>
                <span style="width:20px;height:100px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <span style="font-size:14px;">可提现额度：${"100.00"}元</span>
            </h3>
        </div>
        <div class="row">
            <div class="col-md-4">
                <form class="form" action="${ctx}/" method="post">
                    <div style="font-family:''微软雅黑'';font-size:14px;">
                        收款账号:<input id="bankAccount" type="text" name="bankAccount" value="${p2pAccount.bankAccount}"
                                    class="form-control">
                    </div>
                    <div style="font-family:''微软雅黑'';font-size:14px;">
                        收款人:<input id="realName" type="text" name="realName" value="${realName }" class="form-control">
                    </div>
                    <div style="font-family:''微软雅黑'';font-size:14px;">
                        提现金额：<input id="withdrawAmount" type="text" name="withdrawAmount" value="" class="form-control">
                    </div>
                    <div style="font-family:''微软雅黑'';font-size:14px;">
                        手机验证码：<input id="certifyCode" type="text" name="certifyCode" class="form-control">
                        <input type="hidden" name="smsPhone" value="${smsPhone}">
                    </div>
                    <div><br/></div>
                    <div>
                        <button id="tixian" type="button" class="btn btn-primary col-md-offset-2" name="tixian"
                                value="提现">提现
                        </button>
                    </div>
                </form>
            </div>

        </div>

        <div class="clearfix"></div>
    </div>
    <!--账户总览内容区域结束-->
    <!-- 引入footer文件 -->
    <!--账户总览内容区域结束-->
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        var data = {"withdrawAmount": $("#withdrawAmount").val()};
        $("#tixian").click(function () {
            //收款账号 bankAccount
            var bankAccount = $("#bankAccount").val();
            //收款人realName
            var realName = $("#realName").val();
            //提现金额 withdrawAmount
            var withdrawAmount = $("#withdrawAmount").val();
            //手机验证码 certifyCode
            var certifyCode = $("#certifyCode").val();
            if (bankAccount == '' || bankAccount == null) {
                alert("收款账号不能为空")
            }
            if (realName == '' || realName == null) {
                alert("收款人不能为空");
            }
            if (withdrawAmount == '' || withdrawAmount == null) {
                alert("提现金额不能为空");
            }
            if (certifyCode == null || certifyCode == '') {
                alert("手机验证码不能为空");
            }
            $.post("${ctx}/p2p/user/p2pAccountWithdrawRecord/withDrawAmount", data, function (data) {
                if (data != 0) {
                    alert("提现失败");
                }
                else {
                    alert("提现成功");
                }
            })
        })
    })
</script>
</body>
</html>
  