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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <style type="text/css">
        .table-ul-con {
            margin-bottom: 0px;
        }

        .table-ul-con li {
            text-align: left
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="touzizq-content">
    <!--左侧内容区域-->
    <div class="zh">
        <ol class="breadcrumb update">
            <li><b>当前位置：</b></li>
            <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
            <li class="lg-active"><strong>信用记录</strong></li>
        </ol>
    </div>
    <!--左侧内容区域结束-->
    <div class="cont-wyrz">
        <div class="contBox">
            <div class="chooseBox">
                <!--条件选择-->
                <div class="choose clearfix">
                </div>
                <div class="choose clearfix">
                    <label class="pull-left" style="width: 9%">&nbsp;所属行业：</label>
                    <ul class="search_tj pull-left">
                        <li class="active_click credit_right_li pull-left select-all">全部<span data-key="industryCode"
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
            </div>
            <div class="search-box" style="margin-bottom: 40px">
                <div class="wyrz-input-parent clearfix">
                    <input id="enterpriseName" type="text" class="form-control wyrz-input pull-left"
                           placeholder="请输入企业名称" name="value">
                    <span id="search_span" class="pull-left"><input id="baidu" type="image"
                                                                    src="${ctxStatic}/dist/images/search_icn.png"
                                                                    alt="点击进行搜索" title="点击进行搜索"></span>
                </div>
            </div>
            <div class="pjbg-info">
                <p style="padding-left: 16px">
                    <span class="pull-left">已找到搜索结果总共<span id="xybgcxjgNum">${count}</span>条</span>
                </p>
                <div class="clearfix">
                    <div class="pjbg-table-box xybg-table-box">
                        <table class="table">
                            <tbody id="pjbgList">
                            <c:forEach items="${list}" var="p2pEnterpriseCertify">
                                <tr>
                                    <td>
                                        <ul class="table-ul-con">
                                            <li class="table-ul-con1 c_xydj">
                                                <a href="${ctx}/cms/article/xinyongjlDetails?userId=${p2pEnterpriseCertify.userId}"
                                                   class="pkbg-name">${p2pEnterpriseCertify.enterpriseName}信用报告</a>
                                            </li>
                                            <li class="table-ul-con2">
                                                <span class="gsname">公司名称：<i>${p2pEnterpriseCertify.enterpriseName}</i></span>
                                            </li>
                                            <li class="table-ul-con2">
                                                <span class="gsgm">公司规模：<i>${fns:getDictLabel(p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}</i></span>
                                                <c:if test="${not empty p2pEnterpriseCertify.p2pFinancingInformation}">
                                                    <span class="zxmc">债项名称：<i>${p2pEnterpriseCertify.p2pFinancingInformation.finacingName}</i></span>
                                                </c:if>
                                                <c:if test="${not empty p2pEnterpriseCertify.p2pFinancingRatingInfo}">
                                                    <span class="xymj">信用级别：<i>${p2pEnterpriseCertify.p2pFinancingRatingInfo.mainCreditGrade}</i></span>
                                                </c:if>
                                                <span class="sshy">所属行业：<i>${p2pEnterpriseCertify.p2pIndustryclassi.classinameCn}</i></span>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder"></div>
                        <!--分页 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        var industryCode = '${industryCode}';
        $("#enterpriseName").val('${enterpriseName}');
        $(".credit_right_li").each(function (i) {
            if ($($(".credit_right_li span")[i]).text() == industryCode) {
                $($(".credit_right_li")[i]).addClass("active_click").siblings().removeClass("active_click");
            }
        })
    })
    $(document).on("click", ".credit_right_li", function () {
        $(this).addClass("active_click").siblings().removeClass("active_click");
        $("#search_span").click();
    })

    /**
     *搜索
     */
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
    $("#search_span").click(function () {
        $(".credit_right_li").each(function (i) {
            if ($($(".credit_right_li")[i]).hasClass("active_click") && !$($(".credit_right_li")[i]).hasClass("select-all")) {
                industryCode = $($(".credit_right_li span")[i]).text();
            } else if ($($(".credit_right_li")[i]).hasClass("active_click") && $($(".credit_right_li")[i]).hasClass("select-all")) {
                industryCode = "";
            }
        })
        enterpriseName = $("#enterpriseName").val();
        post('${ctx}/cms/article/xinyongjlcx', {industryCode: industryCode, enterpriseName: enterpriseName})
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