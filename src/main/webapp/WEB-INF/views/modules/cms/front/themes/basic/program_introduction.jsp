<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一带一路项目招标</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li class="active"><a href="#">一带一路大型项目简介</a></li>
    </ol>
</div>
<div class="contbox">
    <div class="pic_ttbox mgtop_30">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>

    <div class="xmzb_box mgtop_30 bgColor">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>项目招标</h3>
            </div>
            <div class="els_introduce_top-right pull-left"></div>
            <div class="clearfix"></div>
        </div>

        <div class="xyjy-content-top-bot" style="margin-left:60px">
            <div id="itemContainer1">
                <c:forEach items="${fnc:getArticleList(site.id, 62, 1000, '')}" var="article">
                    <c:if test="${article.statusCode eq '5'}">
                        <div>
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjyjt-content-top-bot-content-left pull-left"
                                     style="margin-top:30px;line-height:50px;">

                                    <ul>
                                        <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
                                            <li class="pull-left"><img alt="" src="${img}" height="180px" width="180px">
                                            </li>
                                        </c:forEach>
                                        <div class="clearfix"></div>
                                    </ul>
                                        <%-- <img src="${ctxStatic}/dist/images/xmxb_pic.jpg" alt=""> --%>
                                    <p align="center"><a
                                            href="${ctx}/cms/cmsMegaProjectIntroduce1/selectCurrentMegaProjectDetail?pid=${article.id}"
                                            style="color:${article.color}">${fns:abbr(article.title,30)}</a></p>
                                </div>
                            </div>

                            <div class="xyjyjt-content-top-bot-content-right pull-left"
                                 style="margin-top:50px; margin-left:40px;line-height:30px;">
                                <p>项目名称：<a
                                        href="${ctx}/cms/cmsMegaProjectIntroduce1/selectCurrentMegaProjectDetail?pid=${article.id}"
                                        style="color:${article.color}">${fns:abbr(article.title,62)}</a></p>
                                <p>项目时间：<fmt:formatDate value="${article.updateDate}"
                                                        pattern="yyyy-MM-dd"/></span></a></p>
                                <p>项目规模：<a href="${article.url}"
                                           style="color:${article.color}">${fns:abbr(article.projectScale,62)}</a></p>
                                <p>相关企业：<a href="${article.url}"
                                           style="color:${article.color}">${fns:abbr(article.relatedEnterprises,62)}</a>
                                </p>
                                <p class="pull-left" style="width: 70px;">项目简介：</p>
                                <p class="pull-right" style="width: 500px; margin-bottom: 20px;">
                                    <a href="${article.url}"
                                       style="color:${article.color}">${fns:abbr(article.description,200)}</a></p>
                            </div>


                            <div class="clearfix"></div>
                            <hr style="height:2px;border:none;border-bottom:1px dashed #cccccc; padding-bottom: 10px">
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="holder1"></div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/jPages.min.js"></script>
<script>
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id,
                first: '首页',
                last: '尾页',
                previous: '上页',
                next: '下页',
                perPage: 4,
                startPage: 1,
                startRange: 2,
                midRange: 3,
                endRange: 2,
                animation: 'wobble',
                keyBrowse: true,
                callback: function (pages, items) {
                    items.showing.find("img").trigger("turnPage");
                    items.oncoming.find("img").trigger("turnPage");
                }
            });
        };

        fenye("div.holder1", "itemContainer1");

    });

</script>
</body>
</html>