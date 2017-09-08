<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>丝路互金网</title>
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

        :-ms-input-placeholder { /* Internet Explorer 10+ */
            color: #8c8c8c;
        }
    </style>
</head>
<script type="text/javascript">
    function che() {
        var i = 1;
        $('.isLongTerm').each(function () {
            if ($(this).prop('checked') == true) {
                $('#cq' + i).val(1);
            } else {
                $('#cq' + i).val(0);
            }
            i++;
        });
    }
    $(function () {
        /* $('.topics').bind('click',function(){
         if($(this).val() == 'javascript1'){
         $("input[name='unitType']").eq(2).prop('checked',true);
         }
         if($(this).val() == 'css1'){
         $("input[name='unitType']").eq(0).prop('checked',true);
         }
         }); */
        $("input[name='unitType']").bind('click', function () {
            if ($(this).val() == 1) {
                $("input[name='unitType']").eq(0).prop('checked', true);
                $("input[name='unitType']").eq(2).prop('checked', true);
            }
        });
        $("input[name='unitType']").bind('click', function () {
            if ($(this).val() == 2) {
                $("input[name='unitType']").eq(1).prop('checked', true);
                $("input[name='unitType']").eq(3).prop('checked', true);
            }
        });
        $("input[name='operationPeriod']").bind('click', function () {
            $(".isLongTerm").attr("checked", false)
        });
        $(".isLongTerm").bind('click', function () {
            if ($(this).prop('checked') == true) {
                $("input[name='operationPeriod']").val("");
            }
        });
    });
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
                    <input type="radio"  name="unitType" value="1" checked="checked">
                    个体工商户
                </label>
                <label style="margin-left:50px;color:#929292">
                    <input type="radio"  name="unitType" value="2" >
                    企业
                </label>
            </div> -->
            <div class="form-group" style="margin-bottom: 0px;">
                <label class="col-lg-2 control-label">证件类型：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="topics" name="topics" value="css1">

                    普通营业执照(存在独立的组织机构代码证)
                </label>
            </div>
            <div class="form-group" style="margin-top: 0px;">
                <label class="col-lg-2 control-label"></label>
                <label style="margin-left: 10px;color:#929292">
                    <!--<input type="radio"  name="topic[]" value="javascript">-->
                    <input type="radio" class="topics" name="topics" value="javascript1">
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

                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业执照注册号<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="unifiedSocialCreditCode"
                                   placeholder="请输入营业执照注册号" value="${p2pEnterpriseCertify.unifiedSocialCreditCode}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业执照所在地<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <select class="form-control" name="certificateLocation" data-bv-notempty
                                    data-bv-notempty-message="请选择营业执照所在地"
                                    style="width:100%;color:#929292;margin-top:5px;padding-right:14px ">
                                <c:forEach items="${fns:getDictList('provincial_area')}" varStatus="status" var="a">
                                    <option value="${a.value }">${a.label }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">公司成立日期<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input name="companyFoundDate" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate" placeholder="请选择日期"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                   style="cursor:pointer;margin-top: 10px"/>
                        </div>
                    </div>

                    <div class="form-group" style='position:relative;'>
                        <label class="col-lg-3 control-label">营业期限<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-6 checkbox" style="color:#929292;">
                            <div class="col-lg-5" style="margin-left: -15px">
                                <input class="operationPeriod" name="operationPeriod" type="text" readonly="readonly"
                                       maxlength="20" class="input-medium Wdate" placeholder="请选择日期"
                                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                       style="cursor:pointer;"/>
                                <div id="wrap"
                                     style='width:156px;height:20px;position:absolute;top:0;left:15px;display:none;'></div>
                            </div>
                            <label style="margin-left: 60px">
                                <input id='btn-long' class="isLongTerm" type="checkbox" onclick="che()">
                                长期 <input id="cq1" name="isLongTerm" type="hidden" value="0"/>
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
                    <div class="form-group btn-file form-group-01">
                        <label class="col-lg-3 control-label">营业执照副本扫描件<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file eeee pull-left gyh_inp" type="file" name="file">
                            <div class="gyh" style="display: none; color: #f1318e">
                                您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-offset-3 saomiao">
                        <p style="color: #C1181D;">证件要求：</p>
                        <p>必须为清晰彩色原件扫描件或数码照，图片大小不超过5M</p>
                        <p>必须在有效期内且年检章齐全(当年成立公司可无年检章)</p>
                        <p>必须为中国大陆工商局颁发</p>
                        <p><!-- <a href="javascript:void(0)" style="color:#1B41D6">查看详细证件要求</a> --></p>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">组织机构代码<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="organizationCode" placeholder="请输入组织机构代码"
                                   value="${p2pEnterpriseCertify.organizationCode }"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">税务登记号<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" placeholder="请输入税务登记号" name="taxRegistrationNum"
                                   value="${p2pEnterpriseCertify.taxRegistrationNum }"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业范围<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <%-- <input type="text" class="form-control" name="businessScope" placeholder="请输入营业范围" value="${p2pEnterpriseCertify.businessScope }"/> --%>
                            <textarea rows="10" style="border-radius:10px;padding: 2px " name="businessScope"
                                      placeholder="请输入营业范围" cols="40%">${p2pEnterpriseCertify.businessScope }</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label noWrap">注册资本（元）<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="registeredCapital" placeholder="请输入注册资本"
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


            <div class="form-group">
                <label class="col-lg-4 control-label" style="margin-left: -6%">代理人是否为企业法定代表人<b
                        style="color:#C1181D;font-size:16px;">*</b>：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="xbox" name="topic2" value="yes">
                    是
                </label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="xbox" name="topic2" value="no">
                    否
                </label>
            </div>
            <div data-topic='yes'>
                <fieldset>

                </fieldset>
            </div>
            <div style="display: none;" data-topic='no'>
                <fieldset>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人姓名<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="nameOf" placeholder="请输入姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人身份证号<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="idNumberOf" placeholder="请输入身份证号"/>
                        </div>
                    </div>

                    <div class="form-group btn-file form-group-02">
                        <label class="col-lg-3 control-label">身份证正面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file pull-left" type="file" name="file">
                        </div>
                    </div>
                    <div class="form-group btn-file form-group-03">
                        <label class="col-lg-3 control-label">身份证背面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file pull-left" type="file" name="file">
                        </div>
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
                            <input type="text" class="form-control" name="telephoneNumOf" placeholder="请输入联系电话"/>
                        </div>
                    </div>
                </fieldset>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; margin-bottom:40px;width: 95%;">
                    <button type="submit" class="btn btn-primary" id="signup" name="signup" value="Sign up">下一步</button>
                    <button type="button" class="btn btn-info" id="resetBtn" style="width: 68px;margin-left:2%"
                            onclick="reflush()"> 重 置
                    </button>
                </div>
            </div>
        </form>

        <form id="interviewForms" name="reg_testdates" style="display:none" method="post"
              class="form-horizontal interviewForm" action="${ctx}/user/p2pEnterpriseCertify/enterpriseCertify"
              enctype="multipart/form-data">
            <input type="hidden" name="token" value="${token}"/>
            <input type="hidden" name="id" value="${p2pEnterpriseCertify.id}"/>
            <input type="hidden" name="unitType" value="2"/>
            <!--  <div class="form-group">
                 <label  class="col-lg-2 control-label">单位类型：</label>
                 <label style="margin-left: 10px;color:#929292">
                     <input type="radio"  name="unitType" value="1" checked="checked">
                     个体工商户
                 </label>
                 <label style="margin-left:50px;color:#929292">
                     <input type="radio"  name="unitType" value="2" >
                     企业
                 </label>
             </div> -->
            <div class="form-group" style="margin-bottom: 0px;">
                <label class="col-lg-2 control-label">证件类型：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="topics" name="topics" value="css1">
                    普通营业执照(存在独立的组织机构代码证)
                </label>
            </div>
            <div class="form-group" style="margin-top: 0px;">
                <label class="col-lg-2 control-label"></label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="topics" name="topics" value="javascript1">
                    多证合一营业执照(不存在独立的组织机构代码证)
                </label>
            </div>

            <!--多证合一营业执照-->
            <div>
                <fieldset>
                    <div class="form-group" style="margin-top:20px;">
                        <label class="col-lg-3 control-label">统一社会信用代码<span
                                style="color:#C1181D;margin-left: 0px">*</span>：<br><span
                                style="font-size:12px;padding-right:15px;">(营业执照注册号)</span></label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" placeholder="请输入社会信用代码"
                                   name="unifiedSocialCreditCode2"
                                   value="${p2pEnterpriseCertify.unifiedSocialCreditCode }"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-top:20px;">
                        <label class="col-lg-3 control-label">公司成立日期<span
                                style="color:#C1181D;margin-left: 0px">*</span>：<br></label>
                        <div class="col-lg-5 ">
                            <input name="companyFoundDate" type="text" readonly="readonly" maxlength="20"
                                   class="input-medium Wdate" placeholder="请选择日期"
                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                   style="cursor:pointer;margin-top: 10px"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">组织机构代码证号：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="organizationCode2" placeholder="请输入组织机构代码证号"
                                   value="${p2pEnterpriseCertify.organizationCode }"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">税务登记号：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" placeholder="请输入税务登记号" name="taxRegistrationNum2"
                                   value="${p2pEnterpriseCertify.taxRegistrationNum}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业名称<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="enterpriseName" placeholder="请输入企业名称"
                                   value="${p2pEnterpriseCertify.enterpriseName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">证件照所在地 <b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <select class="form-control" name="certificateLocation" data-bv-notempty
                                    data-bv-notempty-message="请选择营业执照所在地"
                                    style="width:100%;color:#929292;margin-top:5px">
                                <c:forEach items="${fns:getDictList('provincial_area')}" varStatus="status" var="a">
                                    <option value="${a.value}">${a.label }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业期限<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-6 checkbox" style="color:#929292">
                            <div class="col-lg-5" style="margin-left: -15px">
                                <input class="operationPeriod" name="operationPeriod" type="text" readonly="readonly"
                                       maxlength="20" class="input-medium Wdate" placeholder="请选择日期"
                                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                       style="cursor:pointer;"/>
                                <div class="wrap"
                                     style='width:156px;height:20px;position:absolute;top:0;left:15px;display:none;'></div>
                            </div>
                            <label style="margin-left: 60px">
                                <input class="isLongTerm" type="checkbox" onclick="che()">
                                长期 <input id="cq2" name="isLongTerm" type="hidden" value="0"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">注册地址<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="registeredAddress" placeholder="请输入注册地址"
                                   value="${p2pEnterpriseCertify.registeredAddress}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">营业范围<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <%-- <input type="text" class="form-control" name="businessScope" placeholder="请输入营业范围" value="${p2pEnterpriseCertify.businessScope}"/> --%>
                            <textarea rows="10" style="border-radius:10px;padding: 2px " name="businessScope"
                                      placeholder="请输入营业范围" cols="40%">${p2pEnterpriseCertify.businessScope }</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label noWrap">注册资本（元）<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="registeredCapital" placeholder="请输入注册资本"
                                   value="${p2pEnterpriseCertify.registeredCapital}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">传真<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="faxNum" placeholder="请输入传真号码"
                                   value="${p2pEnterpriseCertify.faxNum}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">联系电话<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="telephoneNum" placeholder="请输入联系电话"
                                   value="${p2pEnterpriseCertify.telephoneNum}"/>
                        </div>
                    </div>
                    <div class="form-group btn-file form-group-04">
                        <label class="col-lg-3 control-label">营业执照副本扫描件<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file pull-left gyh_inp" type="file" name="file">
                            <div class="gyh" style="display: none; color: #f1318e">
                                您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-offset-3 saomiao">
                        <p style="color: #C1181D;">证件要求：</p>
                        <p>必须为清晰彩色原件扫描件或数码照，图片大小不超过5M</p>
                        <p>必须在有效期内且年检章齐全(当年成立公司可无年检章)</p>
                        <p>必须为中国大陆工商局颁发</p>
                        <p><!-- <a href="javascript:void(0)" style="color:#1B41D6">查看详细证件要求</a> --></p>
                    </div>

                </fieldset>
            </div>

            <div class="form-group">
                <label class="col-lg-4 control-label" style="margin-left: -6%">代理人是否为企业法定代表人<b
                        style="color:#C1181D;font-size:16px;">*</b>：</label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="xbox" name="topic2" value="yes">
                    是
                </label>
                <label style="margin-left: 10px;color:#929292">
                    <input type="radio" class="xbox" name="topic2" value="no">
                    否
                </label>
            </div>
            <div data-topic='yes'>
                <fieldset>

                </fieldset>
            </div>
            <div style="display: none;" data-topic='no'>
                <fieldset>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人姓名<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="nameOf" placeholder="请输入姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">企业法定代表人身份证号<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input type="text" class="form-control" name="idNumberOf" placeholder="请输入身份证号"/>
                        </div>
                    </div>

                    <div class="form-group form-group-05">
                        <label class="col-lg-3 control-label">身份证正面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file pull-left" type="file" name="file">
                        </div>
                    </div>
                    <div class="form-group form-group-06">
                        <label class="col-lg-3 control-label">身份证背面<b
                                style="color:#C1181D;font-size:16px;">*</b>：</label>
                        <div class="col-lg-5 ">
                            <input class="file pull-left" type="file" name="file">
                        </div>
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
                            <input type="text" class="form-control" name="telephoneNumOf" placeholder="请输入联系电话"/>
                        </div>
                    </div>
                </fieldset>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; margin-bottom:40px;width: 95%;">
                    <button type="submit" class="btn btn-primary" id="signup" name="signup" value="Sign up">下一步</button>
                    <button type="button" class="btn btn-info" id="resetBtns" style="width: 68px;margin-left:2%"
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


<script>
    var radio = document.getElementsByClassName("topics");
    for (var i = 0; i < radio.length; i++) {
        if (radio[i].value == "css1") {
            radio[i].checked = true;
        }
    }
    $(".topics").click(function () {
        $('.isLongTerm').each(function () {
            $('.isLongTerm').attr('checked', false);
            if ($(this).prop('checked') == true) {
                $('#cq' + i).val(0);
            } else {
                $('#cq' + i).val(0);
            }
            i++;
        });
        var e = window.event || arguments[0];
        var target = e.srcElement || e.target;
        var value = $(target).val();
        if (value == "css1") {
            $(".topics").attr("checked", "false");
            $(".wrap").hide();
            $(".topics").each(function (i) {
                if ($(".topics")[i].value == "css1") {
                    radio[i].checked = true;
                }
            })
            $("input[name='topic2']").prop("checked", false);
            $("input[name='topic2']:first").prop("checked", true);
            $("[data-topic='no']").hide();
            $("[data-topic='yes']").show();
            $(".interviewForm").hide();
            $("#interviewForm").show();
        } else if (value == "javascript1") {
            $('.isLongTerm').attr('checked', false);
            $(".wrap").hide();
            $('.isLongTerm').each(function () {
                if ($(this).prop('checked') == true) {
                    $('#cq' + i).val(0);
                } else {
                    $('#cq' + i).val(0);
                }
                i++;
            });
            $(".topics").each(function (i) {
                if ($(".topics")[i].value == "javascript1") {
                    radio[i].checked = true;
                }
            })
            $("input[name='topic2']").prop("checked", false);
            $("input[name='topic2']").eq(2).prop("checked", true);
            $("[data-topic='no']").hide();
            $("[data-topic='yes']").show();
            $(".interviewForm").hide();
            $("#interviewForms").show();
        }
    })
</script>


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
                        remote: {
                            url: '${ctx}/user/p2pEnterpriseCertify/getByEnterpriseName',
                            message: '企业名称已存在'
                        },
                        stringLength: {
                            max: 30,
                            message: '企业名称必须小于30字'
                        }
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
                        notEmpty: {
                            message: '税务登记号不能为空'
                        },
                        regexp: {
                            regexp: /^\d{15}$|^\d{20}$/,
                            message: '税务登记号必须为15位或20位数字'
                        },

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
                    message: '注册资本是无效的',
                    validators: {
                        notEmpty: {
                            message: '注册资本不能为空'
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
                organizationCode: {
                    message: '组织机构代码是无效的',
                    validators: {
                        notEmpty: {
                            message: '组织机构代码不能为空'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}$/,
                            message: '请输入正确的组织机构代码，如：00000000-0'
                        },
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
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
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
                            regexp: /^1(3|5|7|8)\d{9}$/,
                            message: '请输入正确电话号码'
                        }
                    }
                },
                telephoneNumOf: {
                    validators: {
                        notEmpty: {
                            message: '法人联系电话不能为空'
                        },
                        regexp: {
                            regexp: /^1(3|4|5|7|8)\d{9}$/,
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
    $(document).ready(function () {
        $('#interviewForms').bootstrapValidator({
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
                        remote: {
                            url: '${ctx}/user/p2pEnterpriseCertify/getByEnterpriseName',
                            message: '企业名称已存在'
                        },
                        stringLength: {
                            max: 30,
                            message: '企业名称必须小于30字'
                        }
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
                    message: '注册资本是无效的',
                    validators: {
                        notEmpty: {
                            message: '注册资本不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9]{1}[0-9]{0,9}$|^[1]{1}[0]{10}$/,
                            message: '请输入以元为单位的数字'
                        }
                    }
                },
                unifiedSocialCreditCode2: {
                    message: '社会信用代码是无效的',
                    validators: {
                        notEmpty: {
                            message: '社会信用代码不能为空'
                        },
                        regexp: {
                            regexp: /^[A-Z0-9]{18}$/,
                            message: '请输入18位数字以及大写字母'
                        },
                    }
                },
                organizationCode2: {
                    message: '组织机构代码是无效的',
                    validators: {
                        regexp: {
                            regexp: /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}$/,
                            message: '请输入正确的组织机构代码，如：00000000-0'
                        },
                    }
                },
                taxRegistrationNum2: {
                    message: '税务登记号是无效的',
                    validators: {
                        regexp: {
                            regexp: /^\d{15}$|^\d{20}$/,
                            message: '税务登记号必须为15位或20位数字'
                        },
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
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
                            message: '请输入正确的身份证号'
                        },
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
                telephoneNumOf: {
                    validators: {
                        notEmpty: {
                            message: '法人联系电话不能为空'
                        },
                        regexp: {
                            regexp: /^1(3|4|5|7|8)\d{9}$/,
                            message: '请输入正确电话号码'
                        }
                    }
                },
                telephoneNum: {
                    validators: {
                        notEmpty: {
                            message: '联系电话不能为空'
                        },
                        regexp: {
                            regexp: /^1(3|4|5|7|8)\d{9}$/,
                            message: '请输入正确电话号码'
                        }
                    }
                }
            }
        })
            .find('input[type="radio"]').on('change', function () {

            $(".file").parent().find("i").eq(1).css("left", "85%");
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
                    $('#interviewForms').bootstrapValidator('removeField', 'css_frameworks[]');
                    break;
                case ('javascript' == topic && 'block' == display):
                    $('#interviewForms').bootstrapValidator('addField', 'js_frameworks[]', {
                        validators: {
                            notEmpty: {
                                message: 'The name of framework is required'
                            }
                        }
                    });
                    break;
                case ('javascript' == topic && 'none' == display):
                    $('#interviewForms').bootstrapValidator('removeField', 'js_frameworks[]');
                    break;
            }

        });

        $('#resetBtns').click(function () {
            $('#interviewForms').data('bootstrapValidator').resetForm(true);
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
        $(".file").parent(".btn-file").css("width", "100%");
        $(".file").parent(".btn-file").css("margin-top", "10px");
        $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");

        $(".close").click(function () {
            $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");
        })
        $(".fileinput-remove-button").click(function () {
            $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");
        })
    })
    if (myBrowser() == "Safari") {
        $('input[type="file"]').css({"opacity": 1, "margin-top": 0})
    }

    function myBrowser() {
        if (isSafari = navigator.userAgent.indexOf("Safari") > 0 && navigator.userAgent.indexOf("Chrome") < 0) {
            OsObject = "Safari";
        }
        return OsObject;
    }
</script>
<script type="text/javascript">
    function reflush() {
        window.location.reload();
    }
</script>
<script type="text/javascript">
    fillInputBug('01');
    fillInputBug('02');
    fillInputBug('03');
    fillInputBug('04');
    fillInputBug('05');
    fillInputBug('06');
    function fillInputBug(num) {
        $('.pull-left[type ="file"]').click(function (e) {
            var $close = $(".form-group-" + num + " " + ".fileinput-remove"); //del
            var $i = $(".form-group-" + num + " " + "i.form-control-feedback");// v
            var $lg5 = $(".form-group-" + num + " " + ".col-lg-5");
            var $form = $(".form-group-" + num);

            $close.click(function () {
                $lg5.children('small').remove();
                var $input = $(".form-group-" + num + " " + " input[name=" + "hand_ID" + "]");
                var file = e.target.files[0];//获取的当前上传的图片
                console.log(file);
                $form.removeClass('has-success').addClass('has-error');
                $i.removeClass('glyphicon-ok').addClass('glyphicon-remove');
                $input.val("");
                var newStr = '<small class="help-block"data-bv-validator="notEmpty" ' +
                    'data-bv-for="hand_ID" data-bv-result="INVALID" >请上传附件</small>';
                $lg5.append(newStr);
                if ($(".form-group-" + num + " " + ".col-lg-5" + " " + "small") || $input.val()) {
                    $('button[type="submit"]').attr('disabled', 'disabled');
                }
            })
        })
    }
</script>
<script>
    $("#btn-long").click(function () {
        var flag = $(this).prop("checked");
        if (flag) {
            $(".wrap").show();
        } else {
            $(".wrap").hide();
        }
    })
    $(function () {
        $('.xbox').bind('click', function () {
            if ($(this).val() == 'yes') {
                $('.glyphicon-remove').each(function () {
                    var validator = $(this).attr('data-bv-icon-for');
                    if (validator == 'nameOf' || validator == 'idNumberOf' || validator == 'telephoneNumOf' || validator == 'file') {
                        $('.btn-primary').removeAttr("disabled");
                    }
                });
            }
        });
    });
</script>

<script>
    /* 改动内容 */
    var explorer = window.navigator.userAgent.toLowerCase();
    var ver = explorer.match(/msie ([\d.]+)/)[1];
    $(document).ready(function () {
        if (explorer.indexOf("msie") >= -1) {
            if (ver === '9.0' || ver === '8.0' || ver === '7.0' || ver === '6.0') {
                $('.gyh').css('display', 'block');
                $('.gyh_inp').attr('disabled', 'disabled');
                $('.gyh_inp').parent().css({
                    'background': '#ccc',
                    'cursor': 'no-drop',
                    'border': '0'
                });
            }
        }
    });
</script>


</body>
</html>
