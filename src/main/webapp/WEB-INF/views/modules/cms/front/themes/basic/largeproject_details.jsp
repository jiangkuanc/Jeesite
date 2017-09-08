<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一带一路企业详情</title>
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
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx}/cms/article/programIntroduction?start=toFistPage">一带一路大型项目招标</a></li>
        <li class="active"><a href="#" id="pro"></a></li>
    </ol>
</div>

<div class="contbox">
    <div class="qyxqbox mgtop_30">

        <c:forEach items="${currentMegaProjectDetail}" var="megaProjectDetail">
            <div class="gsxq_box">
                <a href="#" class="pull-left"><img src="${ctxStatic}/dist/images/xmxb_pic.jpg" alt=""></a>
                <div class="gsxq_box_rt pull-left">

                    <h3><a href="#" class="c_active" id="projectName">${fns:abbr(megaProjectDetail.projectName,60 )}
                    </h3>
                    <ul>
                        <li>
                            <em><span>项目投资方：</span>${megaProjectDetail.projectInvestment }</em>
                            <em><span>项目承建方：</span>${megaProjectDetail.projectContractor }</em>
                        </li>
                        <li>
                            <em><span>项目进度：</span>${megaProjectDetail.projectSchedule }</em>
                            <em><span>项目所在地：</span>${megaProjectDetail.projectLocated }</em>
                        </li>
                        <li>
                            <em><span>联系人：</span>${megaProjectDetail.contacts }</em>
                            <em><span>职务：</span>${megaProjectDetail.duty }</em>
                        </li>
                        <li>
                            <em><span>联系电话：</span>${megaProjectDetail.phone }</em>
                            <em><span>行业：</span>${megaProjectDetail.industryInvolved }</em>
                        </li>
                        <li><span>有效期至：<fmt:formatDate value="${megaProjectDetail.validity }"
                                                       pattern="yyyy-MM-dd"/></span></td>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>企业简介</h3>
                </div>
                <p><h4><a href="#" class="c_active">${megaProjectDetail.projectName }</h4></a></p>
                <p>${megaProjectDetail.projectEnterprise }</p>

                <div class="qyjj_boxhd">
                    <h3>工作范围</h3>
                </div>
                <p>${megaProjectDetail.workingRange }</p>

                <div class="qyjj_boxhd">
                    <h3>资质要求</h3>
                </div>
                <p>${megaProjectDetail.qualificationRequirement }</p>

                <div class="qyjj_boxhd">
                    <h3>最低设计与咨询经验要求</h3>
                </div>
                <p>${megaProjectDetail.requirement }</p>

                <div class="qyjj_boxhd">
                    <h3>招标文件获取</h3>
                </div>
                <p>${megaProjectDetail.fileAccess }</p>

                <div class="qyjj_boxhd">
                    <h3>投标文件提交</h3>
                </div>
                <p>${megaProjectDetail.fileSubmit }</p>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>企业展示</h3>
                </div>
                <ul class="qyzs_picbox">
                    <c:forEach var="img" items="${fn:split(megaProjectDetail.projectDisplay,'|') }" varStatus="status">
                        <li class="pull-left"><img alt="" src="${img}"></li>

                        <c:if test="${status.count%2==0 }">
                            <br/>
                        </c:if>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h3>合作机会</h3>
                </div>
                <ul class="qyjj_info_box">
                    <li>${megaProjectDetail.cooperationOpportunities }</li>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var te = $("#projectName").html();
        $("#pro").html(te);
    })
</script>
</body>
</html>