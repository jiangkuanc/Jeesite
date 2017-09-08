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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/fileinput.css">
    <%--  <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/> --%>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.min.js"></script>
    <script src="${ctxStatic }/dist/js/fileinput.js"></script>
    <script src="${ctxStatic }/dist/js/fileinput_locale_zh.js"></script>
    <%-- <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script> --%>

    <style>
        .credit-text .btn {
            outline: none;
        }

        .credit-text h1 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 25px;
            font-weight: bold;
        }

        .credit-text h2 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: left;
            font-size: 23px;
            font-weight: bold;
        }

        .credit-text h3 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: left;
            font-size: 16px;
            font-weight: bold;
        }

        .tbody-01 tr td:first-child {
            width: 200px;
            color: #000;
        }

        .tbody-01 tr:last-child {
            height: 80px;
            line-height: 80px;
        }

        .tbody-02 tr td:first-child {
            width: 200px;
            color: #000;
        }

        .title-jumu {
            position: relative;
        }

        .jumu {
            border-radius: 2px;
            text-align: center;
            width: 100%;
            height: 350px;
            position: absolute;
            left: 0;
            top: 40px;
        }

        .jumu h2 {
            width: 100%;
            text-align: center;
        }

        .credit-text {
            width: 90%;
            margin: none;
        }

        .file-preview {
            width: 100%;
        }
    </style>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        #table-wrap {
            width: 100%;
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
            width: 100%;
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
            background: url("dist-wyrz/imgs/warning_03.png") no-repeat 962px center;
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
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
<div class="zh-right pull-left">
    <div class="tabs " id="tabs" style="width:100%">
        <ul>
            <li id="changeZero" class="two currents " style="width:30%"><span class="border border-top">我的信用记录</span>
            </li>
            <li id="changeOne" class="two border" style="width:30%"><span>我的申诉记录</span></li>
            <li id="changeTwo" class="two border" style="width:30%"><span>我的举报记录</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="credit-text">
            <div id="table-wrap">
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
                                        <fmt:formatDate
                                                value="${p2pEnterpriseCertify.p2pFinancingRatingInfo.publishTime}"
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
                                    <td class="same-td-2" style="color:#568eea;"><a data-toggle="modal"
                                                                                    data-target="#myModal1"
                                                                                    class="showModal"
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
                                    <td class="same-td-2" style="color:#568eea;"><a data-toggle="modal"
                                                                                    data-target="#myModal2"
                                                                                    class="showModal"
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
                                    <td class="same-td-2" style="color:#568eea;"><a data-toggle="modal"
                                                                                    data-target="#myModal3"
                                                                                    class="showModal"
                                                                                    style="cursor: pointer; color:blue">${countOther}</a>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        </tbody>
                    </table>
                    <%--  <c:if test="${user.id != null && user.id != ''}"> --%>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"
                            style="margin:30px 0;margin-left:93%;">申诉
                    </button>
                    <%--  </c:if> --%>
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
    </div>
</div>


<!--申诉弹窗部分开始-->
<div class="modal fade bs-example-modal-sm shenshu" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 600px;">
            <form id="shensu" method="post" action="${ctx}/creditmanage/creditAppealInfoFront/save"
                  enctype="multipart/form-data">
                <h4 style="color:#bf1a20;font-size:22px;line-height: 22px;font-weight: bold;text-align: center;">
                    申诉信息</h4>


                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class="control-label"
                           style="width: 100px;display: inline-block;text-align: right;">信用记录类型:</label>
                    <select class="form-control form-control-static" style="width: 200px; display: inline-block;">
                        <option value="1">金融信贷信息</option>
                    </select>
                    <select id="appea_info_type" name="appeaInfoType" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">银行信贷信息</option>
                        <option value="2">大公平台信贷信息</option>
                        <option value="3">其他借贷信息</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">申诉原因:</label>
                    <select id="appeal_reason" name="appealReason" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">平台不良行为(信用黑名单)申诉</option>
                        <option value="2">信用信息增补</option>
                        <option value="3">信用信息更新</option>
                        <option value="4">信用信息不实删除</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class="control-label"
                           style="width:100px;display:inline-block;text-align:right;vertical-align:113px;">描述:</label>
                    <textarea name="appealExplain" class="form-control" rows="6"
                              style="width:400px;resize: none;border-radius:10px;display: inline-block;"></textarea>

                    <div class="form-group" style="width: 100%;">
                        <label name="attachment" class=" control-label"
                               style="width: 100px;display: inline-block;text-align: right;">附件:</label>
                        <input type="hidden" id="attachmentName" name="attachmentName"/>
                        <input type="hidden" id="attachment" name="attachment"/>
                        <input id="inputfile" type="file" name="file"/>
                    </div>
                </div>
                <div class="form-group" style="width: 100%;">
                    <p style="width: 100%;padding-left: 200px;">
                        <input type="hidden" name="id" id="id"/>

                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<!--申诉弹窗部分结束-->


<div class="clearfix"></div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


</body>

<script type="text/javascript">


    $(function () {
        $("#changeZero").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=0"
        });
        $("#changeOne").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=1"
        });
        $("#changeTwo").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=2"
        });
    });


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
