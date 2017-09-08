<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var te = $("#title").html();
            $("#pro").html(te);
        })
        $(document).ready(function () {
            if ("${category.allowComment}" == "1" && "${article.articleData.allowComment}" == "1") {
                $("#comment").show();
                page(1);
            }
        });
        function page(n, s) {
            $.get("${ctx}/comment", {
                theme: '${site.theme}',
                'category.id': '${category.id}',
                contentId: '${article.id}',
                title: '${article.title}',
                pageNo: n,
                pageSize: s,
                date: new Date().getTime()
            }, function (data) {
                $("#comment").html(data);
            });
        }
    </script>
    <style>
        .zh {
            border-bottom: 1px solid #eee;
        }

        .prediv pre {
            white-space: pre-wrap; /* CSS-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            background-color: #fff;
            border: 0;
            border-radius: 0;
        }

        .xyjyjt-content-mbx .breadcrumb li:not(:last-of-type) {
            color: #909090;
        }

        .xyjyjt-content {
            width: 1100px;
            margin: 0 auto;
            padding: 30px;

        }

        .xyjyjt-content-mbx .breadcrumb li:first-of-type, .xyjyjt-content-mbx .breadcrumb li:last-of-type {
            color: #373737;
            font-weight: bold;
        }

        .jyjtList {
            margin: 30px 0 10px;
            line-height: 30px;
            padding-left: 176px;
        }

        .prediv {
            line-height: 22px;
        }

        .xwdt-bt {
            border-bottom: 1px solid #333;
        }

        .xwdt-bt h3 {
            text-align: center;
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
        <li><a href="${ctx}/cms/article/companyProfile">走进大公数据</a></li>
        <li><a href="${ctx}/cms/article/newsList">新闻动态</a></li>
        <li id="pro" class="lg-active">${fns:abbr(articleDetails.title,40)}</li>
    </ol>
</div>
<div class="row">
    <div class="xyjyjt-content">
        <div class="xwdt-bt">
            <h3>${articleDetails.title}</h3>
            <ul class="jyjtList clearfix">
                <li class="pull-left" style="margin-left:40px">发布者：${articleDetails.speaker}</li>
                <li class="pull-left" style="margin-left:40px">来源：${articleDetails.articleData.copyfrom}</li>
                <li class="pull-left" style="margin-left:40px">点击数：${articleDetails.hits}</li>
                <li class="pull-left" style="margin-left:50px">发布时间：<fmt:formatDate
                        value="${articleDetails.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;
                </li>
            </ul>
        </div>
        <c:if test="${not empty articleDetails.image }">
            <div style="text-align: center;padding:50px 0">
                <img src="${articleDetails.image}" style="width:700px; height:500px;" alt="">
            </div>
        </c:if>

        <div class="prediv"
             style="width:100%;word-wrap: break-word;padding:0 50px">${articleDetails.articleData.content}</div>

    </div>


</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>