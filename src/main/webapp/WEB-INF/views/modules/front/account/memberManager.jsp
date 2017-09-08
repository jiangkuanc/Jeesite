<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
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
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
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
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
<div class="zh-right pull-left" style="padding-top: 75px">
    <div class="zh-right-div">
        <c:choose>
            <c:when test="${certifyState == 400}">
                <h4>
                    会员昵称：<span style="color: #666666;">&nbsp;${user.loginName}</span>
                </h4>
                <h4>
                    会员类型：<span style="color: #666666;">免费会员</span>
                    <button class="btn btn-primary" style="background:#529ffd;;width:25%;color:#fff;">续费</button>
                </h4>
                <h4>
                    到期日期：<span class="date">2017-12-31</span>
                </h4>
                <h5>
                    <span>*</span>说明：2017年12月31日前可以免费成为会员在平台上进行投资。
                </h5>
            </c:when>
            <c:otherwise>
                <h4>
                    会员昵称：<span style="color: #666666;">&nbsp;无</span>
                </h4>
                <h4>
                    会员类型：<span style="color: #666666;">无</span>
                    <button onclick="link()" class="btn btn-primary" style="background:#FE6E42;;width:25%;color:#fff;">
                        成为会员
                    </button>
                </h4>
                <h4>
                    到期日期：<span class="date">无</span>
                </h4>
                <h5>
                    <span>*</span>说明：2017年5月31日前可以免费成为会员在平台上进行投资。
                </h5>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    function link() {
        var certifyState = '${certifyState}';
        if (certifyState == 101) {
            alert('请先完成实名认证！');
        } else if (certifyState == 200 || certifyState == 301 || certifyState == 302) {
            alert('请先完成企业认证！');
        }
        window.location.href = '${ctx}/user/p2pUserInformation/becomeMember';
    }
</script>
</html>