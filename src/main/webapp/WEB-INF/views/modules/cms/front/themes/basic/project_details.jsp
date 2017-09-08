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
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页> </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx}/cms/article/projectBiding?start=toFistPage">一带一路重点项目招标</a></li>
        <li class="active"><a href="#" id="pro" white-space:nowrap></a></li>
    </ol>
</div>
<div class="contbox">
    <div class="qyxqbox mgtop_30">

        <c:forEach items="${currentProjectDetils}" var="projectDetils" varStatus="stu">

            <div class="gsxq_box">

                <a href="#" class="pull-left"><img src="${ctxStatic}/dist/images/xmxb_pic.jpg" alt=""></a>
                <div class="gsxq_box_rt pull-left">

                    <h3><a href="#" class="c_active" id="projectName">${fns:abbr(projectDetils.projectName,70)}</a></h3>
                    <ul>
                        <li><span>投资方式：</span>${projectDetils.investmentWay }</li>
                        <li><span>所属行业：</span>${projectDetils.industryInvolved }</li>
                        <li><span>项目有效期：</span>${projectDetils.projectValidity }</li>
                        <li><span>项目所在地：</span>${projectDetils.projectLocated }</li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>企业简介</h3>
                </div>
                <p>
                <h3><a href="#" class="c_active">${fns:abbr(projectDetils.projectName,70)}</h3></a></p>
                <p>${projectDetils.projectEnterprise }</p>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>企业展示</h3>
                </div>
                <ul class="qyzs_picbox">
                    <c:forEach var="img" items="${fn:split(projectDetils.projectDisplay,'|') }" varStatus="status">
                        <li class="pull-left"><img alt="" src="${img}"></li>

                        <c:if test="${status.count%2==0 }">
                            <br/>
                        </c:if>

                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>合作机会</h3>
                </div>
                <ul class="qyjj_info_box">
                    <li>${projectDetils.cooperationOpportunities }</li>
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
        var te = $("#projectName").html();
        $("#pro").html(te);
    })
</script>
</body>
</html>