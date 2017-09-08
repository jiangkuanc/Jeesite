<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>服务条款</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">网站协议</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">网站协议</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <!--  <p class="zhtext "><a href="javascript:;" >服务条款简介</a></p> -->
                <ul class="zhzllevel2">
                    <li class="tzsy"><a href="${ctx}/cms/article/serviceResponsibilities">服务条款</a></li>
                    <li><a href="${ctx}/cms/article/disclaimer">免责声明</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <div class="zh-right pull-left contect" style="padding-top:0">
        <div class="clearfix"></div>
        <div class="contectnei">
            <p>一、宗旨</p>
            <p>树立企业良好信用形象，提高诚信企业知名度，增强企业竞争力；促进企业加强信用管理，防范经营风险；推进信用体系建设，为市场经济健康发展贡献力量。</p>
            <p>二、工作方针</p>
            <p>调查客观、评价公正、标准科学、操作规范、重在提高。</p>
            <p>三、评价内容</p>
            <p>1、资本运营：资本实力、偿债能力、营运能力、经济效益。</p>
            <p>2、产品质量：设施条件、产品质量、性能、售后服务、交货及时性、样本及广告宣传真实性、用户满意度。</p>
            <p>3、社会行为：证照齐全有效、及时足额完税、劳动保险、水、电等各种行政、事业、公益企业费用缴纳情况。</p>
            <p>4、经营者素质及企业管理：经营层、管理层人员素质、能力、业绩、劳动生产率、企业形象、管理水平、方法。</p>
            <p>5、发展趋势：上年销售额、利润、资本金增长趋势、产业政策环境、行业发展趋势、市场需求趋势。</p>
            <p>四、评价方法与结论</p>
            <p>依照《企业信用评价内容和评分标准》，考察企业近两年的信用记录，评估未来两年的信用能力，用计分法按国际通行的四等十级制即信用企业（AAA、AA、A）、守信企业（BBB、BB、B）
                信用警示企业（CCC、CC、C）、失信企业（D）评定信用等级，颁发证书和评价报告。评价结论规范用语示例：“AAA级信用企业”，评价证书信息在中国企业信用评价网www.cecrec.com和商务部全国行业信用公共服务平台bcp.12312.gov.cn公示查询.</p>
        </div>
    </div>

    <div class="clearfix"></div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>