<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/myback/myback.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
    <style type="text/css">
        .selected {
            background: #f14349;
            color: #fff;
        }

        a {
            cursor: pointer;
        }

        .btna {
            -moz-user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857;
            margin-bottom: 0;
            padding: 6px 12px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }

        .weizhi {
            float: right;
        }

        .btn:hover {
            color: #fff;
            cursor: default;
        }

        /*     	table{table-layout: fixed;} */
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<!-- 引入header文件 -->
<c:if test="${user.roleList[0].id=='101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id=='104'}">
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
</c:if>
<div class="zh-right pull-left">
    <div class="tzright_top">
        <p class="zl-p">
            未到账收益总额： <span><fmt:formatNumber value="${unReceived}" pattern="#,##0.00"/>元 </span>
        </p>
        <p class="zl-p">
            累计收益 ：<span><fmt:formatNumber value="${hasReceived}" pattern="#,##0.00"/>元</span>
        </p>
        <div class="rz-time">
            <span class="chaxun">按时间查询：</span>
            <form action="${ctx}/user/Institution/ctrlMenu" style="margin:0px;display:inline;"
                  onsubmit="return checkinput()">
                <input type="hidden" name="mode" value="investmentIncome"/>
                <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date" readonly>
                <b>至</b>
                <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date" readonly>
                <input type="submit" value="查 询"/>
            </form>
        </div>
    </div>
    <div class="zh-right-bottom" id="div1">
        <!--债项  表单-->
        <table class="table table-hover tzzl-table table-striped table-condensed"
               style="word-break:keep-all;white-space:nowrap;">
            <thead>
            <tr class="active list-th">
                <th name="" width="15%">债项名称</th>
                <th width="9.9%">收益率(年化)</th>
                <th width="9.8%">借款期限(月)</th>
                <th width="9.80%">投资额度(元)</th>
                <th width="11.0%">投资时间</th>
                <th width="9.0%">债项状态</th>
                <th width="9.5%">收益总额度(元)</th>
                <th width="11.63%">收款总额度(元)</th>
                <th width="19.63%">到期时间</th>

            </tr>
            </thead>
            <tbody class="tzzl-tbody" id="itemContainer">
            <c:if test="${list == null}">
                <tr>
                    <td colspan="9" rowspan="2">
                        <div class="cai-text">暂无投资信息，立即 <a href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a>
                        </div>
                    </td>
                </tr>
            </c:if>
            <c:if test="${list != null}">
                <c:forEach items="${list}" var="p2pFinancingInformation">
                    <tr>
                        <td title="${p2pFinancingInformation.finacingName }"><a
                                onclick="view('${p2pFinancingInformation.id}')"
                                class="showModal">${fns:abbr(p2pFinancingInformation.finacingName,20 )}</a></td>
                        <!-- 			                    <td><a onclick ="view('${earnRecordList.id}')" data-toggle="modal" data-target="#myModal">${earnRecordList.finacingName }</a></td> -->
                        <td><fmt:formatNumber
                                pattern="#0.00">${p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%
                        </td>
                        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
                        <td><fmt:formatNumber
                                pattern="#,##0.00">${p2pFinancingInformation.p2pInvestmentInformation.investmentSumAmount}</fmt:formatNumber></td>
                        <td><fmt:formatDate
                                value="${p2pFinancingInformation.p2pInvestmentInformation.lastInvestmentTime}"
                                pattern="yyyy-MM-dd"/></td>
                        <td>${fns:getDictLabel(p2pFinancingInformation.currentStage,"progress_stage","") }</td>
                        <td><fmt:formatNumber value="${p2pFinancingInformation.p2pReceivePlan.sumInterest }"
                                              pattern="#,##0.00"/></td>
                        <td><fmt:formatNumber
                                value="${p2pFinancingInformation.p2pInvestmentInformation.investmentSumAmount + p2pFinancingInformation.p2pReceivePlan.sumInterest}"
                                pattern="#,##0.00"/></td>
                        <td><fmt:formatDate value="${p2pFinancingInformation.p2pReceivePlan.maturityTime}"
                                            pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <div class="holder"></div>
    </div>
    <div class="clearfix"></div>
    <!-- 投资项目的还款计划模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 0">
        <div class="modal-dialog" style="width:75%">
            <div class="modal-content" style="margin-top: 15%">
                <div class="modal-header" style="padding-left:15px;padding-top: 0;padding-bottom: 0">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3 id="myModalLabel">投资收益明细</h3>
                </div>
                <div class="modal-body">
                    <input id="id" type="hidden" class="form-control">
                    <table id="modalTable" class="table table-striped table-bordered table-condensed" border="1"
                           bordercolor="#ccc" style="background: #ffffff;width:100%">
                        <thead>
                        <tr>
                            <td name="finacingName" style="width:18%">债项名称</td>
                            <td name="recommendedRate" style="width:9%">收益率(年化)</td>
                            <td name="financingMaturity" style="width:8%">借款期限</td>
                            <td name="p2pInvestmentInformation.investmentSumAmount" style="width:8%">投资额度(元)</td>
                            <td name="p2pInvestmentInformation.lastInvestmentTime" style="width:17%">投资时间</td>
                            <td name="p2pReceivePlan.receiveState" style="width:8%">款项状态</td>
                            <td name="earnings" style="width:8%">收益总额度(元)</td>
                            <td name="sumReceive" style="width:8%">收款总额度(元)</td>
                            <td name="p2pReceivePlan.planReceiveDate" style="width:17%">预期到账时间</td>
                            <td name="p2pReceiveRecord.realReceiveDate" style="width:17%">实际到账时间</td>
                        </tr>
                        </thead>
                        <tbody id="itemContainer2">
                        </tbody>
                    </table>
                    <div class="holder1"></div>
                    <div class="clearfix"></div>
                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                    <div class="clearfix"></div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dictionary/dictionary.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script type="text/javascript">
    //按时间查询前验证
    function checkinput() {
        var beginTime = new Date($("#beginTime").val());
        var endTime = new Date($("#endTime").val());
        if (beginTime > endTime) {
            alert("起始时间不得大于截止时间！")
            return false;
        }
        return true;

    }

    //查询字典项
    function selectdic(value, type, defaultValue) {
        var zhi = '';
        var a = $.ajax({
            url: '${ctx}/financing/p2pFinancingInformation/selectDict',
            async: false,
            type: 'post',
            dataType: 'json',
            data: {value: value, type: type, defaultValue: defaultValue},
            success: function (d) {
                zhi = d.responseText;
            },
            error: function (e) {
                zhi = e.responseText;
                return zhi;
            }
        });
        return zhi;
    }

    //////////获取投资项目的还款计划///////////////
    function view(id) {
        $.ajax({
            type: 'post',
            async: false,
            url: '${ctx}/user/Institution/getRepaymentRecordByIdAndUserId?id=' + id,
            dataType: 'json',
            success: function (data) {
                var itemContainer2 = '';
                var tds = $("#modalTable thead td");
                var tdsName = [];//用于接住thead下所有的td的name的属性
                tds.each(function (i) {
                    tdsName.push($(tds[i]).attr("name"));
                });
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>";
                    var planReceiveInterest = data[i]['p2pReceivePlan']['planReceiveInterest'];
                    planReceiveInterest = planReceiveInterest != undefined ? planReceiveInterest : 0;
                    var planReceiveFine = data[i]['p2pReceivePlan']['planReceiveFine'];
                    planReceiveFine = planReceiveFine != undefined ? planReceiveFine : 0;
                    var planReceivePrincipal = data[i]['p2pReceivePlan']['planReceivePrincipal'];
                    planReceivePrincipal = planReceivePrincipal != undefined ? planReceivePrincipal : 0;
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
                        if (j == 1) {
                            var nameValueStr = (nameValue * 100).toFixed(2);
                            nameValueStr += "%";
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 2) {
                            var nameValueStr = selectdic(nameValue, 'financing_maturity', '');
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 5) {
                            var nameValueStr = selectdic(nameValue, 'receive_state', '');
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 6) {
                            var earnings;
                            earnings = planReceiveInterest + planReceiveFine;
                            earnings = earnings.toFixed(2);
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + earnings + "'>" + earnings + "</td>";
                        } else if (j == 7) {
                            var sumReceive = planReceiveInterest + planReceiveFine + planReceivePrincipal;
                            sumReceive = sumReceive.toFixed(2);
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + sumReceive + "'>" + sumReceive + "</td>";
                        } else if (j == 4) {
                            var nameValueDate = new Date(nameValue);
                            var nameValueStr = nameValueDate.format("yyyy-MM-dd hh:mm:ss");
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 3) {
                            var nameValueStr = parseFloat(nameValue).toFixed(2);
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j == 8 || j == 9) {
                            var nameValueStr = '--';
                            if (nameValue != "--") {
                                var nameValueDate = new Date(nameValue);
                                nameValueStr = nameValueDate.format("yyyy-MM-dd");
                            }
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else {
                            var nameStr = "";
                            if (nameValue.length > 20) {
                                nameStr = nameValue.substr(0, 17) + "...";
                            } else {
                                nameStr = nameValue;
                            }
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis; padding:8px;' title='" + nameValue + "'>" + nameStr + "</td>";
                        }
                    }
                    itemContainer2 += tr + "</tr>";
                }
                $("#itemContainer2").html(itemContainer2);
            }
        });
        $("#myModal").modal("show")
        $('#myModal').on('shown.bs.modal', function () {
            $("div.holder1").html("");
            fenye("div.holder1", "itemContainer2")
        });
    }
    function r_() {
        $('#beginDate').val("");
        $('#endDate').val("");
        window.location.href = "${ctx }/financing/myAccount/investmentIncome";
    }

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
    /*js实现页面分页*/
    function fenye(content, id) {
        $(content).jPages({
            containerID: id, //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 12, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 1, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    }
    fenye("div.holder", "itemContainer");
</script>
</body>
</html>