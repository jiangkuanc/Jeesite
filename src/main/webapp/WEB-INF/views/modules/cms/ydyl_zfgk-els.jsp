<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
        <li><a href="${ctx }/cmsca/cmsChinaAreaCity/findAllChinaAreaNamesC">一带一路国内省市概况</a></li>
        <li class="active"><a href="#">${cmsChinaAreaCity.cmsChinaAreaCityName}</a></li>
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
                <div class="els_introduce_top-left pull-left">
                    <h3>${cmsChinaAreaCity.cmsChinaAreaCityName}基本介绍</h3>
                </div>
                <div class="els_introduce_top-right pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="els_text">
                <p>
                    ${cmsChinaAreaCity.cmsChinaAreaCityBasic}
                </p>
            </div>
        </li>
        <%--   <li class="els_introduce mgtop_30">
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
                   ${cmsChinaAreaCity.cmsChinaAreaCityPosition}
                  </p>
              </div>
          </li> --%>
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
                    ${cmsChinaAreaCity.cmsChinaAreaCityPosition}
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
                    ${cmsChinaAreaCity.cmsChinaAreaCityPopulation}
                </p>
                <p>民族</p>
                <p>
                    ${cmsChinaAreaCity.cmsChinaAreaCityNation}
                </p>
            </div>
        </li>
    </ul>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>











