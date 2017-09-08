<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>一带一路国外政府概况</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath }">首页 </a></li>
        <li><a href="${ctx }/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx }/cms/cmsForeignCountry/toForeignCountryShowPage">一带一路政府概况</a></li>
        <li class="active"><a href="#">${cmsOneForeignCountry.cmsCountryName}</a></li>
    </ol>
</div>
<!--政府详情-->
<div class="contbox">
    <div class="pic_ttbox mgtop_30">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>
    <ul class="els_info">
        <li class="els_introduce mgtop_30">
            <div class="els_introduce_top elsintroduce">
                <div class="els_introduce_top-left pull-left" style="width:25%">
                    <h3><b>${cmsOneForeignCountry.cmsCountryName}</b>&nbsp;基本介绍</h3>
                </div>
                <div class="els_introduce_top-right pull-left" style="width:75%"></div>
                <div class="clearfix"></div>
            </div>
            <div class="els_text">
                <p>
                    ${cmsOneForeignCountry.cmsCountryBasic}
                </p>
            </div>
        </li>
        <li class="els_introduce mgtop_30">
            <div class="els_introduce_top">
                <div class="els_introduce_top-left pull-left">
                    <h3>地理位置</h3>
                </div>
                <div class="els_introduce_top-right pull-left">
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="els_text">
                <p>
                    ${cmsOneForeignCountry.cmsCountryPosition}
                </p>
            </div>
        </li>
        <li class="els_introduce mgtop_30">
            <div class="els_introduce_top">
                <div class="els_introduce_top-left pull-left">
                    <h3>人口民族</h3>
                </div>
                <div class="els_introduce_top-right pull-left">
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="els_text">
                <p>人口</p>
                <p>
                    ${cmsOneForeignCountry.cmsCountryPopulation}
                </p>
                <p>民族</p>
                <p>
                    ${cmsOneForeignCountry.cmsCountryNation}
                </p>
            </div>
        </li>
    </ul>
</div>
<div class="index-footer-top">
    <div class="index-footer-top-content">
        <dl class="pull-left">
            <dt>关于我们&nbsp;&nbsp;&nbsp;|</dt>
            <dd>平台简介</dd>
            <dd>管理团队</dd>
            <dd>平台新闻</dd>
        </dl>
        <dl class="pull-left">
            <dt> &nbsp;&nbsp;&nbsp;服务条款 &nbsp;&nbsp;&nbsp;|</dt>
            <dd class="fotter-dd">费用说明</dd>
            <dd class="fotter-dd">服务权责</dd>
        </dl>
        <dl class="pull-left">
            <dt> &nbsp;&nbsp;&nbsp;免责声明 &nbsp;&nbsp;&nbsp;|</dt>
            <dd class="fotter-dd">融资免责</dd>
            <dd class="fotter-dd">投资免责</dd>
        </dl>
        <dl class="pull-left">
            <dt> &nbsp;&nbsp;&nbsp;联系我们 &nbsp;&nbsp;&nbsp;|</dt>
            <dd class="fotter-dd">客服热线</dd>
            <dd class="fotter-dd">在线客服</dd>
        </dl>
        <dl class="pull-left">
            <dt> &nbsp;&nbsp;&nbsp;帮助中心 &nbsp;&nbsp;&nbsp;|</dt>
            <dd class="fotter-dd">产品介绍</dd>
            <dd class="fotter-dd">新手指南</dd>
            <dd class="fotter-dd">常见问题</dd>
        </dl>
        <dl class="pull-left">
            <dt> &nbsp;&nbsp;&nbsp;网站地图</dt>
        </dl>
    </div>
</div>
<div class="index-footer-bot">
    <div class="index-footer-bot-content">
        <p>ICP:XXXXXXX 大公互联网金融信用信息平台&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright 1994-2016. All R</p>
    </div>
</div>
</body>
</html>











