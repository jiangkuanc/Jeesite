<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dictionary/dictionary.js"></script>
    <style type="text/css">
        .select dl {
            margin-bottom: 0;
        }

        .select {
            padding: 0px 0px;
            border-radius: 4px;
            font-size: 12px
        }

        .select li {
            list-style: none;
            padding: 10px 0 5px 100px
        }

        .select .select-list {
            border-bottom: #eee 1px dashed
        }

        .select dl {
            zoom: 1;
            position: relative;
            line-height: 24px;
        }

        .select dl:after {
            content: " ";
            display: block;
            clear: both;
            height: 0;
            overflow: hidden
        }

        .select dt {
            width: 100px;
            margin-bottom: 5px;
            position: absolute;
            top: 7px;
            left: -100px;
            text-align: right;
            color: #666;
            height: 24px;
            line-height: 24px;
            font-size: 14px;
        }

        .select dd {
            float: left;
            display: inline;
            margin: 0 0 5px 5px;
        }

        .select a {
            display: inline-block;
            white-space: nowrap;
            height: 24px;
            padding: 0 10px;
            text-decoration: none;
            color: #039;
            border-radius: 2px;
        }

        .select a:hover {
            color: #f60;
            background-color: #f3edc2
        }

        .select .selected a {
            color: #fff;
            background-color: #f60
        }

        .select-result dt {
            font-weight: bold;
            font-size: 14px;
        }

        .select-result dl {
            min-height: 45px;
        }

        .select-no {
            color: #999
        }

        /* 		.select .select-result a{padding-right:20px;background:#f60 url("


        ${ctxStatic }   /dist/images/close.gif") right 9px no-repeat} */
        .select .select-result a:hover {
            background-position: right -15px
        }

        .touzizq-content {
            width: 76.3%;
            margin: 0 auto;
        }

        .touzizq-content-right {
            margin-bottom: 50px;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="clearfix"></div>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">投资专区</li>
    </ol>
</div>
<div class="touzizq-content">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <ul class="zhzl">
            <li data-i="0" class="zhzl-li" id="quanbu">
                <!--                 <p class="zhtext" style="font-size: 26px;cursor:pointer;" onclick="allFinancing();">投资专区</p> -->
                <p class="zhtext "><a href="javascript:void(0);" style="font-size: 25px;" onclick="leixing();">投资专区</a>
                </p>
            </li>
            <li data-i="0" class="zhzl-li" id="jigou">
                <p class="zhtext "><a href="javascript:void(0);" onclick="leixing('markType=1');">机构投资专区</a></p>
            </li>

            <li data-i="1" class="zhzl-li" id="geren">
                <p class="zhtext "><a href="javascript:void(0);" onclick="leixing('markType=2');">个人投资专区</a></p>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->
    <div class="touzizq-content-right pull-right">
        <img src="${ctxStatic}/dist/images/touzizq-banner_03.jpg" alt="">
        <div class="touzizq-content-right-center">
            <h4>选择条件</h4>
            <ul class="select">
                <li class="select-list">
                    <dl id="select1">
                        <dt>融资企业行业：</dt>
                        <dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
                        <span data-key="industryCode" style="display:none">${industry.industrynum}</span>
                        <c:forEach items="${industryList}" var="industry">
                            <dd class="select-dd"><a>${industry.classinameCn}</a></dd>
                            <span data-key="industryCode" style="display:none">${industry.industrynum}</span>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-list">
                    <dl id="select2">
                        <dt>标的期限：</dt>
                        <dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
                        <c:forEach items="${fns:getDictList('financing_maturity')}" var="item">
                            <dd class="select-dd"><a>${item.label}</a></dd>
                            <span data-key="financingMaturity" style="display:none">${item.value}</span>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-list">
                    <dl id="select3">
                        <dt>融资规模：</dt>
                        <dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
                        <dd class="select-dd"><a>200,000元以下</a></dd>
                        <span data-key="financingScale" style="display:none">0~200000</span>
                        <dd class="select-dd"><a>200,000~499,999元</a></dd>
                        <span data-key="financingScale" style="display:none">200000~499999</span>
                        <dd class="select-dd"><a>500,000~1,000,000元</a></dd>
                        <span data-key="financingScale" style="display:none">500000~1000000</span>

                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-list">
                    <dl id="select4">
                        <dt>收益率区间：</dt>
                        <dd class="select-all selected"><a>全部</a></dd>
                        <dd class="select-dd"><a>8%以下</a></dd>
                        <span data-key="earnRate" style="display:none">0~0.08</span>
                        <dd class="select-dd"><a>8%~10%</a></dd>
                        <span data-key="earnRate" style="display:none">0.08~0.1</span>
                        <dd class="select-dd"><a>10%~15%</a></dd>
                        <span data-key="earnRate" style="display:none">0.1~0.15</span>
                        <dd class="select-dd"><a>15%以上</a></dd>
                        <span data-key="earnRate" style="display:none">0.15~1</span>
                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-result">
                    <dl>
                        <dt>已选条件：</dt>
                        <dd class="select-no" style="padding-left:20px;padding-top: 10px">暂时没有选择过滤条件</dd>
                    </dl>
                </li>
            </ul>
        </div>

        <table class="table table-hover table-striped table-condensed"
               style="font-size: 14px;table-layout: fixed;border-collapse: separate;border-spacing: 0px 2px;word-break:keep-all;white-space:nowrap;">
            <thead>
            <tr class="active list-th">
                <!-- <td name="finacingName" width="12.5%">债项名称</td> -->
                <td name="finacingName" width="12.5%">借款项目名称</td>
                <td name="p2pEnterpriseCertify.enterpriseName" width="13.13%">融资企业</td>
                <td name="p2pFinancingRatingInfo.ratingLevel" width="8%">信用级别</td>
                <td name="p2pFinancingRatingInfo.recommendedRate" width="11.68%">收益率(年化)</td>
                <!--                 <td name="currentStage" width="8.75%">债项状态</td> -->
                <td name="currentStage" width="8.75%">状态</td>
                <td name="restRaiseMoney" width="10.38%">剩余额度(元)</td>
                <td width="9.5%">融资进度</td>
                <td width="17%">剩余时间</td>
                <td width="8.63%">操作</td>
            </tr>
            </thead>
            <tbody id="itemContainer">
            </tbody>
        </table>
        <div class="holder"></div>
    </div>
    <div class="clearfix"></div>
    <!--分页-->
</div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    /**
     *加载数据列表
     */
    $(function () {
        var map = eval("(" + '${json}' + ")");
        itemContainer(map);
    });
    function itemContainer(data) {
        var select = [];
        for (var key in data) {
            select.push(key);
        }
        if ((data.hasOwnProperty("earnRate") || data.hasOwnProperty("financingMaturity")) && (data['earnRate'] != "" || data['financingMaturity'] != "")) {
            $(".select-result dd").remove();
            for (var i = 0; i < select.length; i++) {
                var spans = $("span[data-key=" + select[i] + "]");
                spans.each(function (k) {
                    if ($(spans[k]).text() == data[select[i]]) {
                        $(spans[k]).parent().find(".select-all").removeClass("selected");
                        $(spans[k]).prev().addClass("selected");
                        $(".select-result dl").append($(spans[k]).prev().clone())
                    }
                })
            }
        }
        if (data.hasOwnProperty("markType")) {
            var p = "markType=" + data['markType'];
            if (p == "markType=1") {
                $('.zhzl li:eq(1)').attr('class', 'tz-active');
                $('.zhzl li:eq(2)').attr('class', 'zhtext');
                $('.zhzl li:eq(0)').attr('class', 'zhtext');
            } else if (p == "markType=2") {
                $('.zhzl li:eq(2)').attr('class', 'tz-active');
                $('.zhzl li:eq(0)').attr('class', 'zhtext');
                $('.zhzl li:eq(1)').attr('class', 'zhtext');
            }
        } else {
            $('.zhzl li:eq(0)').attr('class', 'tz-active');
            $('.zhzl li:eq(1)').attr('class', 'zhtext');
            $('.zhzl li:eq(2)').attr('class', 'zhtext');
        }
        $.ajax({
            type: "post",
            url: "${ctx}/financing/p2pFinancingInformation/financingList",//加载数据
            data: data,
            async: false,
            dataType: "JSON",
            success: function (data) {
                var itemContainer = '';
                var tds = $(".table-hover thead td");
                var tdsName = [];//用于接住thead下所有的td的name的属性
                tds.each(function (i) {
                    tdsName.push($(tds[i]).attr("name"));
                });
                for (var i = 0; i < data.length; i++) {
                    var idd = data[i]['id'];
                    var tr = "<tr>";
                    var ids = "jindu" + data[i]['id'];
                    var hasRaiseAmount = data[i]['hasRaiseAmount'];
                    if (hasRaiseAmount == null || hasRaiseAmount == undefined) {
                        hasRaiseAmount = 0;
                    }
                    var financingAmount = 1;
                    if (data[i]['financingAmount'] >= data[i]['applicationAmount']) {
                        financingAmount = data[i]['applicationAmount'];
                    } else {
                        financingAmount = data[i]['financingAmount'];
                    }
                    if (financingAmount == null || financingAmount == undefined) {
                        financingAmount = 1;
                    }
                    var inRaiseState = data[i]['inRaiseState'];
                    var currentStage = data[i]['currentStage'];
                    var percent = hasRaiseAmount / financingAmount;
                    percent = (percent * 100).toFixed(2);
                    var jindu = percent + "%";
                    var width = parseFloat(jindu);
                    var stas = "sta" + data[i]['id'];
                    var iddd = JSON.stringify(idd);
                    for (var j = 0; j < tdsName.length; j++) {
                        var name = tdsName[j];
                        var nameValue = null;//根据以下情况复制
                        if (name != undefined) {
                            if (name.indexOf(".") < 0) {
                                nameValue = (data[i][name] == undefined || data[i][name] == null || data[i][name].length == 0) ? "--"
                                    : data[i][name];
                            } else {
                                var bb = name.substring(0, name.indexOf("."));//复合对象
                                var kk = name.substring(name.indexOf(".") + 1);//复合对象中的属性
                                var valueTemp = null;
                                try {
                                    valueTemp = data[i][bb][kk];//取到值
                                } catch (e) {

                                }
                                nameValue = valueTemp == undefined || valueTemp == null || valueTemp == '' ? "--" : valueTemp;
                            }
                        }
                        if (j == 0) {
                            tr += "<td id='" + idd + "' name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;color:blue;cursor:pointer;' onclick='touzi(" + inRaiseState + "," + currentStage + "," + iddd + ")' title='" + nameValue + "'>" + nameValue + "</td>";
                        } else if (j < 3) {
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValue + "'>" + nameValue + "</td>";
                        } else if (j == 5) {
                            if (nameValue == "--") {
                                nameValue = 0;
                            }
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValue + "'>" + nameValue + "</td>";
                        } else if (j == 3) {
                            rate = (nameValue * 100).toFixed(2);
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + rate + "'>" + rate + '%' + "</td>";
                        } else if (j == 4) {
                            var nameValueStr = $.selectdic(nameValue, 'progress_stage', '');
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 6) {
                            tr += "<td><div class='progress plan'><div id='" + ids + "' style='width:" + jindu + ";color: black;' class='progress-bar' role='progressbar' aria-valuenow='" + width + "' aria-valuemin='0' aria-valuemax='100'>" + jindu + "</div></div></td>";
                        } else if (j == 7) {
                            tr += "<td class='sta' id='" + stas + "'></td>";
                        } else if (j == 8) {
                            var flag = false;
                            var userId = "${user.id}";
                            if (userId != null && userId != "") {
                                $.ajax({
                                    type: "post",
                                    url: "${ctx}/financing/p2pFinancingInformation/findInvestmentInformation?financingInformationId=" + idd,//加载数据
                                    async: false,
                                    dataType: "JSON",
                                    success: function (ddata) {
                                        if (ddata != null && ddata != undefined && ddata != "" && ddata.length > 0) {
                                            for (var m = 0; m < ddata.length; m++) {
                                                if (ddata[m]['user']['id'] == userId) {
                                                    flag = true;
                                                    if (data[i]['inRaiseState'] == 0 && data[i]['currentStage'] == 500) {
                                                        tr += "<td><a class='buts' href='${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=" + idd + "'}'>追加投资</a><td>";
                                                    } else {
                                                        tr += "<td><a class='buts2'}>追加投资</a><td>";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                            if (!flag) {
                                if (data[i]['inRaiseState'] == 0 && data[i]['currentStage'] == 500) {
                                    tr += "<td><a class='buts' href='${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=" + idd + "'}'>立即投资</a><td>";
                                }
                                if ((data[i]['inRaiseState'] == 1 && data[i]['currentStage'] == 500) || data[i]['currentStage'] > 500) {
                                    tr += "<td><a class='buts2'}>立即投资</a><td>";
                                }
                            }
                        }
                    }
                    itemContainer += tr + "</tr>";
                }

                $("#itemContainer").html(itemContainer);
                $("div.holder").html("");
                $("div.holder").jPages({
                    containerID: "itemContainer", //显示数据所在的块的ID
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
                var InterValObj = window.setInterval(function () {
                    _fresh()
                }, 1000); //间隔函数，1秒执行
                function _fresh() {
                    for (var k = 0; k < data.length; k++) {
                        var stas = "sta" + data[k]['id'];
                        var remainTime;
                        var obj = data[k]['raiseTimeLimit'];//截止日期
                        if (obj == null || obj == undefined) {
                            obj = 0;
                        }
                        var lastPublishTime = data[k]['lastPublishTime'];//最新发布时间
                        if (lastPublishTime == null || lastPublishTime == undefined) {
                            lastPublishTime = 0;
                        }
                        var hasRaiseTime = data[k]['hasRaiseTime'];//已募集时间
                        if (hasRaiseTime == null || hasRaiseTime == undefined) {
                            hasRaiseTime = 0;
                        }
                        var currentStage = data[k]['currentStage'];//债项状态
                        var inRaiseState = data[k]['inRaiseState'];//募集中状态
                        var nowtime;//当前时间
                        var endtime;//结束时间
                        var leftsecond;//剩余时间秒数
                        endtime = obj * 24 * 3600;
                        nowtime = new Date();
                        var leftsecond = parseInt(endtime - (nowtime.getTime() - lastPublishTime + hasRaiseTime * 1000) / 1000); //剩余时间
                        if (currentStage == 500 && inRaiseState == 0) {
                            if (leftsecond > 0) {
                                var _d = parseInt(leftsecond / 3600 / 24); //计算天
                                var _h = parseInt((leftsecond / 3600) % 24); //计算时
                                var _m = parseInt((leftsecond / 60) % 60); //计算分
                                var _s = parseInt(leftsecond % 60); //计算秒
                                remainTime = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                            } else {
                                remainTime = "募集已结束";
                            }
                        } else if (currentStage == 500 && inRaiseState == 1) {
                            remainTime = "募集已暂停";
                        } else {
                            remainTime = "募集已结束";
                        }
                        $("#" + stas).text("" + remainTime);
                    }
                }

            }
        })
    }

    function touzi(inRaiseState, currentStage, idd) {
        window.location.href = '${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=' + idd;
    }
    /**
     *控制左侧菜单栏
     */
    function leixing(ppp) {
        var key = "markType";
        var value = '';
        if (ppp == "markType=1") {
            value = 1;
            $('.zhzl li:eq(1)').attr('class', 'tz-active');
            $('.zhzl li:eq(0)').attr('class', 'zhtext');
            $('.zhzl li:eq(2)').attr('class', 'zhtext');
        } else if (ppp == "markType=2") {
            value = 2;
            $('.zhzl li:eq(2)').attr('class', 'tz-active');
            $('.zhzl li:eq(0)').attr('class', 'zhtext');
            $('.zhzl li:eq(1)').attr('class', 'zhtext');
        } else if (ppp == undefined) {
            $('.zhzl li:eq(0)').attr('class', 'tz-active');
            $('.zhzl li:eq(1)').attr('class', 'zhtext');
            $('.zhzl li:eq(2)').attr('class', 'zhtext');
        }
        var data = "{'" + key + "':'" + value + "'}";
        $(".select-all").attr("class", "select-all selected");
        $(".select-dd").attr("class", "select-dd");
        var str = "<dd class='select-no' style='padding-left:20px;padding-top: 10px'>暂时没有选择过滤条件</dd>";
        $(".select-result dd").remove();
        $(".select-result span").remove();
        $(".select-result dl").append($(str));
        data = eval("(" + data + ")");
        itemContainer(data);
    }

    //点击左侧投资专区
    function allFinancing() {
        $(".zh-p").css("color", "#C1181D");
        $(".zh-p").css("background", "#eaeaea");
        itemContainer();
    }

    function func() {
        alert("该项目不在融资期，不能投资");
    }

    /**
     *筛选条件控制
     */
    $(".select-list a").click(function () {
        var e = window.event || arguments[0];
        var target = e.srcElement || e.target;
        //找到当前点击元素的父元素dd，并追加选中效果的class
        $(target).parent().parent().find("dd").removeClass("selected");
        $(target).parent().addClass("selected");
        //
        var selected = new Array();
        $(".select-list dd").each(function (i) {
            if ($($(".select-list dd")[i]).hasClass("selected") && !$($(".select-list dd")[i]).hasClass("select-all")) {
                var selectedClon = $($(".select-list dd")[i]).clone()
                var spanClocn = $($(".select-list dd")[i]).next().clone()
                selected.push(selectedClon);
                selected.push(spanClocn);
            }
        })

        if (selected.length != 0) {
            $(".select-result dd").remove();
            $(".select-result span").remove();
            for (var i = 0; i < selected.length; i++) {
                $(".select-result dl").append(selected[i])
            }

        } else {
            var title = "<dd class='select-no' style='padding-left:20px;padding-top: 10px'>暂时没有选择过滤条件</dd>";
            $(".select-result dd").remove();
            $(".select-result span").remove();
            $(".select-result dl").append($(title));
        }

        //遍历结果集中的元素
        var data = "{";
        for (var i = 0; i < selected.length; i++) {
            if (selected[i][0].tagName == "SPAN") {
                var key = selected[i].attr("data-key");
                var value = selected[i].text();
                data += "'" + key + "'" + ":" + "'" + value + "'" + ",";
            }
        }
        if ($("#geren").hasClass("tz-active")) {
            data += "'markType':'2'";
        } else if ($("#jigou").hasClass("tz-active")) {
            data += "'markType':'1'";
        } else {
            if (data.length != 1) {
                data = data.substring(0, data.length - 1);
            }
        }
        data += "}";
        data = eval('(' + data + ')');
        itemContainer(data);
    })
</script>
</body>
</html>