<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>信用记录维护</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

    </script>
</head>
<body>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>XXX电子商务有限公司</td>
        <td>企业组织结构代码</td>
        <td>22552222222</td>
    </tr>
    <tr>
        <td>注册号</td>
        <td>2533</td>
        <td>企业法人</td>
        <td>张三</td>
    </tr>
    <tr>
        <td>注册资本</td>
        <td>一千万</td>
        <td>企业类型</td>
        <td>有限公司</td>
    </tr>
    <tr>
        <td>经营范围</td>
        <td>软件工程、金融</td>
        <td>对公账户</td>
        <td>65522552</td>
    </tr>
    <tr>
        <td>实际控制人姓名</td>
        <td>李四</td>
        <td>实际控制人身份证号码</td>
        <td>3721522557441415252</td>
    </tr>
    <tr>
        <td>代理人姓名</td>
        <td>张安</td>
        <td>代理人身份证号码</td>
        <td>3721522557441415252</td>
    </tr>
    </tbody>
</table>
<h4>逾期记录</h4>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>处置机构</th>
        <th>笔数</th>
        <th>币种</th>
        <th>逾期金额</th>
        <th>逾期年月</th>
        <th>逾期持续月数</th>
        <th>最近一次还款日期</th>
        <th>处置完成日期</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>
