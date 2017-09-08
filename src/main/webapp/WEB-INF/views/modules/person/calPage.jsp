<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist-gyh/css/zhzl.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
    <script src="${ctxStatic}/dist-gyh/js/zhzl.js"></script>
    <script type="text/javascript">
        //校验表单
        function checkForm() {
            var amount = $('#amount').val();//投资/融资金额
            //alert(amount);
            var rate = $('#rate').val();		//年利率
            //alert(rate);
            var date = $('#date').val();	   //借款开始时间
            //alert(date);
            var term = $('#term').val();	//借款期限
            //alert(term);
            var way = $('#way').val();	//还款方式
            //alert(way);
            if (amount != '' && rate != '' && term != '' && date != '' && way != '') {
                sendForm();
            } else {
                alert('请填写完整');
            }
        }
        //提交表单
        function sendForm() {
            $.ajax({
                type: 'POST',
                url: '${ctx}/user/personInvestment/calcRepayment',
                data: $('#defaultForm').serialize(),
                success: function (result) {
                    var list = eval("(" + result + ")");
                    showData(list);
                },
                error: function () {
                    console.log('ajax error!');
                }
            });
        }
        //显示结果数据
        function showData(list) {
            var str = '';
            var sum = 0;
            var count = '';
            for (var i in list) {
                var obj = list[i];
                str += '<tr><td>' + obj.phase + '</td><td>' + obj.rate + '</td><td>' + formatCurrency(obj.amount) + '</td><td>' + new Date(obj.time).Format('yyyy-MM-dd') + '</td></tr>'
                sum = sum + parseFloat(obj.amount);
                count++;
            }
            $('#tbody').html(str);
            $('.totalAmount').html(formatCurrency(sum) + ' 元');
            $('.periodNumber').html(count + '期');
        }
        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1,
                "d+": this.getDate(),
                "h+": this.getHours(),
                "m+": this.getMinutes(),
                "s+": this.getSeconds(),
                "q+": Math.floor((this.getMonth() + 3) / 3),
                "S": this.getMilliseconds()
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        function formatCurrency(num) {
            num = num.toString().replace(/\$|\,/g, '');
            if (isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num * 100 + 0.50000000001);
            cents = num % 100;
            num = Math.floor(num / 100).toString();
            if (cents < 10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                    num.substring(num.length - (4 * i + 3));
            return (((sign) ? '' : '-') + num + '.' + cents);
        }
    </script>
    <script type="text/javascript">
        //模拟下拉选赋值
        function fuzhi(id, val) {
            $('#' + id).val(val);
        }
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active">计算器</li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left zhzl_jsq">
        <h3>收益计算器</h3>
        <form id="defaultForm">
            <div class="syjsq_top">
                <ul class="clearfix">
                    <li class="pull-left">
                        <label>投资金额</label>&nbsp;&nbsp;&nbsp;
                        <input id="amount" type="text" name="amount" value="">&nbsp;&nbsp;元
                    </li>
                    <li class="pull-left">
                        <label>年利率</label>&nbsp;&nbsp;&nbsp;
                        <input id="rate" type="text" name="rate" value="">&nbsp;&nbsp;%
                    </li>
                    <li class="pull-left">
                        <label class="text-justify">借款开始时间</label>&nbsp;&nbsp;&nbsp;
                        <input id="date" name="date" type="text" placeholder="请选择日期" class="mh_date" readonly="true">
                    </li>
                    <li class="pull-left">
                        <label class="text-justify">借款期限</label>&nbsp;&nbsp;
                        <input type="hidden" id="term" name="term" value=""/>
                        <div id="dropdown_jkqx" class="dropdown">
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle dropdownMenu_jkqx" type="button"
                                   id="dropdownMenu_jkqx" data-toggle="dropdown">
                                    <!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
                                    <span class="placeholder">请选择</span>
                                    <span class="caret1"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu_jkqx">
                                    <li role="presentation" value="1"><a role="menuitem" tabindex="1"
                                                                         href="javascript:fuzhi('term',3);">3</a></li>
                                    <li role="presentation" value="2"><a role="menuitem" tabindex="2"
                                                                         href="javascript:fuzhi('term',6);">6</a></li>
                                    <li role="presentation" value="3"><a role="menuitem" tabindex="3"
                                                                         href="javascript:fuzhi('term',12);">12</a></li>
                                </ul>
                            </div>
                        </div>&nbsp;&nbsp;个月
                    </li>
                    <li class="pull-left">
                        <label class="text-justify">还款方式</label>&nbsp;&nbsp;
                        <input type="hidden" id="way" name="way" value=""/>
                        <div id="dropdown_hkfs" class="dropdown">
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle dropdownMenu_jkqx" type="button"
                                   id="dropdownMenu_hkfs" data-toggle="dropdown">
                                    <!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
                                    <span class="placeholder">请选择</span>
                                    <span class="caret1"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu_hkfs">
                                    <li role="presentation" value="1"><a role="menuitem" tabindex="1"
                                                                         href="javascript:fuzhi('way',1);">按月付息，到期还本</a>
                                    </li>
                                    <li role="presentation" value="2"><a role="menuitem" tabindex="2"
                                                                         href="javascript:fuzhi('way',2);">等额本息</a></li>
                                    <li role="presentation" value="3"><a role="menuitem" tabindex="3"
                                                                         href="javascript:fuzhi('way',3);">一次性还本付息</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- <a href="#" class="lookXs">查看详细说明</a> -->
                    </li>
                    <li class="pull-left">
                        <button type="button" class="btn btn-js" onclick="checkForm()">计算</button>
                    </li>
                </ul>
            </div>
        </form>
        <div class="syjsq_bom">
            <p>总金额: <span class="totalAmount">0.00 元&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;总期数：<span class="periodNumber">0期</span>
            </p>
            <table class="table table-hover jsq_table">
                <thead>
                <tr>
                    <th>期数</th>
                    <th>月利率</th>
                    <th>每期应收/应付金额</th>
                    <th>到期日</th>
                </tr>
                </thead>
                <tbody id="tbody"></tbody>
            </table>
            <div>
                <button class="btn btn-wytz" id="investmenet">我要投资</button>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script>
    $(function () {
        $(".zh-left").css("height", "900px");
    });
    $(function () {
        $("input.mh_date").manhuaDate({
            Event: "click",//可选
            Left: 0,//弹出时间停靠的左边位置
            Top: -16,//弹出时间停靠的顶部边位置
            fuhao: "-",//日期连接符默认为-
            isTime: false,//是否开启时间值默认为false
            beginY: 1980,//年份的开始默认为1949
            endY: 2025//年份的结束默认为2049
        });

    });
    //我要投资
    $("#investmenet").click(function () {
        var url = "${ctx}/financing/p2pFinancingInformation/preLoadFinancingList";
        window.location.href = url;
    })

</script>
</html>