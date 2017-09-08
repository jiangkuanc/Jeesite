<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户设置页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li class="lg-active">我的账户</li>
    </ol>
</div>

<!--内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p ">账户总览</p>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=userCertify">身份认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=enterpriseCertify">企业认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=pwdManager">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">消息中心</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accSettings">账户设置</a></li>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian ">
                <p class="zhtext txzh"><a href="javascript:void(0);">融资管理</a></p>
                <ul class="zhzllevel2 ">
                    <li><a href="">我的融资申请</a></li>
                    <li><a href="">我的债项</a></li>
                    <li><a href="">我的还款</a></li>
                    <li><a href="">融资记录</a></li>
                    <li class="tz-active zhsz"><a href="">账户设置</a></li>
                </ul>
            </li>

            <li data-i="2" class=" zhzllevel1  xiajian ">
                <p class="zhtext txzh"><a href="javascript:;">我的项目</a></p>
                <ul class="zhzllevel2">
                    <li><a href="">项目发布</a></li>
                    <li><a href="">发布记录</a></li>
                </ul>
            </li>
        </ul>

    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left shezhi ">
        <h3 class="">账户设置</h3>
        <div>
            <ul>
                <li class="sz-text">密码设置</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已设置</button>
                </li>
                <li class="sz-text2">上次登录时间：2015-12-28 09：34:08</li>
                <li class="sz-btn2">
                    <button class="btn"><a href="">修改密码</a></button>
                </li>
            </ul>
            <ul>
                <li class="sz-text">安全头像</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未设置</button>
                </li>
                <li class="sz-text2">用于确认访问的网站是否为大公数据官网</li>
                <li class="sz-btn2">
                    <button class="btn "><a href="">立即设置</a></button>
                </li>
            </ul>
            <ul>
                <li class="sz-text">手机认证</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已认证</button>
                </li>
                <li class="sz-text2">15841516689</li>
                <li class="sz-btn2">
                    <button class="btn"><a href="">更改</a></button>
                </li>
            </ul>
            <ul>
                <li class="sz-text">邮箱认证</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已认证</button>
                </li>
                <li class="sz-text2">15841516689</li>
                <li class="sz-btn2">
                    <button class="btn"><a href="">更改</a></button>
                </li>
            </ul>
            <ul>
                <li class="sz-text">对接人信息</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已完成</button>
                </li>
                <li class="sz-text2"></li>
                <li class="sz-btn2">
                    <button class="btn"><a href="">更改</a></button>
                </li>
            </ul>
        </div>


        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">

</script>


</body>
</html>