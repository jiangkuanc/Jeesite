<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
资产评估表
@author Zeus
@version 2016-12-21
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>添加担保公司</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/bootstrap/2.3.1/css/homepage.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#registerGuaranteeForm").validate({
                rules: {
                    'user.loginName': {
                        required: true,
                        rangelength: [4, 16],
                        remote: "${ctx}/sys/user/getBackByLoginName",
                        isLegal: true
                    },
                    'user.password': {
                        required: true,
                        rangelength: [8, 12]
                    },
                    'user.name': {
                        required: true,
                        rangelength: [2, 5]
                    },
                    'user.phone': {
                        required: true,
                        isMobile: true,
                        remote: "${ctx}/sys/user/getBackByPhone"
                    },
                    'user.email': {
                        email: true
                    },
                    name: {
                        required: true,
                        maxlength: 20
                    },
                    dockingDepartment: {
                        maxlength: 20
                    },
                    dockingJob: {
                        maxlength: 20
                    },
                    address: {
                        maxlength: 50
                    },
                    addressDetail: {
                        maxlength: 50
                    },
                    businessScope: {
                        maxlength: 150
                    },
                    guaranteeLimit: {
                        number: true,
                        moneyNumber: true
                    },
                    guaranteeAmount: {
                        number: true,
                        moneyNumber: true
                    },
                    guaranteeProportion: {
                        number: true,
                        rateNumber: true
                    },
                    introduce: {
                        maxlength: 200
                    },
                    webSite: {
                        maxlength: 60,
                        url: true
                    },
                    phone: {
                        required: true,
                        rangelength: [7, 11]
                    },
                    cooperationPlanfile: {
                        required: true,
                        isPic: true
                    },
                    businessLicensefile: {
                        required: true,
                        isPic: true
                    },
                    legalPersonIdcardfile: {
                        required: true,
                        isPic: true
                    },
                    dockingIdscanningfile: {
                        required: true,
                        isPic: true
                    }

                },
                messages: {
                    'user.loginName': {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。"),
                        remote: "用户名已存在"
                    },
                    'user.password': {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    'user.name': {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    'user.phone': {
                        isMobile: "请正确填写手机号码",
                        remote: "手机号已存在"
                    },
                    'user.email': {
                        email: "邮箱格式不正确"
                    },
                    name: {
                        maxlength: "不能超过20个字符"
                    },
                    phone: {
                        rangelength: $.format("最小长度:{0}, 最大长度:{1}。")
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
                        loading('正在提交，请稍等...');
                        form.submit();
                    });
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>

<body>
<div class="title"><h3>添加担保公司</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<form id="registerGuaranteeForm" action="${ctx}/user/userList/guaranteeRegister" method="post" class="form-horizontal"
      enctype="multipart/form-data">
    <div class="row" style="margin:0px">
        <div class="col-md-6">
            <div class="control-group">
                <label class="control-label " style="height:27px"><h4>账户信息</h4></label>
            </div>
            <div class="control-group">
                <label class="control-label">昵称<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input id="aaa" name="user.loginName" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">密码<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input name="user.password" type="password" class="input-large "/>
                </div>
            </div>
            <div class="control-group" style="height:30px">
                <label class="control-label">是否认证：</label>
                <div class="controls" style="padding-top:5px">
                    <label><input name="isCertify" type="radio" class="input-xlarge " value="1"
                                  checked="checked"/>是</label>
                    <label><input name="isCertify" type="radio" class="input-xlarge " value="0"/>否</label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" style="height:27px"><h4>对接人基本信息</h4></label>
            </div>
            <div class="control-group">
                <label class="control-label">姓名<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input name="user.name" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group" style="height:30px">
                <label class="control-label">性别：</label>
                <div class="controls" style="padding-top:5px">
                    <label><input name="dockingSex" type="radio" value="1" checked="checked"/>男</label>
                    <label><input name="dockingSex" type="radio" value="2"/>女 </label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">手机号码<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input name="user.phone" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">部门：</label>
                <div class="controls">
                    <input name="dockingDepartment" type="text" class="input-large"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">职位：</label>
                <div class="controls">
                    <input name="dockingJob" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">邮箱：</label>
                <div class="controls">
                    <input name="user.email" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">对接人身份证（扫描件）<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input type="file" name="dockingIdscanningfile">
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="control-group">
                <label class="control-label" style="height:27px"><h4>担保公司基本信息</h4></label>
            </div>
            <div class="control-group">
                <label class="control-label">公司名称<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input name="name" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">公司电话<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input name="phone" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">注册地址：</label>
                <div class="controls">
                    <input name="address" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">公司详细地址：</label>
                <div class="controls">
                    <input name="addressDetail" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">业务范围：</label>
                <div class="controls">
                    <!-- <input name="businessScope" type="text"  class="input-large "/> -->
                    <textarea name="businessScope" class="input-large " style="min-height: 67px"></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">担保限额（元）：</label>
                <div class="controls">
                    <input name="guaranteeLimit" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">可担保额度（元）：</label>
                <div class="controls">
                    <input name="guaranteeAmount" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">可担保债项比例：</label>
                <div class="controls">
                    <input name="guaranteeProportion" type="text" class="input-large "/>
                </div>
            </div>


            <div class="control-group">
                <label class="control-label">公司简介：</label>
                <div class="controls">
                    <textarea name="introduce" class="input-large " style="min-height: 67px"></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">公司网址：</label>
                <div class="controls">
                    <input name="webSite" type="text" class="input-large "/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">战略合作协议<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input type="file" name="cooperationPlanfile">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">营业执照（扫描件）<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input type="file" name="businessLicensefile">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">法人身份证（扫描件）<b style="color:#C1181D;font-size:16px;">&nbsp*</b>：</label>
                <div class="controls">
                    <input type="file" name="legalPersonIdcardfile">
                </div>
            </div>

        </div>

    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
    </div>
</form>
</body>
</html>