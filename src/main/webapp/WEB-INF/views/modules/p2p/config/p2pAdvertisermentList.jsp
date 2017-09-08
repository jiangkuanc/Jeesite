<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
广告
@author Chace
@version 2016-12-19
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>广告管理</title>
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

        function qiyong(position, id) {
            if (position == '1') {
                swal({
                    title: "确认启用吗？",
                    showCancelButton: true,
                    type: "info",
                }, function (inputValue) {
                    if (inputValue === false) {
                        return false;
                    }
                    location.href = "${ctx}/p2p/config/p2pAdvertiserment/changeStage?id=" + id + "&&position=" + position + "&&isEnable=1";
                });
            } else if (position == '2' || position == '3') {
                $.ajax({
                    type: "POST",
                    url: "${ctx}/p2p/config/p2pAdvertiserment/getCount?position=" + position,
                    dataType: "json",
                    success: function (data) {
                        var t;
                        if (data == 0) {
                            t = "确认启用吗？"
                        } else {
                            t = "将会使正在启用的该位置广告停用，确认启用吗？"
                        }
                        swal({
                            title: t,
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            location.href = "${ctx}/p2p/config/p2pAdvertiserment/changeStage?id=" + id + "&&position=" + position + "&&isEnable=1";
                        });
                    }
                });
            }
        }
        function tingyong(position, id) {
            if (position == '2' || position == '3') {
                swal({
                    title: "确认停用吗？",
                    showCancelButton: true,
                    type: "info",
                }, function (inputValue) {
                    if (inputValue === false) {
                        return false;
                    }
                    location.href = "${ctx}/p2p/config/p2pAdvertiserment/changeStage?id=" + id + "&&position=" + position + "&&isEnable=0";
                });
            } else if (position == '1') {
                $.ajax({
                    type: "POST",
                    url: "${ctx}/p2p/config/p2pAdvertiserment/getCount?position=" + position,
                    dataType: "json",
                    success: function (data) {
                        if (data == 1) {
                            swal("上部广告至少要有一条处于启用状态", "", "error");
                        } else {
                            swal({
                                title: "确认停用吗？",
                                showCancelButton: true,
                                type: "info",
                            }, function (inputValue) {
                                if (inputValue === false) {
                                    return false;
                                }
                                location.href = "${ctx}/p2p/config/p2pAdvertiserment/changeStage?id=" + id + "&&position=" + position + "&&isEnable=0";
                            });
                        }
                    }
                });
            }
        }

        function removed(position, id, isEnable) {
            swal({
                title: "确认删除吗？",
                showCancelButton: true,
                type: "info",
            }, function (inputValue) {
                if (inputValue === false) {
                    return false;
                }
                location.href = "${ctx}/p2p/config/p2pAdvertiserment/delete?id=" + id + "&&position=" + position + "&&isEnable=" + isEnable;
            });
        }

    </script>
    <style type="text/css">
        table thead tr th, table tbody tr td {
            text-align: center;
        }
    </style>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/config/p2pAdvertiserment/">广告列表</a></li>
    <li><a href="${ctx}/p2p/config/p2pAdvertiserment/form">广告添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pAdvertiserment" action="${ctx}/p2p/config/p2pAdvertiserment/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>是否启用链接：</label>
            <form:select path="isEnableLink" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>打开方式：</label>
            <form:select path="openWay" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('open_way')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>所在位置：</label>
            <form:select path="position" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('position')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>是否启用：</label>
            <form:select path="isEnable" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>广告图片</th>
        <th>是否启用链接</th>
        <th>链接地址</th>
        <th>打开方式</th>
        <th>所在位置</th>
        <th>是否启用</th>
        <th>排序值</th>
        <th>添加人</th>
        <th>添加时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pAdvertiserment">
        <tr>
            <td>${status.count }</td>
            <td>
                <a href="javascript:void(0);" onclick="modelView('${p2pAdvertiserment.adPicture}')">查看</a>
            </td>
            <td>${fns:getDictLabel(p2pAdvertiserment.isEnableLink, 'yes_no', '')}</td>
            <td>${p2pAdvertiserment.linkAddress}</td>
            <td>${fns:getDictLabel(p2pAdvertiserment.openWay, 'open_way', '')}</td>
            <td>${fns:getDictLabel(p2pAdvertiserment.position, 'position', '')}</td>
            <td>
                    ${fns:getDictLabel(p2pAdvertiserment.isEnable, 'yes_no', '')}
                <c:if test="${p2pAdvertiserment.isEnable == '1'}">
                    <a href="javascript:void(0);"
                       onclick="tingyong('${p2pAdvertiserment.position}','${p2pAdvertiserment.id}')">停用</a>
                </c:if>
                <c:if test="${p2pAdvertiserment.isEnable == '0'}">
                    <a href="javascript:void(0);"
                       onclick="qiyong('${p2pAdvertiserment.position}','${p2pAdvertiserment.id}')">启用</a>
                </c:if>
            </td>
            <td>${p2pAdvertiserment.serialNumber}</td>
            <td>${p2pAdvertiserment.operationPerson}</td>
            <td><fmt:formatDate value="${p2pAdvertiserment.operateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/p2p/config/p2pAdvertiserment/form?id=${p2pAdvertiserment.id}">修改</a>
                <a href="javascript:void(0);"
                   onclick="removed('${p2pAdvertiserment.position}','${p2pAdvertiserment.id}','${p2pAdvertiserment.isEnable}')">删除</a>
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