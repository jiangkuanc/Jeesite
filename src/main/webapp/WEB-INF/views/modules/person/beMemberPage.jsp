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
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">成为会员</li>
    </ol>
</div>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zh-right-div">
            <h4>
                会员昵称：<span style="color: #666666;">&nbsp;<c:out value="${user.loginName}" default="无"></c:out></span>
            </h4>
            <h4>
                会员类型：<span style="color: #666666;">
						<c:out value="${p2pMember.memberType}" default="无"></c:out>
					</span>
                <%-- <a href="${ctx}/user/bankCard/authComplete"></a> --%>
                <button id="beMemeberId" class="btn btn-primary" style="background:#FE6E42;;width:25%;color:#fff;">
                    成为会员
                </button>
            </h4>
            <h4>
                到期日期：<span class="date">
					<c:out value="${p2pMember.endTime}" default="无"></c:out>
					</span>
            </h4>
            <h5>
                <span>*</span>说明：2017年5月31日前可以免费成为会员在平台上进行投资。
            </h5>
            <%-- <h5>
                <a href="${ctx}/user/bankCard/authComplete">实名认证完成</a>
            </h5> --%>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    function abc() {
        window.location.href = '${frontPath}';
    }

    $(function () {
        $("#beMemeberId").click(function () {
            getStepForCertify();
        })
    })
    /**
     用户在实名认证的过程中出于哪一步?

     */
    function getStepForCertify() {
        var url = "${ctx}/user/bankCard/getCertifyStateVal";
        var certifyState = -1;//实名认证状态值
        $.get(url, function (data) {
            //alert(data);
            var dataVal = eval(data);

            switch (dataVal) {

                /**
                 * -4.网络异常
                 * -3.实名认证失败
                 * -2.实名认证审核
                 * -1.未进行实名认证
                 * 0.未进行绑卡
                 * 1.未进行风险测评
                 * 2.未成为会员
                 * 3.实名认证完成
                 */
                case "-4" :
                    alert("网络错误！");
                    break;
                case "-3" :
                    alert("您的实名认证失败,请您完成实名认证");
                    break;
                case "-2" :
                    alert("您的实名认证审核中,请等待！");
                    break;
                case "-1" :
                    alert("您未进行实名认证,请您完成实名认证！");
                    break;
                case "0" :
                    alert("您未进行银行卡绑定,请您完成银行卡绑定！");
                    break;
                case "1" :
                    alert("您未进行风险测评,请您完成风险测评！");
                    break;
                case "2" :
                case "3" :
                    window.location.href = "${ctx}/user/bankCard/beMember2";//如果实名认证完成,则跳转到成为会员页面
                    break;
                default:
                    break;
            }
        });
    }

</script>
</html>