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
    <link rel="stylesheet"
          href="${ctxStatic }/dist/css/jquery.validate1.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/financing.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/fileinput.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/dist/js/fileinput.js"></script>
    <script src="${ctxStatic }/dist/js/fileinput_locale_zh.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        #table-wrap {
            width: 1100px;
            margin: 0 auto;
        }

        #table-wrap h2 {
            font-size: 22px;
            color: #333;
            font-weight: bold;
            line-height: 22px;
            margin: 0;
            text-align: center;
            font-family: "Microsoft YaHei";
            padding: 0;
        }

        .table-show {

        }

        .table-show h3 {
            color: #bf1a20;
            font-size: 20px;
            font-weight: bold;
            text-indent: 23px;
            margin: 0;
            padding: 0;
        }

        .table {
            border-radius: 5px;
            border: 1px solid #dadada;
            width: 1000px;
            margin: 0 auto;
            position: relative;
        }

        .table > tbody > tr > td {
            vertical-align: inherit;
            border: none;
            border-bottom: 1px solid #dadada;
        }

        #myModal1 .table > tbody > tr > td, #myModal2 .table > tbody > tr > td, #myModal3 .table > tbody > tr > td {
            border: 1px solid #dadada;
        }

        .table tr {
            height: 60px;
            text-align: center;
            border-top: 0;
            border-bottom: 0px solid #dadada;
        }

        .table tr td {
            height: 60px;
            line-height: 60px;
            border-bottom: 1px solid #dadada;
        }

        .table > tbody > tr > .same-td {
            background: #fddede;
            color: #640303;
            font-size: 14px;
            text-align: center;
            font-weight: bold;
            border-bottom: 1px solid #fff;
        }

        .report {
            width: 100%;
            height: 20px;
            display: block;
            text-indent: 979px;
            color: #ea5e0a;
            background: url("${ctxStatic}/dist/images/warning_03.png") no-repeat 962px center;
        }

        /*遮罩层*/
        #exampleModal div {
            color: #333;
            font-size: 16px;
        }

        #exampleModal .col-lg-4 {
            text-align: right;
            line-height: 42px;
            height: 42px;
            margin: 0;
            padding: 0;
        }

        #exampleModal .col-lg-8 {
            text-align: left;
            line-height: 42px;
            height: 42px;
            margin: 0;
            padding: 0;
        }

        #exampleModal .col-lg-4 span {
            color: #bf1a20;
            vertical-align: -4px;
        }

        .dropdown-menu {
            width: 160px;
            left: 28px;
            top: 32px;
            border-radius: 0;
        }

        .dropdown-menu li {
            width: 160px;
            height: 24px;
            text-align: left;
            color: #333;
            font-size: 14px;
            line-height: 24px;
            text-indent: 5px;
        }

        .dropdown-menu li:hover {
            background: #e0e0e0;
        }

        .dropdown {
            display: inline-block;
        }

        .modal-footer {
            border: none;
        }

        #exampleModal .modal-footer button {
            width: 88px;
            height: 30px;
            line-height: 0;
            background: #f2434a;
            font-size: 16px;
            text-align: center;
            border: none;
            margin: 0 auto;
        }

        #exampleModal .modal-footer button:last-child {
            margin-right: 257px;
        }

        .breadcrumb > li + li:after {
            padding: 0;
        }

        .modal-header .close {
            margin-top: -13px;
        }

        .file-input {
            overflow-x: initial;
            display: inline-block;
            vertical-align: top;
            width: 71%;
        }

        .touzizq-content {
            margin-bottom: 50px;
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
                    href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页
            </a>
            </li>
            <li class="active">信用记录查询</li>
        </ol>
    </div>
    <!--左侧内容区域结束-->
    <div class="touzizq-content">
        <div id="table-wrap">
            <div style="height: 65px;"></div>
            <h2>${p2pEnterpriseCertify.enterpriseName}信用报告 (简版)</h2>
            <div style="height: 69px;"></div>
            <div class="table-show">
                <h3>一、信用等级</h3>
                <div style="height: 20px;"></div>
                <table class="table"
                       style="border-radius: 5px;border-collapse: separate">
                    <tbody>
                    <tr>
                        <td class="same-td col-lg-2">等 级</td>
                        <td class="same-td-2 col-lg-9">
                            <c:choose>
                                <c:when test="${not empty p2pEnterpriseCertify.p2pFinancingRatingInfo.mainCreditGrade}">
                                    ${p2pEnterpriseCertify.p2pFinancingRatingInfo.mainCreditGrade}
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="same-td">评级年月</td>
                        <td class="same-td-2">
                            <c:choose>
                                <c:when test="${not empty p2pEnterpriseCertify.p2pFinancingRatingInfo.publishTime}">
                                    <fmt:formatDate value="${p2pEnterpriseCertify.p2pFinancingRatingInfo.publishTime}"
                                                    pattern="yyyy年MM月"/>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="height: 52px;"></div>
            <!--政府监管信息-->
            <div class="table-show">
                <h3>二、政府监管信息</h3>
                <div style="height: 20px;"></div>
                <table class="table" style="border-radius: 5px;border-collapse: separate">
                    <tbody>
                    <tr style="background:#cc484d;color:#fff;font-size:20px;">
                        <td colspan="2">企业基本信息</td>
                    </tr>
                    <tr>
                        <td class="same-td col-lg-2">注册号/统一社会信用代码</td>
                        <td class="same-td-2 col-lg-9">
                            <c:choose>
                                <c:when test="${not empty p2pEnterpriseCertify.unifiedSocialCreditCode}">
                                    已提供
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="same-td">组织机构代码</td>
                        <td class="same-td-2">
                            <c:choose>
                                <c:when test="${not empty p2pEnterpriseCertify.organizationCode}">
                                    已提供
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="same-td">税务登记代码</td>
                        <td class="same-td-2">
                            <c:choose>
                                <c:when test="${not empty p2pEnterpriseCertify.taxRegistrationNum}">
                                    已提供
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="height: 52px;"></div>
            <div class="table-show">
                <h3>三、金融信贷信息</h3>
                <div style="height: 20px;">
                    <c:choose>
                        <c:when test="${user.id != null && user.id != '' && user.id != reportUserId}">
                            <a data-toggle="modal" data-target="#exampleModal" class="report"
                               href="javascript:;">举报此信息</a>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </div>
                <table class="table" style="border-radius: 5px;border-collapse: separate">
                    <tbody>
                    <tr>
                        <td class="col-lg-2"></td>
                        <td class="same-td-2 col-lg-9"
                            style="color:#640303;font-size:25px;font-weight: bold;">风险条数
                        </td>
                    </tr>
                    <tr>
                        <td class="same-td">大公平台借贷信息</td>
                        <c:choose>
                            <c:when test="${countDagong == 0}">
                                <td class="same-td-2">${countDagong}</td>
                            </c:when>
                            <c:otherwise>
                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('1')" class="showModal"
                                                                                style="cursor: pointer; color:blue">${countDagong}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td class="same-td">银行借贷信息</td>
                        <c:choose>
                            <c:when test="${countBank == 0}">
                                <td class="same-td-2">${countBank}</td>
                            </c:when>
                            <c:otherwise>
                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('2')" class="showModal"
                                                                                style="cursor: pointer; color:blue">${countBank}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td class="same-td">其他渠道借款信息</td>
                        <c:choose>
                            <c:when test="${countOther == 0}">
                                <td class="same-td-2">${countOther}</td>
                            </c:when>
                            <c:otherwise>
                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('3')" class="showModal"
                                                                                style="cursor: pointer; color:blue">${countOther}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 大公一带一路平台逾期信息模态框 -->
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" style="margin-top: 0">
            <div class="modal-dialog" style="width:60%">
                <div class="modal-content" style="margin-top: 25%">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                               style="background: #ffffff;width:100%">
                            <thead>
                            <tr>
                                <td>处置机构</td>
                                <td>笔数(笔)</td>
                                <td>币种</td>
                                <td>逾期金额(元)</td>
                                <td>逾期年月</td>
                                <td>逾期持续月数(月)</td>
                                <td>最近一次还款日期</td>
                                <td>处置完成日期</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${dagongList}" var="creditOverdueInfo">
                                <tr>
                                    <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency, 'disposal_agency', '')}</td>
                                    <td>${creditOverdueInfo.pens}</td>
                                    <td>${fns:getDictLabel(creditOverdueInfo.currency, 'currency', '')}</td>
                                    <td><fmt:formatNumber
                                            pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.overdueDate}"
                                            pattern="yyyy-MM"/>
                                    </td>
                                    <td>${creditOverdueInfo.overdueMonths}</td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.lastRepaymentDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.disposalCompletionDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                    </div>
                    <!--尾部按钮-->
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
        <!-- 银行信贷信息模态框 -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" style="margin-top: 0">
            <div class="modal-dialog" style="width:60%">
                <div class="modal-content" style="margin-top: 25%">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                               style="background: #ffffff;width:100%">
                            <thead>
                            <tr>
                                <td>处置机构</td>
                                <td>笔数(笔)</td>
                                <td>币种</td>
                                <td>逾期金额(元)</td>
                                <td>逾期年月</td>
                                <td>逾期持续月数(月)</td>
                                <td>最近一次还款日期</td>
                                <td>处置完成日期</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bankList}" var="creditOverdueInfo">
                                <tr>
                                    <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                            'disposal_agency', '')}</td>
                                    <td>${creditOverdueInfo.pens}</td>
                                    <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                            'currency', '')}</td>
                                    <td><fmt:formatNumber
                                            pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.overdueDate}"
                                            pattern="yyyy-MM"/>
                                    </td>
                                    <td>${creditOverdueInfo.overdueMonths}</td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.lastRepaymentDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.disposalCompletionDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                    </div>
                    <!--尾部按钮-->
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
        <!-- 其他借贷平台逾期模态框 -->
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" style="margin-top: 0">
            <div class="modal-dialog" style="width:60%">
                <div class="modal-content" style="margin-top: 25%">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                               style="background: #ffffff;width:100%">
                            <thead>
                            <tr>
                                <td>处置机构</td>
                                <td>笔数(笔)</td>
                                <td>币种</td>
                                <td>逾期金额(元)</td>
                                <td>逾期年月</td>
                                <td>逾期持续月数(月)</td>
                                <td>最近一次还款日期</td>
                                <td>处置完成日期</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${otherList}" var="creditOverdueInfo">
                                <tr>
                                    <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                            'disposal_agency', '')}</td>
                                    <td>${creditOverdueInfo.pens}</td>
                                    <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                            'currency', '')}</td>
                                    <td><fmt:formatNumber
                                            pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.overdueDate}"
                                            pattern="yyyy-MM"/>
                                    </td>
                                    <td>${creditOverdueInfo.overdueMonths}</td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.lastRepaymentDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td><fmt:formatDate
                                            value="${creditOverdueInfo.disposalCompletionDate}"
                                            pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                    </div>
                    <!--尾部按钮-->
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
    </div>
    <div class="clearfix"></div>


</div>


<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<!--举报弹窗部分开始-->
<div id="exampleModal" class="modal fade bs-example-modal-sm shenshu" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 600px;">
            <form id="shensu" method="post" action="${ctx}/creditmanage/creditReportInfoFront/save"
                  enctype="multipart/form-data">
                <h4 style="color:#bf1a20;font-size:22px;line-height: 50px;font-weight: bold;text-align: center;">
                    举报信息</h4>
                <input type="hidden" id="beReportedId" name="beReportedId" value="${p2pEnterpriseCertify.userId}"/>

                <div class="form-group" style="width: 100%;padding-left:40px;">
                    <label class="control-label"
                           style="width:101px;display:inline-block;text-align:right;">信用记录类型:</label>
                    <select class="form-control form-control-static" style="width: 200px; display: inline-block;">
                        <option value="1">金融信贷信息</option>
                    </select>
                    <select id="reportInfoType" name="reportInfoType" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">银行信贷信息</option>
                        <option value="2">大公平台信贷信息</option>
                        <option value="3">其他借贷信息</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">举报原因:</label>
                    <select id="reportReason" name="reportReason" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">欠款</option>
                        <option value="2">信息造假</option>
                        <option value="3">隐匿信息</option>
                        <option value="4">信用历史记录</option>
                        <option value="5">其他</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class="control-label"
                           style="width:100px;display:inline-block;text-align:right;line-height:39px;vertical-align:113px;">描述:</label>
                    <textarea name="reportExplain" class="form-control required" rows="6"
                              style="width:400px;resize: none;border-radius:10px;display: inline-block;"></textarea>
                </div>
                <div class="form-group" style="width: 95%;">
                    <label name="attachment" class=" control-label"
                           style="width: 139px;display: inline-block;text-align: right;">附件:</label>
                    <input type="hidden" id="attachmentName" name="attachmentName"/>
                    <input type="hidden" id="attachment" name="attachment"/>
                    <input id="inputfile" type="file" name="file"/>
                </div>

                <div class="form-group" style="width: 100%;">
                    <p style="width: 100%;padding-left: 246px;">
                        <input type="hidden" name="id" id="id"/>
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<!--举报弹窗部分结束-->
</body>
<script type="text/javascript">
    function view(param) {
        if (param == 1) {
            $("#myModal1").modal("show")
        }
        if (param == 2) {
            $("#myModal2").modal("show")
        }
        if (param == 3) {
            $("#myModal3").modal("show")
        }
    }

    $('#inputfile').fileinput({
        showUpload: false, //是否显示上传按钮
        showRemove: false,
        showCaption: false,//是否显示标题
//        	showPreview: false,
        maxFileSize: 10240,
        maxFileCount: 1
    }).on("fileuploaded", function (event, data) {

    });
</script>
</html>