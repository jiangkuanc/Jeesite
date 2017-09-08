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
    <link href="${ctxStatic }/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>
    <script src="${ctxStatic }/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic }/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <style>
        .file-preview {
            float: left;
            width: 30%;
        }

        .input-group {
            float: left;
            width: 50%;
            margin-top: 100px;
            margin-left: 20px;
        }

        .kv-fileinput-upload {
            height: 34px;
        }

        .fileinput-remove {
            height: 34px;
        }

        .btn-primary {
            background-color: #f2434a;
            border-color: #f2434a;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .btn-primary:focus {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open > .dropdown-toggle.btn-primary.focus, .open > .dropdown-toggle.btn-primary:focus, .open > .dropdown-toggle.btn-primary:hover {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .file-thumbnail-footer {
            display: none;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
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
        <p class="zh-p"><a href="${ctx}/user/myAccountinformation/allInformation">账户总览</a></p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="">投资管理</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentGeneral">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentIncome">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentRecord">投资记录</a></li>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=passwordModify">密码管理</a></li>
                    <li class="tz-active"><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accountSet">账户设置</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left yanzheng ">
        <h3 style="color: #bf1a20;">添加或修改头像</h3>
        <div class="tx-con">
            <form enctype="multipart/form-data" action="${ctx}/financing/myAccount/uploadUserPic" method="post">
                <p style="color: #909090">请从电脑中选择您的照片:<br>
                    你可以上传大小在1M以下的JPG、JPEG、GIF、PNG或BMP文件</p>
                <div class="form-group">
                    <input id="file-0b" class="file" type="file" name="file">
                </div>
                <br>
                <div class="clearfix"></div>
                <input type="submit" class="btn btn-primary" style="margin-top: 20px; margin-left: 20px;" value="提交">
                <input type="button" class="btn btn-default" style="height: 36px; width: 100px; margin-top: 20px;"
                       value="取消" onclick="_quxiao();">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $("input[name='file']").fileinput({
        'allowedFileExtensions': ['jpg', 'png', 'gif', 'jpeg', 'bmp'],
        showCaption: false,
        maxFileSize: 800
    });
    function _quxiao() {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission";
    }

</script>
</body>
</html>