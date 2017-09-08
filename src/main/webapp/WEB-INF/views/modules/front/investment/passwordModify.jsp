<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('productName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>


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

        .mima p:first-child {
            margin-bottom: 10px;
        }

        #messageBox {
            width: 100%;
            height: 34px;
            line-height: 4px;
            color: #C3181E;
            text-align: center;
            font-family: '微软雅黑';
            background-color: #C7EDCC;
            margin-bottom: 5px;
            display: none;
        }

        #messageBox .error {
            font-weight: normal;
        }

        .close {
            line-height: 0.1;
        }

        .form-horizontal .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--更换手机号页面-->
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
        <p class="zh-p" style="background: #eaeaea;"><a
                href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountAll">账户总览</a></p>
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
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=p2pRegUserCertify">身份认证</a>
                    </li>
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
    <!--右侧内容区域-->
    <div class="zh-right pull-left xgmm ">
        <div class="mima">
            <div class="alert alert-error " id="messageBox">
                <button class="close" data-dismiss="alert" onclick="change()">×</button>
                <label class="error" id="loginError">${msg }</label>
            </div>
            <div id="empty" style="height:44px;"></div>
            <h3>修改登录密码</h3>
            <!--             <div id="msg" class="msg">${msg }</div> -->
            <form id="defaultForm" method="post" class="form-horizontal" style="margin-top: 30px;"
                  action="${ctx}/sys/user/passwordModify">
                <div class="form-group">
                    <label for="dlmm" class="col-lg-3 control-label dlmm">原始登录密码：</label>
                    <div class="col-lg-5 ">
                        <input type="password" class="form-control" id="dlmm" name="oldPassword"
                               placeholder="请输入原始登录密码"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="xmm" class="col-lg-3 control-label">新密码：</label>
                    <div class="col-lg-5">
                        <input type="password" class="form-control" id="xmm" name="newPassword" placeholder="请输入新登录密码"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">确认密码：</label>
                    <div class="col-lg-5">
                        <input type="password" class="form-control" name="confirmNewPassword" placeholder="请输入确认密码"/>
                    </div>
                </div>
                <div class="form-group" style=" text-align: center;">
                    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                        <a href="mimaszcg.html" class="sure1">
                            <button type="submit" class="btn btn-default" name="signup" value="Sign up">确定</button>
                        </a>
                        <!--                         <input class="btn btn-primary" type="submit" value="确定"/> -->
                        <button type="button" class="btn off" id="resetBtn">取消</button>
                    </div>
                </div>
            </form>


            <div class="clearfix"></div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/left.js"></script>
<script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>
<script type="text/javascript">
    // 	$(document).ready(function() {
    // 		var cookies = document.cookie.split(";");
    // 		    for (var i = 0; i < cookies.length; i++) {
    // 		        var cookie = cookies[i];
    // 		        var eqPos = cookie.indexOf("=");
    // 		        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    // 		        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
    // 		    }
    // 			if(cookies.length > 0)
    // 			{
    // 			    for (var i = 0; i < cookies.length; i++) {
    // 			        var cookie = cookies[i];
    // 			        var eqPos = cookie.indexOf("=");
    // 			        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    // 			    var domain = location.host.substr(location.host.indexOf('.'));
    // 			        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; domain=" + domain;
    // 			    }
    // 			}
    // 		});
    //	onLoad=setTimeout("msg.style.display='none'",5000);
    $(function () {
        var msg = '${msg}';
        if (msg != null && msg != '') {
            $('#messageBox').show();
            $('#empty').hide();
        } else {
            $('#messageBox').hide();
            $('#empty').show();
        }
    });

    function change() {
        $('#messageBox').hide();
        $('#empty').show();
    }

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
                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: '原密码不能为空'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getOldPassword',
                            message: '原密码错误'
                        }
                    }
                },
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            message: '新密码必须超过6个字符'
                        }
                    }
                },
                confirmNewPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'newPassword',
                            message: '确认密码和新密码不一样'
                        }
                    }
                },
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