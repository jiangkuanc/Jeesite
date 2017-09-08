<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhaixiang.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>
    <link href="${ctxStatic}/sweetAlert/sweetalert.css" type="text/css" rel="stylesheet"/>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/echarts.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/sweetAlert/sweetalert.min.js" type="text/javascript"></script>
    <!-- <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script> -->
    <style>
        a.but {
            width: 140px;
            height: 32px;
            line-height: 32px;
            margin-left: 47px;
            font-size: 16px;
        }

        .ketou {
            width: 100px;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
            color: #555;
            display: block;
            font-size: 14px;
            height: 30px;
            line-height: 1.2;
            padding: 3px 3px;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
        }

        table {
            table-layout: fixed;
        }

        .item {
            width: 100%;
            height: 238px;
        }

        .zhaixiang {
            margin-bottom: 76px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx }/financing/p2pFinancingInformation/preLoadFinancingList">投资专区</a></li>
        <li class="lg-active">产品详情</li>
    </ol>
</div>
<div class="zhaixiang" style="height:auto">
    <%-- <h3 title="${p2pFinancingInformation.finacingName }">债项名称：${fns:abbr(p2pFinancingInformation.finacingName,35 )} --%>
    <h3 title="${p2pFinancingInformation.finacingName }">${fns:abbr(p2pFinancingInformation.finacingName,70 )}
    </h3>
    <div class="zhai_left col-md-4">
        <div class="qdlhzc">
            <c:if test="${user.id == null || user.id == ''}">
                <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                </h3>
            </c:if>
            <c:if test="${user.id != null && user.id != ''}">
                <c:choose>

                    <c:when test="${user.id != null && user.id != '' && user.roleList[0].id == 104}">
                        <c:if test="${certificateState == 1001}">
                            <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                        </c:if>
                        <c:if test="${certificateState == 2001}">
                            <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                        </c:if>
                        <c:if test="${certificateState == 3001}">
                            <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看</h3>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="qdlhzc">
                            <div class="carousel slide" id="carousel">
                                <div class="carousel-inner">
                                    <div class="item">
                                        <img alt="" src="${certifyInfo.p2pEnterpriseCertify.businessLicense}"
                                             style="width:100%;height:100%;">
                                    </div>
                                    <div class="item">
                                        <img alt="" src="${certifyInfo.p2pEnterpriseCertify.idCardFront}"
                                             style="width:100%;height:100%;">
                                    </div>
                                    <div class="item active">
                                        <img alt="" src="${certifyInfo.p2pEnterpriseCertify.idCardBack}"
                                             style="width:100%;height:100%;">

                                    </div>
                                </div>
                                <a class="left carousel-control" data-slide="prev" href="#carousel"></a>
                                <a class="right carousel-control" data-slide="next" href="#carousel"></a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </div>
    <form id="defaultForm" method="post" action="">
        <div class="zhai_left col-md-4">
            <table width="100%" border="0">
                <tr>
                    <td height="35" align="right" valign="top" width="40%">信用等级：</td>
                    <td height="35" valign="top"
                        width="60%">${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel,'rating_level','') }
                        <!--             	<small>信用等级　${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel,'rating_level','') }  -->
                        <!-- 		    		<a href="javascript:;" target="_blank;" onclick="creditReportDown('${p2pFinancingInformation.p2pFinancingRatingInfo.creditReport}');return false;"><img src="${ctxStatic }/dist/images/pdf.jpg" alt=""></a> -->
                        <!-- 		    	</small>　 -->
                        <!-- 		    	<small><a href=""><img src="${ctxStatic }/dist/images/baiwen.jpg" alt=""></a></small></span> -->
                        &nbsp;
                        <%-- <a href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pFinancingInformation.id}"> --%>

                        <c:choose>
                            <c:when test="${user.roleList[0].id == 101}">
                                <a href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${p2pFinancingInformation.id}">
                                    <img alt="" src="${ctxStatic}/dist/images/pdfDemo.png" height="15" width="15"/>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=${id2}">
                                    <img alt="" src="${ctxStatic}/dist/images/pdfDemo.png" height="15" width="15"/>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </td>

                </tr>
                <tr>
                    <td height="35" align="right" valign="top" width="40%">收益率(年化)：</td>
                    <td height="35" valign="top" width="60%"><fmt:formatNumber
                            pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                    </td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">借款期限：</td>
                    <td height="35" valign="top">${p2pFinancingInformation.financingMaturity}&nbsp;&nbsp;个月</td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">融资总额：</td>
                    <td height="35" valign="top">
                        <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                            ${p2pFinancingInformation.applicationAmount}&nbsp;&nbsp;元
                        </c:if>
                        <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                            ${p2pFinancingInformation.financingAmount}&nbsp;&nbsp;元
                        </c:if>
                    </td>
                    <input id="totalValue" type="hidden" value="${p2pFinancingInformation.financingAmount}"/>
                    <input id="totalValue2" type="hidden" value="${p2pFinancingInformation.applicationAmount}"/>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">还款方式：</td>
                    <td height="35"
                        valign="top">${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}<%-- <a href="">　<img src="${ctxStatic }/dist/images/baiwen.jpg" alt=""> --%></a></td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">计息方式：</td>
                    <td height="35" valign="top">按日计息</td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">发布时间：</td>
                    <td height="35" valign="top"><fmt:formatDate value="${p2pFinancingInformation.publishTime}"
                                                                 pattern="yyyy-MM-dd"/></td>
                    <input id="lastPublishTime" type="hidden"
                           value="<fmt:formatDate value='${p2pFinancingInformation.lastPublishTime}' pattern='yyyy-MM-dd-HH-mm-ss'/>"/>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">到期时间：</td>
                    <td height="35" valign="top" id="daoqi"></td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">产品名称：</td>
                    <td height="35" valign="top">
                        <c:choose>
                            <c:when test="${not empty p2pFinancingInformation.productName}">
                                ${p2pFinancingInformation.productName}
                            </c:when>
                            <c:otherwise>
                                无
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
        <div class="zhai_left col-md-4">
            <table width="100%" border="0">
                <tr>
                    <td height="35" align="right" valign="top">融资进度：</td>
                    <td height="35" valign="top">
                        <!-- 修改width:100%的宽度和span标签的内容可调整进度条的进度 -->
                        <div id="progressPercent" class="progress pull-left" style="margin-bottom: 0px;">

                        </div>
                    </td>
                </tr>
                <c:if test="${p2pFinancingInformation.markType == 1}">
                    <tr>
                        <td height="35" align="right" valign="top">起投金额：</td>
                        <td height="35" valign="top">${p2pFinancingInformation.restRaiseMoney}&nbsp;&nbsp;元</td>
                    </tr>
                </c:if>
                <c:if test="${p2pFinancingInformation.markType == 2}">
                    <tr>
                        <td height="35" align="right" valign="top">起投金额：</td>
                        <!-- <td height="35" valign="top">100&nbsp;&nbsp;元</td> -->
                        <td height="35" valign="top">
                            <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                                ${p2pFinancingInformation.applicationAmount}&nbsp;&nbsp;元
                            </c:if>
                            <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                                ${p2pFinancingInformation.financingAmount}&nbsp;&nbsp;元
                            </c:if>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${p2pFinancingInformation.markType == 2}">
                    <tr>
                        <td height="35" align="right" valign="top">倍投金额：</td>
                        <td height="35" valign="top">100&nbsp;&nbsp;元</td>
                    </tr>
                </c:if>
                <tr>
                    <td height="35" align="right" valign="top">可投金额：</td>
                    <td height="35" valign="top">${p2pFinancingInformation.restRaiseMoney}&nbsp;&nbsp;元</td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">预估收益：</td>
                    <td height="35" valign="top"><span style="margin: 0;padding: 0;" id="earnings"></span>
                        <!-- <input name="earnings" type="button" value="计算" onclick="jisuan()"/> --></td>
                </tr>
                <tr>
                    <td height="35" align="right" valign="top">已投金额：</td>
                    <td height="35" valign="top">${p2pFinancingInformation.hasRaiseAmount}&nbsp;&nbsp;元</td>
                    <input id="restValue" type="hidden" value="${p2pFinancingInformation.hasRaiseAmount}"/>
                </tr>
                <c:if test="${p2pFinancingInformation.markType == 1}">
                    <tr>
                        <td height="35" align="right" valign="top">投资金额：</td>
                        <td height="35" valign="top">${p2pFinancingInformation.restRaiseMoney}&nbsp;&nbsp;元</td>
                        <input type="hidden" id="investSum" value="${p2pFinancingInformation.restRaiseMoney}"
                               name="investAmount" style="width:70px;"/>
                    </tr>
                </c:if>
                <c:if test="${p2pFinancingInformation.markType == 2}">
                    <tr>
                        <td height="45" align="right" valign="top">投资金额：</td>
                        <td height="45" valign="top">
                            <div style="width: 50%;" class="pull-left">
                                <input id="investSum" style="width: 100%;" name="investSum" type="text" class="ketou"
                                       size="10" placeholder="100整数倍">
                                <div id="mes" style="display:none; color:red;"><label>请输入100的整数倍且不得大于5万</label></div>
                            </div>&nbsp;元
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td height="35" align="right" valign="top">产品类型：</td>
                    <td height="35"
                        valign="top">${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
                </tr>
            </table>
            <a id="touzi" class="but" href="#" style="margin-left:95px;" onclick="invest();"></a>
        </div>
    </form>
    <div class="clearfix"></div>
    <div class="tabs" style="margin-top: 20px;">
        <ul>
            <!--             <li class="two current border">企业概况</li> -->
            <li class="two current border">项目概况</li>
            <li class="two border">借款用途</li>
            <li class="two border">增信情况</li>
            <li class="two border">还款来源</li>
            <li class="two border">投资记录</li>
            <li class="two border">信用记录</li>
            <c:choose>
                <c:when test="${user.id == null || user.id == ''}">
                    <a style="line-height: 2.3;font-size: 18px;" href="${ctx}/sys/user/preUserLogin">更多</a>
                </c:when>
                <c:otherwise><a style="line-height: 2.3;font-size: 18px;"
                                href="${ctx}/enterpriseDatabase/list?financingInformationId=${p2pInvestmentInformation.id}">更多</a></c:otherwise>
            </c:choose>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu">
            <div class="one current2">

                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h4>企业信息：</h4>
                            <div class="zhai_left col-md-5">
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" width="40%">企业名称：</td>
                                        <td height="45" colspan="3"
                                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">企业性质：</td>
                                        <td height="45"
                                            colspan="3">${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseNature, 'enterprise_nature', '')}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">注册资本：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.registeredCapital}元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">实缴资本：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.realCapital}元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">经营区域：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.businessArea}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">所属行业：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pIndustryclassi.classinameCn}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">联系电话：</td>
                                        <td height="45" colspan="3">
                                            <c:if test="${p2pFinancingInformation.p2pEnterpriseCertify.telephoneNum!=null}">
                                                ${p2pFinancingInformation.p2pEnterpriseCertify.telephoneNum.replaceAll("(\\d{3})\\d{5}(\\d{3})","$1*****$2")}
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">是否存在境外交易：</td>
                                        <td height="45"
                                            colspan="3">${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.isOffshoreTransaction, 'yes_no', '')}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">营业执照登记状态：</td>
                                        <td height="45"
                                            colspan="3">${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.registrationState, 'registration_state', '')}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="zhai_left col-md-5">
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" width="40%">成立时间：</td>
                                        <td height="45" colspan="3" width="60%"><fmt:formatDate
                                                value="${p2pFinancingInformation.p2pEnterpriseCertify.companyFoundDate}"
                                                pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">企业规模：</td>
                                        <td height="45"
                                            colspan="3">${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">注册地址：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.registeredAddress}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">所在地：</td>
                                        <td id="szd" height="45" colspan="3"></td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">企业股东名单：</td>
                                        <td height="45" colspan="3"><a style="color:blue;"
                                                                       href="${ctx}/financing/p2pFinancingInformation/downloads?financingInformationId=${p2pFinancingInformation.id}&rateDocumentTempId=2">下载</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">经营范围：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.businessScope}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">营业执照登记机关：</td>
                                        <td height="45"
                                            colspan="3">${p2pFinancingInformation.p2pEnterpriseCertify.registrationAuthority}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right">营业执照核准日期：</td>
                                        <td height="45" colspan="3"><fmt:formatDate
                                                value="${p2pFinancingInformation.p2pEnterpriseCertify.quasiNuclearDate}"
                                                pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right"></td>
                                        <td height="45" colspan="3"></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="zhai_left col-md-5">
                                <h4 style="margin-left: -14px;">法定代表人信息：</h4>
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" width="40%">姓名：</td>
                                        <td height="45" colspan="3"
                                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.nameOf}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" width="40%">身份证正面：</td>
                                        <td height="45" colspan="3" width="60%"><a style="color:blue;"
                                                                                   href="${ctx}/financing/p2pFinancingInformation/download?address=${p2pFinancingInformation.p2pEnterpriseCertify.idCardFront}">下载</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="zhai_left col-md-5" style="margin-top:29px">
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" width="40%">身份证号：</td>
                                        <td height="45" colspan="3"
                                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.idNumberOf}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" width="40%">身份证反面：</td>
                                        <td height="45" colspan="3" width="60%"><a style="color:blue;"
                                                                                   href="${ctx}/financing/p2pFinancingInformation/download?address=${p2pFinancingInformation.p2pEnterpriseCertify.idCardBack}">下载</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="zhai_left col-md-10">
                                <h4 style="margin-left: -14px;">项目介绍：</h4>
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" width="20%">借款项目介绍：</td>
                                        <td height="45" colspan="3" width="80%">
                                            <c:choose>
                                                <c:when test="${not empty p2pFinancingInformation.productDescription}">
                                                    ${p2pFinancingInformation.productDescription}
                                                </c:when>
                                                <c:otherwise>
                                                    无
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="zhai_left col-md-10">
                                <h4 style="margin-left: -14px;">免责声明：</h4>
                                <span rows="3" cols="140" readonly="readonly">
				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丝路互金网作为交易信息服务平台进行信息发布，不对任何投资人及/或任何交易提供任何担保，无论是明示、默示或法定的。丝路互金网平台提供的各种信息及资料仅供参考，投资人应依其独立判断做出决策。投资人据此进行投资交易的，产生的投资风险由投资人自行承担，丝路互金网不承担任何责任。
				    	</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="one">
                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="zhai_left col-md-10">
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">借款用途：</td>
                                        <td height="45" valign="top"
                                            width="80%">${fns:getDictLabel(p2pFinancingInformation.purposeClassification, 'purpose_classification', '')}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">借款用途说明：</td>
                                        <td height="45" valign="top"
                                            width="80%">${p2pFinancingInformation.purposeExplain}</td>
                                    </tr>
                                    <c:if test="${address != ''}">
                                        <tr>
                                            <td height="45" align="right" valign="top" width="20%">还款凭证：</td>
                                            <td height="45" valign="top" width="80%"><a style="color:blue;"
                                                                                        href="${ctx}/financing/p2pFinancingInformation/download2?address=${address}">下载</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="one">
                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="zhai_left col-md-10">
                                <table width="100%" border="0">
                                    <c:choose>
                                        <c:when test="${p2pFinancingInformation.p2pAssetValuation.name == null}">
                                            <tr>
                                                <td>暂无增信情况</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td height="45" align="right" valign="top" width="20%">资产评估公司名称：</td>
                                                <td height="45" valign="top"
                                                    width="80%">${p2pFinancingInformation.p2pAssetValuation.name}</td>
                                            </tr>
                                            <tr>
                                                <td height="45" align="right" valign="top" width="20%">资产评估合同：</td>
                                                <td height="45" valign="top" width="80%"><a style="color:blue;"
                                                                                            href="${ctx}/financing/p2pFinancingInformation/download?address=${p2pFinancingInformation.p2pAssetValuationRecord.evaluationContract}">下载</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="45" align="right" valign="top" width="20%">资产评估报告：</td>
                                                <td height="45" valign="top" width="80%"><a style="color:blue;"
                                                                                            href="${ctx}/financing/p2pFinancingInformation/download?address=${p2pFinancingInformation.p2pAssetValuationRecord.assessmentReport}">下载</a>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="one">
                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="zhai_left col-md-10">
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">第一还款来源：</td>
                                        <td height="45" valign="top"
                                            width="80%">${p2pFinancingInformation.repaymentFirstSource}</td>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">第二还款来源：</td>
                                        <c:choose>
                                            <c:when test="${p2pFinancingInformation.repaymentSecondSource == null || p2pFinancingInformation.repaymentSecondSource==''}">
                                                <td height="45" valign="top" width="80%">无</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td height="45" valign="top"
                                                    width="80%">${p2pFinancingInformation.repaymentSecondSource}</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">第三还款来源：</td>
                                        <c:choose>
                                            <c:when test="${p2pFinancingInformation.repaymentThirdSource == null || p2pFinancingInformation.repaymentThirdSource ==''}">
                                                <td height="45" valign="top" width="80%">无</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td height="45" valign="top"
                                                    width="80%">${p2pFinancingInformation.repaymentThirdSource}</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td height="45" align="right" valign="top" width="20%">其他还款来源：</td>
                                        <c:choose>
                                            <c:when test="${p2pFinancingInformation.repaymentOtherSource == null || p2pFinancingInformation.repaymentOtherSource ==''}">
                                                <td height="45" valign="top" width="80%">无</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td height="45" valign="top"
                                                    width="80%">${p2pFinancingInformation.repaymentOtherSource}</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="one">
                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="zhai_left col-md-10">
                                <table width="100%" border="0">
                                    <tr style="line-height: 50px">
                                        <td>用户名</td>
                                        <td>投资金额(元)</td>
                                        <td>投资时间</td>
                                        <td>投资渠道</td>
                                    </tr>
                                    <c:forEach items="${p2pInvestmentInformationList }" var="j">
                                        <tr>
                                            <td>*${fn:substring(j.user.name, 1, 20)} </td>
                                            <td>${j.investmentSumAmount }</td>
                                            <td><fmt:formatDate value="${j.lastInvestmentTime }"
                                                                pattern="yyyy-MM-dd"/></td>
                                            <td>PC端</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="one">
                <c:if test="${user.id == null || user.id == ''}">
                    <h3>请<a href="${ctx}/sys/user/preUserLogin">登录</a>或先<a href="${ctx}/sys/user/preUserRegister">注册</a>
                    </h3>
                </c:if>
                <c:if test="${user.id != null && user.id != ''}">
                    <c:choose>
                        <c:when test="${user.roleList[0].id == 104 }">
                            <c:if test="${certificateState == 1001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/certify">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 2001}">
                                <h3>请完成<a href="${ctx}/user/idCardCertify/authingIdCard">实名认证</a>后查看</h3>
                            </c:if>
                            <c:if test="${certificateState == 3001}">
                                <h3>请完成<a href="${ctx}/user/accountGeneration/redirect_failAuthIdCardUrl">实名认证</a>后查看
                                </h3>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div class="zhai_left col-md-10">
                                <h5><strong>信用评级结果</strong></h5>
                                <div id="echartDiv" style="height:300px;width:750px;"></div>
                                <table width="100%" border="0" id="hhh" style="display:none;">
                                    <!-- <tr>
                                        <td>信用评级结果</td>
                                        <td>年份</td>
                                    </tr>  -->
                                    <c:forEach items="${p2pFinancingInformationList }" var="f">
                                        <tr>
                                            <td>${f.p2pFinancingRatingInfo.ratingLevel }</td>
                                            <td>
                                                <fmt:formatDate value="${f.p2pFinancingRatingInfo.publishTime }"
                                                                pattern="yyyy-MM-dd"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <table class="table" style="border-radius: 5px;border-collapse: separate">
                                    <h5><strong>债务信息</strong></h5>
                                    <tbody>
                                    <tr>
                                        <td class="col-lg-2"></td>
                                        <td class="same-td-2 col-lg-9"
                                            style="color:#640303;font-size:25px;font-weight: bold;">风险条数
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="same-td">大公平台借贷信息</td>
                                        <c:choose>
                                            <c:when test="${countDagong == 0}">
                                                <td class="same-td-2">${countDagong}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('1')"
                                                                                                class="showModal"
                                                                                                style="cursor: pointer; color:blue">${countDagong}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td class="same-td">银行借贷信息</td>
                                        <c:choose>
                                            <c:when test="${countBank == 0}">
                                                <td class="same-td-2">${countBank}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('2')"
                                                                                                class="showModal"
                                                                                                style="cursor: pointer; color:blue">${countBank}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td class="same-td">其他渠道借款信息</td>
                                        <c:choose>
                                            <c:when test="${countOther == 0}">
                                                <td class="same-td-2">${countOther}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="same-td-2" style="color:#568eea;"><a onclick="view('3')"
                                                                                                class="showModal"
                                                                                                style="cursor: pointer; color:blue">${countOther}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
        </div>
    </div>
    <!-- 大公一带一路平台逾期信息模态框 -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
         style="margin-top: 0">
        <div class="modal-dialog" style="width:60%">
            <div class="modal-content" style="margin-top: 25%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                           style="background: #ffffff;width:100%">
                        <thead>
                        <tr>
                            <td>处置机构</td>
                            <td>笔数(笔)</td>
                            <td>币种</td>
                            <td>逾期金额(元)</td>
                            <td>逾期年月</td>
                            <td>逾期持续月数(月)</td>
                            <td>最近一次还款日期</td>
                            <td>处置完成日期</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dagongList}" var="creditOverdueInfo">
                            <tr>
                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency, 'disposal_agency', '')}</td>
                                <td>${creditOverdueInfo.pens}</td>
                                <td>${fns:getDictLabel(creditOverdueInfo.currency, 'currency', '')}</td>
                                <td><fmt:formatNumber
                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.overdueDate}"
                                        pattern="yyyy-MM"/>
                                </td>
                                <td>${creditOverdueInfo.overdueMonths}</td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>
                <!--尾部按钮-->
                <div class="modal-footer">
                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <!-- 银行信贷信息模态框 -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
         style="margin-top: 0">
        <div class="modal-dialog" style="width:60%">
            <div class="modal-content" style="margin-top: 25%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                           style="background: #ffffff;width:100%">
                        <thead>
                        <tr>
                            <td>处置机构</td>
                            <td>笔数(笔)</td>
                            <td>币种</td>
                            <td>逾期金额(元)</td>
                            <td>逾期年月</td>
                            <td>逾期持续月数(月)</td>
                            <td>最近一次还款日期</td>
                            <td>处置完成日期</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bankList}" var="creditOverdueInfo">
                            <tr>
                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                        'disposal_agency', '')}</td>
                                <td>${creditOverdueInfo.pens}</td>
                                <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                        'currency', '')}</td>
                                <td><fmt:formatNumber
                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.overdueDate}"
                                        pattern="yyyy-MM"/>
                                </td>
                                <td>${creditOverdueInfo.overdueMonths}</td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>
                <!--尾部按钮-->
                <div class="modal-footer">
                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <!-- 其他借贷平台逾期模态框 -->
    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
         style="margin-top: 0">
        <div class="modal-dialog" style="width:60%">
            <div class="modal-content" style="margin-top: 25%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-condensed" border="1" bordercolor="#ccc"
                           style="background: #ffffff;width:100%">
                        <thead>
                        <tr>
                            <td>处置机构</td>
                            <td>笔数(笔)</td>
                            <td>币种</td>
                            <td>逾期金额(元)</td>
                            <td>逾期年月</td>
                            <td>逾期持续月数(月)</td>
                            <td>最近一次还款日期</td>
                            <td>处置完成日期</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${otherList}" var="creditOverdueInfo">
                            <tr>
                                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,
                                        'disposal_agency', '')}</td>
                                <td>${creditOverdueInfo.pens}</td>
                                <td>${fns:getDictLabel(creditOverdueInfo.currency,
                                        'currency', '')}</td>
                                <td><fmt:formatNumber
                                        pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.overdueDate}"
                                        pattern="yyyy-MM"/>
                                </td>
                                <td>${creditOverdueInfo.overdueMonths}</td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.lastRepaymentDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                                <td><fmt:formatDate
                                        value="${creditOverdueInfo.disposalCompletionDate}"
                                        pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>
                <!--尾部按钮-->
                <div class="modal-footer">
                    <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <div class="clearfix"></div>
    <!--申诉弹窗部分开始-->
    <div class="modal fade bs-example-modal-sm shenshu" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 600px;">
                <h3 style="width: 100%;text-align: center;font-weight: bold;">举报内容</h3>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">企业名称:</label>
                    <tr>
                        <td height="45" colspan="3"
                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
                    </tr>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">企业名称:</label>
                    <tr>
                        <td height="45" colspan="3"
                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
                    </tr>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">企业名称:</label>
                    <tr>
                        <td height="45" colspan="3"
                            width="60%">${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
                    </tr>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">原因描述:</label>
                    <textarea class="form-control" rows="6"
                              style="width: 405px;resize: none;border-radius:10px;display: inline-block;"></textarea>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">上传附件:</label>
                    <input type="text" class="form-control" placeholder="上传附件"
                           style="width: 200px; display: inline-block;">
                    <button type="button" class="btn btn-danger">浏览</button>
                    <button type="button" class="btn btn-danger">上传</button>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <p style="width: 100%;padding-left: 200px;">
                        <button type="button" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-default quxiao">取消</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--申诉弹窗部分结束-->
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


<script type="text/javascript">
    var earnings;
    var daoqiDate;
    var nowDate = new Date();
    var flag = 0;
    function jisuan() {
        var amount = $("#investSum").val();
        if (amount == null || amount == "") {
            amount = 0;
        }
        var rate = '${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate}';
        var repaymentMode = '${p2pFinancingInformation.repaymentMode}';
        var phase = '${p2pFinancingInformation.financingMaturity}';
        $.ajax({

            url: "${ctx}/financing/p2pFinancingInformation/calculateIncome?amount=" + amount + "&rate=" + rate + "&repaymentMode=" + repaymentMode + "&phase=" + phase,//加载数据
            type: 'post',
            dataType: 'text',
            success: function (data) {
                $("#earnings").text(data + "元");
            }
        });
    }
    $(function () {
        var amount = $("#investSum").val();
        if (amount == null || amount == "") {
            amount = 0;
        }
        jisuan();
    })
    $(function () {
        $("#investSum").bind('input oninput', function () {
            regCheck();
            if (flag == 1) {
                this.val("");
            }
            jisuan();
        });
    });
    $(function () {
        var provinceCode = '${p2pFinancingInformation.p2pEnterpriseCertify.provincialArea}';
        var cityCode = '${p2pFinancingInformation.p2pEnterpriseCertify.municipalArea}';
        //*******计算到期时间**********
        var deadLine = '${p2pFinancingInformation.raiseTimeLimit}';//募集期限
        var lastPublishTime = $("#lastPublishTime").val();//最新发布时间
        var arr = lastPublishTime.split('-');
        var date = new Date(arr[0], arr[1] - 1, arr[2], arr[3], arr[4], arr[5]);
        var hasRaiseTime = '${p2pFinancingInformation.hasRaiseTime}';//已募集时间
        var expireDate = deadLine * 24 * 3600 * 1000 + (date.getTime() - hasRaiseTime * 1000);
        expireDate = new Date(expireDate);
        daoqiDate = expireDate;
        var n = expireDate.getFullYear();
        var y = expireDate.getMonth() + 1;
        var r = expireDate.getDate();
        var s = expireDate.getHours();
        var f = expireDate.getMinutes();
        var m = expireDate.getSeconds();
        y = y < 10 ? '0' + y : y;
        r = r < 10 ? '0' + r : r;
        s = s < 10 ? '0' + s : s;
        f = f < 10 ? '0' + f : f;
        m = m < 10 ? '0' + m : m;
        $("#daoqi").text(n + "-" + y + "-" + r + " " + s + ":" + f + ":" + m);
        //*******计算到期时间**********
        $.ajax({
            url: "${ctx}/financing/p2pFinancingInformation/findArea?provinceCode=" + provinceCode + "&cityCode=" + cityCode,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var province = data[0].provincialArea;
                var city = data[0].municipalArea;
                var areaStr = province + "-" + city;
                $("#szd").html(areaStr);
            }
        });
    });
    //初始化轮播时间
    $('.carousel').carousel({
        interval: 3000
    })
    $(function () {
        $(".tabs ul li").click(function () {
            $(this).addClass('current').siblings().removeClass('current');
            var index = $(".tabs ul li").index(this);
            $('.tabs div .one').eq(index).show().addClass('current2').siblings().hide().removeClass('current2');
        });
    });
    /////////下载报告///////////
    function creditReportDown(report) {
        if (report == null || report == '') {
            alert("没有添加评级报告");
            return false;
        } else {
            var url = report.substring(1);
// 		   	location.href = url;
            window.open(url);
        }
    }

    function getnum() {
        var value = $("#investSum").val();
        var str = value % 100;
        if (str != 0)
            $("#investSum").val('');
    }

    function regCheck() {
        var reg = /^[1-5]{1}[0-9]{2}[0]{2}$|^[1-9]{1}[0-9]{1}[0]{2}$|^[1-9]{1}[0]{2}$/;
        if (reg.test($("#investSum").val())) {
            $("#mes").hide();
            flag = 0;
        } else {
            flag = 1;
            $("#mes").show();
        }
    }

    $(function () {
        var totalValue1 = $("#totalValue").val() - 0;
        var totalValue2 = $("#totalValue2").val() - 0;
        var totalValue;
        if (totalValue1 >= totalValue2) {
            totalValue = totalValue2;
        } else {
            totalValue = totalValue1;
        }
        var restValue = $("#restValue").val();
        var percent = (restValue / totalValue * 100).toFixed(2);
        var str = '<div class="progress-bar" role="progressbar" aria-valuenow="' + percent + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + percent + '%;">' +
            '<span class="pull-left" style="color:#000">' + percent + '%</span>' +
            '</div>';
        $("#progressPercent").html(str);
    });
    var userId;
    var roleId;
    var markType;
    var p2pInvestmentInformation;
    var certificateState = '${certificateState}';
    $(function () {
        userId = '${user.id}';
        roleId = '${user.roleList[0].id}';
        markType = '${p2pFinancingInformation.markType}';
        p2pInvestmentInformation = '${p2pInvestmentInformation}';
        if (userId != null && userId != '' && roleId == 104 && markType == 2 && p2pInvestmentInformation != null && p2pInvestmentInformation != '') {
            $("#touzi").text("追加投资");
        } else {
            $("#touzi").text("立即投资");
        }
        var currentStage = ${p2pFinancingInformation.currentStage};
        var inRaiseState = ${p2pFinancingInformation.inRaiseState};
        if (currentStage != 500 || inRaiseState != 0 || daoqiDate <= nowDate) {
            $("#touzi").css("background", "#909090");
        }
    });
    /**
     *点击投资按钮事件
     */
    function invest() {
        var token = '${token}';
        var currentStage = ${p2pFinancingInformation.currentStage};
        var inRaiseState = ${p2pFinancingInformation.inRaiseState};
        if (currentStage != 500 || inRaiseState != 0 || daoqiDate <= nowDate) {
            alert("项目不在融资期！");
        } else {
            earnings = $("#earnings").text();
            earnings = parseFloat(earnings);
            var p2pFinancingInformationId = '${p2pFinancingInformation.id}';
            if (userId == null || userId == '') {
                window.location.href = '${ctx}/sys/user/preUserLogin';
            } else {
                if (roleId == 102) {
                    alert("很抱歉，您是融资企业，本功能尚不开放。");
                } else if (roleId == 105) {
                    alert("很抱歉，您是评估公司，本功能尚不开放。");
                } else if (roleId == 106) {
                    alert("很抱歉，您是担保公司，本功能尚不开放。");
                } else if (roleId == 101 && markType == 2) {
                    alert("很抱歉，您是机构类投资用户，无法投资个人类。");
                } else if (roleId == 104 && markType == 1) {
                    alert("很抱歉，您是个人类投资用户，无法投资机构类。");
                } else if (roleId == 104 && certificateState == 1001) {
                    window.location.href = '${ctx}/user/idCardCertify/certify';
                } else if (roleId == 101 && markType == 1) {
                    if (certificateState == 303) {
                        swal({
                            title: "确认投资吗？",
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            window.location.href = "${ctx}/financing/p2pFinancingInformation/investmentSuccess?financingInformationId=" + p2pFinancingInformationId + "&earnings=" + earnings + "&token=" + token;
                        });

                    } else {
                        swal({
                            title: "您尚未完成投资前准备，是否立即去完成准备事项？",
                            showCancelButton: true,
                            type: "info",
                        }, function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            window.location.href = '${ctx}/user/Institution/berforInvestment?certificateState=' + certificateState;
                        });
                    }
                } else if (roleId == 104 && markType == 2) {
                    var investSum = $("#investSum").val();
                    if (flag == 1 || investSum == null || investSum == "") {
                        alert("请输入投资金额，并且为100的整数倍！");
                    } else {
                        investSum = parseInt(investSum);
                        if (certificateState == 1040) {
                            var k = 0;
                            var restRaiseMoney = '${p2pFinancingInformation.restRaiseMoney}';
                            var financingAmount = '${p2pFinancingInformation.financingAmount}';
                            var textzhuijia = $("#touzi").text();
                            var a = parseFloat(financingAmount);
                            a = parseFloat(a / 5);
                            var b = parseFloat(restRaiseMoney);
                            if (p2pInvestmentInformation != null && p2pInvestmentInformation != '') {
                                var investmentSumAmount = parseFloat('${p2pInvestmentInformation.investmentSumAmount}');
                                var c = parseFloat(investSum + investmentSumAmount);
                                if (c > a || c > b || c > 50000) {
                                    k = 1;
                                }
                            } else {
                                if (a < investSum || b < investSum || investSum > 50000) {
                                    k = 1;
                                }
                            }
                            if (k == 1) {
                                alert("您的总投资额不得超过5万且不得超过总投资额的五分之一！");
                            } else {
                                swal({
                                    title: "确认投资吗？",
                                    showCancelButton: true,
                                    type: "info",
                                }, function (inputValue) {
                                    if (inputValue === false) {
                                        return false;
                                    }
                                    window.location.href = '${ctx}/financing/p2pFinancingInformation/investmentFinalizationPerson?p2pFinancingInformationId=' + p2pFinancingInformationId + '&investSum=' + investSum + '&earnings=' + earnings + '&token=' + token;
                                });
                            }
                        } else {
                            swal({
                                title: "您尚未完成投资前准备，是否立即去完成准备事项？",
                                showCancelButton: true,
                                type: "info",
                            }, function (inputValue) {
                                if (inputValue === false) {
                                    return false;
                                }
                                window.location.href = '${ctx}/user/accountGeneration/berforInvestment?certificateState=' + certificateState;
                            });
                        }
                    }
                }
            }
        }

    }
</script>
<script>
    $(function () {

        var ftd = $('#hhh tr td:nth-child(1)').html();
        var ltd = $('#hhh tr td:nth-child(2)').html();

        var dataY = [ftd];
        var dataX = [ltd];
        var data = [];
        for (var i = 0; i < dataY.length; i++) {
            if (dataY[i] == 'BB-') {
                data.push('0');
            } else if (dataY[i] == 'BB') {
                data.push('0.5');
            } else if (dataY[i] == 'BB+') {
                data.push('1');
            } else if (dataY[i] == 'BBB-') {
                data.push('1.5');
            } else if (dataY[i] == 'BBB') {
                data.push('2');
            } else if (dataY[i] == 'BBB+') {
                data.push('2.5');
            } else if (dataY[i] == 'A-') {
                data.push('3');
            } else if (dataY[i] == 'A') {
                data.push('3.5');
            } else if (dataY[i] == 'A+') {
                data.push('4');
            } else if (dataY[i] == 'AA-') {
                data.push('4.5');
            } else if (dataY[i] == 'AA') {
                data.push('5');
            } else if (dataY[i] == 'AA+') {
                data.push('5.5');
            } else if (dataY[i] == 'AAA') {
                data.push('6');
            }
        }

        var myChart = echarts.init(document.getElementById('echartDiv'));
        var option = {
            /*  tooltip:{
             formatter: function (val) {
             console.log(val.data);
             var value=val.data;
             if(value==0){
             return "AAA" + val.name;
             }else if(value==1){
             return "AA" + val.name;
             }else if(value==2){
             return "A" + val.name;
             }else if(value==3){
             return "BB+" + val.name;
             }else if(value==4){
             return "BB-" + val.name;
             }else if(value==5){
             return "BB" + val.name;
             }}

             }, */
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: function (value) {
                        console.log(value)
                        if (value == 0) {
                            return "BB-"
                        } else if (value == 0.5) {
                            return "BB"
                        } else if (value == 1) {
                            return "BB+"
                        } else if (value == 1.5) {
                            return "BBB-"
                        } else if (value == 2) {
                            return "BBB"
                        } else if (value == 2.5) {
                            return "BBB+"
                        } else if (value == 3) {
                            return "A-"
                        } else if (value == 3.5) {
                            return "A"
                        } else if (value == 4) {
                            return "A+"
                        } else if (value == 4.5) {
                            return "AA-"
                        } else if (value == 5) {
                            return "AA"
                        } else if (value == 5.5) {
                            return "AA+"
                        } else if (value == 6) {
                            return "AAA"
                        }
                    }
                }
            },
            xAxis: {
                type: 'category',
                data: dataX
            },
            series: [{
                name: '000',
                type: 'line',
                step: 'middle',
                data: data
            }]
        }
        myChart.setOption(option);

    });

    function view(param) {
        if (param == 1) {
            $("#myModal1").modal("show")
        }
        if (param == 2) {
            $("#myModal2").modal("show")
        }
        if (param == 3) {
            $("#myModal3").modal("show")
        }
    }
</script>
</body>
</html>