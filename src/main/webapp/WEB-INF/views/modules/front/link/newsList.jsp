<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/gywm.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }

        h3, h4, p, h5 {
            margin: 0
        }

        .breadcrumb {
            width: 76.3%;
            margin: 7px auto;
        }

        .gudgsj {
            font-size: 22px;
            border-bottom: 5px solid #eeeeee;
            padding-bottom: 8px
        }

        .companyProfile {
            margin-bottom: 50px
        }

        .companyProfile h3 {
            text-align: center;
            padding: 25px 0;
            font-size: 22px;
        }

        .companyProfile-box {
            margin-top: 50px
        }

        .companyProfile-box h4 {
            font-size: 20px;
            border-left: 10px solid #bf1a20;
            padding-left: 10px
        }

        .Introduction {
            margin-top: 20px;
            text-indent: 2em;
        }

        .companyProfile p {
            color: #666666;
            line-height: 20px
        }

        .zzjg {
            text-align: center;
            padding: 24px 0 12px;
            border-bottom: 1px solid #eeeeee;
        }

        .zzjg img {
            width: 90%;
        }

        .fzlc-list {
            padding: 30px 80px 30px 30px
        }

        .fzlc-list > li h5 {
            height: 20px;
            background: url("${ctxStatic}/dist/images/yq_03.jpg") no-repeat left center;
            padding-left: 28px;
            line-height: 20px
        }

        .fzlc-list > li p {
            font-size: 12px;
            padding: 8px 0 30px 20px;
            border-left: 2px solid #d25d62;
            margin-left: 8px
        }

        .fzlc-list > li:last-of-type p {
            border: none
        }

        .fzlc-list > li p span {
            display: block
        }
    </style>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        li {
            list-style: none;
        }

        #right-ht {
            background: transparent;
        }

        #msgLists li {
            position: relative;
            /*   height: 150px; */
            padding: 10px 0;
            border-bottom: 1px dotted #666;
            background: transparent;
            margin-top: 10px;
        }

        #msgLists li img {
            width: 230px;
            height: 130px;
            border: 10px solid #eee;
            background: transparent;
            margin-right: 30px;
        }

        .msgLists-right {
            width: 70%;
            height: 130px;
            background: transparent;
        }

        .msgLists-right h4 {
            font-size: 18px;
            cursor: pointer;
            font-weight: 600;
            font-family: "Microsoft YaHei";
            width: 90%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: left;
            margin: 3px 0 10px;
        }

        .msgLists-right h4 a {
            color: #333;
        }

        .msgLists-right p {
            font-size: 16px;
            color: #666;
            line-height: 24px;
        }

        .msgLists-right p a {
            font-size: 14px;
            color: #999;
            cursor: pointer;
            display: block;
            margin-top: 5px;
        }

        .msgLists-right a:hover {
            color: red;
        }


    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/companyProfile">走进大公数据</a></li>
        <li class="lg-active">新闻动态</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">走进大公数据</a></p>
        <ul class="zhzl">
            <li data-i="0" class="zhzllevel1">
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/companyProfile">公司简介</a></li>
                    <li><a href="${ctx}/cms/article/cydiaProfile">丝路互金网简介</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/newsList">新闻动态</a></li>
                    <li><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
                    <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <h3 class="gudgsj">新闻动态</h3>
        <div style='height:30px;'></div>
        <div class="companyProfile">

            <div>
                <div id="itemContainer1">
                    <div id="right-ht">
                        <ul id="msgLists">
                            <c:forEach items="${newsList }" var="article">
                                <li class="clearfix">
                                    <c:if test="${ not empty article.image }">
                                        <img class="pull-left" alt="" src="${article.image }">
                                    </c:if>
                                    <div class="msgLists-right pull-left">
                                        <h4>
                                            <a href="${ctx}/cms/article/newsListDetails?id=${article.id }">${fns:abbr(article.title,60)}</a>
                                        </h4>
                                        <p>${fns:abbr(article.description,130)}<a style="display: inline;"
                                                                                  href="${ctx}/cms/article/newsListDetails?id=${article.id }">[
                                            阅读全文 ]</a></p>
                                        <span href="###"
                                              style="width:100%;text-align: left;color:#999999;cursor: default;">
					<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="holder"></div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <div class="clearfix"></div>

</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script>
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id,//显示数据所在的块的ID
                first: '首页',
                last: '尾页',
                previous: '上页',
                next: '下页',
                perPage: 10,//每页显示数据为多少行
                startPage: 1,//起始页
                startRange: 2,//开始页码为2个
                midRange: 6,//最多显示几个页码页码,其余用..代替e
                endRange: 10,//结束页码为2个
                keyBrowse: true,
                delay: 20,//分页时动画持续时间，0表示无动画,
                minHeight: false,
                callback: function (pages, items) {
                    items.showing.find("img").trigger("turnPage");
                    items.oncoming.find("img").trigger("turnPage");
                }
            });
        };
        fenye("div.holder", "msgLists");
    });

</script>
</body>
</html>