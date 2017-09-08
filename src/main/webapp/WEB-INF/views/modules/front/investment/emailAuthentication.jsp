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

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
    <style type="text/css">
        .msg {
            position: relative;
            width: 260px;
            line-height: 30px;
            margin: 0 auto;
            background-color: #C7EDCC;
            text-align: center;
            vertical-align: middle;
            color: red;
            border-radius: 4px;
        }
    </style>
    <script type="text/javascript">
        onLoad = setTimeout("msg.style.display='none'", 5000);
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->

<!--内容区域-->
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
        <p class="zh-p"><a href="${ctx}/user/p2pUserInformation/accountPermission">账户总览</a></p>
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
        <form id="defaultForm" method="post" class="form-horizontal youxiangyz"
              action="${ctx }/financing/myAccount/sendValidEmail">
            <h3>邮箱认证</h3>
            <div class="form-group shuru">
                <div id="msg" class="msg">${msg }</div>
                <label class="col-sm-3 control-label">输入我的邮箱：</label>
                <div class="col-sm-5" style="padding:0px 15px">
                    <input type="text" class="form-control" name="email" value="${user.email }" placeholder="请输入邮箱"/>
                </div>
                <!--<div class="col-sm-3 yzf" >-->
                <!--<span>@</span>-->
                <!--<select name="" id="">-->
                <!--<option value="">请选择邮箱</option>-->
                <!--<option value="">qq.com</option>-->
                <!--<option value="">126.com</option>-->
                <!--<option value="">163.com</option>-->
                <!--<option value="">sina.com</option>-->
                <!--<option value="">sohu.com</option>-->
                <!--<option value="">yeah.net</option>-->
                <!--<option value="">21cn.com</option>-->
                <!--<option value="">139.com</option>-->
                <!--<option value="">189.com</option>-->
                <!--<option value="">tom.com</option>-->
                <!--<option value="">foxmail.com</option>-->
                <!--<option value="">gmail.com</option>-->
                <!--<option value="">hotmail.com</option>-->
                <!--<option value="">aliyun.com</option>-->
                <!--</select>-->
                <!--</div>-->
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                    <button type="submit" class="btn sure-yz" name="signup" value="Sign up"><a href="">发送验证邮件</a>
                    </button>
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
                email: {
                    validators: {
                        emailAddress: {
                            message: '输入的邮箱格式不正确'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getByEmail',
                            message: '输入的邮箱地址不存在'
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