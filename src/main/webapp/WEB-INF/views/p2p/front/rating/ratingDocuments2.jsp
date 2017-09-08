<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/fileinput.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/dist-gyh/css/zhzl.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js"></script>
    <style>
        .clsc {
            width: 690px;
        }

        .mbxz {
            padding: 3px 10px;
        }

        .file-input {
            overflow-x: initial;
            display: inline-block;
            vertical-align: top;
        }

        .file-input .input-group-btn .btn {
            display: inline-block;
            width: 60px;
            line-height: 12px;
            height: 26px;
            background-color: #f2434a;
            border-color: #f2434a;
            border-radius: 5px;
            color: #fff;
            margin-left: 10px;
        }

        #qycwcl-list .btn-file {
            border-radius: 5px;
        }

        .btn-file .glyphicon-folder-open, .glyphicon-upload, .file-input .input-group-btn .fileinput-remove-button {
            display: none;
        }

        .file-input .input-group {
            width: 350px;
        }

        .file-input .form-control {
            height: 26px;
            width: 220px;
        }

        .file-input .kv-has-ellipsis .file-caption-ellipsis {
            display: none;
        }

        .file-caption-name, .file-drop-zone-title {
            display: none;
        }

        .file-preview {
            margin-top: 10px;
            width: 372px;
        }

        .file-preview-frame {
            height: 80px;
            width: 60px;
        }

        .file-drop-zone {
            margin: 0;
            border: none;
            padding: 0
        }

        .file-input .btn-default {
            width: 24px;
            height: 24px
        }

        .file-upload-indicator, .kv-file-upload {
            display: none
        }

        .file-preview-frame {
            position: relative
        }

        .file-thumbnail-footer {
            position: absolute;
            right: 0px;
            bottom: 0px
        }

        .file-input .close, .kv-upload-progress {
            display: none
        }

        .file-other-error {
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页 </a></li>
        <li><a href="${ctx}/user/p2pUserInformation/financingPermission">我要评级</a></li>
        <li class="lg-active">企业财务材料提交</li>
    </ol>
</div>

<!--内容区域-->
<div class="zh-con rzsq_con">
    <div class="renzheng">
        <p class="rzsq_pjcl">评级申请：评级材料</p>
        <h4 class="zhai-mima rz-h4">财务材料提交</h4>
        <ul class="cltj_scList" id="qycwcl-list">


        </ul>
        <div class="btn-box">
            <form action="${ctx}/rating/front/doDocApp" method="post" id="form1">
                <input type="hidden" name="token" value="${token}"/>
                <input type="hidden" id="fid" name="financingInformationId" value="${p2pFinancingInformation.id}"/>
            </form>
            <p class="btn_pbox"><a href="javascript:validate()">提交</a><a href="javascript:cancel()">取消</a></p>
        </div>
    </div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


<script>
    var fid = '${p2pFinancingInformation.id}';
    var arr = [];
    //加载模板
    $.ajax({
        async: false,
        type: 'POST',
        url: "${ctx}/document/loadDocumentTemp",
        data: {
            type: 2,
        },
        dataType: "json",
        success: function (d) {
            //console.log(d);
            $("#qycwcl-list").html(createHtml(d))

        },
        error: function () {
            alert("error")
        }
    });
    var inps = $('input[name="file"]');
    //上传
    $.each(inps, function (index, item) {
        $(this).fileinput({
            language: 'zh',//设置语言
            uploadUrl: '${ctx}/document/documentUpload?rateDocumentTempId=' + $(this).attr("data-id") + '&financingInformationId=' + fid,//ajax请求地址
            uploadAsync: false,//异步上传or同步上传,true为异步上传
            allowedPreviewTypes: ['image'],
            allowedFileExtensions: ['jpg', 'png', 'jpeg', 'bmp'],
            //initialPreview: arr[$(this).index()-1],
            browseLabel: "浏览",
            showCancel: false,
            deleteUrl: '111',
            maxFileCount: '3'
            //maxFileSize: 0,/单位为kb，如果为0表示不限制文件大小
        }).on('fileloaded', function (event, file, previewId, index, data) {
            $(".file-preview-image").css({"height": 80, "width": 60})
            $(this).parents(".file-input").find(".file-preview").show();
            //区分上否上传
            var $filePreviewFrame = $(this).parents(".file-input").find(".file-preview-frame");
            $.each($filePreviewFrame, function (index, item) {
                var $fileIndex = $(this).attr("data-fileindex");
                console.log($fileIndex)
                if ($fileIndex > 0 || $fileIndex == 0) {
                    $(this).css({"opacity": .6})
                }
            })
        }).on('filebatchuploadsuccess', function (event, data) {
            var $remove = $(this).parents(".file-input").find(".kv-file-remove");
            var len = -1;
            $remove.removeAttr("disabled");
            $remove.each(function (index, item) {
                if ($remove.eq(index).attr("data-fileid") == undefined) {
                    len++;
                    $remove.eq(index).attr("data-fileid", data.response[len]);
                }
            })
            $(this).parents(".file-input").find(".file-uploading").css({"opacity": 1})
            //上传完成之后的图片删除
            $(".kv-file-remove").off("click").on("click", function () {
                var fileId = $(this).attr("data-fileId");
                var $filePreviewFrame = $(this).parents(".file-preview-frame");
                var $filePreview = $filePreviewFrame.parents(".file-preview");
                $.ajax({
                    async: false,
                    type: 'POST',
                    url: "${ctx}/document/delDocById",
                    data: {
                        fileId: fileId,
                    },
                    dataType: "json",
                    success: function (d) {
                        if (d) {
                            $filePreviewFrame.remove();
                            if ($filePreview.find(".file-preview-frame").length == 0) {
                                $filePreview.hide()
                            }
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
            })


        });


    })

    $(".file-input").each(function (index, item) {
        $(this).find(".btn-file").insertBefore($(this).find(".fileinput-upload-button"));
        $(this).find(".input-group").insertBefore($(this).find(".file-preview"));
    })
    $(".file-input").on("click", ".kv-file-remove", function () {
        $(this).parents(".file-drop-zone").find(".file-error-message").hide();
        var $filePreview = $(this).parents(".file-preview");
        $(this).parents(".file-preview-frame").remove();
        if ($filePreview.find(".file-preview-frame").length == 0) {
            $filePreview.hide()
        }
    });

    //回显图片

    $.ajax({
        async: false,
        type: 'POST',
        url: "${ctx}/document/loadRateDocumentList",
        data: {
            financingInformationId: fid,
        },
        dataType: "json",
        success: function (d) {
            $.each(inps, function (index, item) {
                var Id = $(this).attr("data-id");
                var _this = this;
                $.each(d, function (index, item) {
                    if (item.rateDocumentTempId == Id) {
                        var num = $(_this).parents("li").index();
                        $(".file-preview-thumbnails").eq(num).html(createHtmlpic(item.p2pDocumentUploadRecordList));
                    }
                })
                if ($(this).parents(".file-input").find(".file-preview-frame").length == 0) {
                    $(this).parents(".file-input").find(".file-preview").hide();
                }
            })

        },
        error: function () {
            alert("error")
        }
    });

    //图片删除
    $(".kv-file-remove").off("click").on("click", function () {
        var fileId = $(this).attr("data-fileId");
        var $filePreviewFrame = $(this).parents(".file-preview-frame");
        var $filePreview = $filePreviewFrame.parents(".file-preview");
        $.ajax({
            async: false,
            type: 'POST',
            url: "${ctx}/document/delDocById",
            data: {
                fileId: fileId,
            },
            dataType: "json",
            success: function (d) {
                if (d) {
                    $filePreviewFrame.remove();
                    if ($filePreview.find(".file-preview-frame").length == 0) {
                        $filePreview.hide()
                    }
                }

            },
            error: function () {
                alert("error")
            }
        });
    })


    function createHtml(d) {
        var newHtml = "";
        $.each(d, function (index, item) {
            if (item.tempAddress) {
                if (item.isRequired == 0) {
                    newHtml += '<li class="clearfix">' +
                        '<div class="clsc pull-left form-group">' +
                        '<label  class="control-label">' + item.tempName + '<span>&nbsp;</span>：</label>' +
                        '<input id="as' + index + '" type="file" name="file" class="file-loading form-control" is-required="' + item.isRequired + '" data-id="' + item.id + '" multiple accept="image/bmp,image/jpeg,image/jpg,image/png">' +
                        '</div>' +
                        '<a href="' + item.tempAddress + '" class="mbxz pull-left">下载模板</a>' +
                        '<div class="pull-right scsm">' +
                        '<p>*说明 </p>' +
                        item.tempExplain
                    '</div>' +
                    '</li>';
                } else {
                    newHtml += '<li class="clearfix">' +
                        '<div class="clsc pull-left form-group">' +
                        '<label  class="control-label">' + item.tempName + '<span>&nbsp;*</span>：</label>' +
                        '<input id="as' + index + '" type="file" name="file" class="file-loading form-control" is-required="' + item.isRequired + '" data-id="' + item.id + '" multiple accept="image/bmp,image/jpeg,image/jpg,image/png">' +
                        '</div>' +
                        '<a href="' + item.tempAddress + '" class="mbxz pull-left">下载模板</a>' +
                        '<div class="pull-right scsm">' +
                        '<p>*说明 </p>' +
                        item.tempExplain
                    '</div>' +
                    '</li>';
                }
            } else {
                if (item.isRequired == 0) {
                    newHtml += '<li class="clearfix">' +
                        '<div class="clsc pull-left form-group">' +
                        '<label  class="control-label">' + item.tempName + '<span>&nbsp;</span>：</label>' +
                        '<input id="as' + index + '" type="file" name="file" class="file-loading form-control" is-required="' + item.isRequired + '" data-id="' + item.id + '" multiple accept="image/bmp,image/jpeg,image/jpg,image/png">' +
                        '</div>' +
                        '<div class="pull-right scsm">' +
                        '<p>*说明 </p>' +
                        item.tempExplain
                    '</div>' +
                    '</li>';
                } else {
                    newHtml += '<li class="clearfix">' +
                        '<div class="clsc pull-left form-group">' +
                        '<label  class="control-label">' + item.tempName + '<span>&nbsp;*</span>：</label>' +
                        '<input id="as' + index + '" type="file" name="file" class="file-loading form-control" is-required="' + item.isRequired + '" data-id="' + item.id + '" multiple accept="image/bmp,image/jpeg,image/jpg,image/png">' +
                        '</div>' +
                        '<div class="pull-right scsm">' +
                        '<p>*说明 </p>' +
                        item.tempExplain
                    '</div>' +
                    '</li>';
                }
            }

        })

        return newHtml
    }
    function createHtmlpic(d) {
        var newHtml = "";
        $.each(d, function (index, item) {
            //console.log(item)
            newHtml += '<div class="file-preview-frame" data-fileindex="-1">' +
                '<img src="' + item.fileAddress + '" class="file-preview-image"  style="width: 60px; height: 80px;">' +
                '<div class="file-thumbnail-footer">' +
                '<div class="file-actions">' +
                '<div class="file-footer-buttons">' +
                '<button type="button" class="kv-file-upload btn btn-xs btn-default" title="Upload file"><i class="glyphicon glyphicon-upload text-info"></i></button>' +
                '<button type="button" class="kv-file-remove btn btn-xs btn-default" title="Remove file" data-fileId="' + item.fileId + '" ><i class="glyphicon glyphicon-trash text-danger"></i></button>' +
                '</div>' +
                '<div class="file-upload-indicator" tabindex="-1" title="Not uploaded yet"><i class="glyphicon glyphicon-hand-down text-warning"></i></div>' +
                '<div class="clearfix"></div>' +
                '</div>' +
                '</div>' +
                '</div>'
        })
        return newHtml
    }
    //提交
    function validate() {
        var lens, len;
        var flag = true;
        $.each(inps, function (index, item) {
            var isRequired = inps.eq(index).attr('is-required');
            if (isRequired == 0) {
            } else {
                lens = inps.eq(index).parents(".file-input").find(".file-preview-frame").length;
                len = inps.eq(index).parents(".file-input").find(".file-preview-frame[data-fileindex='-1']").length;
                if (lens == 0) {
                    alert('请上传图片！！');
                    flag = false;
                    return false;
                } else if (lens != len) {
                    alert('请上传图片！！');
                    flag = false;
                    return false;
                }
            }
        });
        if (flag == true) {
            $('#form1').submit();
            //alert('已提交！！');
        }
    }
    //取消
    function cancel() {
        window.location.href = '${ctx}/user/p2pUserInformation/accountPermission';
    }

</script>
</body>
</html>