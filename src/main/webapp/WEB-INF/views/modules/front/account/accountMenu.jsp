<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10"/>

<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
        <li id="sub" class="lg-active"></li>
    </ol>
</div>

<!--账户总览内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p" style="background: #eaeaea;"><a href="${ctx}/user/p2pUserInformation/accountPermission">账户总览</a>
        </p>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">借款项目管理</a></p>
                <ul class="zhzllevel2 leftMenu">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp">我的申请</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=0">我的借款项目</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0">我的还款</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=financRecord">融资记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">资金管理</a></p>
                <ul class="zhzllevel2 leftMenu">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=rechargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=withdrawRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="2" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">账户管理</a></p>
                <ul class="zhzllevel2 zhgl leftMenu">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=updatePhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=userCertify">身份认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=enterpriseCertify">企业认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=pwdManager">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=0">信用记录</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">消息中心</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=memberManager">会员管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accSettings">账户设置</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        $(function () {
            showBT('账户总览');
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var mode = '${param.mode}';
            var param = '${mode}';
            if (mode == '') {
                mode = param;
            }
            if (mode == 'myFinancApp') {
                $('.leftMenu li:eq(0)').attr('class', 'tz-active')
                showBT('我的申请');
            } else if (mode == 'myDebt') {
                $('.leftMenu li:eq(1)').attr('class', 'tz-active')
                showBT('我的借款项目');
            } else if (mode == 'myRepayment') {
                $('.leftMenu li:eq(2)').attr('class', 'tz-active')
                showBT('我的还款');
            } else if (mode == 'financRecord') {
                $('.leftMenu li:eq(3)').attr('class', 'tz-active')
                showBT('融资记录');
            } else if (mode == 'rechargeRecord') {
                $('.leftMenu li:eq(4)').attr('class', 'tz-active')
                showBT('充值记录');
            } else if (mode == 'withdrawRecord') {
                $('.leftMenu li:eq(5)').attr('class', 'tz-active')
                showBT('提现记录');
            } else if (mode == 'updatePhone') {
                $('.leftMenu li:eq(6)').attr('class', 'tz-active')
                showBT('绑定手机号');
            } else if (mode == 'userCertify') {
                $('.leftMenu li:eq(7)').attr('class', 'tz-active')
                showBT('身份认证');
            } else if (mode == 'enterpriseCertify') {
                $('.leftMenu li:eq(8)').attr('class', 'tz-active')
                showBT('企业认证');
            } else if (mode == 'pwdManager') {
                $('.leftMenu li:eq(9)').attr('class', 'tz-active')
                showBT('密码管理');
            } else if (mode == 'creditRecord') {
                $('.leftMenu li:eq(10)').attr('class', 'tz-active')
                showBT('信用记录');
            } else if (mode == 'msgCenter' || mode == 'msgContent') {
                $('.leftMenu li:eq(11)').attr('class', 'tz-active')
                showBT('消息中心');
            } else if (mode == 'memberManager') {
                $('.leftMenu li:eq(12)').attr('class', 'tz-active')
                showBT('会员管理');
            } else if (mode == 'accSettings') {
                $('.leftMenu li:eq(13)').attr('class', 'tz-active')
                showBT('账户设置');
            } else if (mode == 'paymentDetails') {
                showBT('款项详情');
            }
        });

        function showBT(htm) {
            $('#sub').html(htm);
            $('#sub').show();
        }
    </script>