<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>

    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/jeesite.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <style type="text/css">
        li {
            display: inline
        }

        .divs .imgs {
            display: inline-block;
            vertical-align: middle;
        }

        /* .divs .infos{
            display: inline-block;
            vertical-align: right;
        } */
    </style>
    <script type="text/javascript">
        $(function () {
            var te = $("#titles").val();
            $("#pro").html(te);
        })
        //加载评论
        $(document).ready(function () {
            if ('${currentVideoDetails.get(0).category.allowComment}' == '1') {
                $("#comment").show();
                page(1, 5);
            }
        });
        function page(n, s) {
            $.get("${ctx}/comment", {
                theme: '${currentVideoDetails.get(0).category.site.theme}',
                'category.id': '${currentVideoDetails.get(0).category.id}',
                contentId: '${currentVideoDetails.get(0).id}',
                title: '${currentVideoDetails.get(0).title}',
                pageNo: n,
                pageSize: s,
                date: new Date().getTime()
            }, function (data) {
                $("#comment").html(data);
            });
        }
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li><a href="${ctx }/cms/link/xyjyshipin">信用教育视频</a></li>
        <li id="pro" class="lg-active"></li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy_02.jpg" width="1440px" height="358px" alt=""></li>
    </ul>
</div>

<div class="xyjy-content-top">
    <div style="padding: 30px 10px;">
        <div>
            <c:forEach items="${currentVideoDetails}" var="videoDetails" varStatus="status">
                <ul>
                    <li style="font-size:25px">${videoDetails.title}</li>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <li>发表于：<fmt:formatDate value="${videoDetails.updateDate}" pattern="yyyy-MM-dd"/></li>
                </ul>
                <div style="padding:10px 0px;">
                    <p>主题：${videoDetails.theme }</p>
                    <p>讲师：${videoDetails.speaker }</p>
                    <p>内容简介：${videoDetails.remarks }</p>
                </div>
                <div class="divs">
                    <div class="shipin">
                        <ul style="text-align:center;">
                            <!-- <li> -->
                            <embed src='${videoDetails.href }' allowFullScreen='true' quality='high' width='480'
                                   height='400' align='middle'
                                   allowScriptAccess='always' type='application/x-shockwave-flash'></embed>
                            <!-- </li> -->
                            <!-- <li>
                                <div class="infos">
                                  <ul>
                                    <li>
                                      <p><input typle="button" value="下载课件" onclick=""></p>
                                     &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                      <p><input typle="button" value="发表评论" onclick=""></p>
                                   </li>
                                  </ul>
                               </div>
                            </li>    -->
                        </ul>
                    </div>
                </div>
                <c:if test="${status.first}">
                    <input type="hidden" value="${videoDetails.title}" id="titles">
                </c:if>
            </c:forEach>
        </div>

        <div id="comment" class="span10">
            正在加载评论...
        </div>
    </div>

</div>

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>