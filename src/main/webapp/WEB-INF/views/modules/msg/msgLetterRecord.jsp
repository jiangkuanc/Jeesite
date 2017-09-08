<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
    <link href="${ctxStatic}/sweetAlert/sweetalert.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhzl.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<c:if test="${user.roleList[0].id == '101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '102'}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>

<c:if test="${user.roleList[0].id == '104'}">
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
</c:if>
<div class="zh-right pull-left zhzl_xxzx" style="margin-bottom: 200px">
    <h3>我的消息</h3>
    <ul class="xxList clearfix">
        <c:if test="${user.roleList[0].id == '102'}">
            <li class="pull-left">消息<span><a
                    href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">（${readJson + unReadJson}）</a></span>
            </li>
            <li class="pull-left">未读消息<span><a
                    href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter&readState=0">（${unReadJson}）</a></span>
            </li>
            <li class="pull-left">已读消息<span><a
                    href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter&readState=1">（${readJson}）</a></span>
            </li>
        </c:if>
        <c:if test="${user.roleList[0].id == '101'}">
            <li class="pull-left">消息<span><a
                    href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter">（${readJson + unReadJson}）</a></span></li>
            <li class="pull-left">未读消息<span><a
                    href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter&readState=0">（${unReadJson}）</a></span></li>
            <li class="pull-left">已读消息<span><a
                    href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter&readState=1">（${readJson}）</a></span></li>
        </c:if>
    </ul>
    <table class="table table-hover zhzl_xxzx_table">
        <thead>
        <tr>
            <th><label><input type="checkbox" id="xxzx_qx">全选</label></th>
            <th>标题</th>
            <th>时间</th>
            <th>发送人</th>
        </tr>
        </thead>
        <tbody id="itemContainer">
        <c:if test="${list == null}">
            <tr>
                <td colspan="9" rowspan="2">
                    <div class="cai-text">暂无消息。</div>
                </td>
            </tr>
        </c:if>
        <c:if test="${list != null}">
            <c:forEach items="${list}" var="msgLetterRecord">
                <tr>
                    <td><input type="hidden" name="id" value="${msgLetterRecord.id }"/><input type="checkbox"
                                                                                              class="inpch"></td>
                    <td style="text-align: center;">
                        <c:if test="${user.roleList[0].id == '101'}">
                            <a id="title${msgLetterRecord.id}"
                               href="${ctx}/user/Institution/ctrlMenu?mode=msgContent&msgId=${msgLetterRecord.id }">${msgLetterRecord.title}</a>
                        </c:if>
                        <c:if test="${user.roleList[0].id == '102'}">
                            <a id="title${msgLetterRecord.id}"
                               href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgContent&msgId=${msgLetterRecord.id }">${msgLetterRecord.title}</a>
                        </c:if>
                        <c:if test="${user.roleList[0].id == '104'}">
                            <a id="title${msgLetterRecord.id}"
                               href="${ctx}/msg/msgLetterRecord/getById?id=${msgLetterRecord.id }">${msgLetterRecord.title}</a>
                        </c:if>
                    </td>
                    <td><fmt:formatDate value="${msgLetterRecord.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${msgLetterRecord.user.name}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <div class="xxzx_bot_lf pull-left">
        <span><label><input type="checkbox" id="xxzx_qx1">&emsp;全选</label></span>
        <span id="scsx">删除所选</span>
        <span id="bjwyd">标记为已读</span>
    </div>
    <div class="holder"></div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/sweetAlert/sweetalert.min.js" type="text/javascript"></script>
<script src="${ctxStatic }/dist/js/zhzl.js"></script>
<script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
    $(function () {
        /*js实现页面分页*/
        /*分页*/
        $("div.holder").jPages({
            containerID: "itemContainer", //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 10, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    });

    //未读消息变为蓝色
    $(function () {
        var jsonlist = eval("(" + '${jsonlist}' + ")");
        if (jsonlist != null && jsonlist.length > 0) {
            for (var i in jsonlist) {
                var idd = jsonlist[i].id;
                var state = jsonlist[i].readState;
                if (state == '0') {
                    $("#title" + idd).css("color", "blue");
                }
            }
        }
    })
</script>
</body>
</html>