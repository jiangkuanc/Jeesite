<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist-wyrz/css/wyrz-wdrz.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>

</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh" style="border-bottom: 1px solid #d6d7dc;">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active" style="font-weight: bold;">企业融资</li>
    </ol>
</div>
<!--banner-->
<div class="wyrz-banner-box">
    <a href="javascript:void(0)" onclick="sendForm()">
        <img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/wdrz-bannder.jpg" alt="" class="wyrz-banner">
    </a>
    <div class="sqrzBox">
        <div>
            <h3>合规&nbsp;&nbsp;专业</h3>
            <h3>高效&nbsp;&nbsp;安全</h3>
            <h4>创建项目 快速融资</h4>
        </div>
        <a href="javascript:sendForm()" class="sqrz">申请融资</a>
    </div>
</div>
<!--内容开始-->
<div class="cont-wyrz">
    <div class="safety_tab_wyrz">
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active" style="border-left:none;"><a href="#home" class="a-active"
                                                                                    id="home-tab" role="tab"
                                                                                    data-toggle="tab"
                                                                                    aria-controls="home"
                                                                                    aria-expanded="true">融资主体</a></li>
                <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"
                                           aria-controls="profile">融资步骤</a></li>
                <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab"
                                           aria-controls="profile">融资产品说明</a></li>
                <li role="presentation"><a href="#profile3" role="tab" id="profile-tab3" data-toggle="tab"
                                           aria-controls="profile">融资费用</a></li>
                <li role="presentation" style="border-right:none;"><a href="#profile2" role="tab" id="profile-tab2"
                                                                      data-toggle="tab"
                                                                      aria-controls="profile">评级方法说明</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
                    <div class="qy">
                        <ul class="clearfix">
                            <li class="pull-left">
                                <em>企业规模：</em>
                                <span>不限</span>
                            </li>
                            <li class="pull-left">
                                <em>经营范围：</em>
                                <span>非投资类</span>
                            </li>
                            <li class="pull-left">
                                <em>注册时间：</em>
                                <span>不限</span>
                            </li>
                            <li class="pull-left">
                                <em>注册所在地：</em>
                                <span>大陆境内</span>
                            </li>
                            <li class="pull-left">
                                <em>企业资产：</em>
                                <span class="color-fb861e">10万元以上</span>
                            </li>
                            <li class="pull-left">
                                <em>起融金额：</em>
                                <span class="color-fb861e">50,000元以上</span>
                            </li>
                            <li class="pull-left">
                                <em>信用等级：</em>
                                <span class="color-ee1510">BBB级以上</span>（大公信用级别）
                            </li>
                        </ul>
                    </div>
                    <div class="gr" style="display: none;">
                        <div class="mkjsz pull-left">
                            <div class="mkjsz-icon pull-left"></div>
                            <div class="pull-left">模块</br>建设中...</div>
                        </div>
                        <div class="jqqd pull-left">
                            <p>敬请期待...</p>
                            <div class="jdt-wrap">
                                <div class="jdt-inner"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
                    <div class="rzbz-qy">
                        <h4>企业</h4>
                        <div class="rzbz-qy-div"><img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/rzbz-icon.jpg" alt="">
                        </div>
                    </div>
                    <div class="rzbz-qy">
                        <h4>准备材料</h4>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>材料类别</th>
                                <th>名称</th>
                                <th>行业</th>
                                <th>说明</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td rowspan="14" align="center" style="width: 140px;">企业基本</br>材料</td>
                                <td>1 公司章程</td>
                                <td rowspan="6">所有行业</td>
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
                                <td>了解实际控制人征信情况，需提供扫描件，报告日期截止到申请前7天内</td>
                            </tr>
                            <tr>
                                <td>5 企业员工花名册</td>
                                <td>了解企业员工情况，需提供扫描件，可以根据实际情况提供，提供后会有</br>
                                    助于提升信用等级。
                                </td>
                            </tr>
                            <tr>
                                <td>6 实际控制人和高管简历</td>
                                <td>了解实际控制人、管理人员、核心技术人员的教育程度、相关行业工作</br>
                                    经历
                                </td>
                            </tr>
                            <tr>
                                <td>7 公司制度清单</td>
                                <td>其他行业</td>
                                <td>了解企业管理机制、管理机构、管理制度，需提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>8 企业组织架构图</td>
                                <td>科学研究和技术服务业</br>
                                    制造业</br>
                                    租赁和商务服务业</br>
                                    批发和零售业
                                </td>
                                <td>了解企业基本概况。</td>
                            </tr>
                            <tr>
                                <td>9 核心技术人员离职记录表</td>
                                <td>科学研究和技术服务业</br>
                                    租赁和商业服务业</br>
                                    其他行业
                                </td>
                                <td>了解核心技术人员离职情况。</td>
                            </tr>
                            <tr>
                                <td>10 产品清单及前5大产品
                                    对应专利清单
                                </td>
                                <td>科学研究和技术服务业</br>
                                    制造业</br>
                                    其他行业
                                </td>
                                <td>了解企业前五大产品的技术含量。</td>
                            </tr>
                            <tr>
                                <td>11 产能利用情况信息表</td>
                                <td>制造业</td>
                                <td>了解企业产能利用情况，需包含企业设计产能、实际产能情况及统计</br>
                                    数据，请提供扫描件
                                </td>
                            </tr>
                            <tr>
                                <td>12 员工专业资格证书</td>
                                <td>制造业</td>
                                <td>了解企业员工专业知识密集度，请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>13 专利证书和商标注册证</td>
                                <td>科学研究和技术服务业</br>
                                    租赁和商务服务业</br>
                                    其他行业
                                </td>
                                <td>了解企业知识产权/无形资产情况，请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>14 股权融资商业计划书</td>
                                <td>科学研究和技术服务业</br>
                                    制造业</br>
                                    租赁和商务服务业</br>
                                    批发和零售业
                                </td>
                                <td>了解企业股权融资规模及占比，请提供股权融资商业计划书签写页或盖</br>章页的扫描件。</td>
                            </tr>
                            <tr>
                                <td rowspan="25" align="center" style="width: 140px;">企业财务</br>材料</td>
                                <td>1 资产负债表</td>
                                <td rowspan="10">所有行业</td>
                                <td rowspan="4">1 成立需满3年；
                                    2 成立超过3年的企业需提供近三年的财务报表，当年的财务报表如果</br>
                                    已出年报，则提供年报，如果未出年报，则需提供当年所有季度和或半</br>
                                    年财务报表，如果当年不够一季度，则只需提供前三年的财务报表；</br>
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
                                <td>了解并核对财务报表中的信息（期末），需提供扫描件。</td>
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
                                <td>9销售和采购合同</td>
                                <td>了解企业主营业务收入（前五大销售合同），请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>10 实际控制人社保缴费凭证</td>
                                <td>了解实际控制人社保缴纳情况，请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>11 科目余额表</td>
                                <td rowspan="6">其他行业</td>
                                <td>用于了解期末借方余额和期末贷方余额情况，需提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>12 企业有习债务清单</td>
                                <td>了解公司借款情况</td>
                            </tr>
                            <tr>
                                <td>13 企业资产抵质押情况清单</td>
                                <td>了解公司资产抵质押情况（期末），需提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>14 企业银行存款证明</td>
                                <td>核实财务报表中的信息（期末），需提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>15 研发费用&专利明细表</td>
                                <td>了解企业研发投入情况。</td>
                            </tr>
                            <tr>
                                <td>16 实际控制人所得税完税</br>
                                    证明
                                </td>
                                <td>了解实际控制人的纳税情况，需要与财务报表年限相匹配。</td>
                            </tr>
                            <tr>
                                <td>17 企业增值税纳税申报表</td>
                                <td rowspan="2">科学研究和技术服务业</br>
                                    制造业</br>
                                    租赁和商务服务业</br>
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
                                <td>科学研究和技术服务业</br>
                                    租赁和商务服务业</br>
                                    其他行业
                                </td>
                                <td>了解企业补贴期间、金额，请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>21 借款合同或单据</td>
                                <td>制造业</br>
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
                                <td>科学研究和技术服务业</br>
                                    租赁和商务服务业</br>
                                    批发和零售业
                                </td>
                                <td>解经营场所稳定性，请提供扫描件。</td>
                            </tr>
                            <tr>
                                <td>24 资金出借合同</td>
                                <td>科学研究和技术服务业</br>
                                    制造业</br>
                                    租赁和商务服务业</br>
                                    批发和零售业
                                </td>
                                <td>了解企业借出款项的金额、利率、资本化利息、费用化利息，请提</br>
                                    供扫描件。
                                </td>
                            </tr>
                            <tr>
                                <td>25 水电缴费单据</td>
                                <td>租赁和商务服务业</br>
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
                        <div class="sqrz-box"><a href="javascript:sendForm()" class="btn btn-sqrz">申请融资</a></div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade clearfix" id="profile1" aria-labelledBy="profile-tab">
                    <div class="rzcpsm-lf pull-left"><img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/rzcpsm.jpg" alt="">
                    </div>
                    <div class="rzcpsm-rt pull-right">
                        <h4>产品信息披露</h4>
                        <ol class="cpxxpl-list clearfix">
                            <li class="pull-left">1.企业名称</li>
                            <li class="pull-left">2.企业性质</li>
                            <li class="pull-left">3.注册资本</li>
                            <li class="pull-left">4.法定代表人</li>
                            <li class="pull-left">5.实缴资本</li>
                            <li class="pull-left">6.借款账号所属地</li>
                            <li class="pull-left">7.企业股东名单</li>
                            <li class="pull-left">8.经营范围</li>
                            <li class="pull-left">9.成立时间</li>
                            <li class="pull-left">10.企业规模</li>
                            <li class="pull-left">11.注册地址</li>
                            <li class="pull-left">12.企业办公地址</li>
                            <li class="pull-left">13.经营区域</li>
                            <li class="pull-left">14.所属行业</li>
                            <li class="pull-left">15.担保公司名称</li>
                            <li class="pull-left">16.资产评估公司名称</li>
                            <li class="pull-left">17.资产评估报告</li>
                            <li class="pull-left">18.担保函</li>
                            <li class="pull-left">19.资产评估合同</li>
                            <li class="pull-left">20.委托担保合同</li>
                            <li class="pull-left">21.还款来源</li>
                        </ol>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile3" aria-labelledBy="profile-tab">
                    <ul class="rzfy-list clearfix">
                        <li class="pull-left"><img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/pjfy.jpg" alt=""></li>
                        <li class="pull-left"><img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/zfsxf.jpg" alt=""></li>
                        <li class="pull-left"><img src="${ctxStatic}/dist-wyrz/imgs/imgs-wdrz/rzfwf.jpg" alt=""></li>
                        `
                    </ul>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile2" aria-labelledBy="profile-tab">
                    <p>
                        大公互联网数字化评级依据《大公信用评级原理》理论，以受评主体偿债来源对总量债务的覆盖度评价其偿债能力，充分考虑偿债来源对财富创造能力的偏离度，并运用大量历史数据预测未来信息，最终揭示其信用风险。</p>
                    <p>
                        基于此，大公在深入研究中小企业以及互联网金融信用风险形成规律的基础上，全面深入梳理影响互联网债务人偿债能力的内外部因素，即数据项，并将其进行标准化处理，对评级指标层层分解，最终独创数字化信用评级方法。</p>
                    <div>
                        <h4>一、数字化评级逻辑架构</h4>
                        <p>本评级方法遵循现代信用经济生产与信用、信用与评级的矛盾运动规律，体现了以下评级思想：</p>
                        <p>（一）信用风险形成因素的内在联系是构成评级要素的源泉</p>
                        <p>（二）判定信用关系所处状态，发挥评级逆周期作用；</p>
                        <p>（三）创富能力是偿还债务的基石；</p>
                        <p>（四）各偿债来源的偏离度是判定企业偿债能力的关键；</p>
                        <p>（五）根据债务人的总债务偿还能力、存量债务偿还能力以及新增债务偿还能力这三种偿债能力判定其信用级别。</p>
                        <p>
                            为实现评级结果的一致性和可比性，本方法遵循大公中小企业评级方法的一般逻辑结构，主要包括五大要素：偿债环境、创富能力、偿债来源、偿债能力以及调整项。通过对偿债环境指数、创富能力指数、偿债来源指数和偿债能力指数进行风险加权后得到债务主体相应的信用评级分值，将其映射到所对应级别区间，得到初始信用评级结果。由评审委员会对计算结果进行审核，并考虑评级系统中未以指标形式出现的因素，根据行业环境和外部支持调整项对初始级别进行调整，确定最终级别。</p>
                    </div>
                    <div>
                        <h4>二、数字化评级流程</h4>
                        <p>具体而言，大公互联网数字化评级方法通过以下四个步骤得到最终级别：</p>
                        <p>（一）确定各要素的核心指标</p>
                        <p class="color-999">根据外部偿债环境和企业内部创富能力的一般影响因素，确定衡量各要素的核心指标，包括定量和定性指标。指标打分方法采取5分制的评分标准。</p>
                        <p>（二）编制偿债环境、创富能力和偿债来源指数</p>
                        <p class="color-999">
                            运用层层递进分析方法对偿债环境、创富能力和偿债来源的评级要素进行分析，根据各项核心指标的重要性确定权重，进行逐级风险加权，形成偿债环境指数、创富能力指数和偿债来源指数。</p>
                        <p>（三）确定债务偿还能力指数</p>
                        <p class="color-999">根据经偏离度调整后的可用偿债来源及总量债务，来计算存量债务偿还能力和新增债务偿还能力，进而得到总量债务偿还能力。</p>
                        <p>（四）确定级别</p>
                        <p class="color-999">
                            将评级要素指数映射到所对应的等级区间，得到评级结果。由评审委员会根据调整项对初始评级结果进行审核、投票。评审委员会首先需要复核定性指标的打分结果和定量指标的准确性，对数字化评级系统的评级结果进行校正。若评审委员会认为存在可能影响个体信用级别的特殊因素未在评级模型中得到反映，可对评级结果进行调整。</p>
                        <p>
                            大公互联网数字化评级信用级别划分为三等九级，级别符号采用大写英文字母表示，分为A、B、C三等，每等分为三级，即AAA、AA、A；BBB、BB、B；CCC、CC、C。除AAA和CCC（含）以下级别外，每一信用级别可用“+”、“-”符号进行微调。每个信用级别符号表达的是经偿债环境、创富能力等风险因素调整后的偿债来源对债务的保障能力。具体登记含义如下表所示：</p>

                    </div>
                    <table class="table">
                        <h4 style="text-align: center">网络贷款企业信用等级符号和定义说明</h4>
                        <thead>
                        <tr>
                            <th class="table_fir_th">信用等级</th>
                            <th>定义</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <td>AAA</td>
                            <td> 偿还债务能力极强，债务偿还安全度很高，违约风险极低</td>
                        </tr>
                        <tr class="active_td">
                            <td>AA</td>
                            <td>偿还债务能力很强，债务偿还安全度高，违约风险很低</td>

                        </tr>
                        <tr>
                            <td>A</td>
                            <td>偿还能力较强，债务偿还安全度较高，违约风险较低</td>

                        </tr>
                        <tr class="active_td">
                            <td>BBB</td>
                            <td> 偿还债务能力一般，债务偿还安全度较低，违约风险一般</td>
                        </tr>
                        <tr>
                            <td>BB</td>
                            <td>
                                偿还债务能力较弱，债务偿还安全度低，有较高违约风险
                            </td>

                        </tr>
                        <tr class="active_td">
                            <td>B</td>
                            <td>
                                偿还债务能力不足，违约风险很高
                            </td>

                        </tr>
                        <tr>
                            <td>CCC</td>
                            <td>
                                偿还债务能力弱，债务偿还安全度差，违约风险极高
                            </td>
                        </tr>
                        <tr class="active_td">
                            <td>CC</td>
                            <td>
                                在破产或重组时可获得保护较小，基本不能保证偿还债务
                            </td>

                        </tr>
                        <tr>
                            <td>C</td>
                            <td>
                                不能偿还债务
                            </td>

                        </tr>
                        <tr class="active_td" style="height:60px;">
                            <td colspan="2" style="font-size: 12px;color: #666;text-align: center;">
                                注：除AAA级、CCC级（含）以下等级外，每一个信用等级可用“+”、“-”符号进行微调，表示略高或略低于本等级。
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div>
                        <h4>三、数字化评级优势</h4>
                        <p>（一）信息采集自动化</p>
                        <p class="color-999">
                            数字化评级依托大数据时代背景，线上获取受评主体所提交的评级资料清单，并自动化采集评级所需的信息，且数据来源广泛，具有一定的权威性。自动化采集过程遵循原始数据筛选严格、数据真实可靠、操作人员专业规范三项原则，力争数据源准确无误，保证采集的信息可全面、精确反映受评主体的信用状况，高效便捷完成信息采集基础工作。</p>
                        <p>（二）数据处理标准化</p>
                        <p class="color-999">
                            数字化评级要求对数据项的来源、性质、作用、位置及编码进行标准化处理。通过对标准化后的数据项进行全面审计，以对企业提供的内部信息进行偏离度调整，最终填报至大公信用信息报表。此信用信息报表经互联网金融债务人确认后便可依据该报表和信用评级指标体系进行评级操作，最终得出相应级别。</p>
                        <p>（三）报告生成智能化</p>
                        <p class="color-999">
                            信用评级报告生成智能化是数字化评级最为关键的一环。此项内容涉及文本结构规范化、分析语句标准化、数据调用灵活化、图表绘制专业化及评级报告生成批量化，且采用流程化管理信用评级报告的生成过程。</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script>
    $("#myTab li a").each(function (index, item) {
        $(this).on("click", function () {
            $("#myTab li a").css('color', "#909090");
            $(item).css("color", "#bf1a20");
        })
    })

    /*
     * 模块建设中齿轮旋转
     * */
    var num = 0;
    setInterval(function () {
        num++;
        num %= 360;
        $(".mkjsz-icon").css({"transform": "rotate(" + num + "deg)"})
    }, 25);

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

    function sendForm() {
        post('${ctx}/user/p2pUserInformation/financingPermission', {flag: 1});
    }
</script>
</body>
</html>
