<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一带一路</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="contbox">
    <div class="search_cont clearfix">
        <img src="${ctxStatic}/dist/images/ydyl_tt_1.jpg" alt="" class="ttpic pull-left">
        <ul class="search_box pull-left">
            <li class="country_search">
                <div class="clearfix">
                    <s class="line fl"></s>
                    <h3 class="country_search fl">国别搜索</h3>
                    <s class="line fl"></s>
                </div>
                <ul class="clearfix">
                    <!-- 前几个国外区域开始************************* -->
                    <c:forEach items="${cmsForeignAreaList}" var="vo" varStatus="stu" begin="0" end="4">
                        <c:choose>
                            <c:when test="${stu.count==1 || stu.count==2}">
                                <li class="fl region padding_7"><a
                                        href="${ctx}/cms/cmsForeignCountry/selectCountrysInfoAccClick?cid=${vo.id}">${vo.areaname}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="fl region padding_7 "><a
                                        href="${ctx}/cms/cmsForeignCountry/selectCountrysInfoAccClick?cid=${vo.id}">${vo.areaname}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 前几个国外国家开始 -->
                    <c:forEach items="${cmsForeignCountryList}" var="vo" varStatus="stu">
                        <li class="fl country"><a
                                href="${ctx}/cms/cmsForeignCountry/toForeignCountryetailPage?cid=${vo.id}">${vo.cmsCountryName}</a>
                        </li>
                    </c:forEach>
                    <li class="fl country more"><a href="${ctx}/cms/cmsForeignCountry/toForeignCountryShowPage">更多</a>
                    </li>
                </ul>
            </li>
            <li class="country_search">
                <div class="clearfix">
                    <s class="line fl"></s>
                    <h3 class="country_search fl">国内搜索</h3>
                    <s class="line fl"></s>
                </div>
                <ul class="clearfix">
                    <c:forEach items="${cmsChinaAreaListlist}" var="vo" begin="0" end="5">
                        <li class="fl region padding_11"><a
                                href="${ctx}/cmsca/cmsChinaAreaCity/findTheCitysAccClick?aid=${vo.id}">${vo.areaname}</a>
                        </li>
                    </c:forEach>

                    <!-- <li class="fl region padding_11 "><a href="javascript:">华南地区</a></li>
                    <li class="fl region padding_11 "><a href="javascript:">华北地区</a></li>
                    <li class="fl region padding_11 "><a href="javascript:">华中地区</a></li>
                    <li class="fl region padding_11 "><a href="javascript:">西南地区</a></li>
                    <li class="fl region padding_11 "><a href="javascript:">东北地区</a></li> -->
                    <c:forEach items="${cmsChinaAreaCiNames}" var="vo">
                        <li class="fl country"><a
                                href="${ctx}/cmsca/cmsChinaAreaCity/seletCtityInfoAccCid?cid=${vo.id}">${vo.cmsChinaAreaCityName}</a>
                        </li>
                    </c:forEach>
                    <!--  <li class="fl country"><a href="javascript:">山东</a></li>
                     <li class="fl country"><a href="javascript:">越南</a></li>
                     <li class="fl country"><a href="javascript:">马来西亚</a></li>
                     <li class="fl country"><a href="javascript:">新加坡</a></li>
                     <li class="fl country"><a href="javascript:">柬埔寨</a></li>
                     <li class="fl country"><a href="javascript:">泰国</a></li>
                     <li class="fl country"><a href="javascript:">缅甸</a></li>
                     <li class="fl country"><a href="javascript:">老挝</a></li> -->
                    <li class="fl country more"><a href="${ctx}/cmsca/cmsChinaAreaCity/findAllChinaAreaNamesC">更多</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="clearfix mgtop_30">
        <div class="project_box project fl">
            <div class="els_introduce_top">
                <div class="els_introduce_top-left pull-left">
                    <h3>项目展示</h3>
                </div>
                <div class="els_introduce_top-right pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="project_info fl">
                <div class="text_box">
                    <div class="info_box clearfix">
                        <h4 class="fl">项目招标</h4>
                        <a href="${ctx}/cms/article/projectBiding" class="know_more fr">
                            <em>了解更多</em>
                            <span class="bg"></span>
                        </a>
                    </div>
                    <div class="line"></div>
                    <ul class="info_list project_list">
                        <div class="xyjy-content-top-bot">
                            <c:forEach items="${fnc:getArticleList(site.id, 60, 5, '')}" var="article"
                                       varStatus="status" begin="0" end="4">
                                <c:if test="${article.statusCode eq '5'}">
                                    <div class="xyjy-content-top-bot-content pull-left">
                                        <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                            <li><p class="xyjy-content-top-bot-content-p-1"><span
                                                    class="pull-right"></span><a href="${article.url}"
                                                                                 style="color:${article.color}"
                                                                                 title="${article.title }">${fns:abbr(article.title,25)}</a>
                                            </p>
                                            </li>
                                        </div>
                                    </div>
                                    <c:if test="${status.count%1==0 }">
                                        <br/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <div class="clearfix"></div>
                        </div>

                    </ul>
                </div>
            </div>
            <div class="project_info fl">
                <div class="text_box">
                    <div class="info_box clearfix">
                        <h4 class="fl">大型项目简介</h4>
                        <a href="${ctx}/cms/article/programIntroduction" class="know_more fr">
                            <em>了解更多</em>
                            <span class="bg"></span>
                        </a>
                    </div>
                    <div class="line"></div>
                    <ul class="info_list project_list">
                        <div class="xyjy-content-top-bot">
                            <c:forEach items="${fnc:getArticleList(site.id, 62, 5, '')}" var="article"
                                       varStatus="status" begin="0" end="4">
                                <div class="xyjy-content-top-bot-content pull-left">
                                    <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                        <c:if test="${article.statusCode eq '5'}">
                                            <li>
                                                <p class="xyjy-content-top-bot-content-p-1"><span
                                                        class="pull-right"></span><a href="${article.url}"
                                                                                     style="color:${article.color}"
                                                                                     title="${article.title }">${fns:abbr(article.title,25)}</a>
                                                </p>
                                            </li>
                                        </c:if>
                                    </div>
                                </div>
                                <c:if test="${status.count%1==0 }">
                                    <br/>
                                </c:if>
                            </c:forEach>
                            <div class="clearfix"></div>
                        </div>

                    </ul>
                </div>
            </div>
        </div>
        <div class="project_box project fr">
            <div class="els_introduce_top">
                <div class="els_introduce_top-left pull-left" style="width: 15%">
                    <h3>资讯</h3>
                </div>
                <div class="els_introduce_top-right pull-left" style="width: 85%"></div>
                <div class="clearfix"></div>
            </div>
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">新闻资讯</h4>
                    <a href="${ctx}/cms/article/newsInformation" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list project_list">
                    <c:forEach items="${fnc:getArticleList(site.id,63, 5, '')}" var="article">
                        <c:if test="${article.statusCode eq '5'}">
                            <li><p><span class="pull-right"></span><a href="${article.url}"
                                                                      style="color:${article.color}"
                                                                      title="${article.title }">${fns:abbr(article.title,60)}</a>
                            </p></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="project_box mgtop_30 report clearfix">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>报告</h3>
            </div>
            <div class="els_introduce_top-right pull-left"></div>
            <div class="clearfix"></div>
        </div>
        <div class="project_report fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">国别研究报告</h4>
                    <a href="${ctx}/cms/article/xinxichanpin" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list report_list">
                    <c:forEach items="${fnc:getArticleList(site.id,61, 5, '')}" var="article">
                        <c:if test="${article.statusCode eq '5'}">
                            <li><p><span class="pull-right"></span><a
                                    href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                    style="color:${article.color}"
                                    title="${article.title }">${fns:abbr(article.title,40)}</a></p></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="project_report fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">投资指南</h4>
                    <a href="${ctx }/cms/article/investmentguide" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list report_list">
                    <c:forEach items="${fnc:getArticleList(site.id,64, 5, '')}" var="article">
                        <c:if test="${article.statusCode eq '5'}">
                            <li><p><span class="pull-right"></span><a
                                    href="${ctx }/cms/cmsReport/selectCurrentInvestmentGuide?pid=${article.id}"
                                    style="color:${article.color}"
                                    title="${article.title }">${fns:abbr(article.title,40)}</a></p></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="project_report fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">丝路战略研究</h4>
                    <a href="${ctx }/cms/article/strategicResearch" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list report_list">
                    <c:forEach items="${fnc:getArticleList(site.id,67, 5, '')}" var="article">
                        <c:if test="${article.statusCode eq '5'}">
                            <li><p><span class="pull-right"></span><a
                                    href="${ctx }/cms/cmsReport/selectCurrentstrategicResearch?pid=${article.id}"
                                    style="color:${article.color}"
                                    title="${article.title }">${fns:abbr(article.title,40)}</a></p></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="project_box mgtop_30 business clearfix">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left" style="width:12%;">
                <h3>经贸信息</h3>
            </div>
            <div class="els_introduce_top-right pull-left" style="width:88%;"></div>
            <div class="clearfix"></div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">商务需求信息</h4>
                    <a href="${ctx}/cms/cmsRequirementInformation/requirementInformation" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list business_list">
                    <c:forEach items="${cmsRequirementInformationList}" var="requirementInformationlist"
                               varStatus="status" begin="0" end="4">
                        <input type="hidden" value="${requirementInformationlist.id}"/>
                        <div class="xyjy-content-top-bot-content pull-left">
                            <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                <li>
                                    <p class="xyjy-content-top-bot-content-p-1">
                                        <a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${requirementInformationlist.id}"
                                           class="c_active"
                                           title="${requirementInformationlist.productName }">${fns:abbr(requirementInformationlist.productName,70) }</a>
                                    </p>
                                </li>
                            </div>
                        </div>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">商务供给信息</h4>
                    <a href="${ctx}/cms/p2pProductInfo/productInfo" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list business_list">
                    <c:forEach items="${p2pProductInfoList}" var="productinfolist" varStatus="status" begin="0" end="4">
                        <input type="hidden" value="${productinfolist.id}"/>
                        <div class="xyjy-content-top-bot-content pull-left">
                            <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                <li>
                                    <p class="xyjy-content-top-bot-content-p-1">
                                        <a href="${ctx}/cms/cmsSupplyInformation/selectCurrentSupplyInformation?pid=${productinfolist.id}"
                                           class="c_active"
                                           title="${productinfolist.productName }">${fns:abbr(productinfolist.productName,70) }</a>
                                    </p>
                                </li>
                            </div>
                        </div>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
    </div>
    <div class="project_box mgtop_30 clearfix">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>投融资</h3>
            </div>
            <div class="els_introduce_top-right pull-left"></div>
            <div class="clearfix"></div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">融资信息</h4>
                    <a href="${ctx}/cms/article/financing" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">
                    <c:forEach items="${fnc:getArticleList(site.id,68, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                            <c:if test="${status.count%1==0 }">
                                <br/>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">丝路债券</h4>
                    <a href="${ctx}/cms/article/bond" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">
                    <c:forEach items="${fnc:getArticleList(site.id,69, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="project_box mgtop_30 clearfix">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>政策</h3>
            </div>
            <div class="els_introduce_top-right pull-left"></div>
            <div class="clearfix"></div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">沿线国家政策</h4>
                    <a href="${ctx}/cms/article/infoListForeign" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">
                    <c:forEach items="${fnc:getArticleList(site.id,13, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                </ul>

            </div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">国内地方政策</h4>
                    <a href="${ctx}/cms/article/infoListInland" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">
                    <c:forEach items="${fnc:getArticleList(site.id,14, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="project_box mgtop_30 clearfix">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>人文</h3>
            </div>
            <div class="els_introduce_top-right pull-left"></div>
            <div class="clearfix"></div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">人文概述</h4>
                    <a href="${ctx}/cms/article/humanity" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">
                    <c:forEach items="${fnc:getArticleList(site.id,65, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="project_info fl">
            <div class="text_box">
                <div class="info_box clearfix">
                    <h4 class="fl">文化交流</h4>
                    <a href="${ctx}/cms/article/culturalCommunication" class="know_more fr">
                        <em>了解更多</em>
                        <span class="bg"></span>
                    </a>
                </div>
                <div class="line"></div>
                <ul class="info_list">

                    <c:forEach items="${fnc:getArticleList(site.id,66, 5, '')}" var="article" varStatus="status"
                               begin="0" end="4">
                        <c:if test="${article.statusCode eq '5'}">
                            <div class="xyjy-content-top-bot-content pull-left">
                                <div class="xyjy-content-top-bot-content pull-left" style="margin-right:10px;">
                                    <li>
                                        <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a
                                                href="${article.url}" style="color:${article.color}"
                                                title="${article.title }">${fns:abbr(article.title,70)}</a></p>
                                    </li>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${status.count%1==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>