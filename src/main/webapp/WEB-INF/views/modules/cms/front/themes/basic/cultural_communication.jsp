<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>信息产品</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/ydyl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx }/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li class="active"><a href="#">文化交流</a></li>
    </ol>
</div>
<!--信息产品-->
<div class="index-xinyong bgColor">
    <div class="pic_ttbox ">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>
    <div class="indxe-xinyong-top mgtop_30">
        <div class="index-xinyong-top-left pull-left" style="width:15%">
            <h3>${cultural_category }</h3>
        </div>
        <div class="index-xinyong-top-right pull-left" style="width:85%">
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="table-bot">
        <table class="table table_xxcp table-hover">
            <thead>
            <tr>
                <th class="product">信息名称</th>
                <th>发布时间</th>
            </tr>
            </thead>
            <tbody id="itemContainer">
            <tr class="kheight"></tr>
            <c:forEach items="${fnc:getArticleList(site.id,66, 1000000, '')}" var="article" varStatus="status">
                <c:if test="${article.statusCode eq '5'}">
                    <tr>
                        <td class="product_text info_list">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:65px;">
                                    <p class="xyjy-content-top-bot-content-p-1">
                                        <span class="pull-right"></span>
                                        <a href="${article.url}" style="color:${article.color}"
                                           title="${article.title }">
                                                ${fns:abbr(article.title,50)}
                                        </a>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${status.count%1==0 }">
                                <br/>
                            </c:if>
                        </td>
                        <td><span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="holder"></div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script>
    $(function () {
        $("div.holder").jPages({
            containerID: "itemContainer", //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 20, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 10, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    })
</script>

</html>