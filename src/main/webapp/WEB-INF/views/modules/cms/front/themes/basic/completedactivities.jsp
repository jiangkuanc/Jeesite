<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/jeesite.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <style type="text/css">
        li {
            display: inline
        }

        .divs .imgs {
            display: inline-block;
            vertical-align: middle;
        }

        .nrjj {
            padding: 20px 0;
            margin: 0;
        }

        .nrjj span, .bqhd_name {
            display: inline-block;
        }

        .nrjj span:nth-of-type(2) {
            width: 900px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx }/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li><a href="${ctx }/cms/article/xyjyhuodong">信用教育活动</a></li>
        <li class="lg-active">已完成活动</li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy-banner1_02.png" width="1440px" height="358px" alt=""></li>
    </ul>
</div>
<div class="xyjy-content-top" style="padding:50px 0;margin-bottom:100px;">
    <ul>
        <li style="font-size:25px">${fns:abbr(article.title,50)}</li>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <li>发表于 :<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></li>
    </ul>
    <div>
        <p class="nrjj"><span>活动回顾：</span><span>${fns:abbr(article.articleData.content,1000)}</span></p>
    </div>
    <div class="clearfix">
        <p>活动展示：</p>
        <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
            <p style="text-align: center;"><img alt="" class="img" src="${article.image}" height="280px" width="300px">
            </p>
        </c:forEach>
    </div>
    <div>
        <p class="nrjj"><span>活动寄语：</span><span>${article.eventMessage}</span></p>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>