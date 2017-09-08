<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <!--
    		<link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
		    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    	 -->
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">

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

        body a {
            color: #909090
        }

        .zh-right-div-wdyhk h4 label {
            display: line-block;
            width: 50%;
            text-align: right;
            font-weight: 500;
            font-family: "微软雅黑";
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">身份认证</li>
    </ol>
</div>

<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zh-right-div zh-right-div-wdyhk" style="width: 55%;">
            <h3>身份认证</h3>
            <h4>
                <label>姓名：</label>
                <span>无</span>
            </h4>
            <h4>
                <label>我的身份证号：</label>
                <span>无</span>
            </h4>
            <h4>
                <label>状态：</label>
                <span>无</span>
                <button id="instantCert" class="btn btn-primary"
                        style="background: #f2434a;margin-left:8%;width:23%;padding:1% 3%;color:white;">立即认证
                </button>
                </a>
            </h4>
            <h4>
                <label>手持身份证照片：</label>
                <span>无</span>
            </h4>
            <h4>
                <label>身份证正面照片：</label>
                <span>无</span>
            </h4>
            <h4>
                <label>身份证背面照片：</label>
                <span>无</span>
            </h4>
            <h4>
                <label>说明：</label>
                <span>无</span>
            </h4>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    //立即认证按钮
    $("#instantCert").click(function () {
        window.location.href = "${ctx}/user/idCardCertify/certify";
    });
</script>
</body>
</html>