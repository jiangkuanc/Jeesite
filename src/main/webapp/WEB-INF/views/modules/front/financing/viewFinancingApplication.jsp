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
            right: 290px
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
        $(function () {
            var date = '${p2p.p2pEnterpriseCertify.quasiNuclearDate}';
            date = new Date(date);
            $('#quasiNuclearDate').html(date.Format('yyyy-MM-dd'));
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
        <li class="lg-active">融资申请查看</li>
    </ol>
</div>

<div class="rzsq">
    <div class="xyjyjt-content" style="margin-top: 20px">

        <div class="clearfix"></div>
        <h4>融资申请：基本信息查看</h4>
    </div>
    <div class="rzsq-con">
        <form id="interviewForm" method="post" class="form-horizontal" action="${ctx}/application/updateAppInfo">
            <input type="hidden" name="token" value="${token}"/>
            <p><strong>债项信息：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label" style="height: 35px;">申请人：</label>
                <div class="col-lg-3" style="height:35px;">
                    <span style="line-height: 48px;font-size:14px">${p2p.p2pRegUserCertify.realName}</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">借款金额<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-4 checkbox" style="margin-top: 7px">
                    <span style="font-size:14px;margin:0px 2px">${p2p.applicationAmount}元</span>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-2 control-label">借款时长<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    <span style="font-size:14px;margin:0px 2px">${p2p.financingMaturity}个月</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">还款方式<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${fns:getDictLabel(p2p.repaymentMode, 'repayment_mode', '')}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">募集期限<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox noWrap" style="margin-top: 7px">
                    <span style="font-size:14px;margin:0px 2px">${p2p.raiseTimeLimit}天(20个工作日以内)</span>
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
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${fns:getDictLabel(p2p.p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">企业性质<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${fns:getDictLabel(p2p.p2pEnterpriseCertify.enterpriseNature, 'enterprise_nature', '')}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">所属行业<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${p2p.p2pIndustryclassi.classinameCn}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">所在地<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${p2p.p2pEnterpriseCertify.provincialArea}&nbsp;&nbsp;&nbsp;${p2p.p2pEnterpriseCertify.municipalArea}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">企业经营范围：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.p2pEnterpriseCertify.businessScope}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">实缴资本<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    <span style="font-size:14px;margin:0px 2px">${p2p.p2pEnterpriseCertify.realCapital}元</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">经营区域<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${p2p.p2pEnterpriseCertify.businessArea}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照登记机关<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${p2p.p2pEnterpriseCertify.registrationAuthority}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照登记状态<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${fns:getDictLabel(p2p.p2pEnterpriseCertify.registrationState, 'registration_state', '')}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照准核日期<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" id="quasiNuclearDate" style="margin-top: 7px">

                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">是否存在境外交易<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    <c:if test="${p2p.p2pEnterpriseCertify.isOffshoreTransaction == 1}">是</c:if>
                    <c:if test="${p2p.p2pEnterpriseCertify.isOffshoreTransaction == 0}">否</c:if>
                </div>
            </div>

            <p><strong>借款用途：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label">用途类别<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-3 checkbox" style="margin-top: 7px">
                    ${fns:getDictLabel(p2p.purposeClassification, 'purpose_classification', '')}
                </div>
            </div>

            <input type="hidden" id="purposeName" name="purposeName" value=""/>

            <div class="form-group" id="myTextarea">
                <label class="col-lg-2 control-label">用途说明<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.purposeExplain}
                </div>
            </div>

            <p><strong>还款来源：</strong></p>
            <div class="form-group">
                <label class="col-lg-2 control-label">第一还款来源<b style="color:#C1181D;font-size:16px;">*</b>：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.repaymentFirstSource}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">第二还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.repaymentSecondSource}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">第三还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.repaymentThirdSource}
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">其他还款来源&nbsp;：</label>
                <div class="col-lg-8 checkbox" style="margin-top: 7px">
                    ${p2p.repaymentOtherSource}
                </div>
            </div>
            <div class="form-group" style=" text-align: center;margin:35px 0px 40px 0px">
                <div class="col-lg-8 col-lg-offset-2" style="margin-left: 10px; width: 85%;margin-bottom:40px">

                    <input type="button" class="btn btn-primary" id="resetBtn" style="margin-left:1%;" value="返回"
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
        window.location.href = '${ctx}/user/p2pUserInformation/financingPermission';
    }
</script>
</body>
</html>
