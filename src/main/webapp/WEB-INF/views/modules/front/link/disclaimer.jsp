<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
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

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="JavaScript:void(0)">网站协议</a></li>
        <%-- <li><a href="${ctx}/cms/article/serviceTerms">网站协议</a></li> --%>
        <li class="lg-active">免责声明</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <a href="javascript:void(0)"><h3 class="jianjietitle">网站协议</h3></a>
        <!--  <ul class="zhzl">
             <li data-i="0" class=" zhzllevel1  xiajian zhzl-li"> -->
        <!--  <p class="zhtext "><a href="javascript:;" >服务条款简介</a></p> -->
        <ul class="zhzllevel2 zhzl">
            <li><a href="${ctx}/cms/article/serviceResponsibilities">服务条款</a></li>
            <li class="tz-active"><a href="${ctx}/cms/article/disclaimer">免责声明</a></li>
        </ul>
        <!--   </li>
      </ul> -->
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <h3>免责声明</h3>
        <div style=" align:center;margin: 20px">
            <img src="${ctxStatic }/dist/images/aboutDagong.jpg" alt="大公概况" height="264" width="660">
        </div>
        <div style="text-indent:2EM;">

            <p>
                欢迎访问“丝路互金网”互联网金融信用信息服务平台（以下简称“本平台”）。本平台是由大公信用数据有限公司（以下简称“大公数据”）所有并提供发布信息、撮合交易服务的平台。本平台将根据下列各项使用条款（以下简称“本声明”）为您提供服务，敬请仔细阅读。您访问本平台或通过本平台办理投资业务，大公数据即视为您已详细阅读并认可以下全部条款：
            </p>

            <p>
                第一条
                大公数据力求其提供网站内容准确可靠，对出借人与借款人的资格条件、融资项目等信息的真实性、合法性进行必要审核。但大公数据不保证本平台所提供的信息或资料没有任何错误、遗漏或不实。本平台所载信息及资料应当仅供投资者一般性参考，本平台提供的任何资讯并不构成或视为买入、卖出的投资意见或建议。对于任何因内容不准确或遗漏或因根据本平台内容所作决定、行动或不行动而导致的损失或损害，大公数据概不负责。
            </p>
            <p>
                第二条 为了方便用户，本平台允许用户通过链接访问其他站点。但本平台无法保证其他站点的安全性和可靠性。用户由网站链接访问其他站点而造成的损失，本平台不承担任何责任。
            </p>
            <p>
                第三条 本平台合作机构提供的服务由该合作机构负责。用户接受相关服务时产生的争议、纠纷及损失，本平台不承担任何责任。
            </p>
            <p>
                第四条
                鉴于互联网传输的特殊性，本平台无法保证所有交易的准确性及时性。因突发性的设备、网络、通讯故障或自然灾害及其他不可抗力或不可预测、不可控制之因素而导致的任何直接、间接、特殊或从属的损失，本平台不承担任何责任
            </p>
            <p>
                第五条 大公数据具有法律法规规定的其他有关免责规定项下的一切权利，大公数据没有主张或延迟主张该等权利，并不视为大公数据对该等权利的放弃。
            </p>

            <!-- <p>1.所展示的信息由企业自行提供，内容的真实性、准确性和合法性由发布企业负责。大公对此不承担任何保证责任</p>

            <p>2.如果以上产品侵犯您的版权或者非企业授权发布，请联系大公网（400-888-8888），我们会在24小时内审核处理</p>

            <p>3.在线留言评论代表使用该企业产品的个人观点，如果不需要显示的留言或评论，大公网站管理员可以自行删除，或者联系大公网（400-888-8888）</p>

            <p>4.大公网只提供产品信息，一切交易将视为客户自行自愿交易，对交易风险由交易双方自行负责，大公网对此不承担任何保证责任</p>

            <p><h3>友情提示</h3></p>

            <p>为保障您的利益，建议优先选择搜圈VIP会员提供的服务、产品及有公司营业证书(或个人身份证明)上传到大公网站的公司和服务组织。</p>
               <br/>
               <br/> -->
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>