<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="${ctxStatic }/vendor/bootstrap/css/bootstrap.css"/>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>


<div class="zh-right pull-left bdsjh ">
    <form id="defaultForm" method="post" class="form-horizontal" action="${ctx}/sys/user/updatePhone3">
        <div class="form-group">
            <label class="col-lg-3 control-label xsjh">原手机号：</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="" value="${user.phone }" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="dlmm" class="col-lg-3 control-label dlmm">登录密码：</label>
            <div class="col-lg-5 ">
                <input type="password" class="form-control" id="dlmm" name="oldPassword" placeholder="请输入登录密码"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label xsjh">新手机号：</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="phone" placeholder="请输入新手机号码"/>
            </div>
        </div>


        <div class="form-group" style=" text-align: center;">
            <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                <button type="submit" class="btn sure" name="signup" value="Sign up">确定</button>
                <input type="button" class="btn off" id="resetBtn" value="取消" onclick="abc()"/>
            </div>
        </div>
    </form>


    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    function abc() {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission";
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

        $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {
                            message: 'The first name is required and cannot be empty'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {
                            message: 'The last name is required and cannot be empty'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        digits: {},
                        phone: {
                            country: 'US'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getByPhone',
                            message: '手机号已被绑定'
                        }
                    }
                },
                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            message: '密码必须超过6个字符'
                        },
//                                 identical: {
//                                     field: 'confirmPassword',
//                                     message: '密码不正确'
//                                 }
                    }
                },
//                         confirmPassword: {
//                             validators: {
//                                 notEmpty: {
//                                     message: '确认密码不能为空'
//                                 },
//                                 identical: {
//                                     field: 'password',
//                                     message: '密码和确认密码不一样'
//                                 }
//                             }
//                         },
                gender: {
                    validators: {
                        notEmpty: {
                            message: 'The gender is required'
                        }
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {
                            message: ''
                        }
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4,
                            message: 'Please choose 2 - 4 programming languages you are good at'
                        }
                    }
                },
                captcha: {
                    validators: {
                        callback: {
                            message: '答案错误',
                            callback: function (value, validator) {
                                var items = $('#captchaOperation').html().split(' '),
                                    sum = parseInt(items[0]) + parseInt(items[2]);
                                return value == sum;
                            }
                        }
                    }
                }
            }
        });

        // Validate the form manually
        $('#validateBtn').click(function () {
            $('#defaultForm').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function () {
            $('#defaultForm').data('bootstrapValidator').resetForm(true);
        });
    });
</script>


</body>
</html>