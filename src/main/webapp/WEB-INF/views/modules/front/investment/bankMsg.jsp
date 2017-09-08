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
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>

    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--绑定手机号页面-->
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

    private String zjAccount; //中金 账户
    private String openAccountName; // 开户名
    private String bankName; // 开户行(bank_name)
    private String branchBankName; // 支行名称
    private String bankAccount; // 银行账户
    private String certificateStatus; // 认证状态(success_failure)
    private Date bindTime; // 绑定时间

    <div class="zh-right pull-left bdsjh ">
        <h3>我的银行卡</h3>
        <div id="content">
            <table class="table" style="border:0px">
                <tr>
                    <td>我的银行卡号:</td>
                    <td>${bankAccount}</td>
                </tr>
                "src/main/webapp/WEB-INF/views/modules/front/account/accSettings.jsp"
                <tr>
                    <td>状态:</td>
                    <td>${certificateStatus}</td>
                    <td>
                        ${ctx}
                        <a href="${ctx}/user/p2pAccount/form" role="button" class="btn btn-info">立即绑定</a>
                    </td>
                </tr>
                <tr>
                    <td>开户行银行:</td>
                    <td>${bankName}</td>
                </tr>
                <tr>
                    <td>开户行所在地:</td>
                    <td>${bankAddress}</td>
                </tr>
                <tr>
                    <td>账户类型:</td>
                    <td>${accountType}</td>
                </tr>
                <tr>
                    <td>银行预留手机号:</td>
                    <td>${bankPhone}</td>
                </tr>
                <tr>
                    <td>银行卡类型:</td>
                    <td>${bankType}</td>
                </tr>


            </table>
        </div>
        <div class="clearfix"></div>
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