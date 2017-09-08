<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
    <style>
        .form-horizontal .form-group {
            margin-bottom: 8px;
        }

        .input-group {
            float: left;
            width: 80%;
        }

        .form-group {
            margin: 20px 0;
        }

        .form-group span {
            font-size: 18px;
            color: #909090;
        }

        .form-control-feedback {
            left: 82%;
        }

        .help-block {
            margin-left: 50px;
        }

        .kv-fileinput-upload {
            height: 34px;
        }

        .fileinput-remove {
            height: 34px;
        }

        .btn-primary {
            background-color: #f2434a;
            border-color: #f2434a;
            color: #fff;
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

        .help-block {
            margin-left: 0px;
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
            width: 80%;
        }

        .file-thumbnail-footer {
            display: block;
        }

        .file-error-message {
            word-wrap: break-word;
            word-break: break-all;
        }

        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
</head>
<script type="text/javascript">
    $(function () {
        $('#isLongTerm').prop('checked', false);
    });
    function che() {
        if ($('#isLongTerm').prop('checked') == true) {
            $('#cq').val('1');
            $('#operationPeriod').val('');
        } else {
            $('#cq').val('0');
        }
    }
    function bb() {
        var i = $('.glyphicon-remove').attr('data-bv-icon-for');
        $('.glyphicon-remove').each(function () {
            var validator = $(this).attr('data-bv-icon-for');
            if (validator == 'unifiedSocialCreditCode2' || validator == 'unifiedSocialCreditCode2') {
                $('.btn-primary').removeAttr("disabled");
            }
        });
    }
    function lalala() {
        bb();
        if ($('.topics').eq(0).prop('checked') == true) {
            $('#organizationCode').val($('#organizationCode2').val());
            $('#taxRegistrationNum').val($('#taxRegistrationNum2').val());
            $('#unifiedSocialCreditCode').val($('#unifiedSocialCreditCode2').val());
            $('#div1').show();
            $('#div2').show();
            $('#div5').show();
            $('#div3').hide();
            $('#div4').hide();
            $('#div6').hide();
        } else {
            $('#organizationCode2').val($('#organizationCode').val());
            $('#taxRegistrationNum2').val($('#taxRegistrationNum').val());
            $('#unifiedSocialCreditCode2').val($('#unifiedSocialCreditCode').val());
            $('#div1').hide();
            $('#div2').hide();
            $('#div5').hide();
            $('#div3').show();
            $('#div4').show();
            $('#div6').show();
        }
    }
</script>
<script type="text/javascript">
    var obj = '${json}';
    obj = eval('(' + obj + ')');
    $(function () {
        if (obj.certificateType == 0) {
            obj.certificateType = 'css1';
            $('#organizationCode2').val('');
            $('#taxRegistrationNum2').val('');
            $('#unifiedSocialCreditCode2').val('');
            $('#div1').show();
            $('#div2').show();
            $('#div5').show();
        }
        if (obj.certificateType == 1) {
            obj.certificateType = 'javascript1';
            $('#organizationCode').val('');
            $('#taxRegistrationNum').val('');
            $('#unifiedSocialCreditCode').val('');
            $('#div3').show();
            $('#div4').show();
            $('#div6').show();
        }
        if (obj.isLongTerm == 1) {
            $('#isLongTerm').prop('checked', true);
            $('#cq').val('1');
        }
        //回填下拉选
        $('.option1').each(function () {
            if ($(this).val() == obj.certificateLocation) {
                $(this).prop('selected', true);
            }
        });
        $('.topics').each(function () {
            if ($(this).val() == obj.certificateType) {
                $(this).prop('checked', true);
            }
        });
        //公司成立日期
        var companyFoundDate = new Date(obj.companyFoundDate);
        $('#companyFoundDate').val(companyFoundDate.Format('yyyy-MM-dd'));
        //营业期限
        if (obj.isLongTerm != 1) {
            var operationPeriod = obj.operationPeriod;
            operationPeriod = new Date(operationPeriod);
            /* operationPeriod = operationPeriod.substring(0,10);
             operationPeriod = fixDate(operationPeriod); */
            $('#operationPeriod').val(operationPeriod.Format('yyyy-MM-dd'));
        }
    });
    function fixDate(time) {
        var arr = time.split(time.match(/\D+/g)[0]);
        return new Date(arr[0], arr[1] - 1, arr[2]);
    }
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

</script>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left zhaimima ">
    <div class="renzheng ">
        <h3 class="zhai-mima rz-h3">企业认证</h3>
        <form id="interviewForm" name="reg_testdate" method="post" class="form-horizontal interviewForm"
              action="${ctx}/user/p2pEnterpriseCertify/enterpriseCertify" enctype="multipart/form-data">
            <input type="hidden" name="token" value="${token}"/>
            <input type="hidden" name="id" value="${p2pEnterpriseCertify.id}"/>
            <input type="hidden" name="unitType" value="2"/>
            <!-- <div class="form-group">
                <label  class="col-lg-2 control-label">单位类型：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input class="unitType" type="radio"  name="unitType" value="1" >
                    个体工商户
                </label>
                <label style="margin-left:50px;color:#929292">
                    <input class="unitType" type="radio"  name="unitType" value="2" >
                    企业
                </label>
            </div> -->
            <div class="form-group" style="margin-bottom: 0px;">
                <label class="col-lg-2 control-label">证件类型：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input onchange="lalala()" type="radio" class="topics" name="topics" value="css1">

                    普通营业执照(存在独立的组织机构代码证)
                </label>
            </div>
            <div class="form-group" style="margin-top: 0px;">
                <label class="col-lg-2 control-label"></label>
                <label style="margin-left: 10px;color:#929292">
                    <!--<input type="radio"  name="topic[]" value="javascript">-->
                    <input onchange="lalala()" type="radio" class="topics" name="topics" value="javascript1">
                    多证合一营业执照(不存在独立的组织机构代码证)
                </label>
            </div>

            <!--普通营业执照-->
            <div data-topic='css'>
                <fieldset>
                    <div class="form-group" style="margin-top:20px;">
                        <label class="col-lg-3 control-label">企业名称<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="enterpriseName" placeholder="请输入企业名称"
                                   value="${p2pEnterpriseCertify.enterpriseName}"/>
                        </div>
                    </div>

                    <div class="form-group" id="div5" style="display: none;">
                        <label class="col-lg-3 control-label">营业执照注册号<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" id="unifiedSocialCreditCode"
                                   name="unifiedSocialCreditCode" placeholder="请输入营业执照注册号"
                                   value="${p2pEnterpriseCertify.unifiedSocialCreditCode}"/>
                        </div>
                    </div>

                    <div class="form-group" id="div6" style="display: none;">
                        <label class="col-lg-3 control-label">统一社会信用代码<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" id="unifiedSocialCreditCode2"
                                   name="unifiedSocialCreditCode2" placeholder="请输入统一社会信用代码"
                                   value="${p2pEnterpriseCertify.unifiedSocialCreditCode}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业执照所在地<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <select id="select1" class="form-control" name="certificateLocation" data-bv-notempty
                                    data-bv-notempty-message="请选择营业执照所在地"
                                    style="width:100%;color:#929292;margin-top:5px;padding-right:14px ">
                                <c:forEach items="${fns:getDictList('provincial_area')}" varStatus="status" var="a">
                                    <option class="option1" value="${a.value }">${a.label }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group noWrap">
                        <label class="col-lg-3 control-label">公司成立日期<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input id="companyFoundDate" name="companyFoundDate" type="text" readonly="readonly"
                                   maxlength="20" class="input-medium Wdate" placeholder="请选择日期"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                   style="cursor:pointer;margin-top: 10px"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业期限<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-6 checkbox" style="color:#929292">
                            <div class="col-lg-5" style="margin-left: -15px">
                                <input id="operationPeriod" name="operationPeriod" type="text" readonly="readonly"
                                       maxlength="20" class="input-medium Wdate" placeholder="请选择日期"
                                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                       style="cursor:pointer;" onchange="aaa()"/>
                            </div>
                            <label style="margin-left: 60px">
                                <input id="isLongTerm" type="checkbox" onclick="che()">
                                长期 <input id="cq" name="isLongTerm" type="hidden" value="0"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">注册地址<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="registeredAddress" placeholder="请输入注册地址"
                                   value="${p2pEnterpriseCertify.registeredAddress }"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">联系电话<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="telephoneNum" placeholder="请输入联系电话"
                                   value="${p2pEnterpriseCertify.telephoneNum }"/>
                        </div>
                    </div>
                    <input type="hidden" name="licenseIsReject" value="${p2pEnterpriseCertify.licenseIsReject}"/>
                    <div class="form-group btn-file">
                        <label class="col-lg-3 control-label">营业执照副本扫描件<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.licenseIsReject == 1}">
                                <img src="${p2pEnterpriseCertify.businessLicenseView}" alt=""
                                     style="width:300px;margin: 9px 0px  0px 17px"/>
                            </c:when>
                            <c:otherwise>
                                <div class="col-lg-5 ">
                                    <input class="file eeee pull-left" type="file" name="file">
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="col-lg-offset-3 saomiao">
                        <p style="color: #C1181D;">证件要求：</p>
                        <p>必须为清晰彩色原件扫描件或数码照，图片大小不超过5M</p>
                        <p>必须在有效期内且年检章齐全(当年成立公司可无年检章)</p>
                        <p>必须为中国大陆工商局颁发</p>
                        <!-- <p><a href="" style="color:#1B41D6">查看详细证件要求</a></p> -->
                    </div>
                    <div class="form-group" id="div1" style="display: none;">
                        <label class="col-lg-3 control-label">组织机构代码：</label>
                        <div class="col-lg-5 ">
                            <input type="text" id="organizationCode" class="form-control" name="organizationCode"
                                   placeholder="请输入组织机构代码" value="${p2pEnterpriseCertify.organizationCode }"/>
                        </div>
                    </div>
                    <div class="form-group" id="div2" style="display: none;">
                        <label class="col-lg-3 control-label">税务登记号：</label>
                        <div class="col-lg-5 ">
                            <input type="text" id="taxRegistrationNum" class="form-control" placeholder="请输入税务登记号"
                                   name="taxRegistrationNum" value="${p2pEnterpriseCertify.taxRegistrationNum }"/>
                        </div>
                    </div>
                    <div class="form-group" id="div3" style="display: none;">
                        <label class="col-lg-3 control-label">组织机构代码：</label>
                        <div class="col-lg-5 ">
                            <input type="text" id="organizationCode2" class="form-control" name="organizationCode2"
                                   placeholder="请输入组织机构代码" value="${p2pEnterpriseCertify.organizationCode }"/>
                        </div>
                    </div>
                    <div class="form-group" id="div4" style="display: none;">
                        <label class="col-lg-3 control-label">税务登记号：</label>
                        <div class="col-lg-5 ">
                            <input type="text" id="taxRegistrationNum2" class="form-control" placeholder="请输入税务登记号"
                                   name="taxRegistrationNum2" value="${p2pEnterpriseCertify.taxRegistrationNum }"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业范围<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <%-- <input type="text" class="form-control" name="businessScope" placeholder="请输入营业范围" value="${p2pEnterpriseCertify.businessScope }" /> --%>
                            <textarea rows="10" style="border-radius:10px;padding: 2px " name="businessScope"
                                      placeholder="请输入营业范围" cols="40%">${p2pEnterpriseCertify.businessScope }</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label noWrap">注册资金（元）<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="registeredCapital" placeholder="请输入注册资金"
                                   value="${p2pEnterpriseCertify.registeredCapital }"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">传真<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="faxNum" placeholder="请输入传真号码"
                                   value="${p2pEnterpriseCertify.faxNum}"/>
                        </div>
                    </div>

                </fieldset>
            </div>


            <div>
                <fieldset>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人姓名<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="nameOf" placeholder="请输入姓名"
                                   value="${p2pEnterpriseCertify.nameOf}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人身份证号<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="idNumberOf" placeholder="请输入身份证号"
                                   value="${p2pEnterpriseCertify.idNumberOf}" readonly="readonly"/>
                        </div>
                    </div>
                    <input type="hidden" name="frontIsReject" value="${p2pEnterpriseCertify.frontIsReject}"/>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">身份证正面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.frontIsReject == 0}">
                                <div class="col-lg-5 ">
                                    <input class="file" type="file" name="file">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <img src="${p2pEnterpriseCertify.idCardFrontView}" alt=""
                                     style="width: 300px;margin-left: 15px"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <input type="hidden" name="backIsReject" value="${p2pEnterpriseCertify.backIsReject}"/>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">身份证背面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <c:choose>
                            <c:when test="${p2pEnterpriseCertify.backIsReject == 0}">
                                <div class="col-lg-5 ">
                                    <input class="file" type="file" name="file">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <img src="${p2pEnterpriseCertify.idCardBackView}" alt=""
                                     style="width: 300px;margin-left: 15px"/>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="col-lg-offset-3 saomiao">
                        <p>身份证需要上传正反两面：</p>
                        <p>图片需清晰真实有效，文件大小不超过5M</p>
                        <p>支持.jpg .jpeg .png .bmp的图片格式</p>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">联系电话<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="phoneNumber" placeholder="请输入联系电话"
                                   value="${p2pEnterpriseCertify.telephoneNumOf}"/>
                        </div>
                    </div>
                </fieldset>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; margin-bottom:40px;width: 95%;">
                    <button type="submit" class="btn btn-primary" name="signup" value="Sign up">下一步</button>
                    <button type="button" class="btn btn-info" id="resetBtn" style="width: 68px;margin-left:2%"
                            onclick="reflush()"> 重 置
                    </button>
                </div>
            </div>
        </form>


        <div class="clearfix"></div>
    </div>

</div>
<div class="clearfix"></div>
</div>
<!--内容区域结束-->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#interviewForm').bootstrapValidator({
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
                'language[]': {
                    validators: {
                        notEmpty: {
                            message: '请选择'
                        }
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {
                            message: '请选择'
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
                enterpriseName: {
                    message: '企业名称是无效的',
                    validators: {
                        notEmpty: {
                            message: '企业名称不能为空'
                        },
                    }
                },
                registeredAddress: {
                    message: '注册地址是无效的',
                    validators: {
                        notEmpty: {
                            message: '注册地址不能为空'
                        },
                        stringLength: {
                            min: 10,
                            max: 60,
                            message: '注册地址不小于10个字并且不超过60个字'
                        }
                    }
                },
                taxRegistrationNum: {
                    message: '税务登记号是无效的',
                    validators: {
                        regexp: {
                            regexp: /^\d{15}$|^\d{20}$/,
                            message: '税务登记号必须为15位或20位数字'
                        },
                        notEmpty: {
                            message: '税务登记号不能为空'
                        }
                    }
                },
                taxRegistrationNum2: {
                    message: '税务登记号是无效的',
                    validators: {
                        regexp: {
                            regexp: /^\d{15}$|^\d{20}$/,
                            message: '税务登记号必须为15位或20位数字'
                        }
                    }
                },
                businessScope: {
                    message: '营业范围是无效的',
                    validators: {
                        notEmpty: {
                            message: '营业范围不能为空'
                        },
                        stringLength: {
                            min: 5,
                            max: 150,
                            message: '营业范围不小于5个字并且不超过150个字'
                        }
                    }
                },
                registeredCapital: {
                    message: '注册资金是无效的',
                    validators: {
                        notEmpty: {
                            message: '注册资金不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9]{1}[0-9]{0,9}$|^[1]{1}[0]{10}$/,
                            message: '请输入以元为单位的数字'
                        },
                    }
                },
                unifiedSocialCreditCode: {
                    message: '营业执照注册号是无效的',
                    validators: {
                        notEmpty: {
                            message: '营业执照注册号不能为空'
                        },
                        regexp: {
                            regexp: /^\d{15}$/,
                            message: '请输入正确的营业执照注册号'
                        },
                    }
                },
                unifiedSocialCreditCode2: {
                    message: '统一社会信用代码是无效的',
                    validators: {
                        notEmpty: {
                            message: '统一社会信用代码不能为空'
                        },
                        regexp: {
                            regexp: /^[A-Z0-9]{18}$/,
                            message: '请输入18位数字以及大写字母'
                        },
                    }
                },
                organizationCode: {
                    message: '组织机构代码是无效的',
                    validators: {
                        regexp: {
                            regexp: /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}$/,
                            message: '请输入正确的组织机构代码'
                        },
                        notEmpty: {
                            message: '组织机构代码不能为空'
                        }
                    }
                },
                organizationCode2: {
                    message: '组织机构代码是无效的',
                    validators: {
                        regexp: {
                            regexp: /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}$/,
                            message: '请输入正确的组织机构代码'
                        }
                    }
                },
                faxNum: {
                    message: '传真号是无效的',
                    validators: {
                        notEmpty: {
                            message: '传真号不能为空'
                        },
                        regexp: {
                            regexp: /^(\d{3,4})-\d{7,8}$/,
                            message: '请输入正确的传真号，如：xxx-xxxxxxx'
                        },
                    }
                },
                nameOf: {
                    message: '法人姓名是无效的',
                    validators: {
                        notEmpty: {
                            message: '请输入法人姓名'
                        },
                        stringLength: {
                            min: 2,
                            max: 5,
                            message: '姓名长度为2-5个字符'
                        },
                        regexp: {
                            regexp: /^[\u4E00-\u9FA5]{2,5}$/,
                            message: '姓名为不小于2，且不大于5的汉字  '
                        }
                    }
                },
                idNumberOf: {
                    message: '身份证号是无效的',
                    validators: {
                        notEmpty: {
                            message: '身份证号不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/,
                            message: '请输入正确的身份证号'
                        }
                    }
                },
                file: {
                    message: '请上传附件',
                    validators: {
                        notEmpty: {
                            message: '请上传附件'
                        },
                    }
                },
                email: {
                    validators: {
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },
                telephoneNum: {
                    validators: {
                        notEmpty: {
                            message: '联系电话不能为空'
                        },
                        regexp: {
                            regexp: /(^(\d{3,4}-?)?\d{7,9}$)|(^1[3,5,7,8]\d{9}$)/g,
                            message: '请输入正确电话号码'
                        }
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {
                            message: '法人联系电话不能为空'
                        },
                        regexp: {
                            regexp: /(^(\d{3,4}-?)?\d{7,9}$)|(^1[3,5,7,8]\d{9}$)/g,
                            message: '请输入正确电话号码'
                        }
                    }
                }
            }
        })

            .find('input[type="radio"]').on('change', function () {
            var topic = $(this).val();
            $container = $("[data-topic='" + topic + "']");
            if (topic == "css") {
                $("[data-topic='css']").toggle();
                $("[data-topic='javascript']").toggle();
            } else if (topic == "javascript") {
                $("[data-topic='css']").toggle();
                $("[data-topic='javascript']").toggle();
            } else if (topic == "yes") {
                $("[data-topic='yes']").toggle();
                $("[data-topic='no']").toggle();
            } else if (topic == "no") {
                $("[data-topic='yes']").toggle();
                $("[data-topic='no']").toggle();
            }
            //                    $container.sibling().toggle();
            var display = $container.css('display');
            switch (true) {
                case ('css' == topic && 'block' == display):
                    $('#interviewForm').bootstrapValidator('addField', 'username', {
                        message: '用户名是无效的',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '用户名必须超过6,小于30个字符'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: '用户名只能由字母、数字、点和下划线'
                            },
                        },
                    });
                    break;
                case ('css' == topic && 'none' == display):
                    $('#interviewForm').bootstrapValidator('removeField', 'css_frameworks[]');
                    break;
                case ('javascript' == topic && 'block' == display):
                    $('#interviewForm').bootstrapValidator('addField', 'js_frameworks[]', {
                        validators: {
                            notEmpty: {
                                message: 'The name of framework is required'
                            }
                        }
                    });
                    break;
                case ('javascript' == topic && 'none' == display):
                    $('#interviewForm').bootstrapValidator('removeField', 'js_frameworks[]');
                    break;
            }

        });

        $('#resetBtn').click(function () {
            $('#interviewForm').data('bootstrapValidator').resetForm(true);
        });

    });
</script>
<script type="text/javascript">
    $("input[type='file']").fileinput({
        'allowedFileExtensions': ['jpg', 'png', 'gif', 'jpeg', 'bmp'],
        showCaption: false,
        maxFileSize: 5000
    });
</script>

<script type="text/javascript">
    $(function () {
        $("input[name='topic2']:first").attr("checked", true);
        $(".file").parent().css("width", "100%");
        $(".file").parent().css("margin-top", "10px");
        $(".file").parent().find("i").eq(1).css("left", "85%");

        $(".close").click(function () {
            $(".file").parent().find("i").eq(1).css("left", "85%");
        })
        $(".fileinput-remove-button").click(function () {
            $(".file").parent().find("i").eq(1).css("left", "85%");
        })
    })
</script>
<script type="text/javascript">
    function reflush() {
        window.location.reload();
    }
    function aaa() {
        var flag = $('#isLongTerm').prop('checked', false);
    }
</script>
</body>
</html>
