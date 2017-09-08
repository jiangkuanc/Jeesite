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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shenqing.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/tabs.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/diyUpload.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/diyUpload/css/webuploader.css" type="text/css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/diyUpload.js"></script>
    <script type="text/javascript" src="${ctxStatic}/diyUpload/js/webuploader.html5only.min.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>

    <script type="text/javascript">
        var list = '${docList}'
        var fid;
        var tempId;
        var idd;
        function uploadDoc(id, tempName, financingInfoId, rateDocTempId) {
            var path = $('#path').val();
            var str = '';
            var obj = eval('(' + list + ')');
            for (var key in obj) {
                var p2p = obj[key];
                if (p2p.p2pRateDocumentTemplate.id == rateDocTempId) {
                    $('#modalName').html(p2p.p2pRateDocumentTemplate.tempName);
                    idd = p2p.id;
                    fid = p2p.financingInformationId;
                    tempId = p2p.p2pRateDocumentTemplate.id;
                    for (var i in p2p.p2pDocumentUploadRecordList) {
                        var doc = p2p.p2pDocumentUploadRecordList[i];
                        var docId = "'" + doc.fileId + "'";
                        var del = "'" + doc.id + "'";
                        str += '<li id=' + doc.id + ' class="">' +
                            '<div class="viewThumb"><img src="' + doc.fileAddress + '" alt=""/></div>' +
                            '<div class="diyCancel" style="display: inline;" onclick="del(' + docId + ',' + del + ')"></div>' +
                            '<div class="diyFileName">' + doc.fileName + '</div></li>';
                    }
                }
            }
            $('#as').diyUpload({
                url: '${ctx}/document/documentUpload?rateDocumentTempId=' + tempId + '&financingInformationId=' + fid,
                success: function (data) {
                    var $lastChild = $('.fileBoxUl li .diyCancel:last');
                    $('.diySuccess').remove();
                    $('.diyCancel').show();
                    $lastChild.click(function () {
                        del(data);
                    });
                },
                error: function (err) {
                    console.info(err);
                },
                buttonText: '选择文件',
                chunked: true,
                // 分片大小
                chunkSize: 5000 * 1024,
                //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
                fileNumLimit: 1,
                fileSizeLimit: 50000 * 1024,
                fileSingleSizeLimit: 5000 * 1024,
                accept: {
                    title: "Images",
                    extensions: "jpg,jpeg,bmp,png",
                    mimeTypes: "image/*"
                }
            });
            $(".webuploader-pick").click(function () {
                $(this).next().find("input").trigger("click");
                //this.focus();
            });
            $('.btn-primary').bind('click', function () {
                mit();
            });
            $('.fileBoxUl').html(str);
            $('#myModal').modal();
        }

        function mit() {
            $.ajax({
                type: 'POST',
                url: '${ctx}/document/updateIsReject',
                data: {id: idd},
                success: function () {
                    $('#myModal').modal('hide');
                    sub();
                }
            });
        }

        function sub() {
            $('#tr' + idd).remove();
            change();
        }
        var fid2 = '${financingInformationId}';
        function change() {
            if ($('#dtb').html().toString().trim() == '') {
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/document/updateFinancState',
                    data: {id: fid2},
                    success: function () {
                        window.location.href = '${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp';
                    }
                });
            }
        }
        function edg() {
            window.location.reload();
        }
        $(function () {
            change();
        });
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left jianjie shenq" style="width:72.5%;padding-bottom:30px;">
    <p class="shenqp pull-left">您好,<span>${p2pRegUserCertify.realName}</span>,您的评级材料出现问题，请重新进行提交</p><br/><br/>
    <input type="hidden" id="path" value="${fns:getConfig('filePath')}"/>
    <h2>申请进度：</h2>
    <div class="onlyone">
        <img src="${ctxStatic}/dist/images/jindu/4.jpg"" alt="" style="margin-left: 7%;margin-top: 5%">
        <span class="span1"><br></span>
        <span class="span2"><br></span>
        <span class="span3"><br></span>
        <span class="span4"><br></span>
        <span class="span5"><br></span>
        <span class="span6"><br></span>
        <span class="span7"><br></span>
        <span class="span8"><br></span>
        <span class="span9"><br></span>
        <span class="span10"><br></span>
        <span class="span11"><br></span>
        <span class="span12"></span>
    </div>
    <div class="tabs">
        <ul>
            <li class="two currents current"><span class="border border-top">已提交的材料</span></li>
            <li class="two border" id="commit"><span>待提交的材料</span></li>
            <li class="two border "><span>评级结果</span></li>
            <li class="two border"><span>我的订单</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu">
            <div class="one current2">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>材料名称</th>
                        <th>提交时间</th>
                        <th>状态</th>
                        <th>操作</th>
                        <th>审核详情</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rateDocument1}" var="doc1">
                        <c:choose>
                            <c:when test="${doc1.p2pRateDocumentTemplate.tempType == 3}">
                                <tr>
                                    <td>${doc1.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc1.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td><a href="javascript:sony('${doc1.financingInformationId}','${doc1.id}')">查看</a>
                                    </td>
                                    <td>无</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>${doc1.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc1.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td>
                                        <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${doc1.financingInformationId}&rateDocumentTempId=${doc1.rateDocumentTempId}">下载</a>
                                    </td>
                                    <td>无</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>材料名称</th>
                        <th>提交时间</th>
                        <th>状态</th>
                        <th>操作</th>
                        <th>审核详情</th>
                    </tr>
                    </thead>
                    <tbody id="dtb"><c:forEach items="${rateDocument2}" var="doc2">
                        <c:choose>
                            <c:when test="${doc2.p2pRateDocumentTemplate.tempType == 3}">
                                <tr id="tr${doc2.id}">
                                    <td>${doc2.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc2.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>待修改</td>
                                    <td>
                                        <a href="javascript:sendForm('${doc2.financingInformationId}','${doc2.id}')">修改</a>
                                    </td>
                                    <td>${doc2.rejectReason}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr id="tr${doc2.id}">
                                    <td>${doc2.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc2.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>待提交</td>
                                    <td>
                                        <a href="javascript:uploadDoc('${doc2.id}','${doc2.p2pRateDocumentTemplate.tempName}','${doc2.financingInformationId}','${doc2.p2pRateDocumentTemplate.id}')">提交</a>
                                    </td>
                                    <td>${doc2.rejectReason}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach></tbody>
                </table>
            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>借款项目名称</th>
                        <th>完成时间</th>
                        <th>状态</th>
                        <th>级别</th>
                        <th>评级报告</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="one">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>订单类别</th>
                        <th>生成时间</th>
                        <th>费用额度（元）</th>
                        <th>状态</th>
                        <th>支付时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                </table>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1000px;top:-300px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                </h4>
            </div>
            <div class="modal-body" style="width: 1000px;height: 500px">
                <label class="col-lg-3 control-label" id="modalName"></label>
                <input id="file" type="file" name="file" class="webuploader-element-invisible" multiple="multiple"
                       accept="image/bmp,image/jpeg,image/jpg,image/png">

                <div id="as"></div>
                <div class="parentFileBox" style="width: 900px;">
                    <ul class="fileBoxUl"></ul>
                </div>

            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" value="确   定"/>
                <button type="button" class="btn btn-default" style="width:6%;height:35px;"
                        data-dismiss="modal" onclick="xbox()">关闭
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1000px;top:-300px;">
        <div class="modal-content">
            <div class="modal-header" style="height: 45px">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                </h4>
            </div>
            <div class="modal-body" style="width: 1000px;height: 500px">
                <label class="col-lg-3 control-label" id="modalName"></label>
                <!-- 基本信息内容 -->

            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" value="确   定"/>
                <button type="button" class="btn btn-default" style="width:6%;height:35px;"
                        data-dismiss="modal" onclick="xbox()">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    //删除按钮绑定函数
    function del(id, del) {
        $.ajax({
            type: 'POST',
            url: '${ctx}/document/delDocById',
            data: {fileId: id},
            dataType: 'text',
            success: function () {
                $('#' + del).remove();
            },
            error: function () {
                console.log("error");
            }
        });
    }
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
    function sendForm(fid, rdid) {
        post('${ctx}/application/preUpdateApp', {financingInformationId: fid, rateDocumentId: rdid})
    }
    function sony(fid, rdid) {
        post('${ctx}/application/viewAppInfo', {financingInformationId: fid, rateDocumentId: rdid});
    }
</script>


</body>
</html>
