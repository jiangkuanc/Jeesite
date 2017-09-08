<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type: 'POST',
            url: '${ctx}/user/userList/enterpriseBaseInfo?userid=${userid}',
            dataType: 'json',
            success: function (data) {
                for (i in data) {
                    if (i == "unitType") {
                        var a = eval('${fns:getDictListJson('unit_type')}');
                        getJsDictValue(i, a, data[i]);
                    } else if (i == "certificateType") {
                        var a = eval('${fns:getDictListJson('certificate_type')}');
                        getJsDictValue(i, a, data[i]);
                        if (data[i] == 1) {
                            $("#organizationCode").prev().html("组织机构代码");
                            $("#taxRegistrationNum").prev().html("税务登记号");
                        }
                    } else if (i == "certificateLocation") {
                        var a = eval('${fns:getDictListJson('provincial_area')}');
                        getJsDictValue(i, a, data[i]);
                    } else if (i == "isEntLegalRep") {
                        var a = eval('${fns:getDictListJson('yes_no')}');
                        getJsDictValue(i, a, data[i]);
                    } else if (i == "companyFoundDate") {
                        var date = new Date(data[i]);
                        $("#" + i).html(date.format("yyyy-MM-dd"));
                    } else if (i == "registeredCapital" || i == "realCapital") {
                        $("#" + i).html(formatCurrency(data[i]) + "元");
                    } else if (i == "operationPeriod") {
                        if (data[i] != null || data[i] != "") {
                            var date = new Date(data[i]);
                            $("#" + i).html(date.format("yyyy-MM-dd"));
                        }
                    } else if (i == "isLongTerm") {
                        if (data[i] == "1") {
                            $("#operationPeriod").html("长期");
                        }
                    } else if (i == "registrationState") {
                        var a = eval('${fns:getDictListJson('registration_state')}');
                        getJsDictValue(i, a, data[i]);
                    } else if (i == "quasiNuclearDate") {
                        var date = new Date(data[i]);
                        $("#" + i).html(date.format("yyyy-MM-dd"));
                    } else if (i == "isOffshoreTransaction") {
                        var a = eval('${fns:getDictListJson('yes_no')}');
                        getJsDictValue(i, a, data[i]);
                    } else {
                        $("#" + i).html(data[i]);
                    }
                }
            },
            error: function (data) {
            }
        });
    });


</script>

<style>
    b {
        color: #C1181D;
        font-size: 16px;
    }
</style>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>统一社会信用代码（营业执照注册号）<b>&nbsp;*</b></td>
        <td id="unifiedSocialCreditCode"></td>
        <td>组织机构代码<b>&nbsp;*</b></td>
        <td id="organizationCode"></td>
    </tr>
    <tr>
        <td>税务登记号<b>&nbsp;*</b></td>
        <td id="taxRegistrationNum"></td>
        <td>企业名称<b>&nbsp;*</b></td>
        <td id="enterpriseName"></td>
    </tr>
    <tr>
        <td>单位类型<b>&nbsp;*</b></td>
        <td id="unitType"></td>
        <td>证件类型<b>&nbsp;*</b></td>
        <td id="certificateType"></td>
    </tr>
    <tr>
        <td>营业执照所在地<b>&nbsp;*</b></td>
        <td id="certificateLocation"></td>
        <td>注册资金<b>&nbsp;*</b></td>
        <td id="registeredCapital"></td>
    </tr>
    <tr>
        <td>联系电话<b>&nbsp;*</b></td>
        <td id="telephoneNum"></td>
        <td>公司成立日期<b>&nbsp;*</b></td>
        <td id="companyFoundDate"></td>
    </tr>
    <tr>
        <td>营业期限<b>&nbsp;*</b></td>
        <td id="operationPeriod"></td>
        <td>注册地址<b>&nbsp;*</b></td>
        <td id="registeredAddress"></td>
    </tr>
    <tr>
        <td>营业范围<b>&nbsp;*</b></td>
        <td id="businessScope"></td>
        <td>传真<b>&nbsp;*</b></td>
        <td id="faxNum"></td>
    </tr>
    <tr>
        <td>代理人是否为企业法定代表人<b>&nbsp;*</b></td>
        <td id="isEntLegalRep"></td>
        <td>企业法定代表人姓名<b>&nbsp;*</b></td>
        <td id="nameOf"></td>
    </tr>
    <tr>
        <td>企业法定代表人联系电话<b>&nbsp;*</b></td>
        <td id="telephoneNumOf"></td>
        <td>企业法定代表人身份证号<b>&nbsp;*</b></td>
        <td id="idNumberOf"></td>
    </tr>
    <tr>
        <td>实缴资本<b>&nbsp;*</b></td>
        <td id="realCapital"></td>
        <td>经营区域<b>&nbsp;*</b></td>
        <td id="businessArea"></td>
    </tr>
    <tr>
        <td>营业执照登记机关<b>&nbsp;*</b></td>
        <td id="registrationAuthority"></td>
        <td>营业执照登记状态<b>&nbsp;*</b></td>
        <td id="registrationState"></td>
    </tr>
    <tr>
        <td>营业执照核准日期<b>&nbsp;*</b></td>
        <td id="quasiNuclearDate"></td>
        <td>是否存在境外交易<b>&nbsp;*</b></td>
        <td id="isOffshoreTransaction"></td>
    </tr>
    </tbody>
</table>
