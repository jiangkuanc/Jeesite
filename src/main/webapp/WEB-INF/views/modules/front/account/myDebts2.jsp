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
    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#huankuan').attr('disabled', false);
        });
        //（机构投债项）添加还款信息到模态框
        function showForm(phase, id, repaymentRecordId) {
            var amount = $('#' + id).html();
            $('#phase').val(phase);
            $('#span').html(amount + '元');
            $('#huankuan').attr('disabled', false);
            $('#myModal').modal();
            $('#myModal').css('z-index', '5');
            $('.modal-backdrop').css('z-index', '2');
            if (repaymentRecordId != null || repaymentRecordId != '') {
                $('#repaymentRecordId').val(repaymentRecordId);
            }
        }
        //（个人投债项）还款操作
        function personRepayment(fid, phase) {
            $.ajax({
                type: 'post',
                url: '${ctx}/repayment/repaymentOperation/personRepayment',
                data: {
                    financingInformationId: fid,
                    phase: phase
                },
                success: function () {
                    window.location.reload();
                }
            });
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
        function submitListen() {
            var date = $('#realRepaymentDate').val();
            var file = $('#file').val();
            if (date != '' && file != '') {
                if (validateFile() == true) {
                    $('#huankuan').attr('disabled', true);
                    $('#defaultForm').submit();
                } else {
                    alert('上传文件的格式应为bmp,jpg,jpeg,png')
                }
            } else {
                alert('时间和凭证不能为空');
            }
        }
        function validateFile() {
            var fileObject = $("#file");
            var filepath = fileObject.val();
            var fileArr = filepath.split("//");
            var fileTArr = fileArr[fileArr.length - 1].toLowerCase().split(".");
            var filetype = fileTArr[fileTArr.length - 1];
            if (filetype == "jpg" || filetype == "jpeg" || filetype == "png" || filetype == "bmp") {
                return true;
            } else {
                return false;
            }
        }
    </script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
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
            <li id="changeZero" class="two"><span class="border">募集中的借款项目</span></li>
            <li id="changeOne" class="two border current currents"><span class="border-top">还款中的借款项目</span></li>
            <li id="changeTwo" class="two border "><span>已完成的借款项目</span></li>
            <li id="changeThree" class="two border"><span>流标借款项目</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu" style="margin-top:30px">
            <script type="text/javascript">
                //计算到期时间
                $(function () {
                    var financingMaturity = $('#financingMaturity').html();
                    financingMaturity = parseInt(financingMaturity);
                    var givingOutTime = $('#givingOutTime').html();
                    if (givingOutTime != null) {
                        var arr = givingOutTime.split("/");
                        var finalTime = new Date(arr[0], arr[1] - 1 + financingMaturity, arr[2]);
                        finalTime = finalTime.Format('yyyy/MM/dd');
                        $('#finalTime').html(finalTime);
                    }
                });
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
            </script>
            <script type="text/javascript">
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
                function sendForm(fid, p) {
                    post('${ctx}/repayment/viewReceive/paymentDetails', {financingInformationId: fid, phase: p})
                }
            </script>
            <!--还款中的债项-->
            <c:choose>
                <c:when test="${p2p != null}">
                    <div style="display: inherit;" class="one  zh-right-bottom  ">
                        <div class="mj-ul">
                            <ul class="pull-left mj-ul1">
                                <li>借款项目名称：<span><b
                                        title="${p2p.finacingName}">${fns:abbr(p2p.finacingName,20)}</b></span></li>
                                <li>满标金额：<span>
                            <c:choose>
                                <c:when test="${p2p.applicationAmount > p2p.p2pFinancingRatingInfo.recommendedAmount}">
                                    <fmt:formatNumber value="${p2p.p2pFinancingRatingInfo.recommendedAmount}"
                                                      pattern="###,###"/> 元
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${p2p.applicationAmount}" pattern="###,###"/> 元
                                </c:otherwise>
                            </c:choose>
                            </span></li>
                                <li>计息时间：<span id="givingOutTime"><fmt:formatDate value="${p2p.givingOutTime}"
                                                                                  pattern="yyyy/MM/dd"/></span></li>
                            </ul>
                            <ul class="pull-left">
                                <li>信用等级：<span><b>${p2p.p2pFinancingRatingInfo.ratingLevel}</b></span><a
                                        href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${p2p.id}">
                                    <button class="btn ckbg">下载评级报告</button>
                                </a></li>
                                <li>借款利率(年化)：<span><fmt:formatNumber
                                        pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%</span>
                                </li>
                                <li>期限：<span><span id="financingMaturity">${p2p.financingMaturity}</span>个月</span></li>
                            </ul>
                            <ul class="pull-left">
                                <li>还款方式：${fns:getDictLabel(p2p.repaymentMode, 'repayment_mode', '')}</li>
                                <li>到期时间：<span id="finalTime"></span></li>
                                <li><span>逾期时间：</span><span>${overdueDays}天</span></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <div class="xmyuqi">
                        </div>
                        <div class="tz rongzi">
                            <p class="tzjl-text" style="color:#999">还款记录</p>
                            <p class="ljrzje pull-right noWrap" style="width:20%">
                                已还款：<span><fmt:formatNumber value="${hasPaid}" pattern="#,##0.00"/>元</span>
                            </p>
                            <p class="ljrzje pull-right noWrap">
                                未还款金额：<span><fmt:formatNumber value="${notPaid}" pattern="#,##0.00"/>元</span>
                            </p>
                            <p class="ljrzje pull-right noWrap">
                                逾期罚金总额<span><fmt:formatNumber value="${overdueFine}" pattern="#,##0.00"/>元</span>
                            </p>
                        </div>
                        <!-- 机构还款计划 -->
                        <c:if test="${p2p.p2pFinancingRatingInfo.markType == 1}">
                            <table class="table table-hover rongz-table">
                                <thead style="height:50px">
                                <tr class="active list-th">
                                    <th width="7%" class="noWrap">序号</th>
                                    <th width="15%" class="noWrap">应还款时间</th>
                                    <th width="14%" class="noWrap">应还本金(元)</th>
                                    <th width="14%" class="noWrap">应还利息(元)</th>
                                    <th width="14%" class="noWrap">总还款金额(元)</th>
                                    <th width="12%" class="noWrap">状态</th>
                                    <th width="24%" class="noWrap">实际还款时间</th>
                                </tr>
                                </thead>
                                <tbody id="itemContainer">
                                <c:set value="1" var="i"/>
                                <c:set value="1" var="flag"/>
                                <c:forEach items="${repaymentList}" var="repayment">
                                    <c:set var="a" value="1"/>
                                    <tr>
                                        <td><a href="javascript:void(0);"><c:out value="${i}"/> </a></td>
                                        <td class="time1"><fmt:formatDate value="${repayment.planRepaymentDate}"
                                                                          pattern="yyyy-MM-dd"/></td>
                                        <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                              pattern="#,##0.00"/></td>
                                        <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                              pattern="#,##0.00"/></td>
                                        <td id="${repayment.id}"><fmt:formatNumber
                                                value="${repayment.planRepaymentPrincipal+repayment.planRepaymentInterest+repayment.fine}"
                                                pattern="#,##0.00"/></td>
                                        <c:if test="${repayment.repaymentState == 1}">
                                            <td id="weihuan">未还款</td>
                                        </c:if>
                                        <c:if test="${repayment.repaymentState == 2}">
                                            <td id="yqi">已逾期</td>
                                        </c:if>
                                        <c:if test="${repayment.repaymentState == 3}">
                                            <td>已还款</td>
                                        </c:if>
                                        <!-- 待上传还款凭证（一次未提交） -->
                                        <c:if test="${repayment.p2pRepaymentRecord.repaymentAuditState == null && flag == 1 && a == 1}">
                                            <td>-----<a
                                                    href="javascript:showForm('${repayment.phase}','${repayment.id}')">
                                                <button class="btn yhk pull-right">立即还款</button>
                                            </a></td>
                                            <c:set value="0" var="flag"/>
                                            <c:set var="a" value="0"/>
                                        </c:if>
                                        <!-- 还款凭证需要重新上传 -->
                                        <c:if test="${repayment.p2pRepaymentRecord.repaymentAuditState == 3 && flag == 1 && a == 1}">
                                            <td>-----<a
                                                    href="javascript:showForm('${repayment.phase}','${repayment.id}','${repayment.p2pRepaymentRecord.id}')">
                                                <button class="btn yhk pull-right">修改</button>
                                            </a></td>
                                            <c:set value="0" var="flag"/>
                                            <c:set var="a" value="0"/>
                                        </c:if>
                                        <!-- 还款凭证审核中 -->
                                        <c:if test="${repayment.p2pRepaymentRecord.repaymentAuditState == 1 && a == 1}">
                                            <td><fmt:formatDate
                                                    value="${repayment.p2pRepaymentRecord.realRepaymentDate}"
                                                    pattern="yyyy-MM-dd"/></td>
                                            <c:set value="0" var="flag"/>
                                            <c:set var="a" value="0"/>
                                        </c:if>
                                        <!-- 还款凭证审核成功 -->
                                        <c:if test="${repayment.p2pRepaymentRecord.repaymentAuditState == 2 && a == 1}">
                                            <td><fmt:formatDate
                                                    value="${repayment.p2pRepaymentRecord.realRepaymentDate}"
                                                    pattern="yyyy-MM-dd"/></td>
                                            <c:set var="a" value="0"/>
                                        </c:if>
                                        <!-- 未开放还款入口 -->
                                        <c:if test="${repayment.p2pRepaymentRecord.repaymentAuditState == null && flag == 0 && a == 1}">
                                            <td>-</td>
                                            <c:set var="a" value="0"/>
                                        </c:if>
                                    </tr>
                                    <c:set value="${i+1}" var="i"/>
                                </c:forEach>
                                </tbody>

                            </table>
                            <div class="holder"></div>
                        </c:if>
                        <!-- 个人还款计划 -->
                        <c:if test="${p2p.p2pFinancingRatingInfo.markType == 2}">
                            <table class="table table-hover rongz-table">
                                <thead style="height:50px">
                                <tr class="active list-th">
                                    <th width="7%" class="noWrap">序号</th>
                                    <th width="15%" class="noWrap">应还款时间</th>
                                    <th width="16%" class="noWrap">应还本金(元)</th>
                                    <th width="16%" class="noWrap">应还利息(元)</th>
                                    <th width="16%" class="noWrap">总还款金额(元)</th>
                                    <th width="16%" class="noWrap">状态</th>
                                    <th width="14%" class="noWrap">操作</th>
                                </tr>
                                </thead>
                                <tbody id="itemContainer">
                                <c:set value="1" var="i"/>
                                <c:forEach items="${repaymentList}" var="repayment">
                                    <tr>
                                        <td><a href="javascript:void(0);"><c:out value="${i}"/> </a></td>
                                        <td class="time1"><fmt:formatDate value="${repayment.planRepaymentDate}"
                                                                          pattern="yyyy-MM-dd"/></td>
                                        <td><fmt:formatNumber value="${repayment.planRepaymentPrincipal}"
                                                              pattern="#,##0.00"/></td>
                                        <td><fmt:formatNumber value="${repayment.planRepaymentInterest}"
                                                              pattern="#,##0.00"/></td>
                                        <td id="${repayment.phase}"><fmt:formatNumber
                                                value="${repayment.planRepaymentPrincipal+repayment.planRepaymentInterest+repayment.fine}"
                                                pattern="#,##0.00"/></td>
                                        <c:if test="${repayment.repaymentState == 1}">
                                            <td id="weihuan">未还款</td>
                                            <td><a href="javascript:personRepayment('${p2p.id}','${repayment.phase}')">
                                                <button type="button" class="btn yhk">立即还款</button>
                                            </a></td>
                                        </c:if>
                                        <c:if test="${repayment.repaymentState == 2}">
                                            <td id="yqi">已逾期</td>
                                            <td><a href="javascript:personRepayment('${p2p.id}','${repayment.phase}')">
                                                <button type="button" class="btn yhk">立即还款</button>
                                            </a></td>
                                        </c:if>
                                        <c:if test="${repayment.repaymentState == 3}">
                                            <td>已还款</td>
                                            <td><a href="javascript:sendForm('${p2p.id}','${repayment.phase}')">
                                                <button type="button" class="btn yhk">查看详情</button>
                                            </a></td>
                                        </c:if>
                                    </tr>
                                    <c:set value="${i+1}" var="i"/>
                                </c:forEach>
                                </tbody>

                            </table>
                            <div class="holder"></div>
                        </c:if>


                        <div class="tz rongzi" style="margin-top:30px;">
                            <p class="tzjl-text" style="color:#999">投资记录</p>
                            <p class="ljrzje pull-right" style="width:20%">
                                加入人次：<span>${investmentCount}人/次</span>
                            </p>
                            <p class="ljrzje pull-right">
                                总投标金额：<span><fmt:formatNumber value="${p2p.p2pFinancingRatingInfo.recommendedAmount}"
                                                              pattern="###,###"/>元</span>，
                            </p>
                        </div>
                        <div class="rz-time">
                            <span class="chaxun">按时间查询：</span>
                            <form action="${ctx}/user/p2pUserInformation/accountPermission"
                                  style="margin:0px;display:inline;" onsubmit="return checkinput()">
                                <input type="hidden" name="mode" value="myDebt"/>
                                <input type="hidden" name="state" value="1"/>
                                <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date"
                                       readonly>
                                <b>至</b>
                                <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date"
                                       readonly>
                                <input type="submit" value="查 询"/>
                            </form>
                        </div>
                        <table class="table table-hover rongz-table">
                            <thead>
                            <tr class="active list-th">
                                <th width="10%">序号</th>
                                <th width="22.5%">投标人</th>
                                <th width="17.5%">收益率(年化)</th>
                                <th width="20%">投资金额(元)</th>
                                <th width="20%">投资时间</th>
                            </tr>
                            </thead>
                            <tbody id="second">
                            <c:set value="1" var="j"/>
                            <c:forEach items="${investmentList}" var="a">
                                <tr>
                                    <td><a href="javascript:void(0);"><c:out value="${j}"/> </a></td>
                                    <td>
                                        <c:if test="${a.user.role.id == 101}">${a.p2pUserInformation.bankname}</c:if>
                                        <c:if test="${a.user.role.id == 104}">${a.p2pRegUserCertify.realName}</c:if>
                                    </td>
                                    <td><fmt:formatNumber
                                            pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                    </td>
                                    <td><fmt:formatNumber value="${a.investmentSumAmount}" pattern="#,###,###"/></td>
                                    <td><fmt:formatDate value="${a.lastInvestmentTime}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                                <c:set value="${j+1}" var="j"/>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder2"></div>
                    </div>
                    <!-- 还款模态框 -->
                    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        借款项目名称：${p2p.finacingName}
                                    </h4>
                                </div>
                                <form id="defaultForm" action="${ctx}/repayment/repaymentOperation/institutionRepayment"
                                      method="post" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <input type="hidden" name="financingInformationId" value="${p2p.id}"/>
                                        <input type="hidden" id="phase" name="phase" value=""/>
                                        <input type="hidden" id="repaymentRecordId" name="repaymentRecordId" value=""/>
                                        <br/>
                                        <div>还款总额：<span id="span"></span></div>
                                        <div style="margin-top: 12px">还款时间：
                                            <input type="text" placeholder="请选择日期" name="realRepaymentDate"
                                                   id="realRepaymentDate" class="mh_date" readonly>
                                            <!--<input id="realRepaymentDate" name="realRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" value=""
                                    onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" style="cursor:pointer;"/> -->
                                        </div>
                                        <div style="margin-top: 12px"><span style="float: left;">还款凭证：</span><input
                                                type="file" id="file" name="file" required="required"
                                                style="float: left;" accept="image/*"/><br/></div>


                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-primary" value="确   定"
                                               onclick="submitListen()" id="huankuan"/>
                                        <button type="button" class="btn btn-default" style="width:15%;height:35px;"
                                                data-dismiss="modal">关闭
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="display: inherit;" class="one ckmj-div">
                        <p class="hkzx">暂无还款中借款项目</p>
                    </div>
                </c:otherwise>
            </c:choose>
            <!--还款中的债项结束-->
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
        $("#changeZero").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=0"
        });
        $("#changeOne").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=1"
        });
        $("#changeTwo").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=2"
        });
        $("#changeThree").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=3"
        });
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
        fenye("div.holder2", "second");
    });
    $(function () {
        var list = '${json}';
        list = eval('(' + list + ')');
        for (var i in list) {
            if (list[i].repaymentState == 2) {
                var html = '<h2 >项目已逾期，<span>请</span><a href="javascript:void(0)">立即还款</a></h2>';
                $('.xmyuqi').html(html);
                return;
            }
        }
    });
</script>
</body>
</html>
