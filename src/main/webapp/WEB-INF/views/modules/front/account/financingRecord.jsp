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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>

    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->

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

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="zh-right-bottom  ">
        <div class="tz rongzi">
            <p class="rzjl-text">融资记录</p>
            <p class="ljrzje">
                累计融资金额：<span>${allFinancingAmount}元</span>
            </p>
            <p class="rzxm">
                累计融资项目：<span>${allFinancingCount}个</span>
            </p>
        </div>


        <c:if test="${fn:length(repayList) == 0 && fn:length(loanList) == 0 && flag == null}">
            <div class="daihk">
                <p class="daihai1">暂无融资记录信息</p>
            </div>
        </c:if>
        <c:if test="${fn:length(repayList) > 0 || fn:length(loanList) > 0 || flag != null}">
            <div class="rz-time">
                <span class="chaxun">按时间查询：</span>
                <form action="${ctx}/user/p2pUserInformation/accountPermission" style="margin:0px;display:inline;"
                      onsubmit="return checkinput()">
                    <input type="hidden" name="mode" value="financRecord"/>
                    <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date" readonly>
                    <b>至</b>
                    <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date" readonly>
                    <input type="submit" value="查 询"/>
                </form>
            </div>
            <c:choose>
                <c:when test="${fn:length(repayList) > 0 || fn:length(loanList) > 0}">
                    <div id="div">
                        <c:set var="i" value="1"/>
                        <table class="table table-hover rongz-table">
                            <thead style="height:50px">
                            <tr class="active list-th">
                                <th width="10%">序号</th>
                                <th width="22.5%">到账时间</th>
                                <th width="17.5%">款项名称</th>
                                <th width="20%">收支金额(元)</th>
                                <th width="20%">借款项目名称</th>
                            </tr>
                            </thead>
                            <tbody id="itemContainer">
                            <c:forEach items="${loanList}" var="loan">
                                <tr class="tr1 tr">
                                    <td><a href=""><c:out value="${i}"/> </a>
                                    </td>
                                    <td class="time"><fmt:formatDate
                                            value="${loan.givingOutTime}" pattern="yyyy/MM/dd"/>
                                    </td>
                                    <td>项目借款</td>
                                    <td><fmt:formatNumber value="${loan.financingAmount}"
                                                          pattern="#,###.00"/>
                                    </td>
                                    <td><a href="javascript:void(0);"
                                           title="${loan.finacingName}">${fns:abbr(loan.finacingName,27)}</a>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i+1}"/>
                            </c:forEach>
                            <c:forEach items="${repayList}" var="repay">
                                <tr class="tr2 tr">
                                    <td><a href=""><c:out value="${i}"/> </a>
                                    </td>
                                    <td class="time"><fmt:formatDate
                                            value="${repay.financingRepayExpire}" pattern="yyyy/MM/dd"/>
                                    </td>
                                    <td>项目还款</td>
                                    <td><fmt:formatNumber value="${repay.qbyhk}"
                                                          pattern="#,##0.00"></fmt:formatNumber></td>
                                    <td><a href="javascript:void(0);"
                                           title="${repay.finacingName}-${repay.p2pRepaymentPlan.phase}">${fns:abbr(repay.finacingName,27)}</a>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i+1}"/>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder"></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table table-hover rongz-table">
                        <thead style="height:50px">
                        <tr class="active list-th">
                            <th width="10%">序号</th>
                            <th width="22.5%">到账时间</th>
                            <th width="17.5%">款项名称</th>
                            <th width="20%">收支金额(元)</th>
                            <th width="20%">借款项目名称</th>
                        </tr>
                        </thead>
                    </table>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

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
                delay: 20
                //分页时动画持续时间，0表示无动画
            });
        }

        fenye("div.holder", "itemContainer");
    });
</script>

</body>
</html>	
