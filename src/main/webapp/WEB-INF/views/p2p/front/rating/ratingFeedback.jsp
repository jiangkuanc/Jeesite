<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>


    <title>意见书</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/diyUpload/css/webuploader.css">
    <link rel="stylesheet" href="${ctxStatic}/diyUpload/css/diyUpload.css">
    <link rel="stylesheet" href="${ctxStatic}/diyUpload/css/zhzl.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/diyUpload/js/webuploader.html5only.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/diyUpload/js/diyUpload.js"></script>
    <script type="text/javascript" src="${ctxStatic}/diyUpload/js/zhzl.js"></script>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: '微软雅黑';
        }

        .position-paper {
            width: 100%;
            font-family: '微软雅黑';
            font-size: 16px;
            color: #333333;
        }

        .position-paper-content {
            width: 76.38%;
            margin: 0 auto 50px;
        }

        .position-paper-title {
            width: 100%;
            height: 50px;
        }

        .position-paper-title a {
            display: inline-block;
            color: #999999;
            font-size: 12px;
            width: 49%;;
            height: 50px;
            line-height: 50px;
        }

        .position-paper-title a:first-child {
            text-align: left;
        }

        .position-paper-title a:last-child {
            text-align: right;
        }

        .position-paper-btn {
            width: 100%;
            height: 36px;
            margin-top: 30px;
            overflow: hidden;
        }

        .position-paper-btn button {
            color: #fff;
            background: #2481e0;
            border-radius: 5px;
            text-align: center;
            line-height: 36px;
            height: 36px;
            margin-right: 29px;
            float: right;
            width: 78px;
            border: none;
        }

        /*意见书内容*/
        .position-paper-text {
            width: 100%;
            border-bottom: 1px dashed #9f9f9f;
            margin-bottom: 25px;
        }

        .position-paper-text h3, .position-paper-text2 h3 {
            width: 100%;
            height: 25px;
            text-align: center;
            line-height: 25px;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 22px;
        }

        .position-paper-text p {
            font-family: '微软雅黑';
            text-indent: 2em;
            font-size: 20px;
            color: #333333;
            line-height: 45px;
            font-weight: 600;
            background: #fff;
            border: none;
            margin: 0 auto;
            display: block;
            text-align: left;
            word-spacing: 12px;
        }

        /*信用等级征求意见书回执单*/
        .position-paper-text2 {
            width: 100%;
            font-family: '微软雅黑';
        }

        .position-paper-text2 p {
            font-family: '微软雅黑';
            font-size: 16px;
            color: #333333;
            line-height: 35px;
            font-weight: 600;
        }

        .position-paper-text2 span {
            font-family: '微软雅黑';
            font-size: 16px;
            color: #333333;
            line-height: 35px;
            font-weight: 600;
        }

        .position-paper-text2 form {
            width: 100%;
            margin-top: 30px;
        }

        .position-paper-text2 form div {
            width: 20%;
            margin: 0 auto;
            font-size: 16px;
            color: #333333;
            line-height: 35px;
            font-weight: 600;
        }

        .position-paper-text2 form .last-div {
            position: relative;
            width: 43%;
            margin: 0 auto;
            font-size: 16px;
            color: #333333;
            line-height: 35px;
            font-weight: 600;
        }

        .position-paper-text2 form textarea {
            width: 81.5%;
            height: 125px;
            margin-top: 10px;
            border-radius: 5px;
            margin-left: 100px;
            resize: none;
        }

        .position-paper-text2 form .option-last {
            display: inline-block;
            position: absolute;
            top: 0;
            left: 0;
        }

        .form-btn {
            margin: 0 auto;
        }

        .form-btn button {
            color: #fff;
            width: 85px;
            height: 30px;
            background: #f2434a;
            text-align: center;
            line-height: 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }

        .form-btn button:last-child {
            margin-left: 30px;
        }

        #upload-form {
            width: 100%;
            font-size: 18px;;
            color: #333;
        }

        #upload-form button {
            color: #fff;
            width: 60px;
            height: 26px;
            border-radius: 5px;
            border: none;
            line-height: 26px;
            color: #fff;
            background: #f2434a;
        }

        #upload-form input {
            border-radius: 5px;
            border: 1px solid #cccccc;
            height: 29px;
            width: 146px;
        }

        @media screen and (min-width: 1500px) {
            .position-paper-text h3, .position-paper-text2 h3 {
                font-size: 22px;
            }

            .position-paper-text pre, .position-paper-text2 p, .position-paper-text2 span, .position-paper-text2 form div, .position-paper-text2 form label {
                font-size: 20px;
                word-spacing: 15px;
                line-height: 50px;
            }
        }

        .shc {
            position: absolute;
            right: 0;
            top: -5px;
            height: 30px;
            line-height: 25px;
        }

        .parentFileBox .diyStart {
            height: 30px;
            line-height: 25px;
            position: absolute;
            right: 0;
            top: -3px;
            z-index: 2;
        }

        .parentFileBox {
            position: static;
            margin-left: 90px;
        }
    </style>
    <style>
        #upload {
            width: 500px;
            margin-left: 33.5%;
            position: relative;
        }

        #input_show_lab {
            font-size: 20px;
            font-family: "微软雅黑";
        }

        #input_show {
            width: 190px;
            border-radius: 3px;
            border: 1px solid #999;
            height: 30px;
        }

        @media screen and (max-width: 1440px) {
            #input_show_lab {
                font-size: 16px;
                font-family: "微软雅黑";
            }
        }
    </style>
</head>
<body>

<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户设置页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>我的位置：</b></li>
        <li class="lg-active">查看意见书</li>
    </ol>
</div>
<!--中间content-->
<div class="position-paper">
    <div class="position-paper-content">
        <div class="position-paper-btn">
            <a
                    href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport2?fid=${rating.p2pRatingServiceInfo.id}">
                <button>下载报告</button>
            </a>
        </div>
        <div class="position-paper-text">
            <h3>信用等级征求意见书</h3>
            <p>
                受贵公司委托,作为贵公司${rating.p2pRatingServiceInfo.ratingName}的评级方，在遵循了国家有关法律法规和公司有关制度的基础上，履行了既定的评级制度，规程，采用了应该使用的评级，评审手段和方法，得出了严谨的、务实的评级结论，评定贵公司主体级别为：${rating.mainCreditGrade}
            </p>
            <p>
                现将评审报告发送给贵公司，请在收到本征求意见书的两个工作日内，将征求意见书回执单（盖章版）通过书面传真或图片格式回复，可针对报告相关论断，表达等报告内容提出反馈意见。
            </p>
            <p>
                如对信用等级有异议的，可在收到本征求意见书后两个工作日内申请复评一次，并可与之后的五个工作日内提供补充材料，大公将在收到贵公司补充材料之后组织复评。
            </p>
            <p>若未按时回执，视同贵公司接受评级结果。</p>
            <p>请予合作为盼</p>
            <p>大公信用数据有限公司</p>
            <p>
                <fmt:formatDate value="${rating.publishTime}" pattern="yyyy年MM月dd日"/>
            </p>
            <p>统一客服电话：4008-84-4008 010-83032098（7*24）</p>
        </div>
        <div class="position-paper-text2">
            <h3>信用等级征求意见书回执单</h3>
            <p>大公信用数据有限公司：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我公司已收到贵公司对${rating.p2pRatingServiceInfo.ratingName}的评级结果，并对评级结果表示：</p>
            <form id="defaultForm" action="${ctx}/rating/front/receiptRecord" method="post"
                  enctype="mulitipart/form-data" class="clearfix">
                <input type="hidden" name="token" value="${token}"/>
                <input type="hidden" id="fid" name="financingInformationId" value="${rating.p2pRatingServiceInfo.id}"/>
                <div>
                    <input type="radio" name="viewType" value="1" checked="checked">
                    <span>对评级报告内容有异议</span>
                </div>
                <div>
                    <input type="radio" name="viewType" value="2">
                    <span>对主体级别有异议</span>
                </div>
                <div>
                    <input type="radio" name="viewType" value="3">
                    <span>同意评级结果和内容</span>
                </div>
                <div class="last-div">
                    <label class="option-last" for="customer-opinion">具体意见:</label>
                    <textarea name="viewExplain" id="customer-opinion"></textarea>
                </div>
            </form>
        </div>
    </div>
</div>
<!--上传部分-->
<div id="upload_some" style="width: 100%;margin:0 auto;">
    <div id="upload" style="display:none;">
        <label for="input_show" id="input_show_lab">上传文件:&emsp;</label> <input
            type="text" id="input_show" placeholder="请上传文件" readonly style="border-radius:5px;margin-left: 14px">
        <div id="as"></div>
        <span class="shc">开始上传</span>
    </div>
    <div class="form-btn" style="margin:88px 0 50px 42%;">
        <button type="button" onclick="submit()">提交</button>
        <button type="button" onclick="link()">取消</button>
    </div>
</div>


<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    var $videoInput = $("input[type=radio]");
    $videoInput.each(function (index, item) {
        var _this = this;
        $(this).click(function () {
            var d = $("input[type=radio]:checked").siblings("span").html();
            if (d == "对主体级别有异议") {
                $("#upload").show();
                initialize();
                initializeCss();
            } else {
                $("#upload").hide();
            }
        })
    });
    //初始化插件
    var fid = '${rating.p2pRatingServiceInfo.id}';
    initialize();
    function initialize() {
        $('#as').diyUpload({
            url: '${ctx}/rating/front/uploadReviewDoc?financingInformationId=' + fid,
            success: function (data) {
                $('.diyStart').each(function () {
                    if ($(this).html() == '暂停上传') {
                        $(this).click();
                    }
                });
            },
            error: function (err) {
                console.info(err);
            },
            buttonText: '浏览',
            chunked: true,
            // 分片大小
            chunkSize: 512 * 1024,
            //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
            fileNumLimit: 50,
            fileSizeLimit: 500000 * 1024,
            fileSingleSizeLimit: 50000 * 1024,
            accept: {
                title: "Images",
                extensions: "jpg,jpeg,bmp,png",
                mimeTypes: "image/*"
            }
        });

        initializeCss();//
    }
    function initializeCss() {
        //获取$对象
        var $uploadBtn = $("#upload .webuploader-pick");
        var $uploadBtn2 = $("#upload_up");
        $uploadBtn.css({//浏览
            "background": "#f2434a",
            "height": 30,
            "width": 80,
            "line-height": 0.5,
            "position": "absolute",
            "top": -32,
            "right": 80
        });
        $uploadBtn2.css({//上传
            "background": "#f2434a",
            "height": 30,
            "width": 80,
            "border": "none",
            "border-radius": 3,
            "text-indent": "center",
            "color": "#ffffff",
            "position": "absolute",
            "top": 0,
            "right": -40
        });
    }
</script>
<script type="text/javascript">
    function link() {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }
    function submit() {
        var viewType = $("input[name='viewType']:checked").val();
        if (viewType == 2) {
            if ($('.fileBoxUl').children().length < 1) {
                alert('请上传材料');
                return;
            } else {
                var flag = 1;
                $($('.fileBoxUl').children()).each(function () {
                    if ($(this).attr('class') != '') {
                        flag = 0;
                    }
                });
                if (flag == 0) {
                    alert('请上传材料');
                    return;
                }
            }

        }
        if ($('#customer-opinion').val().trim() == '') {
            alert('请填写具体意见');
            return;
        }
        if ($('#customer-opinion').val().length > 20) {
            alert('请输入20字以内');
            return;
        }
        $('#defaultForm').submit();
    }
</script>
</body>
</html>