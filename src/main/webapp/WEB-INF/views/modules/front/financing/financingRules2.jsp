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
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left  shenq " style="width:72.5%;padding-bottom:30px;">
    <p class="shenqp pull-left">您好 ,<span>${user.loginName}</span> ,您可以从此处开始申请融资</p>
    <c:choose>
        <c:when test="${isApply == 0}">
            <a href="javascript:msg()">
                <button class="btn btn-default red reds" style="margin-left: 160px">申请融资</button>
            </a>
        </c:when>
        <c:otherwise>
            <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp&flag=1">
                <button class="btn btn-default red reds" style="margin-left: 160px">申请融资</button>
            </a>
        </c:otherwise>
    </c:choose>
    <a href="${ctx}/rating/p2pRatingServiceInfo/ctrlRatingFlow">
        <button class="btn btn-default red reds" style="margin-left: 30px">申请评级</button>
    </a>
    <h3>申请步骤：</h3>
    <!--<img src="${ctxStatic}/dist/images/jindu1.jpg" alt="" style="margin-left:2%;">-->
    <div class="onlyone">
        <img src="${ctxStatic}/dist/images/jindu/1.jpg" alt="" style="margin-left: 7%;margin-top: 5%">
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
        <h3>申请须知：</h3>
        <ul>
            <li class="two currents current"><span class="border border-top">准备材料</span></li>
            <li class="two border"><span>融资条件</span></li>
            <li class="two border "><span>费用说明</span></li>
            <li class="two border"><span>信息披露</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu">
            <!--准备材料-->
            <div class="one current2">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td style="width: 20%;">材料类别</td>
                        <td style="width: 20%;">名称</td>
                        <td style="width: 20%;">行业</td>
                        <td style="width: 40%;">说明</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="14" style="padding-top: 10%;">企业基本材料</td>
                        <td>1 公司章程</td>
                        <td rowspan="6" style="padding: 207px 30px;">所有行业</td>
                        <td>包括管理机制、管理机构、管理制度三个方面，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>2 企业股东名单</td>
                        <td>了解公司股东构成情况，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>3 企业征信报告</td>
                        <td>了解企业征信情况，需提供扫描件，报告日期截止到申请前7天内。</td>
                    </tr>
                    <tr>
                        <td>4 实际控制人征信报告</td>
                        <td>了解实际控制人征信情况，需提供扫描件，报告时期截止到申请前7天内。</td>
                    </tr>
                    <tr>
                        <td>5 企业员工花名册</td>
                        <td>了解企业员工情况，需提供扫描件，可以根据实际情况提供，提供后会有助于提升信用等级。</td>
                    </tr>
                    <tr>
                        <td>6 实际控制人和高管简历</td>
                        <td>了解实际控制人、管理人员、核心技术人员的教育程度、相关行业工作经历。</td>
                    </tr>
                    <tr>
                        <td>7 公司制度清单</td>
                        <td>其他行业</td>
                        <td>了解企业管理机制、管理机构、管理制度，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>8 企业组织架构图</td>
                        <td>
                            科学研究和技术服务业 <br>
                            制造业 <br>
                            租赁和商务服务业 <br>
                            批发和零售业 <br>
                        </td>
                        <td>了解企业基本概况，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>9 核心技术人员离职记录表</td>
                        <td>
                            科学研究和技术服务业 <br>
                            租赁和商务服务业 <br>
                            其他行业 <br>
                        </td>
                        <td>了解核心技术人员离职情况，需提供核心技术人员离职证明。</td>
                    </tr>
                    <tr>
                        <td>10 产品清单及前5大产品对应专利清单</td>
                        <td>
                            科学研究和技术服务业 <br>
                            制造业 <br>
                            其他行业 <br>
                        </td>
                        <td>了解企业、企业产品及前五大产品的技术含量。</td>
                    </tr>
                    <tr>
                        <td>11 产能利用情况信息表</td>
                        <td>制造业</td>
                        <td>了解企业产能利用情况，需包含企业设计产能、实际产能情况及统计数据，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>12 员工专业资格证书</td>
                        <td>制造业</td>
                        <td>了解企业员工专业知识密集度，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>13 专利证书和商标注册证</td>
                        <td>
                            科学研究和技术服务业 <br>
                            租赁和商务服务业 <br>
                            其他行业 <br>
                        </td>
                        <td>了解企业知识产权/无形资产情况，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>14 股权融资商业计划书</td>
                        <td>
                            科学研究和技术服务业 <br>
                            制造业 <br>
                            租赁和商务服务业 <br>
                            批发和零售业 <br></td>
                        <td>了解企业股权融资规模及占比，请提供股权融资商业计划书签写页或盖章页的扫描件。</td>
                    </tr>
                    <tr>
                        <td rowspan="25" style="padding-top:10%; ">企业财务材料</td>
                        <td>1 资产负债表</td>
                        <td rowspan="10" style="padding: 277px 30px;">所有行业</td>
                        <td rowspan="4">
                            1 成立需满3年；<br>
                            2
                            成立超过3年的企业需提供近三年的财务报表，当年的财务报表如果已出年报，则提供年报，如果未出年报，则需提供当年所有季度和或半年财务报表，如果当年不够一季度，则只需提供前三年的财务报表；<br>
                            3 需提供所有财务报表的扫描件。
                        </td>
                    </tr>
                    <tr>
                        <td>2 利润表</td>
                    </tr>
                    <tr>
                        <td>3 现金流量表</td>
                    </tr>
                    <tr>
                        <td>4 所有者权益变动表</td>
                    </tr>
                    <tr>
                        <td>5 财务年报附注</td>
                        <td>与年报对应的附注材料，如年报中已包含，则无需上传。</td>
                    </tr>
                    <tr>
                        <td>6 银行对账单</td>
                        <td>了解并核对财务报表中的信息(期末)，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>7 员工五险一金缴费凭证</td>
                        <td>了解企业员工的养老保险费缴纳情况，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>8 企业所得税纳税申报表</td>
                        <td>了解企业纳税水平，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>9 销售和采购合同</td>
                        <td>了解企业主营业务收入（前五大销售合同），请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>10 实际控制人社保缴费凭证</td>
                        <td>了解实际控制人社保缴纳情况，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>11 科目余额表</td>
                        <td rowspan="6" style="padding: 150px 30px;">其他行业</td>
                        <td>用于了解期末借方余额和期末贷方余额情况，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>12 企业有息债务清单</td>
                        <td>了解公司借款情况</td>
                    </tr>
                    <tr>
                        <td>13 企业资产抵质押情况清单</td>
                        <td>了解公司资产抵质押情况(期末)，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>14 企业银行存款证明</td>
                        <td>核实财务报表中的信息(期末)，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>15 研发费用&专利明细表</td>
                        <td>了解企业研发投入情况。</td>
                    </tr>
                    <tr>
                        <td>16 实际控制人所得税完税证明</td>
                        <td>了解实际控制人的纳税情况，需要与财务报表年限相匹配。</td>
                    </tr>
                    <tr>
                        <td>17 企业增值税纳税申报表</td>
                        <td rowspan="2">
                            科学研究和技术服务业 <br>
                            制造业 <br>
                            租赁和商务服务业 <br>
                            批发和零售业
                        </td>
                        <td>了解企业的纳税情况，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>18 实际控制人房产证</td>
                        <td>了解实际控制人经济实力，需提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>19 环保补贴信息表</td>
                        <td>制造业</td>
                        <td>了解企业补贴期间、金额，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>20 补贴&优惠明细表</td>
                        <td>
                            科学研究和技术服务业 <br>
                            租赁和商务服务业 <br>
                            其他行业
                        </td>
                        <td>了解企业补贴期间、金额，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>21 借款合同或单据</td>
                        <td>
                            制造业 <br>
                            其他行业
                        </td>
                        <td>了解企业借款利率、期限等信息，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>22 合作两年以上客户清单</td>
                        <td>租赁和商务服务业</td>
                        <td>了解受评企业的主要客户，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>23 经营场所房产证</td>
                        <td>
                            科学研究和技术服务业 <br>
                            租赁和商务服务业 <br>
                            批发和零售业
                        </td>
                        <td>了解经营场所稳定性，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>24 资金出借合同</td>
                        <td>
                            科学研究和技术服务业 <br>
                            制造业 <br>
                            租赁和商务服务业 <br>
                            批发和零售业
                        </td>
                        <td>了解企业借出款项的金额、利率、资本化利息、费用化利息，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td>25 水电费缴费单据</td>
                        <td>
                            租赁和商务服务业 <br>
                            批发和零售业
                        </td>
                        <td>了解企业经营情况，请提供扫描件。</td>
                    </tr>
                    <tr>
                        <td colspan="4">说明：1、其中“其他行业”为除了科学研究和技术服务业、制造业、租赁和商务服务业、批发和零售业的其他行业。</br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、单页材料盖章在有公司名称落款处（需覆盖公司名称），如无公司名称盖章在文件标题处。</br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、多页（2页以上含2页）需要加盖齐缝章，同时需要参照1在落款处或文件标题住盖章。
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--融资材料-->
            <div class="one rzccai">
                <p>
                    1.融资申请时提交的企业资料、法人(控制人)资料符合时间要求且真实无误，不存在虚假信息。
                </p>
                <p>
                    2.主体的央行征信报告真实且符合时间要求，并且无重大不良信用记录。
                </p>
                <span>*以下行为被视为重大不良信用记录</span>
                <table class="table tables1 ">
                    <tbody>
                    <tr class="biao" style="text-align: center">
                        <td style="width:90px;">主题</td>
                        <td style="width:220px;">信用类型</td>
                        <td>重大不良信用记录</td>
                    </tr>
                    <tr>
                        <td rowspan="16" style="font-weight: bold;text-align: center">企业</td>
                        <td>1 资产管理公司处置的债务(当前)</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>2 担保代偿(当前)</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>3 欠息(当前)</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <tr>
                        <td>4 垫款(当前)</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>5 资产管理公司处置的债务(已结清)</td>
                        <td>最近24个月发生2次以上</td>
                    </tr>
                    <tr>
                        <td>6 担保代偿(已结清)</td>
                        <td>最近24个月发生2次以上</td>
                    </tr>
                    <tr>
                        <td>7 欠息(已结清)</td>
                        <td>最近24个月发生5次以上</td>
                    </tr>
                    <tr>
                        <td>8 垫款(已结清)</td>
                        <td>最近24个月发生2次以上</td>
                    </tr>
                    <tr>
                        <td>9 不良对外担保</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <tr>
                        <td>10 欠税记录</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <tr>
                        <td>11 民事判决记录(已结清)</td>
                        <td>作为被告，发生即为重大</td>
                    </tr>
                    <tr>
                        <td>12 强制执行记录</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>13 央行征信报告查询次数</td>
                        <td>最近1个月因贷款审批查询次数超过3次</td>
                    </tr>
                    <tr>
                        <td>14 行政处罚记录</td>
                        <td>最近24个月发生2次以上</td>
                    </tr>
                    <tr>
                        <td>15 社会保险参保欠费记录</td>
                        <td>最近24个月发生1次以上</td>
                    </tr>
                    <tr>
                        <td>16 住房公积金欠费记录</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <!--第二部分-->
                    <tr>
                        <td rowspan="21" style="font-weight: bold;text-align: center">个人</td>
                        <td rowspan="4">1 信用卡记录</td>
                        <td>最近24个月内出现过6次逾期10天以上30天以下还款记录</td>
                    </tr>
                    <tr>
                        <td>最近24个月内出现过3次逾期30天以上60天以下付息情况</td>
                    </tr>
                    <tr>
                        <td>最近24个月内出现过1次逾期60天以上90天以下不良记录</td>
                    </tr>
                    <tr>
                        <td>因违规用卡等行为被列入银行、同业或征信机构不良客户信息库</td>
                    </tr>

                    <tr>
                        <td rowspan="2">2 贷款记录</td>
                        <td>最近24个月内出现过3次逾期还款记录</td>
                    </tr>
                    <tr>
                        <td>存在恶意骗取银行资金记录</td>
                    </tr>
                    <tr>
                        <td>3 资产处置信息</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>4 保证人代偿</td>
                        <td>发生即为重大</td>
                    </tr>
                    <tr>
                        <td>5 不良担保</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <tr>
                        <td>6 欠费(电信)记录</td>
                        <td>最近24个月欠费超过宽限期累计6个月以上</td>
                    </tr>
                    <tr>
                        <td>7 民事诉讼</td>
                        <td>做为被告，发生即为重大</td>
                    </tr>
                    <tr>
                        <td>8 央行征信报告查询次数</td>
                        <td>最近1个月因贷款审批查询次数超过6次</td>
                    </tr>
                    <tr>
                        <td rowspan="7">9 行政处罚</td>
                        <td>(1) 警告；6次以上</td>
                    </tr>
                    <tr>
                        <td>(2) 罚款；6次以上</td>
                    </tr>
                    <tr>
                        <td>(3) 没收违法所得、没收非法财物；发生1次及以上</td>
                    </tr>
                    <tr>
                        <td>(4) 另停产停业；发生1次及以上</td>
                    </tr>
                    <tr>
                        <td>(5) 暂扣或者吊销许可证、暂扣或者吊销执照；发生1次及以上</td>
                    </tr>
                    <tr>
                        <td>(6) 行政拘留；发生1次以上</td>
                    </tr>
                    <tr>
                        <td>(7) 法律、行政法规规定的其他行政处罚。发生1次及以上</td>
                    </tr>
                    <tr>
                        <td>10 欠税记录</td>
                        <td>最近24个月发生3次以上</td>
                    </tr>
                    <tr>
                        <td>11 强制执行记录</td>
                        <td>发生即为重大</td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!--费用说明-->
            <div class="one feiyong">
                <p>评级费用：</p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    这是您在进行信用评级前需要支付的费用，此项费用中包含入场费和评级费用，如果您未获得准入资格，我们会退回部分评级费用，而且我们会出具《评级报告》以告诉您原因，如果您对准入评级的结果存在异议，可以申请复评。
                </p>
            </div>
            <!--信息披露-->
            <div class="one xinxipl">
                <p style="color: #343434;font-weight: bold;">
                    为保证投资人对所投债项的知情权，债项发布后我们平台将会对您申请融资的企业信息进行披露，包括但不限于以下几项：
                </p>
                <p>1.融资企业名称</p>
                <p>2.组织类型</p>
                <p>3.营业执照号</p>
                <p>4.组织机构代码</p>
                <p>5.税务登记代码</p>
                <p>6.社会信用代码</p>
                <p>7.注册资本</p>
                <p>8.注册地址</p>
                <p>9.经营范围</p>
                <p>10.主营业务</p>
                <p>11.法定代表人(控制人)基本资料</p>
                <p>12.股权结构</p>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
<!--内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/tabs.js"></script>
<script type="text/javascript">
    function msg() {
        alert('营业执照到期时间在一年之内的企业不能进行融资申请！')
    }
</script>
</body>
</html>