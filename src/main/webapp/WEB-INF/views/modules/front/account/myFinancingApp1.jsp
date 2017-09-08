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
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>
    <script type="text/javascript">
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
        function sony(fid, rdid) {
            post('${ctx}/application/viewAppInfo', {financingInformationId: fid, rateDocumentId: rdid})
        }
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left jianjie shenq" style="width:72.5%;padding-bottom:30px;">
    <p class="shenqp pull-left">您好,<span>${p2pRegUserCertify.realName}</span>,我们正在对您提供的评级材料进行审核，请耐心等待</p><br/><br/>
    <h2>申请进度：</h2>
    <div class="onlyone">
        <img src="${ctxStatic}/dist/images/jindu/4.jpg" alt="" style="margin-left: 7%;margin-top: 5%">
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
            <li class="two border"><span>待提交的材料</span></li>
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
                    <c:forEach items="${rateDocument0}" var="doc">
                        <c:choose>
                            <c:when test="${doc.p2pRateDocumentTemplate.tempType == 3}">
                                <tr>
                                    <td>${doc.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td><a href="javascript:sony('${doc.financingInformationId}','${doc.id}')">查看</a>
                                    </td>
                                    <td>无</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>${doc.p2pRateDocumentTemplate.tempName}</td>
                                    <td><fmt:formatDate value="${doc.uploadTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>已提交</td>
                                    <td>
                                        <a href="${ctx}/document/p2pRateDocumentUpload/getAddress?financingInformationId=${doc.financingInformationId}&rateDocumentTempId=${doc.rateDocumentTempId}">下载</a>
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
                    <tbody>
                    </tbody>
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


<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


<script src="${ctxStatic}/dist/js/tabs.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
