<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhaixiang.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/pdfobject.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            alert("您是新注册用户，需先签订服务协议再进行其他操作！");
        })
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/user/Institution/ctrlMenu">我的账户</a></li>
        <li class="lg-active">${fns:getDictLabel(p2pAgreement.agreementType, 'agreement_type', '')}</li>
    </ol>
</div>

<div class="xyjyjt-content">
    <div class="clearfix"></div>
    <div class="xyjyjt-content-top">
        <h3>${p2pAgreement.agreementMainTitle }</h3>
        <span class="clearfix"></span>
    </div>
    <div id="agreement" class="xyjyjt-content-bot" style="border-bottom:1px solid #ccc">
        <p style="text-indent:2em;">
            <br/>
        </p>
        <p style="text-align:center;">
            <strong><span style="font-size:16px;">${p2pAgreement.agreementSubTitle }</span></strong>
        </p>
        <div id="agreementContent">
            ${p2pAgreement.agreementContent}
        </div>
    </div>
    <div class="qianyue">
        <center><label for=""><input id="checkbox"
                                     type="checkbox">　我同意签署《${fns:getDictLabel(p2pAgreement.agreementType, 'agreement_type', '')}》</label>
        </center>
        <input type="button" value="确认" class="btn btn-default zh_btn quxiao" onclick="investment();">
        <input type="button" value="取消" class="btn btn-default zh_btn queren" onclick="toFront();">
    </div>
</div>

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    function investment() {
        var checkbox = document.getElementById('checkbox');//
        if (checkbox.checked) {
            var p2pFinancingInformationId = '${p2pFinancingInformation.id}';
            var p2pInvestmentAgreementId = '${p2pInvestmentAgreement.id}';
            var earnings = '${earnings}';
            //选中了
            window.location.href = "${ctx}/sys/user/signAgreement";
        } else {
            var agreementType = selectdic(${p2pAgreement.agreementType}, 'agreement_type', '');
            //没选中
            alert('请勾选屏幕下方"《' + agreementType + '》"');
        }
    }

    //查询字典项agreement_type
    function selectdic(value, type, defaultValue) {
        var zhi = '';
        var a = $.ajax({
            url: '${ctx}/financing/p2pFinancingInformation/selectDict',
            async: false,
            type: 'post',
            dataType: 'json',
            data: {value: value, type: type, defaultValue: defaultValue},
            success: function (d) {
                zhi = d.responseText;
            },
            error: function (e) {
                zhi = e.responseText;
                return zhi;
            }
        });
        return zhi;
    }

    function toFront() {
        window.location.href = '${pageContext.request.contextPath}${fns:getFrontPath()}';
    }
</script>
</body>
</html>