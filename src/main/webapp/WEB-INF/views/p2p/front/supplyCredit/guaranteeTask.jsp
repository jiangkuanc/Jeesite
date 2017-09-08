<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的担保任务</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style type="text/css">
        #content {
            width: 76.39%;
            margin: 0 auto;
            overflow: hidden;
        }

        #content .content_right {
            width: 80%;
            height: 782px;
            background: #fff;
            float: right;
            text-align: center;
        }

        #content tr th {
            text-align: center;
            height: 50px;
            font-size: 12px;
            color: #5a5a5a;
            font-family: "Microsoft YaHei";
            line-height: 30px;
            background: #ebeaea;
        }

        #content tr td {
            height: 40px;
            color: #8d8d8d;
        }

        #content tbody tr:hover {
            background: #ebeaea;
        }

        #content tr, #content tr th, #content tr td, #content .table-bordered {
            border: none;
        }

        tr td a {
            display: inline-block;
            width: 60px;
            height: 28px;
            text-align: center;
            line-height: 28px;
            color: #fff;
            border-radius: 3px;
            text-decoration: none;
        }

        tr td a:hover {
            color: #ffffff;
            text-decoration: none;
        }

        tr .a1 a {
            background: #2481e0;
        }

        tr .a2 a {
            background: #f14349;
        }

        #content .active-xh {
            color: #2481e0;
        }

        #content .zhzl {
            border: 1px solid #d6d7dc;
        }
    </style>

</head>

<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<%@include file="/WEB-INF/views/p2p/front/supplyCredit/guaranteeMenu.jsp" %>
<!--右边区域-->
<div class="content_right">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>增信时间</th>
            <th>公司名称</th>
            <th>审核结果</th>
            <th>担保函</th>
            <th>担保合同</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr style="height:7px;width:100%"></tr>
        <!--信息内容-->
        <c:forEach items="${list}" var="obj" varStatus="i">
            <c:if test="${obj.isReject == null}">
                <tr>
                    <td class="active-xh" style="color: #8d8d8d">${i.index+1}</td>
                    <td>-</td>
                    <td>${obj.p2pEnterpriseCertify.enterpriseName}</td>
                    <td style="color:#f14349">待提交</td>
                    <td class="a1">------</td>
                    <td class="a1">------</td>
                    <td class="a2"><a href="javascript:showForm('${obj.p2pFinancingInformation.id}',
                '${obj.p2pEnterpriseCertify.enterpriseName}','${obj.p2pFinancingInformation.applicantsId}')">提交</a></td>
                </tr>
            </c:if>
            <c:if test="${obj.isReject == 1}">
                <tr>
                    <td class="active-xh" style="color: #8d8d8d">${i.index+1}</td>
                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.p2pBeforeMatchDebtState.stateTime}"/></td>
                    <td>${obj.p2pEnterpriseCertify.enterpriseName}</td>
                    <td style="color:#08ba19">已通过</td>
                    <td class="a1"><a href="javascript:showImg('${obj.letterIntent}')">查看</a></td>
                    <td class="a1"><a href="javascript:showImg('${obj.guaranteeContract}')">查看</a></td>
                    <td class="a1">------</td>
                </tr>
            </c:if>
            <c:if test="${obj.isReject == 2}">
                <tr>
                    <td class="active-xh" style="color: #8d8d8d">${i.index+1}</td>
                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.p2pBeforeMatchDebtState.stateTime}"/></td>
                    <td>${obj.p2pEnterpriseCertify.enterpriseName}</td>
                    <td style="color:#f14349">未通过</td>
                    <td class="a1">------</td>
                    <td class="a1">------</td>
                    <td class="a2"><a href="javascript:showForm('${obj.p2pFinancingInformation.id}',
                '${obj.p2pEnterpriseCertify.enterpriseName}','${obj.p2pFinancingInformation.applicantsId}')">提交</a></td>
                </tr>
            </c:if>
            <c:if test="${obj.isReject == 0}">
                <tr>
                    <td class="active-xh" style="color: #8d8d8d">${i.index+1}</td>
                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.p2pBeforeMatchDebtState.stateTime}"/></td>
                    <td>${obj.p2pEnterpriseCertify.enterpriseName}</td>
                    <td style="color:#2481e0">待审核</td>
                    <td class="a1"><a href="javascript:showImg('${obj.letterIntent}')">查看</a></td>
                    <td class="a1"><a href="javascript:showImg('${obj.guaranteeContract}')">查看</a></td>
                    <td class="a2">------</td>
                </tr>
            </c:if>
            <c:if test="${obj.isReject == 3}">
                <tr>
                    <td class="active-xh" style="color: #8d8d8d">${i.index+1}</td>
                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.p2pBeforeMatchDebtState.stateTime}"/></td>
                    <td>${obj.p2pEnterpriseCertify.enterpriseName}</td>
                    <td style="color:#2481e0">债项结束</td>
                    <td class="a1"><a href="javascript:showImg('${obj.letterIntent}')">查看</a></td>
                    <td class="a1"><a href="javascript:showImg('${obj.guaranteeContract}')">查看</a></td>
                    <td class="a2">------</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<!-- 模态框1（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 40%;">
        <div class="modal-content" style="margin-top: 10%">
            <!-- <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div> -->
            <div class="modal-body" id="modal-body1">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框2（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div> -->
            <form id="myForm" action="${ctx}/user/Guarantee/finishTask" method="post" enctype="multipart/form-data">
                <div class="modal-body" id="modal-body2">
                    <input type="hidden" id="fid" name="financingInformationId" value=""/>
                    <input type="hidden" id="uid" name="applicantsId" value=""/>
                    <table style="border-collapse:separate; border-spacing:20px;" class="noWrap">
                        <tr>
                            <td align="right">企业名称：</td>
                            <td id="span1"></td>
                        </tr>
                        <tr>
                            <td align="right">联系人：</td>
                            <td id="span2"></td>
                        </tr>
                        <tr>
                            <td align="right">联系电话：</td>
                            <td id="span3"></td>
                        </tr>
                        <tr>
                            <td align="right">担保函：</td>
                            <td><input id="file1" type="file" name="file" required="required"/></td>
                        </tr>
                        <tr>
                            <td align="right">担保合同：</td>
                            <td><input id="file2" type="file" name="file" required="required"/></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width:15%;height:35px;">
                        关闭
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    var contentHeight = $("#content .content_right").height();
    $("#content .zhzl").height(contentHeight)
        .css("margin-bottom", 0);
</script>
<script type="text/javascript">
    function showImg(addr) {
        $('#modal-body1').html('<img width="100%" height="50%" alt="" src="' + addr + '">');
        $('#myModal1').modal();
    }
    function showForm(fid, enterpriseName, applicantsId) {
        $.ajax({
            type: 'POST',
            url: '${ctx}/user/p2pUserInformation/findContactInfo',
            dataType: 'json',
            data: {'userId': applicantsId},
            success: function (data) {
                $('#span1').html(enterpriseName);
                $('#span2').html(data.contactName);
                $('#span3').html(data.contactPhone);
                $('#fid').val(fid);
                $('#uid').val(applicantsId);
            }
        });
        $('#file1').val('');
        $('#file2').val('');
        $('#myModal2').modal();
    }
    function submit() {
        $('#myForm').submit();
    }
</script>
</body>
</html>
