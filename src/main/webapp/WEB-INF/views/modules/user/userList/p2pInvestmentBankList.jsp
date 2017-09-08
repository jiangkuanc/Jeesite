<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>投资机构</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");


            $("#registerBankForm").validate({
                //debug:true,//进行调试模式（表单不提交）
                rules: {
                    loginName: {
                        required: true,
                        rangelength: [3, 12],
                        remote: "${ctx}/sys/user/getBackByLoginName",
                        isLegal: true
                    },
                    password: {
                        required: true,
                        rangelength: [3, 12]
                    },
                    bankname: {
                        required: true,
                        maxlength: 20
                    },
                    bankaddress: {
                        required: true,
                        maxlength: 50
                    },
                    name: {
                        required: true,
                        rangelength: [2, 5]
                    },
                    phone: {
                        required: true,
                        minlength: 11,
                        isMobile: true,
                        remote: "${ctx}/sys/user/getBackByPhone"
                    },
                    email: {
                        required: true,
                        email: true
                    }

                },
                messages: {
                    loginName: {
                        required: "昵称不能为空",
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。"),
                        remote: "用户名已存在",
                        isLegal: "只能输入字母数字下划线"
                    },
                    password: {
                        required: "密码不能为空",
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    bankname: {
                        required: "不能为空",
                        maxlength: "不能超过20个字符"
                    },
                    bankaddress: {
                        required: "不能为空",
                        maxlength: "不能超过50个字符"
                    },
                    name: {
                        required: true,
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    phone: {
                        required: "手机号码不能为空",
                        minlength: "确认手机不能小于11个字符",
                        isMobile: "请正确填写手机号码",
                        remote: "手机号已存在"
                    },
                    email: {
                        required: "不能为空",
                        email: "邮箱格式不正确"
                    }
                },

                submitHandler: function (form) {
                    swal({
                        title: "确认提交吗？",
                        showCancelButton: true,
                        type: "info",
                    }, function (inputValue) {
                        if (inputValue === false) {
                            return false;
                        }
                        form.submit();
                    });

                }
            });


        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        $.validator.addMethod("isLegal", function (value, element) {
            var str = /^[a-zA-Z0-9_]{3,12}$/;
            return this.optional(element) || (str.test(value));
        }, "<font color='#E47068'>只能输入字母数字下划线</font>");
    </script>

</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/p2pEnterpriseCertify/userList">企业</a></li>
    <li class="active"><a href="${ctx}/user/p2pUserInformation/bankList">投资机构</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pUserInformation" action="${ctx}/user/p2pUserInformation/bankList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>机构编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>机构名称：</label>
            <form:input path="bankname" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><input id="" class="btn btn-primary" type="button" data-toggle="modal" data-target="#myModal"
                                value="添加机构账号"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>机构编号</th>
        <th>机构昵称</th>
        <th>机构名称</th>
        <th>地址</th>
        <th>对接人姓名</th>
        <th>对接人电话</th>
        <th>邮箱</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <th>登录账号状态</th>
        <th>密码锁定时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pUserInformation">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${p2pUserInformation.id}
            </td>
            <td>
                <a href="${ctx}/user/p2pUserInformation/bankForm?id=${p2pUserInformation.id}">
                        ${p2pUserInformation.user.loginName}
                </a>
            </td>
            <td>${p2pUserInformation.bankname}</td>
            <td title="${p2pUserInformation.bankaddress }">${fns:abbr(p2pUserInformation.bankaddress,50)}</td>
            <td>${p2pUserInformation.user.name}</td>
            <td>${p2pUserInformation.user.phone}</td>
            <td>${p2pUserInformation.user.email}</td>
            <td>
                <fmt:formatDate value="${p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td><fmt:formatDate value="${p2pUserInformation.user.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${fns:getDictLabel(p2pUserInformation.lockState, 'lock_state', '')}
            </td>
            <td>
                <fmt:formatDate value="${p2pUserInformation.lockTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none"
     data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="registerBankForm" action="${ctx}/sys/user/bankRegister" method="post">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加机构账户</h4>
                </div>
                <div class="modal-body" id="modal-body">
                    <table>
                        <tr>
                            <th>账户信息</th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>昵称：</td>
                            <td><input type="text" id="loginName" name="loginName"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <td>密码：</td>
                            <td><input type="password" id="password" name="password"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <th>机构信息</th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>机构名称：</td>
                            <td><input type="text" class="form-control" id="bankname" name="bankname"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <td>地址：</td>
                            <td><textarea class="form-control" id="bankaddress" name="bankaddress"></textarea></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <th>对接人信息</th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>姓名：</td>
                            <td><input type="text" class="form-control" id="name" name="name"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <td>手机号码：</td>
                            <td><input type="text" class="form-control" id="phone" name="phone"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                        <tr>
                            <td>邮箱：</td>
                            <td><input type="text" class="form-control" id="email" name="email"></td>
                            <td><span class="help-inline"><font color="red">*</font> </span></td>
                        </tr>
                    </table>


                </div>
                <div style="text-align: center;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>