<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
协议表
@author Zeus
@version 2016-11-21
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>协议管理</title>
    <meta name="decorator" content="default"/>
    <style>
        .list {
            margin: 0px auto;
            table-layout: fixed;
            width: 100%;
        }

        .list tbody td {
            word-break: break-all;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            //使用class选择器;例如:list对象->tbody->td对象.
            $(".list tbody tr td:nth-child(4)").each(function (i) {
                //给td设置title属性,并且设置td的完整值.给title属性.
                $(this).attr("title", $(this).text());
            });
        });
        function qiyong(agreementType, id) {
            $.ajax({
                type: "POST",
                url: "${ctx}/p2p/config/p2pAgreement/validateIsEnable?agreementType=" + agreementType,
                dataType: "json",
                success: function (data) {
                    //有已经启用的协议
                    if (data == 1) {
                        swal({
                            title: "将会使正在启用的该类型协议停用，确认启用吗？",
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            location.href = "${ctx}/p2p/config/p2pAgreement/qiyong?id=" + id + "&&agreementType=" + agreementType;
                        });
                    } else {
                        swal({
                            title: "确认启用吗？",
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            location.href = "${ctx}/p2p/config/p2pAgreement/qiyong?id=" + id + "&&agreementType=" + agreementType;
                        });
                    }
                },
                error: function (data) {
                    swal("错误", "弹出了一个错误提示框", "error");
                }
            });
        }
        function tingyong(id) {
            swal({
                title: "确认停用吗？",
                showCancelButton: true,
                type: "info",
            }, function (inputValue) {
                if (inputValue === false) {
                    return false;
                }
                location.href = "${ctx}/p2p/config/p2pAgreement/tingyong?id=" + id;
            });
        }
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/config/p2pAgreement/">协议管理</a></li>
    <li><a href="${ctx}/p2p/config/p2pAgreement/form">协议添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pAgreement" action="${ctx}/p2p/config/p2pAgreement/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">

        <li><label>主标题：</label>
            <form:input path="agreementMainTitle" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>副标题：</label>
            <form:input path="agreementSubTitle" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>协议类别：</label>
            <form:select path="agreementType" class="input-medium-select">
                <form:option value="">--请选择--</form:option>
                <form:options items="${fns:getDictList('agreement_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>是否生效：</label>
            <form:select path="isEnable" class="input-medium-select">
                <form:option value="">--请选择--</form:option>
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed list">
    <thead>
    <tr>
        <th>协议类别</th>
        <th>主标题</th>
        <th>副标题</th>
        <th style="width:150px">协议内容</th>
        <th>是否启用</th>
        <th>生效时间</th>
        <th>失效时间</th>
        <th>备注信息</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pAgreement" varStatus="status">
        <tr>
            <td>
                    ${fns:getDictLabel(p2pAgreement.agreementType, 'agreement_type', '')}
            </td>
            <td>
                <a href="${ctx}/p2p/config/p2pAgreement/form?id=${p2pAgreement.id}">
                        ${p2pAgreement.agreementMainTitle}
                </a>
            </td>
            <td>
                    ${p2pAgreement.agreementSubTitle}
            </td>
            <td>
                    ${fns:abbr(p2pAgreement.agreementContent,'')}
            </td>
            <td>
                    ${fns:getDictLabel(p2pAgreement.isEnable, 'yes_no', '')}
                <c:if test="${p2pAgreement.isEnable == 0 }">
                    <a onclick="qiyong('${p2pAgreement.agreementType}','${p2pAgreement.id}')">启用</a>
                </c:if>
                <c:if test="${p2pAgreement.isEnable == 1 }">
                    <a onclick="tingyong('${p2pAgreement.id}')">停用</a>
                </c:if>
            </td>
            <td>
                <fmt:formatDate value="${p2pAgreement.successTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${p2pAgreement.failureTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td title="${p2pAgreement.remarks}">
                    ${fns:abbr(p2pAgreement.remarks,50)}
            </td>
            <td>
                <a href="${ctx}/p2p/config/p2pAgreement/form?id=${p2pAgreement.id}">修改</a>
                <a href="${ctx}/p2p/config/p2pAgreement/delete?id=${p2pAgreement.id}"
                   onclick="return confirmx('确认要删除该协议表吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>