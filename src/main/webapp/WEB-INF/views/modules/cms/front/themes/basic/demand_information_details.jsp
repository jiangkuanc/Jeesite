<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一带一路企业详情</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
</head>

<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx}/cms/cmsRequirementInformation/requirementInformation">需求信息</a></li>
        <li class="active"><a href="#" id="pro"></a></li>
    </ol>
</div>

<div class="contbox">
    <div class="pic_ttbox mgtop_30">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>

    <div class="qyxqbox mgtop_30">
        <div class="gsxq_box">
            <a href="#" class="pull-left"><img src="${ctxStatic}/dist/images/xmxb_pic.jpg" alt=""></a>
            <div class="gsxq_box_rt pull-left">

                <h3><a href="#" class="c_active" id="productName">${demandInformation.productName }</h3>
                <ul>
                    <li>
                        <em><span>期望价格：</span>${demandInformation.hopePrice }</em>
                        <em><span>预算金额：</span>${demandInformation.budgetAmount }</em>
                    </li>
                    <li>
                        <em><span>所需数量：</span>${demandInformation.requiredNumber }</em>
                        <em><span>企业名称：</span>${demandInformation.companyName }</em>
                    </li>
                    <li>
                        <em><span>联系人姓名：</span>${demandInformation.contacts }</em>
                        <em><span>联系电话：</span>${demandInformation.phone }</em>
                    </li>
                    <li><span>有效期至：<fmt:formatDate value="${demandInformation.validity }" pattern="yyyy-MM-dd"/></span>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="qyjj_box">
            <div class="qyjj_boxhd">
                <h3>附注说明</h3>
            </div>
            <p>
            <h3><a href="#" class="c_active">${demandInformation.productName}</h3></a></p>
            <p>${demandInformation.requiredEnterprise }</p>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var te = $("#productName").html();
        $("#pro").html(te);
    })
</script>
</body>
</html>