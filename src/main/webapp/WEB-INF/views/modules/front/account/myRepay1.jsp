<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="tabs " id="tabs" style="width:100%">
        <ul>
            <li class="two currents" id="changeZero"><span class="border border-top">待还款列表</span></li>
            <li class="two border" id="changeOne"><span>已还款列表</span></li>
            <li class="two border" id="changeTwo"><span>逾期记录</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu" style="margin-top:30px">
            <!--待还款列表-->
            <div class="one current2">
                <c:choose>
                    <c:when test="${list != null}">
                        <div class="rz-time ztcx">
                            <span class="chaxun">按时间查询：</span>
                            <form action="${ctx}/user/p2pUserInformation/accountPermission"
                                  style="margin:0px;display:inline;" onsubmit="return checkinput()">
                                <input type="hidden" name="mode" value="myRepayment"/>
                                <input type="hidden" name="state" value="0"/>
                                <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date"
                                       readonly>
                                <b>至</b>
                                <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date"
                                       readonly>
                                <input type="submit" value="查 询"/>
                            </form>
                        </div>
                        <p class="hong">*红色为逾期项目，请尽快还款并支付逾期费用</p>
                        <c:choose>
                            <c:when test="${p2p.markType == 1}">
                                <table class="table table-hover rongz-table">
                                    <thead style="height:50px">
                                    <tr class="active list-th">
                                        <th width="8%">序号</th>
                                        <th width="18%">借款项目名称</th>
                                        <th width="13%">应还款时间</th>
                                        <th width="13%">应还本金(元)</th>
                                        <th width="13%">应还利息(元)</th>
                                        <th width="13%">应还金额(元)</th>
                                        <th width="11%">款项状态</th>
                                    </tr>
                                    </thead>
                                    <tbody id="itemContainer">
                                    <c:set value="1" var="i"/>
                                    <c:forEach items="${list}" var="repayment">
                                        <c:choose>
                                            <c:when test="${repayment.repaymentState == 2}">
                                                <tr class="yuqi-tr tr">
                                                    <td><a href="javascript:void(0);"><c:out value="${i}"/></a></td>
                                                    <td><a href="javascript:void(0);"
                                                           title="${repayment.p2pFinancingInformation.finacingName}-${repayment.phase}">${fns:abbr(repayment.p2pFinancingInformation.finacingName,27)}-${repayment.phase}</a>
                                                    </td>
                                                    <td class="time"><fmt:formatDate
                                                            value="${repayment.planRepaymentDate}"
                                                            pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber
                                                            value="${repayment.planRepaymentPrincipal + repayment.planRepaymentInterest + repayment.fine}"
                                                            pattern="#,##0.00"/></td>
                                                    <td>
                                                        <a href="javascript:void(0);">已逾期</a>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="tr">
                                                    <td><a href="javascript:void(0);"><c:out value="${i}"/></a></td>
                                                    <td><a href="javascript:void(0);"
                                                           title="${repayment.p2pFinancingInformation.finacingName}-${repayment.phase}">${fns:abbr(repayment.p2pFinancingInformation.finacingName,27)}-${repayment.phase}</a>
                                                    </td>
                                                    <td class="time"><fmt:formatDate
                                                            value="${repayment.planRepaymentDate}"
                                                            pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber
                                                            value="${repayment.planRepaymentPrincipal + repayment.planRepaymentInterest}"
                                                            pattern="#,##0.00"/></td>
                                                    <td>
                                                        <a href="javascript:void(0);">待还款</a>
                                                    </td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="holder"></div>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-hover rongz-table">
                                    <thead style="height:50px">
                                    <tr class="active list-th">
                                        <th width="8%">序号</th>
                                        <th width="18%">借款项目名称</th>
                                        <th width="13%">应还款时间</th>
                                        <th width="13%">应还本金(元)</th>
                                        <th width="13%">应还利息(元)</th>
                                        <th width="13%">应还金额(元)</th>
                                        <th width="11%">款项状态</th>
                                    </tr>
                                    </thead>
                                    <tbody id="itemContainer">
                                    <c:set value="1" var="i"/>
                                    <c:forEach items="${list}" var="repayment">
                                        <c:choose>
                                            <c:when test="${repayment.repaymentState == 2}">
                                                <tr class="yuqi-tr tr">
                                                    <td><a href="javascript:void(0);"><c:out value="${i}"/></a></td>
                                                    <td><a href="javascript:void(0);"
                                                           title="${repayment.p2pFinancingInformation.finacingName}-${repayment.phase}">${fns:abbr(repayment.p2pFinancingInformation.finacingName,27)}</a>
                                                    </td>
                                                    <td class="time"><fmt:formatDate
                                                            value="${repayment.planRepaymentDate}"
                                                            pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber
                                                            value="${repayment.planRepaymentPrincipal + repayment.planRepaymentInterest + repayment.fine}"
                                                            pattern="#,##0.00"/></td>
                                                    <td>已逾期</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="tr">
                                                    <td><a href="javascript:void(0);"><c:out value="${i}"/></a></td>
                                                    <td><a href="javascript:void(0);"
                                                           title="${repayment.p2pFinancingInformation.finacingName}-${repayment.phase}">${fns:abbr(repayment.p2pFinancingInformation.finacingName,27)}</a>
                                                    </td>
                                                    <td class="time"><fmt:formatDate
                                                            value="${repayment.planRepaymentDate}"
                                                            pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                                          pattern="#,##0.00"/></td>
                                                    <td><fmt:formatNumber
                                                            value="${repayment.planRepaymentPrincipal + repayment.planRepaymentInterest}"
                                                            pattern="#,##0.00"/></td>
                                                    <td>待还款</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="holder"></div>
                            </c:otherwise>
                        </c:choose>

                    </c:when>
                    <c:otherwise>
                        <div class="daihk" style="margin-left: 8%;width: 65%">
                            <p class="daihai1">暂无待还款信息</p>
                            <p class="daihai2">返回<a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
            <!--待还款列表结束-->
        </div>
    </div>
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

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

    $(function () {
        $('#changeZero').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0";
        });
        $('#changeOne').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=1";
        });
        $('#changeTwo').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=2";
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id, //显示数据所在的块的ID
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
        }

        fenye("div.holder", "itemContainer");
    });
</script>
<script type="text/javascript">
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
</script>
</body>
</html>
