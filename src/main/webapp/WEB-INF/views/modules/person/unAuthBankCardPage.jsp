<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
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

        .breadcrumb > li + li:before {
            padding: 0px;
            color: #ccc;
            content: "";
        }

        .breadcrumb > li + li::after {
            padding: 0 5px;
            color: #ccc;
            content: "";
        }

        .index-nva ul li:nth-of-type(6) {
            color: #cc484d;
        }

        .index-footer-top a {
            color: #909090;
        }

        /* 面包屑导航样式  */
        .breadcrumb > li + li:before {
            padding: 0px;
            color: #ccc;
            content: "";
        }

        .breadcrumb > li + li:after {
            padding: 0 2px;
            color: #ccc;
            content: ">";
        }

        .breadcrumb > li:last-of-type:after {
            padding: 0px;
            color: #ccc;
            content: "";
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}" style="color:#909090">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation" style="color:#909090">我的账户</a></li>
        <li class="lg-active">绑定银行卡</li>
    </ol>
</div>
<div class="renzheng-index">
    <!-- renzheng开始 -->
    <div class="pull-left" style="margin-left:8%; text-align: center;">
        <h3>第一步:身份认证</h3>
        <div class="icn_lis bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3 style="color: #b81c1d">第二步:绑定银行卡</h3>
        <div class="icn_lis  active_bgred bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第三步:风险评测</h3>
        <div class="icn_lis  bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第四步：成为会员</h3>
        <div class="icn_lis  bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="renzheng-form pull-left" style="margin-left:121px">
        <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
              action="${ctx}/user/bankCard/bindBankCard">
            <div class="form-group">
                <span class="pull-left">我的银行卡号<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input type="text" class="form-control" name="bankAccount" value="${bankAccount}"/>
                </div>
            </div>
            <%--  <div class="form-group">
                 <span class="pull-left" >状态:<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                 <div class="col-lg-5 pull-left">
                      <input type="text" class="form-control" name="certificateStatus" value="${certificateStatus }" placeholder="未绑定">
                 </div>
             </div> --%>
            <div class="form-group">
                <span class="pull-left" style="margin-top: 5px">开户行银行<b
                        style="color:#C1181D;font-size:16px;">*</b>:</span>
                <!-- 开户银行为字典项 -->
                <div class="col-lg-5 pull-left">
                    <%-- <input type="text" class="form-control" name="bankName" value="${bankName }"/> --%>
                    <select class="form-control" name="bankName"><!-- 得到开户行所在地的字典值 -->
                        <!-- 	<option value="">请选择</option> -->
                        <c:forEach items="${fns:getDictList('open_city')}" var="bankName" varStatus="status">
                            <option value="${bankName}">
                                    ${bankName}
                            </option>
                        </c:forEach>
                        <!-- <option value="">请选择</option>
                        <option value="北京市" name="branchBankName">北京市</option>
                        <option value="上海市" name="branchBankName">上海市</option> -->
                    </select>
                </div>
            </div>
            <!-- 开户银行所在地为字典项 -->
            <div class="form-group">
                <span class="pull-left" style="margin-top: 5px">开户行所在地<b
                        style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <%--  <input type="text" class="form-control" name="branchBankName" value="${branchBankName }"/> --%>
                    <select class="form-control" name="branchBankName"><!-- 得到开户行所在地的字典值 -->
                        <!-- <option value="">请选择</option> -->
                        <c:forEach items="${fns:getDictList('open_city')}" var="branchBankName" varStatus="status">
                            <option value="${branchBankName}">
                                    ${branchBankName}
                            </option>
                        </c:forEach>
                        <!-- <option value="">请选择</option>
                        <option value="北京市" name="branchBankName">北京市</option>
                        <option value="上海市" name="branchBankName">上海市</option> -->
                    </select>
                </div>
            </div>
            <!-- 账户类型为字典项目-->
            <div class="form-group">
                <span class="pull-left" style="margin-top:5px">账户类型<b
                        style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <!-- <input type="text" class="form-control" name="accountType" /> -->
                    <select class="form-control" name="accountType"><!-- 得到账户类型的字典值 -->
                        <!-- <option value="">请选择</option> -->
                        <%-- <c:forEach items="${fns:getDictList('open_bank')}" var="bankType">
                            <option value="${bankType}" name="bankType">
                                ${bankType}
                            </option>
                        </c:forEach> --%>

                        <option value="贷记卡">贷记卡</option>
                        <option value="储蓄卡">借记卡</option>
                    </select>
                </div>
            </div>
            <!-- 银行预留手机号需要中金账户,或者存储在数据库中 -->
            <div class="form-group">
                <span class="pull-left" style="margin-top: 5px">银行预留手机号<b
                        style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input type="text" class="form-control" name="bankPhone"/>
                </div>
            </div>
            <div class="form-group">
                <span class="pull-left" style="margin-top: 5px">银行卡类型<b
                        style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <!-- <input type="text" class="form-control" name="bankType" /> -->
                    <select class="form-control" name="bankType"><!-- 得到银行卡类型的字典值 -->
                        <!-- <option value="" name="bankType">请选择</option>	 -->
                        <%-- <c:forEach items="${fns:getDictList('open_bank')}" var="bankType">
                            <option name="bankType" value="${bankType}">
                                ${bankType}
                            </option>
                        </c:forEach> --%>
                        <option value="借记卡">借记卡</option>
                        <option value="贷记卡">贷记卡</option>
                    </select>
                </div>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                    <button type="submit" class="btn btn-primary" style="width:auto;" name="signup" value="Sign up">提交
                    </button>
                    <button type="button" class="btn btn-info" id="resetBtn" onclick="abc()">取消</button>
                </div>
            </div>
        </form>
    </div>
    <div class="clearfix"></div>

</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('#defaultForm').bootstrapValidator({
            message: '输入无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                bankAccount: {
                    message: '姓名是无效的',
                    validators: {
                        notEmpty: {
                            message: '请输入您的银行卡'
                        },
                        stringLength: {
                            min: 19,
                            max: 19,
                            message: '必须19位'
                        },
                        regexp: {
                            regexp: /\d{19}/,
                            message: '银行卡输入有误，请重新输入  '
                        }
                    }
                },
                bankPhone: {
                    message: '手机号是无效的',
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1[34578]\d{9}$/,
                            message: '请输入正确的手机号'
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

</html>