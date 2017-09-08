<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10"/>
<ul class="zhzl">
    <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
        <p class="zhtext "><a href="javascript:;">我的投资</a></p>
        <ul class="zhzllevel2">
            <li><a href="touzizl.html">投资总览</a></li>
            <li><a href="touzisy.html">投资收益</a></li>
            <li><a href="touzijl.html">投资记录</a></li>
        </ul>
    </li>

    <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
        <p class="zhtext "><a href="javascript:;">资金记录</a></p>
        <ul class="zhzllevel2 zhgl">
            <li><a href="bangdingsjh.html">费用记录</a></li>
            <li><a href="xiugaimima.html">充值记录</a></li>
            <li><a href="zhanghusz.html">提现记录</a></li>
        </ul>
    </li>
    <li data-i="2" class=" zhzllevel1 xiajian zhzl-li">
        <p class="zhtext "><a href="javascript:;">账户管理</a></p>
        <ul class="zhzllevel2 zhgl">
            <li><a href="bangdingsjh.html">绑定手机号</a></li>
            <li><a href="xiugaimima.html">身份认证</a></li>
            <li><a href="zhanghusz.html">管理银行卡</a></li>
            <li><a href="bangdingsjh.html">风险测评</a></li>
            <li><a href="xiugaimima.html">会员管理</a></li>
            <li><a href="zhanghusz.html">密码管理</a></li>
            <li><a href="xiugaimima.html">举报管理</a></li>
            <li><a href="zhanghusz.html">消息中心</a></li>
        </ul>
    </li>
    <li data-i="3" class=" zhzllevel1 xiajian zhzl-li">
        <p class="zhtext "><a href="javascript:;">交易助手</a></p>
        <ul class="zhzllevel2 zhgl">
            <li><a href="bangdingsjh.html">计算器</a></li>
        </ul>
    </li>
</ul>
<script type="text/javascript">
    $(function () {
        var mode = '${param.mode}';
        if (mode == 'myFinancApp') {
            $('.leftMenu li:eq(0)').attr('class', 'tz-active')
        } else if (mode == 'myDebt') {
            $('.leftMenu li:eq(1)').attr('class', 'tz-active')
        } else if (mode == 'myRepayment') {
            $('.leftMenu li:eq(2)').attr('class', 'tz-active')
        } else if (mode == 'financRecord') {
            $('.leftMenu li:eq(3)').attr('class', 'tz-active')
        } else if (mode == 'updatePhone') {
            $('.leftMenu li:eq(4)').attr('class', 'tz-active')
        } else if (mode == 'userCertify') {
            $('.leftMenu li:eq(5)').attr('class', 'tz-active')
        } else if (mode == 'enterpriseCertify') {
            $('.leftMenu li:eq(6)').attr('class', 'tz-active')
        } else if (mode == 'pwdManager') {
            $('.leftMenu li:eq(7)').attr('class', 'tz-active')
        } else if (mode == 'accSettings') {
            $('.leftMenu li:eq(8)').attr('class', 'tz-active')
        }
    });
</script>