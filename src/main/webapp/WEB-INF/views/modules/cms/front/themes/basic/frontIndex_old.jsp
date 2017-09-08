<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<div class="index-banner">
    <ul class="pull-left">
        <li><img src="${ctxStatic}/dist/images/banner_02.png" alt=""></li>
    </ul>
    <div class="index-banner-txt pull-left">
        <ul>
            <li><p class="top1">历史年化收益率</p></li>
            <li><p class="top2"><span>12.7%</span></p></li>
            <li><p class="top3"><span>百万投资人信赖</span>的网贷平台</p></li>
            <li><p class="top4"><span>456822人</span>聪明的选择</p></li>
            <li><p class="top5"><input class="touzi" type="button" name="" value="我要投资"><input class="rongzi"
                                                                                               type="button" name=""
                                                                                               value="我要融资"></p></li>
        </ul>
    </div>
    <div class="clearfix"></div>
</div>
<a class="index-xuanfu-left" href="javascript:void(0) ">
</a>
<div class="index-xuanfu-left-close"></div>
<a class="index-xuanfu-right" href="javascript:void(0) ">

</a>
<div class="index-xuanfu-right-close"></div>
<a class="index-qq" href="#">
</a>
<div class="index-content-top">
    <ul>
        <li class="pull-left">
            <h3>权威</h3>
            <p>大公国际的信用评级保障</p>
            <img src="${ctxStatic}/dist/images/quanwei.jpg" alt="">
        </li>
        <li class="pull-left">
            <h3>安全</h3>
            <p>多方参与评级机制监督</p>
            <img src="${ctxStatic}/dist/images/anquan.jpg" alt="">
        </li>
        <li class="pull-left">
            <h3>全面</h3>
            <p>全方位的信息披露审查</p>
            <img src="${ctxStatic}/dist/images/quanmian.jpg" alt="">
        </li>
        <li class="pull-left">
            <h3>专业</h3>
            <p>大公二十余载专注评级力推</p>
            <img src="${ctxStatic}/dist/images/zhuanye.jpg" alt="">
        </li>
        <div class="clearfix"></div>
    </ul>
</div>
<div class="index-content-xian"></div>
<div class="index-content-bottom">
    <ul>
        <li class="pull-left">
            <h4>融资金额</h4>
            <p> 25,898万元</p>
        </li>
        <div class="pull-left"></div>
        <li class="pull-left">
            <h4>融资项目</h4>
            <p> 13,589个</p>
        </li>
        <div class="pull-left"></div>
        <li class="pull-left">
            <h4>投资收益</h4>
            <p>218万元</p>
        </li>
        <div class="pull-left"></div>
        <li class="pull-left">
            <h4>累计待还金额</h4>
            <p>18,612万元</p>
        </li>
    </ul>
</div>
<div class="index-touzi">
    <div class="index-touzi-left pull-left">
        <div class="touzi-top-left pull-left">
            <h3>投资专区</h3>
        </div>
        <div class="touzi-top-right pull-left">
            <a href="${pageContext.request.contextPath}${fns:getAdminPath()}/financing/p2pFinancingInformation/preLoadFinancingList">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="touzi-content-left pull-left">
            <ul>
                <li>
                    <div class="touzi-content-left-top">
                        <p class="pull-left">开玄光电科技融资三期</p>
                        <p class="pull-left">收益率（年化）<span>16%</span></p>
                        <span class="clearfix"></span>
                    </div>
                    <div class="touzi-content-left-bot">
                        <div class="bot-left pull-left">
                            <ul>
                                <li class="bot-left-li-1 pull-left">级别</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/wenhao.jpg"></li>
                                <li class="bot-left-li-3 pull-left">剩余额度（元）</li>
                                <li class="bot-left-li-4 pull-left">进度</li>
                                <div class="clearfix"></div>
                            </ul>
                            <ul>
                                <li class="bot-left-li-5 pull-left">AA级</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/pdf.jpg"></li>
                                <li class="bot-left-li-3 pull-left">400,000.00</li>
                                <li class="bot-left-li-4 pull-left">
                                    <div class="progress">
                                        <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar"
                                             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 2em;">
                                            0%
                                        </div>
                                    </div>
                                </li>
                                <span class="clearfix"></span>
                            </ul>
                        </div>
                        <div class="bot-right pull-left"><input class="but" type="button" value="立即投资"></div>
                        <span class="clearfix"></span>
                    </div>
                </li>
            </ul>
            <ul>
                <li>
                    <div class="touzi-content-left-top">
                        <p class="pull-left">开玄光电科技融资三期</p>
                        <p class="pull-left">收益率（年化）<span>16%</span></p>
                        <span class="clearfix"></span>
                    </div>
                    <div class="touzi-content-left-bot">
                        <div class="bot-left pull-left">
                            <ul>
                                <li class="bot-left-li-1 pull-left">级别</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/wenhao.jpg"></li>
                                <li class="bot-left-li-3 pull-left">剩余额度（元）</li>
                                <li class="bot-left-li-4 pull-left">进度</li>
                                <span class="clearfix"></span>
                            </ul>
                            <ul>
                                <li class="bot-left-li-1 pull-left">AA级</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/pdf.jpg"></li>
                                <li class="bot-left-li-3 pull-left">400,000.00</li>
                                <li class="bot-left-li-4 pull-left">
                                    <div class="progress">
                                        <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar"
                                             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 2em;">
                                            0%
                                        </div>
                                    </div>
                                </li>
                                <span class="clearfix"></span>
                            </ul>
                        </div>
                        <div class="bot-right pull-left"><input class="but" type="button" value="立即投资"></div>
                        <div class="clearfix"></div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="touzi-content-right pull-left">
            <ul>
                <li>
                    <div class="touzi-content-right-top">
                        <p class="pull-left">开玄光电科技融资三期</p>
                        <p class="pull-left">收益率（年化）<span>16%</span></p>
                        <span class="clearfix"></span>
                    </div>
                    <div class="touzi-content-right-bot">
                        <div class="bot-left pull-left">
                            <ul>
                                <li class="bot-left-li-1 pull-left">级别</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/wenhao.jpg"></li>
                                <li class="bot-left-li-3 pull-left">剩余额度（元）</li>
                                <li class="bot-left-li-4 pull-left">进度</li>
                                <span class="clearfix"></span>
                            </ul>
                            <ul>
                                <li class="bot-left-li-1 pull-left">AA级</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/pdf.jpg"></li>
                                <li class="bot-left-li-3 pull-left">400,000.00</li>
                                <li class="bot-left-li-4 pull-left">
                                    <div class="progress">
                                        <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar"
                                             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 2em;">
                                            0%
                                        </div>
                                    </div>
                                </li>
                                <span class="clearfix"></span>
                            </ul>
                        </div>
                        <div class="bot-right pull-left"><input class="but" type="button" value="立即投资"></div>
                        <div class="clearfix"></div>
                    </div>
                </li>
            </ul>
            <ul>
                <li>
                    <div class="touzi-content-right-top">
                        <p class="pull-left">开玄光电科技融资三期</p>
                        <p class="pull-left">收益率（年化）<span>16%</span></p>
                        <span class="clearfix"></span>
                    </div>
                    <div class="touzi-content-right-bot">
                        <div class="bot-left pull-left">
                            <ul>
                                <li class="bot-left-li-1 pull-left">级别</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/wenhao.jpg"></li>
                                <li class="bot-left-li-3 pull-left">剩余额度（元）</li>
                                <li class="bot-left-li-4 pull-left">进度</li>
                            </ul>
                            <ul>
                                <li class="bot-left-li-1 pull-left">AA级</li>
                                <li class="bot-left-li-2 pull-left"><img src="${ctxStatic}/dist/images/pdf.jpg"></li>
                                <li class="bot-left-li-3 pull-left">400,000.00</li>
                                <li class="bot-left-li-4 pull-left">
                                    <div class="progress">
                                        <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar"
                                             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 2em;">
                                            0%
                                        </div>
                                    </div>
                                </li>
                                <span class="clearfix"></span>
                            </ul>
                        </div>
                        <div class="bot-right pull-left"><input class="but" type="button" value="立即投资"></div>
                        <div class="clearfix"></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="index-touzi-right pull-right">
        <h3>快速投资</h3>
        <p class="index-touzi-right-p-1">选择收益率</p>
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-expanded="true">
                15%以上
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
            </ul>
        </div>
        <p class="index-touzi-right-p-2">选择信用级别</p>
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-expanded="true">
                AA
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
            </ul>
        </div>
        <p class="index-touzi-right-p-2">选择投资期限</p>
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-expanded="true">
                12月
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
            </ul>
        </div>
        <div class="index-touzi-right-but"><input class="but" type="button" value="确定"></div>


    </div>
</div>
<div class="index-rongzi">
    <div class="index-rongzi-left pull-left">
        <div class="index-rongzi-left-top">
            <div class="rongzi-top-left pull-left">
                <h3>我要融资</h3>
            </div>
            <div class="rongzi-top-right pull-left">
                <a href="#">了解更多&nbsp;&nbsp;>></a>
            </div>
        </div>
        <div class="index-rongzi-left-bot">
            <p class="index-rongzi-left-bot-p-1">申请对象：企业</p>
            <p class="index-rongzi-left-bot-p-2 pull-left">注册资金：<span>10万元以上</span></p>
            <p class="index-rongzi-left-bot-p-3 pull-left">可融资额度：<span>10万元以下</span></p>
            <span class="clearfix"></span>
            <p class="index-rongzi-left-bot-p-4 pull-left">起融额度：<span>500万元以上</span></p>
            <p class="index-rongzi-left-bot-p-5 pull-left">经营范围：非投资类企业</p>
            <span class="clearfix"></span>
            <p class="index-rongzi-left-bot-p-6 pull-left">注册地：大陆境内</p>
            <div class="index-rongzi-left-bot-button pull-left">
                <input type="button" value="开始融资">
            </div>
        </div>
    </div>
    <div class="index-rongzi-right pull-right">
        <div class="index-rongzi-right-top">
            <div class="rongzi-right-top-left pull-left">
                <h3>平台公告</h3>
            </div>
            <div class="rongzi-right-top-right pull-left">
                <a href="#">更多&nbsp;&nbsp;>></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="index-rongzi-right-bot">
            <ul>
                <li>
                    <p class="index-rongzi-right-bot-p-1 pull-left">升级维护公告</p>
                    <p class="index-rongzi-right-bot-p-2 pull-right">2015/2/26</p>
                    <span class="clearfix"></span>
                </li>
                <li>
                    <p class="index-rongzi-right-bot-p-3 pull-left">暂停服务公告</p>
                    <p class="index-rongzi-right-bot-p-4 pull-right">2015/2/6</p>
                    <span class="clearfix"></span>
                </li>
                <li>
                    <p class="index-rongzi-right-bot-p-5 pull-left">注册有礼公告</p>
                    <p class="index-rongzi-right-bot-p-6 pull-right">2015/2/15</p>
                    <span class="clearfix"></span>
                </li>
                <li>
                    <p class="index-rongzi-right-bot-p-7 pull-left">正式上线公告</p>
                    <p class="index-rongzi-right-bot-p-8 pull-right">2015/2/15</p>
                    <span class="clearfix"></span>
                </li>
                <li>
                    <p class="index-rongzi-right-bot-p-9 pull-left">试运行公告</p>
                    <p class="index-rongzi-right-bot-p-10 pull-right">2015/2/15</p>
                    <span class="clearfix"></span>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="index-xinyong">
    <div class="indxe-xinyong-top">
        <div class="index-xinyong-top-left pull-left">
            <h3>信用教育</h3>
        </div>
        <div class="index-xinyong-top-right pull-left">
            <a href="#">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="indxe-xinyong-bot">
        <div class="index-xinyong-bot-left pull-left">
            <h3>信用教育讲堂</h3>
            <div class="index-xinyong-bot-left-bg"></div>
            <div class="index-xinyong-bot-left-text">
                <ul>
                    <li><p>第一讲 大公信用教育定位及特色</p></li>
                    <li><p>第二讲 信用基本概念介绍</p></li>
                    <li><p>第三讲 中国互联网金融何去何从</p></li>
                    <li><p>第四讲 互联网金融需要引入评级制度</p></li>
                    <li><p>第五讲 让评级成为互联网金融安全....</p></li>
                </ul>
            </div>
        </div>
        <div class="index-xinyong-bot-left-text1-bg pull-left"></div>
        <div class="index-xinyong-bot-center pull-left">
            <h3>信用教育视频</h3>
            <div class="index-xinyong-bot-center-bg"></div>
            <div class="index-xinyong-bot-center-text">
                <ul class="pull-left">
                    <h4>主题</h4>
                    <li class="index-xinyong-bot-center-text-li"><p>透视评级报告中财务 ...</p></li>
                    <li class="index-xinyong-bot-center-text-li"><p>透视评级报告中财务 ...</p></li>
                    <li class="index-xinyong-bot-center-text-li"><p>透视评级报告中财务 ...</p></li>
                    <li class="index-xinyong-bot-center-text-li"><p>透视评级报告中财务 ...</p></li>
                </ul>
                <ul class="pull-right">
                    <h4>讲师</h4>
                    <li><p>李晗（大公资信）</p></li>
                    <li><p>李晗（大公资信）</p></li>
                    <li><p>李晗（大公资信）</p></li>
                    <li><p>李晗（大公资信）</p></li>
                </ul>
                <span class="clearfix"></span>
            </div>
        </div>
        <div class="index-xinyong-bot-left-text1-bg pull-left"></div>
        <div class="index-xinyong-bot-right pull-right">
            <h3>信用教育活动</h3>
            <div class="index-xinyong-bot-right-bg"></div>
            <div class="index-xinyong-bot-right-text">
                <ul>
                    <h4>可报名活动</h4>
                    <li><p>如何识别工商财务分析的十个重要指标如何识</p></li>
                    <li><p>如何识别工商财务分析的十个重要指标如何识</p></li>
                    <h4>往期活动</h4>
                    <li><p>如何识别工商财务分析的十个重要指标如何识</p></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="index-ydyl">
    <div class="index-ydyl-left pull-left">
        <div class="index-ydyl-left-top">
            <div class="ydyl-top-left pull-left">
                <h3>一带一路</h3>
            </div>
            <div class="ydyl-top-right pull-left">
                <a href="#">了解更多&nbsp;&nbsp;>></a>
            </div>
        </div>
        <div class="index-ydyl-left-bot">
            <div class="index-ydyl-bot-left pull-left">
                <h3>政府咨询</h3>
                <div class="index-ydyl-bot-left-bg"></div>
                <div class="index-ydyl-bot-left-text">
                    <ul>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                    </ul>
                </div>
            </div>
            <div class="index-ydyl-bot-left-text1-bg pull-left"></div>
            <div class="index-ydyl-bot-left pull-right">
                <h3>投资动态</h3>
                <div class="index-ydyl-bot-left-bg"></div>
                <div class="index-ydyl-bot-left-text">
                    <ul>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                        <li><p>北京市人民政府互联网金融政策发布</p></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="index-ydyl-right pull-right">
        <div class="index-ydyl-right-top">
            <div class="ydyl-right-top-left pull-left">
                <h3>政府展示</h3>
            </div>
            <div class="ydyl-right-top-right pull-left">
                <a href="#">了解更多&nbsp;&nbsp;>></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="index-ydyl-right-bot">
            <img src="${ctxStatic}/dist/images/index-zhengfu-jqqd_07.png" alt="">
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="index-hezuo">
    <div class="index-hezuo-content">
        <h3><i class="hezuo-left">———————</i>合作伙伴<i class="hezuo-right">———————</i></h3>
        <ul>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <span class="clearfix"></span>
        </ul>
        <ul>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <li class="pull-left"><img src="${ctxStatic}/dist/images/logo111.png" alt=""></li>
            <span class="clearfix"></span>
        </ul>
    </div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script>
    $(function () {
        $(".index-xuanfu-left-close").click(function () {
            $(this).hide().prev().hide();

        })
    })
    $(function () {
        $(".index-xuanfu-right-close").click(function () {
            $(this).hide().prev().hide();
        })
    })
</script>
</body>
</html>