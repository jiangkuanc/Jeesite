<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.thinkgem.jeesite.common.utils.ChineseReverseToPinyin" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>国内重点地区</title>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/gnzddq.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css"/>


    <!--<script type="text/javascript" src="dist/js/ydyl.js"></script>-->
    <!--<script type="text/javascript" src="dist/js/index-nav.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath }">首页 </a></li>
        <li><a href="${ctx }/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li>国内重点地区</li>
    </ol>
</div>
<div class="container" style=" width: 76.38%;border: 1px solid #cccccc;margin: 20px auto;padding: 15px;">
    <div class="row">
        <div class="col-xs-9 gn-content-left">
            <h1>一带一路国内重点地区</h1>
            <ul class="pull-left">
                <c:forEach items="${cmsChinaAreaList}" var="vo" varStatus="stus">
                    <c:choose>
                        <c:when test="${stus.count-1==0}">
                            <li><a href="#" onclick="change(${stus.count-1},'${vo.id}')"
                                   style="color:#bf1c21;">${vo.areaname}</a><span style="visibility: visible"></span>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#" onclick="change(${stus.count-1},'${vo.id}')">${vo.areaname}</a><span></span>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>

            <!-- 区域省市开始 -->

            <ul class="gn-content-left1" style="display: block" id="chinaAreaqu">
                <c:forEach items="${cmsChinaAreaCityList}" var="vo" begin="0" end="9">
                    <li>
                        <p>
                            <a href="${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=${vo.id}"><img
                                    src="${vo.content}"/></a>
                        </p>
                        <p><a href="${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=${vo.id}"
                              style="color: #979797;">${vo.cmsChinaAreaCityName}</a></p>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-xs-3 gn-content-right">
            <div style="margin: 0 auto;width:160px;">
                <h1>快速搜索</h1>
                <span>沿线国家或城市</span>
                <div class="dp">
                    <input type="text" class="dp-inp" id="inp1" value="无锡"/>
                    <img src="${ctxStatic }/dist/images/xljt.png" class="dp-img">
                    <ul class="dp-ul ul1">
                        <li>无锡</li>
                        <li>厦门</li>
                        <li>上海</li>
                    </ul>
                </div>
                <span>信息种类</span>
                <div class="dp">
                    <input type="text" class="dp-inp" id="inp2" value="大型项目信息"/>
                    <img src="${ctxStatic }/dist/images/xljt.png" class="dp-img">
                    <ul class="dp-ul ul2">
                        <li>大型项目信息</li>
                        <li>大型项目</li>
                        <li>项目信息</li>
                    </ul>
                </div>
                <span>输入关键字</span>
                <input type="text" style="margin: 13px auto; width: 170px;height: 25px">
            </div>
            <button type="button">确定</button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding: 0;">
            <div class="media" id="cmsOneChinaCountry">
                <div class="media-left media-middle">
                    <a href="${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=${cmsChinaAreaCityOne.id}">
                        <img class="media-object" src="${cmsChinaAreaCityOne.content}" alt="..."
                             style="width: 150px;height: 120px">
                    </a>
                </div>
                <div class="media-left " style="width: 10%;padding-top:20px;">
                    <h2>${cmsChinaAreaCityOne.cmsChinaAreaCityName}</h2>
                    <c:set var="prop" scope="request">${cmsChinaAreaCityOne.cmsChinaAreaCityName}</c:set>
                    <span><% String prop = (String) request.getAttribute("prop");
                        out.print(ChineseReverseToPinyin.getPinYin(prop).trim());
                    %></span>
                </div>
                <div class="media-body">
                    <p class="media-heading">
                        ${cmsChinaAreaCityOne.cmsChinaAreaCityBasic}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" style=" width: 76.38%;">
    <div class="row gn-bot">
        <div class="col-xs-8" style="margin: 60px auto -5px;">
            <ul class="gn-bot-top">
                <li class="li"><a class="current" style="border-left: 0;" id="gn-bot-top-a1">资讯</a></li>
                <li class="li"><a id="gn-bot-top-a2">项目</a></li>
                <li class="li"><a id="gn-bot-top-a3">商务</a></li>
                <li class="li"><a id="gn-bot-top-a4">投融资</a></li>
                <li class="li"><a id="gn-bot-top-a5">政策</a></li>
                <li class="li"><a id="gn-bot-top-a6">人文</a></li>
                <li class="li"><a id="gn-bot-top-a7">报告</a></li>
                <li class="li"><a style="border-right: 0;" id="gn-bot-top-a8">机构</a></li>
            </ul>
            <div id="div1"><!-- 国内资讯开始 -->
                <ul class="gn-bot-content" style="display: block;" id="itemContainer1">
                    <c:forEach items="${fnc:getArticleList(site.id, 63, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder1"></div>
            </div>

            <div id="div2"><!-- 国内项目开始 -->
                <ul class="gn-bot-content" id="itemContainer2">
                    <c:forEach items="${fnc:getArticleList(site.id, 62, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li>
                            <a href="${ctx}/cms/cmsMegaProjectIntroduce1/selectCurrentMegaProjectDetail?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.beginDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder2"></div>
            </div>

            <div id="div3">
                <ul class="gn-bot-content" id="itemContainer3"><!-- 商务 -->
                    <c:forEach items="${requirementInformationList}" var="vo">
                        <li><a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${vo.id}"
                               class="c_active">${fns:abbr(vo.productName,65)}</a><span><fmt:formatDate
                                value="${vo.createDate}" pattern="yyyy-MM-dd"/></span></li>
                    </c:forEach>
                </ul>
                <div class="holder3"></div>
            </div>
            <div id="div4"><!-- 投融资 -->
                <ul class="gn-bot-content" id="itemContainer4">
                    <c:forEach items="${fnc:getArticleList(site.id, 64, 8, '')}" var="article">
                        <li><a href="${ctx }/cms/cmsReport/selectCurrentInvestmentGuide?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span></li>
                    </c:forEach>
                </ul>
                <div class="holder4"></div>
            </div>

            <div id="div5"><!-- 国内政策开始 -->
                <ul class="gn-bot-content" id="itemContainer5">
                    <c:forEach items="${fnc:getArticleList(site.id,14, 10000, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${article.url}" style="color:${article.color}"
                               title="${article.title }">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder5"></div>
            </div>

            <div id="div6"><!-- 国内人文开始  -->
                <ul class="gn-bot-content" id="itemContainer6">
                    <c:forEach items="${fnc:getArticleList(site.id,65, 10000, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${article.url}" style="color:${article.color}"
                               title="${article.title }">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder6"></div>
            </div>

            <div id="div7"><!-- 国内报告开始 -->
                <ul class="gn-bot-content" id="itemContainer7">
                    <c:forEach items="${fnc:getArticleList(site.id, 61, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder7"></div>
            </div>

            <div id="div8">
                <ul class="gn-bot-content" id="itemContainer8">
                    <c:forEach items="${fnc:getArticleList(site.id, '15ade0e3bde44befb398a07f11314b3f',8, '')}"
                               var="article" varStatus="status" begin="0" end="9">
                        <li>
                            <a href="/jeesite/f/view-15ade0e3bde44befb398a07f11314b3f-${fns:abbr(article.id,64)}.html">${fns:abbr(article.title,65)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder8"></div>
            </div>
        </div>
        <div class="col-xs-4 kuangjia gn-bot-right">
            <h1 class="h1" style="width: 120px;">报告推荐</h1>
            <div style="margin-top: 20px;  background-color:#f7fbff;">
                <c:forEach items="${fnc:getArticleList(site.id, 61, 8, '')}" var="article" varStatus="stu" begin="0"
                           end="9">
                    <c:choose>
                        <c:when test="${stu.count==1}">
                            <p style="margin-top: 20px;">
                                <a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                   style="color:${article.color}">${fns:abbr(article.title,50)}</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p>
                                <a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                   style="color:${article.color}">${fns:abbr(article.title,50)}</a>
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script src="${ctxStatic }/dist/js/jquery-1.7.2.min.js"></script>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/dist/js/jPages.js"></script>
<script src="${ctxStatic}/dist/js/chineseToPinYing.js"></script>
<script type="text/javascript">

    function fenye(content, id) {
        $(content).jPages({
            containerID: id,
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 5,
            startPage: 1,
            startRange: 2,
            midRange: 3,
            endRange: 2,
            animation: 'wobble',
            keyBrowse: true,
            callback: function (pages, items) {
                /* lazy load current images */
                items.showing.find("img").trigger("turnPage");
                /* lazy load next page images */
                items.oncoming.find("img").trigger("turnPage");
            }
        });
    }


    function change(i, cid) {

//        $(".gn-content-left .pull-left li a").css("color","#bf1a20");
        $(this).next().css("visibility", "visibile");
        var mm = $(".gn-content-left1").get(i);
        $(".gn-content-left .pull-left li").eq(i).find("a").css("color", "#bf1a20");
        $(".gn-content-left .pull-left li").eq(i).find("span").css("visibility", "visible");
        $(".gn-content-left .pull-left li").eq(i).siblings().find("a").css("color", "#333333");
        $(".gn-content-left .pull-left li").eq(i).siblings().find("span").css("visibility", "hidden");
        $(mm).show();
        $(mm).siblings("ul.gn-content-left1").hide();


        $.ajax({
            type: 'post',
            data: {
                "aid": cid,//查询
            },
            url: "${ctx}/cmsca/cmsChinaAreaCity/findTheCitysAccAid",
            success: function (data) {
                $("#chinaAreaqu").html("");//清除之前地区
                $("#cmsOneChinaCountry").html("");
                $.each(data.cmsChinaAreaCityList, function (index, value) {
                    //添加区域国家
                    $("#chinaAreaqu").append("<li><p><a href='${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=" + value.id + "'><img src=" + value.content + "/></a></p><a href='' style='color: #979797;'>" + value.cmsChinaAreaCityName + "</a></li>")
                });
                //为一个国家信息赋值cmsOneForeignCountry
                var city = pinyin.getFullChars(data.cmsOneChinaAreaCity.cmsChinaAreaCityName).toUpperCase();
                $("#cmsOneChinaCountry").append("<div class='media-left media-middle'><a href='${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=" + data.cmsOneChinaAreaCity.id + "'><img class='media-object' src=" + data.cmsOneChinaAreaCity.content + " style='width: 150px;height: 120px'>" +
                    "</a></div><div class='media-left' style='width: 10%;padding-top:20px;'><h2>" + data.cmsOneChinaAreaCity.cmsChinaAreaCityName + "</h2><span>" + city + "</span>" +
                    "</div><div class='media-body'><p class='media-heading'>" + data.cmsOneChinaAreaCity.cmsChinaAreaCityBasic + "</p></div>");
            }
        });
    }


    $(function () {
        fenye("div.holder1", "itemContainer1");
        fenye("div.holder2", "itemContainer2");
        fenye("div.holder3", "itemContainer3");
        fenye("div.holder4", "itemContainer4");
        fenye("div.holder5", "itemContainer5");
        fenye("div.holder6", "itemContainer6");
        fenye("div.holder7", "itemContainer7");
        fenye("div.holder8", "itemContainer8");


        $("#div2").css("display", "none");
        $("#div3").css("display", "none");
        $("#div4").css("display", "none");
        $("#div5").css("display", "none");
        $("#div6").css("display", "none");
        $("#div7").css("display", "none");
        $("#div8").css("display", "none");


        $("#gn-bot-top-a1").click(function () {
            $("#div1").css("display", "block");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
        });

        $("#gn-bot-top-a2").click(function () {
            $("#div2").css("display", "block");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
        });

        $("#gn-bot-top-a3").click(function () {
            $("#div3").css("display", "block");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
        });

        $("#gn-bot-top-a4").click(function () {
            $("#div4").css("display", "block");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
        });

        $("#gn-bot-top-a5").click(function () {
            $("#div5").css("display", "block");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
        });

        $("#gn-bot-top-a6").click(function () {
            $("#div6").css("display", "block");
            $("#div7").css("display", "none");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
        });

        $("#gn-bot-top-a7").click(function () {
            $("#div7").css("display", "block");
            $("#div8").css("display", "none");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
        });

        $("#gn-bot-top-a8").click(function () {
            $("#div8").css("display", "block");
            $("#div1").css("display", "none");
            $("#div2").css("display", "none");
            $("#div3").css("display", "none");
            $("#div4").css("display", "none");
            $("#div5").css("display", "none");
            $("#div6").css("display", "none");
            $("#div7").css("display", "none");
        });

    });


    $(function () {
        $(".gn-bot-top li a").click(function () {
            $(this).addClass('current').parent().siblings().find("a").removeClass('current');
            var n = $(this).parent().index();
            $(".gn-bot-content").eq(n).show();
            $(".gn-bot-content").eq(n).siblings(".gn-bot-content").hide();
        });
//        $(".gn-bot-top li a").mouseleave(function () {
//            var n=$(this).parent().index();
//            $(".gn-bot-content").eq(n).show();
//            $(".gn-bot-content").eq(n).siblings(".gn-bot-content").hide();
//        });

        $(".dp-inp").click(function () {
            $(this).siblings(".dp-ul").toggle();
        });
        $(".ul1 li").click(function () {
            $(this).parent().hide();
            var inp = document.getElementById("inp1");
            inp.value = $(this).text();
        });
        $(".ul2 li").click(function () {
            $(this).parent().hide();
            var inp = document.getElementById("inp2");
            inp.value = $(this).text();
        });

    });


</script>
</body>
</html>