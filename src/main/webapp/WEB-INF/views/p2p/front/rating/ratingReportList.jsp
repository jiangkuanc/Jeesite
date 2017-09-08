<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/financing.css">
    <link rel="stylesheet"
          href="${ctxStatic }/dist/css/jquery.validate1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <style type="text/css">
        .table-ul-con li {
            text-align: left
        }

        .breadcrumb > li + li:after {
            padding: 0;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="touzizq-content">
    <!--左侧内容区域-->
    <div class="zh">
        <ol class="breadcrumb update">
            <li><b>当前位置：</b>
            </li>
            <li><a
                    href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a>
            </li>
            <li class="lg-active"><strong>评级报告查询</strong>
            </li>
        </ol>
    </div>
    <!--左侧内容区域结束-->
    <div class="cont-wyrz">
        <div class="wyrz-banner-box">
            <img src="${ctxStatic}/dist/images/pjbg-bn.jpg" alt="" class="wyrz-banner">
            <c:if test="${user == null}">
                <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp"><img
                        src="${ctxStatic}/dist/images/sqpj-img.png" alt=""></a>
            </c:if>
            <c:if test="${user.roleList[0].id == 102}">
                <a href="${ctx}/user/p2pUserInformation/financingRule"><img src="${ctxStatic}/dist/images/sqpj-img.png"
                                                                            alt=""></a>
            </c:if>
            <c:if test="${user.roleList[0].id == 101 || user.roleList[0].id == 104 || user.roleList[0].id == 105 || user.roleList[0].id == 106}">
                <a><img src="${ctxStatic}/dist/images/sqpj-img.png" alt=""></a>
            </c:if>
        </div>
        <div class="contBox">
            <div class="search-box">
                <div class="wyrz-input-parent clearfix">
                    <input id="search_content" type="text" class="form-control wyrz-input pull-left"
                           placeholder="请输入企业名称" name="value">
                    <span id="search_span" class="pull-left" onclick="searchf();">
							<input id="baidu" type="image" src="${ctxStatic}/dist/images/search_icn.png" alt="点击进行搜索"
                                   title="点击进行搜索">
						</span>
                </div>
            </div>
            <div class="chooseBox">
                <!--条件选择-->
                <div class="choose clearfix">
                    <label class="pull-left">&nbsp;按行业：</label>
                    <ul class="search_tj pull-left byIndustry">
                        <li class="active_click credit_right_li pull-left select-all">不限<span data-key="industryCode"
                                                                                              style="display:none"></span>
                        </li>
                        <c:forEach items="${industryList}" var="industry">
                            <li class="credit_right_li pull-left">
                                    ${industry.classinameCn}
                                <span data-key="industryCode" style="display:none">${industry.industrynum}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="choose clearfix">
                    <label class="pull-left">&nbsp;按类型：</label>
                    <ul class="search_tj pull-left byType">
                        <li class="active_click credit_right_li pull-left select-all">不限<span data-key="ratingType"
                                                                                              style="display:none"></span>
                        </li>
                        <li class="credit_right_li pull-left">主体评级<span data-key="ratingType"
                                                                        style="display:none">2</span></li>
                        <li class="credit_right_li pull-left">借贷产品评级<span data-key="ratingType"
                                                                          style="display:none">1</span></li>
                    </ul>
                </div>
                <div class="choose clearfix">
                    <label class="pull-left">&nbsp;按等级：</label>
                    <ul class="search_tj pull-left byLevel">
                        <li class="active_click credit_right_li pull-left select-all">不限<span data-key="ratingType"
                                                                                              style="display:none"></span>
                        </li>
                        <li class="credit_right_li pull-left">AAA<span data-key="ratingType"
                                                                       style="display:none">AAA</span></li>
                        <li class="credit_right_li pull-left">AA+<span data-key="ratingType"
                                                                       style="display:none">AA+</span></li>
                        <li class="credit_right_li pull-left">AA<span data-key="ratingType"
                                                                      style="display:none">AA</span></li>
                        <li class="credit_right_li pull-left">AA-<span data-key="ratingType"
                                                                       style="display:none">AA-</span></li>
                        <li class="credit_right_li pull-left">A+<span data-key="ratingType"
                                                                      style="display:none">A+</span></li>
                        <li class="credit_right_li pull-left">A<span data-key="ratingType" style="display:none">A</span>
                        </li>
                        <li class="credit_right_li pull-left">A-<span data-key="ratingType"
                                                                      style="display:none">A-</span></li>
                        <li class="credit_right_li pull-left">BBB+<span data-key="ratingType"
                                                                        style="display:none">BBB+</span></li>
                        <li class="credit_right_li pull-left">BBB<span data-key="ratingType"
                                                                       style="display:none">BBB</span></li>
                        <li class="credit_right_li pull-left">BBB-<span data-key="ratingType"
                                                                        style="display:none">BBB-</span></li>
                        <li class="credit_right_li pull-left">BB+<span data-key="ratingType"
                                                                       style="display:none">BB+</span></li>
                        <li class="credit_right_li pull-left">BB<span data-key="ratingType"
                                                                      style="display:none">BB</span></li>
                        <li class="credit_right_li pull-left">BB-<span data-key="ratingType"
                                                                       style="display:none">BB-</span></li>
                        <li class="credit_right_li pull-left">B+<span data-key="ratingType"
                                                                      style="display:none">B+</span></li>
                        <li class="credit_right_li pull-left">B<span data-key="ratingType" style="display:none">B</span>
                        </li>
                        <li class="credit_right_li pull-left">B-<span data-key="ratingType"
                                                                      style="display:none">B-</span></li>
                        <li class="credit_right_li pull-left">CCC<span data-key="ratingType"
                                                                       style="display:none">CCC</span></li>
                        <li class="credit_right_li pull-left">CC<span data-key="ratingType"
                                                                      style="display:none">CC</span></li>
                        <li class="credit_right_li pull-left">C<span data-key="ratingType" style="display:none">C</span>
                        </li>
                        <!-- 							<a href="#" class=" pull-left"><span class="wh">?</span>等级如何划分？</a> -->
                    </ul>
                </div>
                <div class="choose cftjBox clearfix">
                    <label>&nbsp;当前查找条件：</label>
                    <ul class="clearfix" id="cftjBox">
                    </ul>
                    <div class="qktj">
                        <i class="glyphicon glyphicon-trash"></i> <span>清空条件</span>
                    </div>
                </div>
            </div>
            <div class="pjbg-info">
                <p style="padding-left: 16px">
                    为您找到 <span id="pjbgNum">${count}</span>份评级报告
                </p>
                <div class="clearfix">
                    <div class="pjbg-table-box pull-left">
                        <table class="table">
                            <tbody id="pjbgList">
                            <c:forEach items="${list}" var="p2pFinancingRatingInfo">
                                <tr>
                                    <td>
                                        <ul class="table-ul-con">
                                            <li class="table-ul-con1 c_xydj">
                                                <a href="${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=${p2pFinancingRatingInfo.id}"
                                                   class="pkbg-name">
                                                        ${p2pFinancingRatingInfo.reportName}
                                                </a>
                                            </li>
                                            <li class="table-ul-con2">
                                                <c:if test="${not empty p2pFinancingRatingInfo.ratingLevel}">
                                                    <span class="xyztdj">借贷产品信用等级：<i>${p2pFinancingRatingInfo.ratingLevel}</i></span>
                                                </c:if>
                                                <span class="xyztdj">主体信用等级：<i>${p2pFinancingRatingInfo.mainCreditGrade}</i></span>
                                                <span class="ztpjzw">主体评级展望：<i>${fns:getDictLabel(p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '')}</i></span>
                                                <span class="pjsj">评级时间 ：<i><fmt:formatDate
                                                        value="${p2pFinancingRatingInfo.publishTime}"
                                                        pattern="yyyy-MM-dd"/></i></span>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--分页 -->
                        <div class="holder"></div>
                    </div>
                    <div class="img-box pull-right">
                        <div>
                            <img src="${ctxStatic}/dist/images/index-xuanfu-right_03.jpg" alt="">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<%@include
        file="/WEB-INF/views/modules/cms/front/include/thePartner.jsp" %>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    var arr = [];
    var industryCode;
    var ratingType;
    var mainCreditGrade;
    var enterpriseName;
    var $search_tj = $(".search_tj");
    for (var i = 0; i < $search_tj.length; i++) {
        arr.push("");
    }
    ;
    $search_tj.on("click", ".credit_right_li", function () {
        $(".cftjBox").show();
        $(this).addClass("active_click").siblings().removeClass("active_click");
        var $lis = $('<li class="pull-left">' +
            '<span class="pull-left on">' + $(this).html() + '</span>' +
            '<i class="pull-left glyphicon glyphicon-remove"></i>' +
            '</li>');
        arr[$(this).parents(".choose").index()] = $lis;
        $("#cftjBox").html(arr);
        searchf();
    })
    $("#cftjBox").on("click", ".glyphicon-remove", function () {
        var _this = this;
        $.each($(".credit_right_li "), function (index, item) {
            if ($(".credit_right_li ").eq(index).html() == $(_this).prev().html()) {
                var num = $(".credit_right_li ").eq(index).parents(".choose").index()
                $(".credit_right_li ").eq(index).parent().find("li").eq(0).addClass("active_click").siblings().removeClass("active_click");
                arr[num] = "";
            }
        })
        $("#cftjBox").html(arr);
        if ($("#cftjBox").find("li").length == 0) {
            $(".cftjBox").hide();
        }
        searchf();
    });
    $(".qktj").click(function () {
        arr = [];
        $("#cftjBox").html("");
        $(".cftjBox").hide();
        $search_tj.each(function (index) {
            $search_tj.eq(index).find(".credit_right_li").eq(0).addClass("active_click").siblings().removeClass("active_click");
        })
        searchf();
    })
    $("div.holder").jPages({
        containerID: "pjbgList", //显示数据所在的块的ID
        first: '首页',
        last: '尾页',
        previous: '上页',
        next: '下页',
        perPage: 10, //每页显示数据为多少行
        startPage: 1, //起始页
        startRange: 2, //开始页码为2个
        midRange: 6, //最多显示几个页码页码,其余用..代替e
        ndRange: 10, //结束页码为2个
        keyBrowse: true,
        delay: 20 //分页时动画持续时间，0表示无动画
    });

    $(function () {
        industryCode = '${industryCode}';
        ratingType = '${ratingType}';
        mainCreditGrade = '${mainCreditGrade}';
        enterpriseName = '${enterpriseName}';
        $("#search_content").val(enterpriseName);
        $(".byIndustry .credit_right_li").each(function (i) {
            if ($($(".byIndustry .credit_right_li span")[i]).text() == industryCode && industryCode != "") {
                $($(".byIndustry .credit_right_li")[i]).addClass("active_click").siblings().removeClass("active_click");
                $(".cftjBox").show();
                var $lis = $('<li class="pull-left">' +
                    '<span class="pull-left on">' + $(this).html() + '</span>' +
                    '<i class="pull-left glyphicon glyphicon-remove"></i>' +
                    '</li>');
                arr[$(this).parents(".choose").index()] = $lis;
                $("#cftjBox").html(arr);
            }
        });
        $(".byType .credit_right_li").each(function (j) {
            if ($($(".byType .credit_right_li span")[j]).text() == ratingType && ratingType != "") {
                $($(".byType .credit_right_li")[j]).addClass("active_click").siblings().removeClass("active_click");
                $(".cftjBox").show();
                var $lis = $('<li class="pull-left">' +
                    '<span class="pull-left on">' + $(this).html() + '</span>' +
                    '<i class="pull-left glyphicon glyphicon-remove"></i>' +
                    '</li>');
                arr[$(this).parents(".choose").index()] = $lis;
                $("#cftjBox").html(arr);
            }
        });
        $(".byLevel .credit_right_li").each(function (k) {
            if ($($(".byLevel .credit_right_li span")[k]).text() == mainCreditGrade && mainCreditGrade != "") {
                $($(".byLevel .credit_right_li")[k]).addClass("active_click").siblings().removeClass("active_click");
                $(".cftjBox").show();
                var $lis = $('<li class="pull-left">' +
                    '<span class="pull-left on">' + $(this).html() + '</span>' +
                    '<i class="pull-left glyphicon glyphicon-remove"></i>' +
                    '</li>');
                arr[$(this).parents(".choose").index()] = $lis;
                $("#cftjBox").html(arr);
            }
        });
    })

    function searchf() {
        $(".byIndustry .credit_right_li").each(function (i) {
            if ($($(".byIndustry .credit_right_li")[i]).hasClass("active_click") && !$($(".byIndustry .credit_right_li")[i]).hasClass("select-all")) {
                industryCode = $($(".byIndustry .credit_right_li span")[i]).text();
            } else if ($($(".byIndustry .credit_right_li")[i]).hasClass("active_click") && $($(".byIndustry .credit_right_li")[i]).hasClass("select-all")) {
                industryCode = "";
            }
        })
        $(".byType .credit_right_li").each(function (j) {
            if ($($(".byType .credit_right_li")[j]).hasClass("active_click") && !$($(".byType .credit_right_li")[j]).hasClass("select-all")) {
                ratingType = $($(".byType .credit_right_li span")[j]).text();
            } else if ($($(".byType .credit_right_li")[j]).hasClass("active_click") && $($(".byType .credit_right_li")[j]).hasClass("select-all")) {
                ratingType = "";
            }
        })
        $(".byLevel .credit_right_li").each(function (k) {
            if ($($(".byLevel .credit_right_li")[k]).hasClass("active_click") && !$($(".byLevel .credit_right_li")[k]).hasClass("select-all")) {
                mainCreditGrade = $($(".byLevel .credit_right_li span")[k]).text();
            } else if ($($(".byLevel .credit_right_li")[k]).hasClass("active_click") && $($(".byLevel .credit_right_li")[k]).hasClass("select-all")) {
                mainCreditGrade = "";
            }
        })
        enterpriseName = $("#search_content").val();
        post('${ctx}/financing/p2pFinancingRatingInfo/getRatingList', {
            industryCode: industryCode,
            ratingType: ratingType,
            mainCreditGrade: mainCreditGrade,
            enterpriseName: enterpriseName
        });
    }

    function post(url, params) {
        var temp = document.createElement('form');
        temp.action = url;
        temp.method = 'post';
        temp.style.display = 'none';
        for (var x in params) {
            var opt = document.createElement('input');
            opt.name = x;
            opt.value = params[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
    $(function () {
        document.onkeydown = function (e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 13) {
                $('#baidu').click();
            }
        }
    });
</script>
</body>
</html>