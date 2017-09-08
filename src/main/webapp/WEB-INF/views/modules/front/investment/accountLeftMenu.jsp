<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10"/>
<%-- <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript">
    // 当点击li菜单时
    $("li").click(function () {
        // 缓存当前点击的li对象
        var $this = $(this);
        // 获取当前对象是否包含执行的class样式
        var thisCss = $this.hasClass("tz-active");
        // 如果当前对象存在class样式（可以理解为当前为选中状态）
        if (thisCss) {
            // 去掉当前样式（未选中）
            $this.removeClass("tz-active");
        } else {// 如果不存在某样式
            // 添加样式
            $this.addClass("tz-active");
        }
    })

</script>
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/Institution/ctrlMenu">我的账户</a></li>
        <li class="lg-active" id="sub"></li>
    </ol>
</div>

<!--账户总览内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p tz-active" style="background: #eaeaea;"><a href="${ctx}/user/Institution/ctrlMenu">账户总览</a></p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="#">投资管理</a></p>
                <ul class="zhzllevel2 leftMenu">
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=investmentGeneral">投资总览</a></li>
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=investmentIncome">投资收益</a></li>
                    <%--  <li><a href="${ctx}/user/Institution/ctrlMenu?mode=investmentRecord">投资记录</a></li> --%>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">账户管理</a></p>
                <ul class="zhzllevel2 zhgl leftMenu">
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=updatePhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=setUserpic">头像设置</a></li>
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=pwdManager">密码管理</a></li>
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter">消息中心</a></li>
                    <li><a href="${ctx}/user/Institution/ctrlMenu?mode=accountSet">账户设置</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        $(function () {
            showBT('账户总览');
        });
        $(function () {
            var mode = '${param.mode}';
            if (mode == 'investmentGeneral') {
                $('.leftMenu li:eq(0)').attr('class', 'tz-active')
                showBT('投资总览');
            } else if (mode == 'investmentIncome') {
                $('.leftMenu li:eq(1)').attr('class', 'tz-active')
                showBT('投资收益');
            } else if (mode == 'updatePhone') {
                $('.leftMenu li:eq(2)').attr('class', 'tz-active')
                showBT('绑定手机号');
            } else if (mode == 'setUserpic') {
                $('.leftMenu li:eq(3)').attr('class', 'tz-active')
                showBT('头像设置');
            } else if (mode == 'pwdManager') {
                $('.leftMenu li:eq(4)').attr('class', 'tz-active')
                showBT('密码管理');
            } else if (mode == 'msgCenter' || mode == 'msgContent') {
                $('.leftMenu li:eq(5)').attr('class', 'tz-active')
                showBT('消息中心');
            } else if (mode == 'accountSet') {
                $('.leftMenu li:eq(6)').attr('class', 'tz-active')
                showBT('账户设置');
            }
        });

        function showBT(htm) {
            $('#sub').html(htm);
            $('#sub').show();
        }
    </script>