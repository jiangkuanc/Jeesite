<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>

    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--更换手机号成功页面-->
<!-- 引入账户菜单文件 -->
<%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>
<!--左侧内容区域结束-->
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
        <p class="zh-p" style="background: #eaeaea;"><a
                href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountAll">账户总览</a></p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/overview">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/income">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/record">投资记录</a></li>
                </ul>
            </li>
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/spendRecord">费用记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/chargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/cashRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone">绑定手机号</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=p2pRegUserCertify">身份认证</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bankMsg">管理银行卡</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=riskEvaluation">风险测评</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=passwordModify">密码管理</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">举报管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=msgCenter">消息中心<span
                            class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a></li>
                </ul>
            </li>

            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">计算器</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left xgmm ">
        <div class="mima">
            <h3>修改登录密码</h3>
            <p>
                <img src="${ctxStatic }/dist/images/password.png" alt="">
                <span>密码设置成功，请您牢记。</span>
            </p>
            <p>
                <a class="btn mi-sure" href="${ctx}/sys/user/userLogin">确定</a>
            </p>

            <div class="clearfix"></div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">

</script>


</body>
</html>