<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrapValidator.min.js"></script>
    <style>
        .czmm_box {
            width: 30%;
            margin: 0 auto;
        }

        .czmm_box h3 {
            color: #be1c1a;
            text-align: center;
            margin: 22px 0 50px;
        }

        .input_box {
            margin-bottom: 25px;
            text-align: center;
        }

        .input_box:last-of-type {
            margin: 72px 0 220px;
        }

        .input_box label {
            text-align: right;
            font-size: 18px;
            font-weight: normal;
            margin-right: 4%;
        }

        .form-control {
            display: inline-block;
            width: 70%;
        }

        #next {
            color: #ffffff;
            background: #f2434a;
            padding: 6px 20px;
            border-radius: 8px;
        }

        .has-feedback label ~ .form-control-feedback {
            top: 0px;
            right: 5%;
        }

        .bv-form .help-block {
            margin-bottom: 0;
            padding-left: 28%;
            text-align: left;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh" style="border-bottom: 1px solid #d6d7dc;">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="#">首页</a></li>
        <li><a href="#">登录</a></li>
        <li class="lg-active">忘记密码</li>
    </ol>
</div>

<!--内容区域-->
<div class="zh-con rzsq_con">
    <div class="czmm_box">
        <h3>重置密码</h3>
        <form id="resetpwForm" action="${ctx}/sys/user/resetPwd" method="post" class="">
            <input type="hidden" name="phone" value="${phone}"/>
            <div class="input_box form-group">
                <label>&emsp;新密码:</label>
                <input class="form-control" type="password" placeholder="请输入新密码" name="newPwd">
            </div>
            <div class="input_box form-group">
                <label>再次输入:</label>
                <input class="form-control" type="password" placeholder="请再次输入密码" name="confirmPassword">
            </div>
            <div class="input_box">
                <button type="submit" class="btn" id="next">下一步</button>
            </div>
        </form>
    </div>
</div>
<!--账户总览内容区域结束-->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script>
    $(function () {
        $('#resetpwForm').bootstrapValidator({
            message: "您的输入值不合法",
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                newPwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 8,
                            max: 20,
                            message: '密码不能少于8个字符，不得大于20个字符'
                        },
                        regexp: {
                            regexp: /(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+)/,
                            message: '*必须由英文、数字、符号组成'
                        },
                        identical: {
                            field: 'confirmPassword',
                            message: '密码和确认密码不一致'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'newPwd',
                            message: '密码和确认密码不一致'
                        }
                    }
                }
            }
        });

    })
</script>
</body>
</html>