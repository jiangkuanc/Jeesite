<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <style>
        .credit-text {
            width: 800px;
            margin: 0 auto;
        }

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
            width: 800px;
            float: right;
            margin: none;
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
            <li id="changeZero" class="two" style="width:30%"><span class="border">我的信用记录</span></li>
            <li id="changeOne" class="two border current currents" style="width:30%"><span
                    class="border-top">我的申诉记录</span></li>
            <li id="changeTwo" class="two border" style="width:30%"><span>我的举报记录</span></li>
            <div style="clear:both;"></div>
        </ul>

        <table class="table table-hover table-striped table-condensed"
               style="font-size: 14px;table-layout: fixed;border-collapse: separate;border-spacing: 0px 2px;">
            <thead>
            <tr class="active list-th">
                <td name="" style="width:5%">序号</td>
                <td name="appeaInfoType" style="word-wrap:break-word;word-break:break-all">信用记录类型</td>
                <td name="attachment" style="word-wrap:break-word;word-break:break-all;">附件</td>
                <td name="appealTime">申诉时间</td>
                <td name="auditStatus" style="width:10%">申请状态</td>

                <td>操作</td>
            </tr>
            </thead>
            <tbody id="itemContainer">
            <c:forEach items="${creditAppealInfoList}" var="creditAppealInfo" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${fns:getDictLabel(creditAppealInfo.appeaInfoType,'info_type','')}</td>
                    <td>

                        <c:if test="${creditAppealInfo.attachment!=null}">
                            <a style="color:blue"
                               href="${ctx}/creditmanage/creditAppealInfo/attachmentDownload?attachmentName=${creditAppealInfo.attachmentName}&attachment=${creditAppealInfo.attachment}">附件下载</a>
                        </c:if>
                    </td>
                    <td><fmt:formatDate value="${creditAppealInfo.appealTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${fns:getDictLabel(creditAppealInfo.auditStatus,'appeal_audit_state','')}</td>
                    <td><a style="color:blue;cursor:pointer" onclick="view('${status.index}')" id="view">查看</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="holder"></div>
    </div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" style="margin-top:10%;">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 700px;margin: 0 auto;">

            <div class="modal-header">
                <h4 style="color:#bf1a20;font-size:22px;line-height: 22px;font-weight: bold;text-align: center;">
                    申诉信息</h4>
            </div>
            <div class="modal-body" style="margin: 0 auto;">
                <table class="table table-striped table-bordered table-condensed mytable" style="text-align:center">
                    <tbody>
                    <tr>
                        <td>信息类型</td>
                        <td id="appeaInfoType"></td>
                    <tr>
                        <td>申诉原因</td>
                        <td id="appealReason"></td>
                    </tr>
                    <tr>
                        <td>申诉描述</td>
                        <td id="appealExplain"></td>
                    </tr>
                    <tr>
                        <td>申诉时间</td>
                        <td id="appealTime"></td>
                    </tr>
                    <tr>
                        <td>申请状态</td>
                        <td id="auditStatus"></td>
                    </tr>
                    <tr>
                        <td>附件</td>
                        <td id="attachmentName">
                            ${creditAppealInfo.attachmentName}&nbsp;&nbsp;&nbsp;
                            <c:if test="${creditAppealInfo.attachment!=null}">
                                <a href="${ctx}/creditmanage/creditAppealInfo/attachmentDownload?attachmentName=${creditAppealInfo.attachmentName}&attachment=${creditAppealInfo.attachment}">附件下载</a>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-left:48%">关闭</button>
                <br/><br/>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">

    $("#changeZero").click(function () {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=0"
    });
    $("#changeOne").click(function () {

        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=1"
    });
    $("#changeTwo").click(function () {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=2"
    });

    //js页面分页

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

        fenye("div.holder", "itemContainer")
    });


    function view(index) {
        <c:forEach items="${creditAppealInfoList}" var="creditAppealInfo" varStatus="status">
        if (${status.index}==index
    )
        {
            $('#appeaInfoType').text('${fns:getDictLabel(creditAppealInfo.appeaInfoType,'info_type','')}');
            $('#appealReason').text('${fns:getDictLabel(creditAppealInfo.appealReason,'appeal_category','')}');
            $('#appealExplain').text('${creditAppealInfo.appealExplain}');
            $('#attachmentName').html('${creditAppealInfo.attachmentName}&nbsp;&nbsp;&nbsp;' +
                '<c:if test="${creditAppealInfo.attachment!=null}">' +
                '<a href="${ctx}/creditmanage/creditAppealInfo/attachmentDownload?attachmentName=${creditAppealInfo.attachmentName}&attachment=${creditAppealInfo.attachment}">附件下载</a>' +
                '</c:if>');
            $('#appealTime').html('<fmt:formatDate value="${creditAppealInfo.appealTime}" pattern="yyyy-MM-dd HH:mm:ss"/>');
            $('#auditStatus').text('${fns:getDictLabel(creditAppealInfo.auditStatus,'appeal_audit_state','')}');
        }
        </c:forEach>
        $('#exampleModal').modal();

    };
</script>


</body>
</html>
