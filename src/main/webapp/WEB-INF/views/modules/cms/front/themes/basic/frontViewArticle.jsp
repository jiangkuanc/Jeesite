<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/xyjy.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
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
        .breadcrumb li:first-child:after {
            /* padding:0px; */
            color: #ccc;
            content: ">"
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
        }

        .xyjyjt-content-mbx .breadcrumb li:first-of-type, .xyjyjt-content-mbx .breadcrumb li:last-of-type {
            color: #373737;
            font-weight: bold;
        }

    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="row">
    <div class="xyjyjt-content-mbx" style="float:left">
        <ol class="breadcrumb">
            <cms:frontCurrentPosition category="${category}"/>
        </ol>

    </div>

    <div class="xyjyjt-content">
        <div class="xyjyjt-content-top">

            <h2 style="color:#555555;font-size:20px;text-align:center;padding-bottom:5px;padding-top:30px;margin:25px 0;"> ${category.name }</h2>
            <div style="border-bottom:1px solid red; text-align:center;padding:5px;margin:25px 0;">
                发布者：${article.user.name} &nbsp; 点击数：${article.hits} &nbsp; 发布时间：<fmt:formatDate
                    value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp; 更新时间：<fmt:formatDate
                    value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <c:if test="${not empty article.description}">
                <div>摘要：${article.description}</div>
            </c:if>
            <span class="clearfix"></span>
        </div>
        <h4 style="color:#000;font-size:16px;text-align:center;padding-bottom:5px;padding-top:0px;margin:25px 0;">${article.title}</h4>
        <div class="prediv" style="width:100%;word-wrap: break-word;">${article.articleData.content}</div>
    </div>


</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>