<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <!--<link rel="stylesheet" type="text/css" href="dist/css/default.css">-->
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
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


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<c:if test="${user.roleList[0].id == 101}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == 102}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li>我的位置：</li>
        <li><a href="#">首页</a></li>
        <li><a href="#">我的账户</a></li>
        <li class="lg-active">设置头像</li>
    </ol>
</div>
<div class="zh-con" style="height:900px;">
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <!--内容区域-->

    <!--左侧内容区域-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left yanzheng ">
        <h3 style="color: #bf1a20;">添加或修改头像</h3>
        <div class="tx-con">

            <form id="defaultForm" enctype="multipart/form-data" action="${ctx}/financing/myAccount/uploadUserPic2"
                  method="post">
                <p style="color: #909090">请从电脑中选择您的照片:<br>
                    你可以上传大小在1M以下的JPG、JPEG、GIF、PNG或BMP文件</p>
                <div class="form-group">
                    <input id="file-0b" class="file" type="file" name="file" required>
                </div>
                <br>
                <div class="clearfix"></div>
                <button type="submit" class="btn btn-primary" style="margin-top: 20px; margin-left: 20px;">提交</button>
                <button type="button" class="btn btn-default" style="height: 34px; width: 54px; margin-top: 20px;"
                        onclick="redirect()">取消
                </button>
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
    $("#file-0").fileinput({
        'allowedFileExtensions': ['jpg', 'png', 'gif', 'jpeg', 'bmp'],
        showCaption: false,
    });
    function redirect() {
        var userId = '${user.id}';

        if (userId != null && userId != "") {
            var userRoleList = '${user.roleList[0].id}';
            if (userRoleList == 101) {
                window.location.href = "${ctx}/user/Institution/ctrlMenu";
            }
            if (userRoleList == 102) {
                window.location.href = "${ctx}/user/p2pUserInformation/accountPermission";
            }
            if (userRoleList == 104) {
                window.location.href = "${ctx}/user/accountGeneration/showAllInformation";
            }
        }

    }
</script>


</body>
</html>