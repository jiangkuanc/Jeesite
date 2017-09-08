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
        #defaultForm .form-control {
            padding-right: 10px;
        }
    </style>
    <script type="text/javascript">
        function contactInfo() {
            document.onkeydown = function (event) {
                if (window.event) {
                    event = window.event;
                }
                if (event.keyCode == 13) {
                    document.getElementById("save").click();
                }
            }
            $('#myModal').modal();
        }
        function doSubmit() {
            var userName = $('#userName').val();
            var dockingJob = $('#dockingJob').val();
            var dockingDepartment = $('#dockingDepartment').val();
// 			var post = $('#post').val();
            if (userName != "" && dockingJob != "" && dockingDepartment != "") {
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/user/Institution/addContactInfo',
                    data: $('#defaultForm').serialize(),
                    success: function (data) {
                        $('#lili').html(data);
                        document.onkeydown = function (event) {
                            if (window.event) {
                                event = window.event;
                            }
                            if (event.keyCode == 13) {

                            }
                        }
                        $('#myModal').modal("hide");
                    }
                });
            } else {
                alert("对接人信息请填写完整！")
            }
        }
        $(function () {
            var json = '${p2pUserInformationJson}';
            json = eval("(" + json + ")");
            if (json.dockingSex == 1) {
                $('#man').prop('checked', true);
            } else {
                $('#woman').prop('checked', true);
            }
        });
    </script>
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == 101}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == 104}">

</c:if>

<!--右侧内容区域-->

<div class="zh-right pull-left shezhi ">
    <h3 class="">账户设置</h3>
    <p>${msg }</p>

    <div>
        <ul>
            <li class="sz-text">密码设置</li>
            <li class="sz-btn1">
                <button class="btn ysz">已设置</button>
            </li>
            <li class="sz-text2">上次登录时间：<fmt:formatDate value="${user.loginDate }" type="both"/></li>
            <li class="sz-btn2">
                <a href="${ctx}/user/Institution/ctrlMenu?mode=pwdManager">
                    <button class="btn">修改密码</button>
                </a>
            </li>
        </ul>
        <ul>
            <li class="sz-text">安全头像</li>
            <li class="sz-btn1">
                <c:if test="${p2pUserPic.userpic == null || ''.equals(p2pUserPic.userpic)}">
                    <button class="btn wsz">未设置</button>
                </c:if>
                <c:if test="${p2pUserPic.userpic != null && !''.equals(p2pUserPic.userpic)}">
                    <button class="btn ysz">已设置</button>
                </c:if>
            </li>
            <li class="sz-text2">用于确认访问的网站是否为大公数据官网</li>
            <li class="sz-btn2">
                <a href="${ctx}/user/Institution/ctrlMenu?mode=setUserpic">
                    <button class="btn ">立即设置</button>
                </a>
            </li>
        </ul>
        <ul>
            <li class="sz-text">手机认证</li>
            <li class="sz-btn1">
                <c:if test="${user.phone == null || ''.equals(user.phone) }">
                    <button class="btn wsz">未认证</button>
                </c:if>
                <c:if test="${user.phone != null && !''.equals(user.phone) }">
                    <button class="btn ysz">已认证</button>
                </c:if>
            </li>
            <li class="sz-text2">
                <c:if test="${user.phone!=null }">
                    ${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}
                </c:if>
            </li>

            <li class="sz-btn2">
                <a href="${ctx}/user/Institution/ctrlMenu?mode=updatePhone">
                    <button class="btn">更改</button>
                </a>
            </li>
        </ul>
        <ul>
            <li class="sz-text">邮箱认证</li>
            <li class="sz-btn1">
                <c:if test="${user.email == null || ''.equals(user.email) }">
                    <button class="btn wsz">未认证</button>
                </c:if>
                <c:if test="${user.email != null && !''.equals(user.email) }">
                    <button class="btn ysz">已认证</button>
                </c:if>
            </li>
            <li class="sz-text2">
                <c:if test="${user.email!=null}">${user.email.replaceAll("(^.{4}).{3}","$1***")}</c:if>
            </li>
            <li class="sz-btn2">
                <a href="${ctx}/user/validEmailCode/showEmail">
                    <button class="btn">更改</button>
                </a>
            </li>
        </ul>
        <ul>
            <li class="sz-text">对接人信息</li>
            <li class="sz-btn1">
                <button class="btn ysz">已完成</button>
            </li>
            <li class="sz-text2" id="lili">
                <c:if test=" ${user.name!=null }"></c:if>
                ${user.name.substring(0, 1)}**
            </li>
            <li class="sz-btn2">
                <button class="btn" onclick="contactInfo()">更改</button>
            </li>
        </ul>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding-left:5%;padding-top:5px;padding-bottom:5px;">
                        <button type="button" class="close" data-dismiss="modal"
                                style="padding-top:5px;padding-bottom:5px;">×
                        </button>
                        <h4 id="myModalLabel">对接人信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="defaultForm" method="post" class="form-horizontal zh-modal"
                              action="${ctx}/sys/user/updateBankAgent">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">姓名：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="userName" class="form-control" name="name"
                                           value="${user.name}"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">性别：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" id="man" name="dockingSex" value="1"/> 男
                                        </label>&nbsp;&nbsp;
                                        <label>
                                            <input type="radio" id="woman" name="dockingSex" value="2"/> 女
                                        </label>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">部门：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="dockingDepartment" name="dockingDepartment"
                                           class="form-control" value="${p2pUserInformation.dockingDepartment}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">职位：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="dockingJob" name="dockingJob" class="form-control"
                                           value="${p2pUserInformation.dockingJob}"/>
                                </div>
                            </div>
                            <div class="form-group" style=" text-align: center;">
                                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                                    <button id="save" class="btn btn-primary zh-baocun" name="signup" value="Sign up"
                                            onclick="doSubmit()">保存
                                    </button>
                                    <button id="cancel" class="btn quxiao" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </form>

                        <div class="clearfix"></div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- 模态框结束 -->
    </div>
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
                usernames: {
                    message: '用户名是无效的',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                    }
                },
                dockingSex: {
                    validators: {
                        notEmpty: {
                            message: '请选择性别'
                        }
                    }
                },
                dockingDepartment: {
                    validators: {
                        notEmpty: {
                            message: '部门名不能为空'
                        }
                    }
                },
                dockingJob: {
                    validators: {
                        notEmpty: {
                            message: '职位名不能为空'
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