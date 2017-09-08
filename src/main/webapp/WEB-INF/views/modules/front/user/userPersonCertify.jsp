<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

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

    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页 </a></li>
        <li><a href="${ctx}/user/myAccountinformation/allInformation">我的账户</a></li>
        <li class="lg-active">投资前准备</li>
    </ol>
</div>
<!--内容区域-->
<!--左侧内容区域结束-->
<div class="zh-con">
    <div class="zh-left pull-left">
        <p class="zh-p" style="background: #eaeaea;">
            <a href="${ctx}/user/myAccountinformation/allInformation">账户总览</a>
        </p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/overview">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/income">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/record">投资记录</a></li>
                </ul>
            </li>
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/spendRecord">费用记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/chargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/cashRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone">绑定手机号</a>
                    </li>
                    <li><a href="${ctx}/user/certify/enterCerfityPage">身份认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bankMsg">管理银行卡</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=riskEvaluation">风险测评</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=passwordModify">密码管理</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">举报管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=msgCenter">消息中心<span
                            class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a></li>
                </ul>
            </li>

            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">计算器</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;"
                  action="${ctx }/user/myAccountinformation/certifyInputPage">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz"
                               value="<c:out value='${p2pRegUserCertify.realName}' default='无'></c:out>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz"
                               value="<c:out value='${p2pRegUserCertify.idNumber}' default='无'></c:out>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz"
                               value="<c:out value='${p2pRegUserCertify.idCardFront}' default='无'></c:out>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz"
                               value="<c:out value='${p2pRegUserCertify.idCardBack}' default='无'></c:out>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5 ">
                        <c:if test="${p2pRegUserCertify.auditState==null}"><span id="wrz">未认证</span>
                            <a href="${ctx }/user/myAccountinformation/certifyInputPage" class="wrz-btn">
                                <button class="btn" class="atOnceCertify">立刻认证</button>
                            </a>
                        </c:if>
                        <c:if test="${p2pRegUserCertify.auditState!=null && p2pRegUserCertify.auditState==1}"><span
                                id="wrz">已认证</span></c:if>
                        <c:if test="${p2pRegUserCertify.auditState!=null && p2pRegUserCertify.auditState==2}">
                            <span id="wrz">认证失败</span>
                            <a href="${ctx }/user/myAccountinformation/certifyInputPage" class="wrz-btn">
                                <button class="btn" class="atOnceCertify">立刻认证</button>
                            </a>
                        </c:if>
                        <c:if test="p2pRegUserCertify.auditState!=null p2pRegUserCertify.auditState==3"><span id="wrz">待审核</span></c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">状态说明：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz"
                               value="<c:out value='${p2pRegUserCertify.auditExplain}' default='无'></c:out>"/>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--内容区域结束-->

</html>