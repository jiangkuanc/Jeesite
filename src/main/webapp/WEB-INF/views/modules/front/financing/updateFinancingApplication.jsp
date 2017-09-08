<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
    <style>
        .has-feedback .form-control {
            padding-right: 0px;
            display: inline-block;
        }

        .form-horizontal .control-label {
            line-height: 30px;
            font-weight: normal;
        }

        .form-control {
            padding: 2px 3px
        }

        .form-group {
            margin-bottom: 0px;
        }

        .checkbox label {
            padding: 0px
        }

        .form-horizontal .has-feedback .form-control-feedback {
            right: -15px;
        }

        #myradio i {
            left: 600px;
            top: -5px
        }

        #myTextarea i {
            right: 290px;
            padding-left: 5%
        }

        #raiseTimeLimit i {
            right: -20%;
            top: 15%
        }

        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript">

        function loadArea() {
            var area1 = $('#area1').val();
            $.ajax({
                url: '${ctx}/user/p2pUserInformation/loadMunicipalArea',
                type: 'POST',
                data: {parentId: area1},
                dataType: 'json',
                success: function (data) {
                    var html = '';
                    $.each(data, function (index, elem) {
                        html += '<option value="' + elem.id + '">' + elem.name + '</option>'
                    });
                    $('#area2').html(html);
                }
            });
        }
        /* function loadIndustry(){
         var industry1 = $('#industry1').val();
         $.ajax({
         url:'${ctx}/Industry/findSecondCategory',
         type:'POST',
         data:{industryNum:industry1},
         success:function(data){
         var html = '';
         $.each(data,function(index,elem){
         html += '<option value="'+elem.industrynum+'">'+elem.classinameCn+'</option>'
         });
         $('#industry2').html(html);
         }
         });
         } */
    </script>
    <script type="text/javascript">
        $(function () {
            changePurpose();
        });
        function changePurpose() {
            $('#purposeName').val($('#purposeClassification option:selected').text());
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $('#financingMaturity').val('${p2p.financingMaturity}');
            $('#repaymentMode').val('${p2p.repaymentMode}');
            $('#raiseTimeLimit').val('${p2p.raiseTimeLimit}');
            $('#enterpriseScale').val('${p2p.p2pEnterpriseCertify.enterpriseScale}');
            $('#enterpriseNature').val('${p2p.p2pEnterpriseCertify.enterpriseNature}');
            var prefix = '${p2p.p2pEnterpriseCertify.industryCode}';
            /* prefix = prefix.substring(0,1); */
            $('#industry1').val(prefix);
            /* loadIndustry(); */
            /* $('#industry2').val('
            ${p2p.p2pEnterpriseCertify.industryCode}'); */
            $('#area1').val('${p2p.p2pEnterpriseCertify.provincialArea}');
            loadArea();
            //$('#area2').val('${p2p.p2pEnterpriseCertify.municipalArea}');
            $('#purposeClassification').val('${p2p.purposeClassification}');
            $('#registrationState').val('${p2p.p2pEnterpriseCertify.registrationState}');
            if ('${p2p.p2pEnterpriseCertify.isOffshoreTransaction}' == 1) {
                $('#isOffshoreTransaction').eq(0).prop('checked', true);
            } else {
                $('#isOffshoreTransaction').eq(1).prop('checked', true);
            }
            var date = '${p2p.p2pEnterpriseCertify.quasiNuclearDate}';
            date = new Date(date);
            $('#quasiNuclearDate').val(date.Format('yyyy-MM-dd'));
        });

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
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页 </a></li>
        <li><a href="${ctx}/user/p2pUserInformation/financingPermission">我要融资</a></li>
        <li class="lg-active">融资申请填写</li>
    </ol>
</div>

<div class="rzsq">
    <div class="xyjyjt-content" style="margin-top: 20px">

        <div class="clearfix"></div>
        <h4>融资申请：基本信息填写</h4>
    </div>
    <div class="rzsq-con">
        <form id="interviewForm" method="post" class="form-horizontal" action="${ctx}/application/updateAppInfo">
            <input type="hidden" name="token" value="${token}"/>
            <input type="hidden" name="id" value="${p2p.id}"/>
            <input type="hidden" name="rateDocumentId" value="${rateDocumentId}">
            <p><strong>债项信息：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label" style="height: 35px;">申请人：</label>
                <div class="col-lg-3" style="height:35px;">
                    <span style="line-height: 48px;font-size:14px">${p2p.p2pRegUserCertify.realName}</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">借款金额<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-4 checkbox">
                    <input type="text" class="form-control" style="width:60%" placeholder="此处填写您的借款金额"
                           name="applicationAmount" value="${p2p.applicationAmount}"/>
                    <span style="font-size:14px;margin:0px 2px">元</span>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-2 control-label">借款时长<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width: 60%;" id="financingMaturity" name="financingMaturity"
                            data-bv-notempty data-bv-notempty-message="请选择借款时长">
                        <option value="">请选择</option>
                        <option value="1">1</option>
                        <option value="3">3</option>
                        <option value="6">6</option>
                        <option value="9">9</option>
                        <option value="12">12</option>
                    </select>
                    <span style="font-size:14px;margin:0px 2px">个月</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">还款方式<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width: 60%;" id="repaymentMode" name="repaymentMode"
                            data-bv-notempty data-bv-notempty-message="请选择还款方式">
                        <option value="">请选择</option>
                        <c:forEach items="${fns:getDictList('repayment_mode')}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>

                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">募集期限<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox noWrap">
                    <select class="form-control" style="width: 60%;" id="raiseTimeLimit" name="raiseTimeLimit"
                            data-bv-notempty data-bv-notempty-message="请选择募集期限">
                        <option value="">请选择</option>
                        <c:forEach begin="1" end="20" varStatus="i">
                            <option value="${i.index}">${i.index}</option>
                        </c:forEach>
                    </select>
                    <span style="font-size:14px;margin:0px 2px">天(20个工作日以内)</span>
                </div>
            </div>
            <p><strong>企业简介：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label" style="height: 25px;">企业名称：</label>
                <div class="col-lg-6" style="min-height: 25px;">
                    <span style="line-height: 48px;font-size:14px">${p2p.p2pEnterpriseCertify.enterpriseName}<input
                            type="hidden" name="enterpriseName" value="${p2pEnterpriseCertify.enterpriseName}"/></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" style="height: 35px;">注册地址：</label>
                <div class="col-lg-6" style="min-height: 35px;">
                    <span style="line-height: 48px;font-size:14px">${p2p.p2pEnterpriseCertify.registeredAddress}<input
                            type="hidden" name="registeredAddress"
                            value="${p2pEnterpriseCertify.registeredAddress}"/></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">企业规模<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width:60%;" id="enterpriseScale" name="enterpriseScale"
                            data-bv-notempty data-bv-notempty-message="请选择企业规模">
                        <option value="">请选择</option>
                        <c:forEach items="${fns:getDictList('enterprise_scale')}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">企业性质<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width: 60%;" id="enterpriseNature" name="enterpriseNature"
                            data-bv-notempty data-bv-notempty-message="请选择企业性质">
                        <option value="">请选择</option>
                        <c:forEach items="${fns:getDictList('enterprise_nature')}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">所属行业<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" name="industryCode" style="width:90%;" data-bv-notempty
                            data-bv-notempty-message="请选择所属行业" id="industry1">
                        <option value="">请选择</option>
                        <c:forEach items="${industryList}" var="item">
                            <option value="${item.industrynum}">${item.classinameCn}</option>
                        </c:forEach>
                    </select>
                    <!-- <select class="form-control" style="width: 45%;" name="industryCode" data-bv-notempty data-bv-notempty-message="请选择所属行业" id="industry2">
                        <option value="">请选择</option>
                    </select> -->
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">所在地<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width: 45%;" name="provincialArea" data-bv-notempty
                            data-bv-notempty-message="请选择所在地" onchange="loadArea()" id="area1">
                        <option value="">请选择</option>
                        <c:forEach items="${provincialAreaList}" var="pal">
                            <option value="${pal.id}">${pal.name}</option>
                        </c:forEach>
                    </select>
                    <select class="form-control" style="width: 45%;" name="municipalArea" id="area2">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">企业经营范围：</label>
                <div class="col-lg-8 checkbox">
                    ${p2p.p2pEnterpriseCertify.businessScope}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">实缴资本<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <input type="text" class="form-control" style="width:60%" placeholder="此处填写您的实缴资本"
                           name="realCapital" value="${p2p.p2pEnterpriseCertify.realCapital}"/>
                    <span style="font-size:14px;margin:0px 2px">元</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">经营区域<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <input type="text" class="form-control" style="width:60%" placeholder="此处填写您的经营区域"
                           name="businessArea" value="${p2p.p2pEnterpriseCertify.businessArea}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照登记机关<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <input type="text" class="form-control" style="width:60%" placeholder="此处填写您的营业执照登记机关"
                           name="registrationAuthority" value="${p2p.p2pEnterpriseCertify.registrationAuthority}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照登记状态<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select class="form-control" style="width: 60%;" id="registrationState" name="registrationState"
                            data-bv-notempty data-bv-notempty-message="请选择营业执照登记状态">
                        <option value="">请选择</option>
                        <c:forEach items="${fns:getDictList('registration_state')}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>

                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照准核日期<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <input id="quasiNuclearDate" name="quasiNuclearDate" type="text" readonly="readonly" maxlength="20"
                           class="input-medium Wdate" placeholder="请选择日期"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                           style="cursor:pointer;margin-top: 7px"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">是否存在境外交易<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    &nbsp;&nbsp;是&nbsp;&nbsp;<input id="isOffshoreTransaction" type="radio" name="isOffshoreTransaction"
                                                    value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    否&nbsp;&nbsp;<input id="isOffshoreTransaction" type="radio" name="isOffshoreTransaction" value="0"
                                        checked="checked"/>
                </div>
            </div>

            <p><strong>借款用途：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label">用途类别<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox">
                    <select id="purposeClassification" class="form-control" style="width: 100%;"
                            name="purposeClassification"
                            data-bv-notempty data-bv-notempty-message="请选择用途类别" onchange="changePurpose()"
                            id="purposeClassification">
                        <option value="">请选择</option>
                        <c:forEach items="${fns:getDictList('purpose_classification')}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <input type="hidden" id="purposeName" name="purposeName" value=""/>

            <div class="form-group" id="myTextarea">
                <label class="col-lg-2 control-label">用途说明<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-8 checkbox">
                    <textarea id="textarea" cols="58" name="purposeExplain" rows="5"
                              style="overflow: hidden;resize: none;border: 1px solid #ccc;">${p2p.purposeExplain}</textarea>
                </div>
            </div>

            <p><strong>还款来源：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label">第一还款来源<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-8 checkbox">
                    <input name="repaymentFirstSource" type="text" class="form-control" placeholder="此处填写您还款来源的详细说明"
                           name="repaymentFirstSource" value="${p2p.repaymentFirstSource}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">第二还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox">
                    <input name="repaymentSecondSource" type="text" class="form-control" placeholder="此处填写您还款来源的详细说明"
                           value="${p2p.repaymentSecondSource}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">第三还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox">
                    <input name="repaymentThirdSource" type="text" class="form-control" placeholder="此处填写您还款来源的详细说明"
                           value="${p2p.repaymentThirdSource}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">其他还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox">
                    <input name="repaymentOtherSource" type="text" class="form-control" placeholder="此处填写您还款来源的详细说明"
                           value="${p2p.repaymentOtherSource}"/>
                </div>
            </div>
            <div class="form-group" style=" text-align: center;margin:35px 0px 40px 0px">
                <div class="col-lg-8 col-lg-offset-2" style="margin-left: 10px; width: 85%;margin-bottom:40px">
                    <button type="submit" class="btn"
                            style="background-color: #f2434a;color:#fff;width:auto;margin-left: 1%">下一步
                    </button>
                    <input type="button" class="btn btn-primary" id="resetBtn" style="margin-left:1%;" value="取消"
                           onclick="abc()"/>
                </div>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    function abc() {
        window.location.href = '${frontPath}';
    }
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
                lastName: {
                    validators: {
                        notEmpty: {
                            message: 'The last name is required and cannot be empty'
                        }
                    }
                },
                finacingName: {
                    validators: {
                        notEmpty: {
                            message: '债项名称不能为空'
                        },
                        stringLength: {
                            max: 100,
                            message: '用途说明必须小于100字'
                        },
                    }
                },
                applicationRate: {
                    message: '请选择您的申请利率',
                    validators: {
                        notEmpty: {
                            message: '请选择您的申请利率'
                        },
                    }
                },
                applicationAmount: {
                    message: '请填写您的借款金额',
                    validators: {
                        notEmpty: {
                            message: '请填写您的借款金额'
                        },
                        regexp: {
                            regexp: /^[5-9]{1}[0]{4}$|^[1-9]{1}[0-9]{1}[0]{4}$|^[1]{1}[0]{6}$/,
                            message: '借款金额不能低于5万，不能大于100万，并且为1万倍数'
                        },
                    }
                },
                financingMaturity: {
                    message: '请选择您的借款时长',
                    validators: {
                        notEmpty: {
                            message: '请选择您的借款时长'
                        },
                    }
                },
                repaymentMode: {
                    message: '请选择您的还款方式',
                    validators: {
                        notEmpty: {
                            message: '请选择您的还款方式'
                        },
                    }
                },
                raiseTimeLimit: {
                    message: '请选择您的融资期限',
                    validators: {
                        notEmpty: {
                            message: '请选择您的融资期限'
                        },
                    }
                },
                enterpriseScale: {
                    message: '请选择您的公司规模',
                    validators: {
                        notEmpty: {
                            message: '请选择您的公司规模'
                        },
                    }
                },
                enterpriseNature: {
                    message: '请选择您的企业性质',
                    validators: {
                        notEmpty: {
                            message: '请选择您的企业性质'
                        },
                    }
                },
                industryCode: {
                    message: '请选择您的企业所属行业',
                    validators: {
                        notEmpty: {
                            message: '请选择您的企业所属行业'
                        },
                    }
                },
                purposeClassification: {
                    message: '请选择您的融资用途类别',
                    validators: {
                        notEmpty: {
                            message: '请选择您的融资用途类别'
                        },
                    }
                },
                realCapital: {
                    message: '请填写企业的实缴资本',
                    validators: {
                        notEmpty: {
                            message: '请填写企业的实缴资本'
                        },
                        regexp: {
                            regexp: /^[1]{1}[0]{11}$|^[1-9]{1}[0-9]{0,10}$/,
                            message: '实缴资本必须为正整数且最大为1000亿'
                        }
                    }
                },
                businessArea: {
                    message: '请填写企业的经营区域',
                    validators: {
                        notEmpty: {
                            message: '请填写企业的经营区域'
                        },
                        stringLength: {
                            max: 20,
                            message: '经营区域必须不超过20字'
                        }
                    }
                },
                quasiNuclearDate: {
                    message: '请填写营业执照准核日期',
                    validators: {
                        notEmpty: {
                            message: '请填写营业执照准核日期'
                        }
                    }
                },
                purposeExplain: {
                    message: '请填写您的融资用途说明',
                    validators: {
                        notEmpty: {
                            message: '请填写您的融资用途说明'
                        },
                        stringLength: {
                            min: 20,
                            max: 600,
                            message: '用途说明不小于20字并且不大于600字'
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
                repaymentFirstSource: {
                    message: '请填写您还款来源的详细说明',
                    validators: {
                        notEmpty: {
                            message: '请填写您还款来源的详细说明'
                        },
                        stringLength: {
                            min: 10,
                            max: 600,
                            message: '还款来源不小于10字并且不大于600字'
                        }
                    }
                },
                repaymentSecondSource: {
                    message: '请填写您还款来源的详细说明',
                    validators: {
                        stringLength: {
                            max: 600,
                            message: '还款来源不能超过600字'
                        }
                    }
                },
                repaymentThirdSource: {
                    message: '请填写您还款来源的详细说明',
                    validators: {
                        stringLength: {
                            max: 600,
                            message: '还款来源不能超过600字'
                        }
                    }
                },
                repaymentOtherSource: {
                    message: '请填写您还款来源的详细说明',
                    validators: {
                        stringLength: {
                            max: 600,
                            message: '还款来源不能超过600字'
                        }
                    }
                },
                registrationAuthority: {
                    message: '请填写您的营业执照登记机关',
                    validators: {
                        notEmpty: {
                            message: '请填写您的营业执照登记机关'
                        },
                        stringLength: {
                            min: 5,
                            max: 20,
                            message: '营业执照登记机关不小于5字并且不大于20字'
                        }
                    }
                }
            }
        })

        $('#resetBtn').click(function () {
            $('#interviewForm').data('bootstrapValidator').resetForm(true);
        });
    });
</script>
</body>
</html>
