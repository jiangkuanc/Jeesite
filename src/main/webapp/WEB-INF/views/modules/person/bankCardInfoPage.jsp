<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <%--    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css"> --%>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <%--   <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
<link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">

<link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
<link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
<link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
<link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
<link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
<link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
<link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
<link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    --%>

    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <style>
        .input-group {
            width: 90%;
        }

        .form-group span {
            font-size: 18px;
            color: #909090;
            width: 22%;
            text-align: right;
        }

        /*         .breadcrumb > li + li::after {
        padding: 0 5px;
        color: #ccc;
        content: ">";
    } */
        .form-group .btn-default {
            margin-left: 0;
        }

        .kv-fileinput-upload {
            height: 34px;
            width: 49%;
            margin-bottom: 5px;
        }

        .fileinput-remove {
            height: 34px;
            width: 49%;
            margin-bottom: 5px;
        }

        .btn-primary {
            background-color: #fff;
            border-color: #ccc;
            color: #555;
            width: 100%;
        }

        .form-horizontal .has-feedback .form-control-feedback {
            right: 15px;
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

        .form-horizontal {
            margin-left: 15%;
            margin-top: 50px;
            width: 99%
        }

        .btn-info {
            margin-left: 20px
        }

        .btn-default {
            margin-left: 0;
            width: 100%;
        }

        .btn-default[type='submit'] {
            display: none;
        }

        .file {
            margin-top: 10px;
        }

        .file-caption-name, .file-preview-other, .file-other-error, .file-preview-frame {
            width: 320px;
        }

        .file-thumbnail-footer {
            display: block;
        }

        .file-error-message {
            word-wrap: break-word;
            word-break: break-all;
        }

        .breadcrumb a {
            color: #737373
        }

        .infobottom a {
            color: #909090
        }

        /* 面包屑导航样式  */
        .breadcrumb > li + li:before {
            padding: 0px;
            color: #ccc;
            content: "";
        }

        .breadcrumb > li + li:after {
            padding: 0 2px;
            color: #ccc;
            content: ">";
        }

        .breadcrumb > li:last-of-type:after {
            padding: 0px;
            color: #ccc;
            content: "";
        }

    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active"><b><a href="${ctx}/user/accountGeneration/showAllInformation"
                                        style="color:#333">银行卡绑定</a></b></li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->

    <div class="renzheng-index zh-right pull-left">

        <div class="renzheng-form pull-left">
            <div class="pull-left zhaimima ">
                <div class="renzheng ">
                    <h3 class="zhai-mima rz-h3">绑卡完成</h3>
                    <div class="mima" style="width:183%">
                        <p>
                            <img src="${ctxStatic}/dist/images/password.png" alt="">
                            <span>恭喜您，您的银行卡已经绑定成功。</span>
                        </p>
                        <p>
                            <a href="${ctx}/user/accountGeneration/showAllInformation">
                                <button class="btn mi-sure">确定</button>
                            </a>
                            <!--<a href="${ctx}/user/bankCard/beMember"><button class="btn mi-sure qi-btn">成为会员</button></a>-->
                            <a href="${ctx}/user/Institution/ctrlMenuPerson?mode=riskRecord">
                                <button class="btn mi-sure qi-btn">风险测评</button>
                            </a>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

    </div>
</div>
<!-- 引入footer页脚文件 -->
<div class="infobottom">
    <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</div>
</body>
</html>