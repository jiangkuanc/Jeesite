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
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/productInfo">产品供给信息</a></li>
        <li class="active"><a href="#" id="info"></a></li>
    </ol>
</div>

<div class="contbox">
    <div class="pic_ttbox mgtop_30">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>

    <div class="qyxqbox mgtop_30">

        <c:forEach items="${currentSupplyInformation}" var="vo">
            <div class="gsxq_box">
                <a href="#" class="pull-left"><img src="${ctxStatic}/dist/images/xmxb_pic.jpg" alt=""></a>
                <div class="gsxq_box_rt pull-left">
                    <h3><a href="#" class="c_active" id="informationName">${vo.informationName}</a></h3>
                    <ul>
                        <li>
                            <em><span>产品价格：</span>${vo.productPrice}</em>
                            <em><span>起订数量：</span>${vo.minOrder }</em>
                        </li>
                        <li>
                            <em><span>联系人：</span>${vo.contacts }</em>
                            <em><span>职务：</span>${vo.duty}</em>
                        </li>
                        <li>
                            <em><span>联系电话：</span>${vo.phone}</em>
                            <em><span>企业名称：</span>${vo.companyName}</em>
                        </li>
                        <li><span>有效期至：<fmt:formatDate value="${vo.validity }" pattern="yyyy-MM-dd"/></span></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>企业简介</h3>
                </div>
                <p>
                <h3><a href="#" class="c_active">${vo.informationName}</h3></a></p>
                <p>${vo.companyEnterprise }</p>
            </div>
            <div class="qyjj_box">
                <h3>企业展示</h3>
                <ul class="qyzs_picbox">
                    <c:forEach var="img" items="${fn:split(vo.companyDisplay,'|') }" varStatus="status">
                        <li class="pull-left"><img alt="" src="http://10.10.10.136:8008${img}"></li>

                        <c:if test="${status.count%2==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var te = $("#informationName").html();
        $("#info").html(te);
    })
</script>
</body>
</html>