<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
友情链接
@author Chace
@version 2016-12-23
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>友情链接管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }


        function selectSome() {
            var checkBoxs = document.getElementsByClassName("checkBoxx");
            var flag = false;
            for (var i = 0; i < checkBoxs.length; i++) {
                var checkbox = checkBoxs[i];
                if (checkbox.checked) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                swal("请至少选择一条友情链接进行批量发布!", "", "error");
                return;
            }
            var arr = new Array();
            var ids = "";
            for (var j = 0; j < checkBoxs.length; j++) {
                //对选中项进行操作
                if (checkBoxs[j].checked) {
                    var $cc = $(checkBoxs[j]);
                    if ($cc.parent().parent().find("td:eq(3)").text().trim() == '已发布') {
                        swal($cc.parent().parent().find("td:eq(2)").text() + "已经发布,请重新选择!", "", "error");
                        return;
                    }
                    //债项编号
                    ids += $cc.parent().parent().find("input[name]").val() + ",";
                }
            }

            ids = ids.substr(0, ids.length - 1);
            fabu(ids);
        }
        function fabu(ids) {
            swal({
                title: "确认发布吗？",
                showCancelButton: true,
                type: "info",
            }, function (inputValue) {
                if (inputValue === false) {
                    return false;
                }
                location.href = "${ctx}/p2p/config/p2pFriendshipLink/publishLink?ids=" + ids;
            });
        }
        function quxiao(id) {
            swal({
                title: "确认取消发布吗？",
                showCancelButton: true,
                type: "info",
            }, function (inputValue) {
                if (inputValue === false) {
                    return false;
                }
                location.href = "${ctx}/p2p/config/p2pFriendshipLink/stopLink?id=" + id;
            });
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/config/p2pFriendshipLink/">友情链接列表</a></li>
    <li><a href="${ctx}/p2p/config/p2pFriendshipLink/form">友情链接添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pFriendshipLink" action="${ctx}/p2p/config/p2pFriendshipLink/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>操作人：</label>
            <form:input path="operationPerson" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>链接发布状态：</label>
            <form:select path="linkState" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:option value="1">已发布</form:option>
                <form:option value="0">未发布</form:option>
                <!-- <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                                   htmlEscape="false"/> -->
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="button" value="批量发布"
                                onclick="selectSome();"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
    <thead>
    <tr>
        <th>选择</th>
        <th>序号</th>
        <th>友情链接单位</th>
        <th>链接状态</th>
        <th>图标</th>
        <th>链接地址</th>
        <th>排序值</th>
        <th>操作人</th>
        <th>添加时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pFriendshipLink">
        <tr>
            <input name="id" type="hidden" value="${p2pFriendshipLink.id}"/>
            <td><input type="checkbox" id="${p2pFriendshipLink.id}" class="checkBoxx"/></td>
            <td>${status.count }</td>
            <td>${p2pFriendshipLink.linkUnit}</td>
            <td>
                <c:if test="${p2pFriendshipLink.linkState == '1'}">
                    已发布 <a href="javascript:void(0);" onclick="quxiao('${p2pFriendshipLink.id}')">取消发布</a>
                </c:if>
                <c:if test="${p2pFriendshipLink.linkState == '0'}">
                    未发布 <a href="javascript:void(0);" onclick="fabu('${p2pFriendshipLink.id}')">发布</a>
                </c:if>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="modelView('${p2pFriendshipLink.linkIcon}')">
                    查看
                </a>
            </td>
            <td>${p2pFriendshipLink.linkAddress}</td>
            <td>${p2pFriendshipLink.sort}</td>
            <td>${p2pFriendshipLink.operationPerson}</td>
            <td><fmt:formatDate value="${p2pFriendshipLink.operateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/p2p/config/p2pFriendshipLink/form?id=${p2pFriendshipLink.id}">修改</a>
                <a href="${ctx}/p2p/config/p2pFriendshipLink/delete?id=${p2pFriendshipLink.id}"
                   onclick="return confirmx('确认要删除该友情链接吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>