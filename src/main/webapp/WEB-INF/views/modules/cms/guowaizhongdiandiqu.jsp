<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@page import="com.thinkgem.jeesite.common.utils.ChineseEnglishReTo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>国外重点地区</title>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/index.css"/>

    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/gnzddq.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/gwzddq.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css"/>

    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
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
        <li>国外重点地区</li>
    </ol>
</div>
<div class="container" style=" width: 76.38%;border: 1px solid #cccccc;margin: 20px auto;padding: 15px;">
    <div class="row">
        <div class="col-xs-9 gn-content-left">
            <h1>一带一路国外重点地区</h1>
            <ul class="pull-left">
                <!-- 国外地区开始************************************** -->
                <c:forEach items="${cmsForeignAreaList}" var="vo" varStatus="stu">
                    <li><a href="#" onclick="change(${stu.count-1},'${vo.id}')">${vo.areaname}</a><span></span></li>
                </c:forEach>
            </ul>
            <!-- 国外国家开始 -->
            <ul class="gn-content-left1" style="display: block" id="foreignArea">
                <c:forEach items="${foreignCountrys}" var="vo" begin="0" end="9">
                    <li>
                        <!-- <p>
                            <a href=""></a>
                        </p> -->
                        <p><a href="${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=${vo.id}"
                              style="color: #979797;"><img src="${vo.content}"></a></p>
                        <p>
                            <a href="${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=${vo.id}">${vo.cmsCountryName}</a>
                        <p>
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
                    <img src="${ctxStatic}/dist/images/xljt.png" class="dp-img">
                    <ul class="dp-ul ul1">
                        <li>无锡</li>
                        <li>厦门</li>
                        <li>上海</li>
                    </ul>
                </div>
                <span>信息种类</span>
                <div class="dp">
                    <input type="text" class="dp-inp" id="inp2" value="大型项目信息"/>
                    <img src="${ctxStatic}/dist/images/xljt.png" class="dp-img">
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
    <div class="row" id="cmsOneForeignCountry">
        <div class="col-xs-12" style="padding: 0;">
            <div class="media" id="cmsOneForeignCountry">
                <div class="media-left media-middle">
                    <a href="${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid='${cmsOneForeignCountry.id}'">
                        <img class="media-object" src="${cmsOneForeignCountry.content}" alt="..."
                             style='width: 150px;height: 120px'>
                    </a>
                </div>
                <div class="media-left " style="width: 15%;padding-top:20px;">
                    <h2>${cmsOneForeignCountry.cmsCountryName}</h2>
                    <c:set var="prop" scope="request">${cmsOneForeignCountry.cmsCountryName}</c:set>
                    <span>
                    <%
                        String prop = (String) request.getAttribute("prop");
                        out.print(ChineseEnglishReTo.selectEnName(prop).toUpperCase());

                    %>
                              
                    </span>
                </div>
                <div class="media-body">
                    <p class="media-heading">
                        ${cmsOneForeignCountry.cmsCountryBasic}
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
                <li class="li"><a class="current" id="gn-bot-top-a1" style="border-left: 0;">资讯</a></li>
                <li class="li"><a id="gn-bot-top-a2">项目</a></li>
                <li class="li"><a id="gn-bot-top-a3">商务</a></li>
                <li class="li"><a id="gn-bot-top-a4">投融资</a></li>
                <li class="li"><a id="gn-bot-top-a5">政策</a></li>
                <li class="li"><a id="gn-bot-top-a6">人文</a></li>
                <li class="li"><a id="gn-bot-top-a7">报告</a></li>
                <li class="li"><a id="gn-bot-top-a8" style="border-right: 0;">机构</a></li>
            </ul>


            <div id="div1"><!-- 国外资讯 -->
                <ul class="gn-bot-content" id="itemContainer1">
                    <c:forEach items="${fnc:getArticleList(site.id, 63, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder1"></div>
            </div>


            <div id="div2">
                <ul class="gn-bot-content" id="itemContainer2"><!-- 国外项目 -->
                    <c:forEach items="${fnc:getArticleList(site.id, 62, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li>
                            <a href="${ctx}/cms/cmsMegaProjectIntroduce1/selectCurrentMegaProjectDetail?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.beginDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder2"></div>
            </div>


            <div id="div3"><!-- 国外商务信息 -->
                <ul class="gn-bot-content" id="itemContainer3">
                    <c:forEach items="${requirementInformationList}" var="vo">
                        <li><a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${vo.id}"
                               class="c_active">${vo.productName}</a><span><fmt:formatDate value="${vo.createDate}"
                                                                                           pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder3" id="div3"></div>
            </div>

            <div id="div4"><!-- 投融资开始 -->
                <ul class="gn-bot-content" id="itemContainer4">
                    <c:forEach items="${fnc:getArticleList(site.id, 64, 8, '')}" var="article">
                        <li><a href="${ctx }/cms/cmsReport/selectCurrentInvestmentGuide?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span></li>
                    </c:forEach>
                </ul>
                <div class="holder4"></div>
            </div>

            <div id="div5"><!-- 国外政策开始 -->
                <ul class="gn-bot-content" id="itemContainer5">
                    <c:forEach items="${fnc:getArticleList(site.id,13, 10000, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${ctx }/cms/cmsReport/selectCurrentInvestmentGuide?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder5"></div>
            </div>

            <div id="div6"><!-- 国外人文开始  -->
                <ul class="gn-bot-content" id="itemContainer6">
                    <c:forEach items="${fnc:getArticleList(site.id,65, 10000, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${article.url}" style="color:${article.color}"
                               title="${article.title }">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>

                </ul>
                <div class="holder6"></div>
            </div>


            <div id="div7">
                <ul class="gn-bot-content" id="itemContainer7"><!-- 国外报告开始 -->
                    <c:forEach items="${fnc:getArticleList(site.id, 61, 8, '')}" var="article" varStatus="status"
                               begin="0" end="9">
                        <li><a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="holder7"></div>
            </div>

            <div id="div8">
                <ul class="gn-bot-content" id="itemContainer8"><!-- 国外机构开始 -->
                    <c:forEach items="${fnc:getArticleList(site.id, '15ade0e3bde44befb398a07f11314b3f',8, '')}"
                               var="article" varStatus="status" begin="0" end="9">
                        <li>
                            <a href="${frontPath }/view-15ade0e3bde44befb398a07f11314b3f-${fns:abbr(article.id,64)}.html">${fns:abbr(article.title,40)}</a>
                            <span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></span>
                        </li>
                    </c:forEach>

                </ul>
                <div class="holder8"></div>
            </div>

        </div>
        <div class="col-xs-4 kuangjia gn-bot-right">
            <h1 class="h1" style="width: 120px;">报告推荐</h1>
            <div style="margin-top: 20px; background-color:#f7fbff;">
                <c:forEach items="${fnc:getArticleList(site.id, 61, 8, '')}" var="article" varStatus="stu" begin="0"
                           end="9">
                    <c:choose>
                        <c:when test="${stu.count==1}">
                            <p style="margin-top: 20px;">
                                <a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                   style="color:${article.color}">${fns:abbr(article.title,40)}</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p>
                                <a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                   style="color:${article.color}">${fns:abbr(article.title,40)}</a>
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
<script src="${ctxStatic}/dist/js/CountrynameReverse.js"></script>
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
                "cid": cid,//查询
            },
            url: "${ctx}/cms/cmsForeignCountry/selectCountrysInfo",
            success: function (data) {
                $("#foreignArea").html("");//清除之前国家
                $.each(data.foreignCountrys, function (index, value) {
                    //添加区域国家
                    $("#foreignArea").append("<li><p><a href='${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=" + value.id + "' style='color: #979797;'><img src=" + value.content + "></a></p>" +
                        "<a href='${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=" + value.id + "'>" + value.cmsCountryName + "</a></li>");
                });
                //为一个国家信息赋值cmsOneForeignCountry
                var zhi = reverton(data.cmsOneForeignCountry.cmsCountryName).toUpperCase();
                $("#cmsOneForeignCountry").html("");
                $("#cmsOneForeignCountry").append("<div class='media-left media-middle'><a href='${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=" + data.cmsOneForeignCountry.id + "'>" +
                    "<img class='media-object' src=" + data.cmsOneForeignCountry.content + " alt='...' style='width: 150px;height: 120px'></a>" +
                    "</div><div class='media-left' style='width: 15%;padding-top:20px;'>" +
                    "<h2>" + data.cmsOneForeignCountry.cmsCountryName + "</h2><span>" + zhi + "</span></div><div class='media-body'><p class='media-heading'>" + data.cmsOneForeignCountry.cmsCountryBasic + "</p></div>")

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
            $(this).css("color", "#bf1a20");
            $(this).parent().siblings().find("a").css("color", "#333333");
            var n = $(this).parent().index();
            $(".gn-bot-content").eq(n).show();
            $(".gn-bot-content").eq(n).siblings(".gn-bot-content").hide();
        });
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


    function reverton(str) {
        var countryArray = new Array();
        var zhi = "";
        countryArray = [['美国 ', 'USA'], ['俄罗斯', 'Russia'], ['泰国', 'Thailand'], ['老挝', 'Laos'], ['文莱', 'Brunei'], ['东帝汶', 'Timor Leste'], ['斯里兰卡', 'Sri Lanka'], ['阿富汗', 'Afghanistan'], ['尼泊尔', 'Nepal'], ['马尔代夫', 'Maldives'], ['不丹', 'Bhutan'], ['沙特阿拉伯', 'Saudi Arabia'], ['阿联酋', 'The United Arab Emirates'], ['阿曼', 'Oman'], ['伊朗', 'Iran'], ['以色列', 'Israel'], ['埃及', 'Egypt'], ['科威特', 'Kuwait'], ['伊拉克', 'Iraq'], ['卡塔尔', 'Qatar'], ['约旦', 'Jordan'], ['黎巴嫩', 'Lebanon'], ['巴林', 'Bahrain'], ['也门共和国', 'Republic of Yemen'], ['叙利亚', 'Syria'], ['英国', 'UK'], ['加拿大', 'CANADA'], ['澳大利亚', 'AUSTRALIA'], ['日本', 'JAPAN'], ['韩国', 'KOREA'], ['马来西亚', 'MALAYSIA'], ['南非', 'SOUTH AFRICA'], ['法国', 'FRANCE'], ['德国', 'GERMANY'], ['爱尔兰', 'Ireland'], ['荷兰', 'Netherlands'], ['比利时', 'Belgium'], ['卢森堡', 'Luxembourg'], ['摩纳哥', 'Monaco'], ['波兰', 'Poland'], ['瑞士', 'Switzerland'], ['奥地利', 'Austria'], ['匈牙利', 'Hungary'], ['葡萄牙', 'Portugal'], ['西班牙', 'Spain'], ['希腊', 'Greece'], ['意大利', 'Italy'], ['马耳他', 'Malta'], ['丹麦', 'Denmark'], ['挪威', 'Norway'], ['冰岛', 'Iceland'], ['芬兰', 'Finland'], ['瑞典', 'Sweden'], ['意大利', 'ITALY'], ['荷兰', 'THENETHERLANDS'], ['西班牙', 'SPAIN'], ['比利时', 'BELGIUM'], ['奥地利', 'AUSTRIA'], ['希腊', 'GREECE'], ['葡萄牙', 'PORTUGAL'], ['匈牙利', 'PORTUGAL'], ['瑞典', 'SWEDEN'], ['瑞士', 'SWITZERLAND'], ['挪威', 'NORWAY'], ['丹麦', 'DENMARK'], ['芬兰', 'FINLAND'], ['冰岛', 'ICELAND'], ['捷克', 'CZECH REPUBLIC'], ['斯洛伐克', 'SLOVAKIA'], ['波兰', 'POLAND'], ['罗马尼亚', 'Romania'], ['保加利亚', 'Bulgaria'], ['克罗地亚', 'Croatia'], ['阿尔巴尼亚', 'Albania'], ['塞尔维亚', 'Serbia'], ['马其顿', 'Macedonia'], ['波黑', 'Bosnia and Herzegovina'], ['黑山', 'Montenegro'], ['哈萨克斯坦', 'Kazakhstan'], ['乌兹别克斯坦', 'Uzbekistan'], ['土库曼斯坦', 'Turkmenistan'], ['吉尔吉斯斯坦', 'Kyrgyzstan'], ['塔吉克斯坦', 'Tajikistan'], ['乌克兰', 'Ukraine'], ['白俄罗斯', 'Belarus'], ['克鲁吉亚', 'Georgia'], ['阿塞拜疆', 'Azerbaijan'], ['亚美尼亚', 'Armenia'], ['摩尔多瓦', 'Moldova'], ['斯洛文尼亚', 'SLOVENIA'], ['爱沙尼亚', 'ESTONIA'], ['立陶宛', 'LITHUANIA'], ['卢森堡', 'LUXEMBURG'], ['马尔他', 'MALTA'], ['拉脱维亚', 'LATVIA'], ['孟加拉国', ' Bangladesh'], ['缅甸', 'Burma'], ['柬埔寨', ' Cambodia'], ['印度', 'India'], ['印度尼西亚', 'Indonesia'], ['马来西亚', 'Malaysia '], ['蒙古', 'Mongolia'], ['尼泊尔', 'Nepal'], ['朝鲜', 'North Korea'], ['巴基斯坦', 'Pakistan'], ['新加坡', 'Singapore'], ['泰国', 'Thailand'], ['土耳其', 'Turkey'], ['越南', 'Vietnam'], ['巴勒斯坦', 'Palestine'], ['阿根廷', 'Argentina'], ['巴西', 'Brazil'], ['智利', 'Chile'], ['哥伦比亚', 'Colombia'], ['古巴', 'Cuba'], ['牙买加', 'Jamaica'], ['墨西哥', 'Mexico'], ['巴拿马', 'Panama'], ['秘鲁', 'Peru'], ['乌拉圭', 'Uruguay'], ['委内瑞拉', 'Venezuela']];
        for (var i = 0; i < countryArray.length; i++) {
            countryArray_1 = new Array();
            countryArray_1 = countryArray[i];
            for (var j = 0; j < countryArray_1.length - 1; j++) {
                if (countryArray_1[j] == str) {
                    zhi = countryArray_1[j + 1];
                    return zhi;
                }
            }
        }
        return zhi;

    };
</script>
</body>
</html>