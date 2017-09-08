<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>投资机构</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#registerBankForm").validate({
                //debug:true,//进行调试模式（表单不提交）
                rules: {
                    loginName: {
                        required: true,
                        rangelength: [4, 16],
                        remote: "${ctx}/sys/user/getBackByLoginName",
                        isLegal: true
                    },
                    password: {
                        required: true,
                        rangelength: [8, 14]
                    },
                    bankname: {
                        required: true,
                        maxlength: 20
                    },
                    bankaddress: {
                        maxlength: 50
                    },
                    name: {
                        required: true,
                        rangelength: [2, 5]
                    },
                    phone: {
                        required: true,
                        isMobile: true,
                        remote: "${ctx}/sys/user/getBackByPhone"
                    },
                    email: {
                        email: true
                    }
                },
                messages: {
                    loginName: {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。"),
                        remote: "用户名已存在"
                    },
                    password: {
                        required: "密码不能为空",
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    bankname: {
                        maxlength: "不能超过20个字符"
                    },
                    bankaddress: {
                        maxlength: "不能超过50个字符"
                    },
                    name: {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    phone: {
                        isMobile: "请正确填写手机号码",
                        remote: "手机号已存在"
                    },
                    email: {
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

            var h = $(window).height();
            $("#modal-body").css("height", h / 2);
            window.onresize = function () {
                var h = $(window).height();
                $("#modal-body").css("height", h / 2);
            };
        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

    </script>
</head>
<body>
<%--<ul class="nav nav-tabs">
    <li ><a href="${ctx}/user/userList/enterpriseList">企业</a></li>
    <li class="active"><a href="${ctx}/user/userList/agencyList">投资机构</a></li>
    <li><a href="${ctx}/user/userList/personalList">个人</a></li>
</ul>
--%>
<form:form id="searchForm" modelAttribute="user" action="${ctx}/user/userList/agencyList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>机构编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>机构名称：</label>
            <form:input path="p2pUserInformation.bankname" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>用户来源：</label>
            <form:select path="p2pUserInformation.userFrom" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('user_from')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><input class="btn btn-primary" type="button" data-toggle="modal" data-target="#myModal1"
                                value="添加投资机构"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>机构编号</th>
        <th>机构名称</th>
        <th>注册地址</th>
        <th>战略合作协议</th>
        <th>用户来源</th>
        <th>对接人姓名</th>
        <th>对接人电话</th>
        <th>邮箱</th>
        <th>账户昵称</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <!-- <th>登录账号状态</th>
        <th>密码锁定时间</th> -->
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${user.id}
            </td>
            <td>
                <a href="${ctx}/user/userList/agencyBaseInfo?userid=${user.id}">
                        ${user.p2pUserInformation.bankname}
                </a>
            </td>
            <td title="${user.p2pUserInformation.bankaddress }">${fns:abbr(user.p2pUserInformation.bankaddress,50)}</td>
            <td><a onclick="modelView('${user.p2pUserInformation.cooperationPlan }')">机构战略合作协议</a></td>
            <td>${fns:getDictLabel(user.p2pUserInformation.userFrom, 'user_from', '')}</td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
            <td>${user.loginName}</td>
            <td><fmt:formatDate value="${user.p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${user.loginDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <%-- <td>${fns:getDictLabel(user.p2pUserInformation.lockState, 'lock_state', '')}</td>
                <td><fmt:formatDate value="${user.p2pUserInformation.lockTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     style="display: none; width:600px;top:5%;" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="registerBankForm" action="${ctx}/user/userList/agencyRegister" method="post"
                  enctype="multipart/form-data">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加机构账户</h4>
                </div>
                <div class="modal-body" id="modal-body" style="max-height:500px;">

                    <table class="mytable">
                        <tr>
                            <th><h4>账户信息</h4></th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>昵称：</td>
                            <td><input type="text" name="loginName" required="required"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>密码：</td>
                            <td><input type="password" name="password" required="required"><span
                                    class="help-inline"><font color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <th><h4>机构信息</h4></th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>机构名称：</td>
                            <td><input type="text" name="bankname" required="required"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>注册地址：</td>
                            <td><input type="text" name="bankaddress" required="required"><span
                                    class="help-inline"><font color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>公司详细地址：</td>
                            <td><input type="text" maxlength="200" name="companyAddress" required="required"><span
                                    class="help-inline"><font color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>战略合作方案（影印版）：</td>
                            <td><input type="file" name="cooperationPlanfile" required="required"
                                       accept=".jpg,.png,.gif,.jpeg,.bmp" style="width:220px"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>营业执照（扫描件）：</td>
                            <td><input type="file" name="businessLicensefile" required="required"
                                       accept=".jpg,.png,.gif,.jpeg,.bmp" style="width:220px"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>法人身份证（扫描件）：</td>
                            <td><input type="file" name="legalPersonIdcardfile" required="required"
                                       accept=".jpg,.png,.gif,.jpeg,.bmp" style="width:220px"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <th><h4>对接人信息</h4></th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>姓名：</td>
                            <td><input type="text" name="name" required="required"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>性别：</td>
                            <td>
                                <label><input name="dockingSex" type="radio" value="1" checked="checked"/>男</label>
                                <label><input name="dockingSex" type="radio" value="2"/>女 </label>
                            </td>
                        </tr>
                        <tr>
                            <td>手机号码：</td>
                            <td><input type="text" name="phone" required="required"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>部门：</td>
                            <td><input type="text" maxlength="64" name="dockingDepartment" required="required"><span
                                    class="help-inline"><font color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>职位：</td>
                            <td><input type="text" maxlength="64" name="dockingJob" required="required"><span
                                    class="help-inline"><font color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>邮箱：</td>
                            <td><input type="text" name="email" required="required"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                        <tr>
                            <td>对接人身份证（扫描件）：</td>
                            <td><input type="file" name="dockingIdscanningfile" required="required"
                                       accept=".jpg,.png,.gif,.jpeg,.bmp" style="width:220px"><span class="help-inline"><font
                                    color="red">*</font></span></td>
                        </tr>
                    </table>
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary"
                            style="background-image:linear-gradient(to bottom, #46aeea, #2fa4e7);" id="btnSubmit">提交
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>