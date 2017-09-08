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
        <li><a href="${ctx}/user/Guarantee/ctrlMenu">我的账户</a></li>
        <li id="sub" class="lg-active"></li>
    </ol>
</div>

<!--账户总览内容区域-->
<div id="content" class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0)">我的担保任务</a></p>
                <ul class="zhzllevel2 leftMenu">
                    <li class=""><a href="${ctx}/user/Guarantee/ctrlMenu">担保任务</a></li>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0)">账户管理</a></p>
                <ul class="zhzllevel2 leftMenu">
                    <li><a href="${ctx}/user/Guarantee/ctrlMenu?mode=pwdManager">密码管理</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        $(function () {
            showBT('担保任务');
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var mode = '${param.mode}';
            var param = '${mode}';
            if (mode == '') {
                mode = param;
            }
            if (mode == 'pwdManager') {
                $('.leftMenu li:eq(1)').attr('class', 'tz-active')
                showBT('密码管理');
            } else {
                $('.leftMenu li:eq(0)').attr('class', 'tz-active')
                showBT('担保任务');
            }
        });

        function showBT(htm) {
            $('#sub').html(htm);
            $('#sub').show();
        }
    </script>