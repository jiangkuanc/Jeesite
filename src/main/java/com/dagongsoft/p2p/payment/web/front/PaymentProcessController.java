package com.dagongsoft.p2p.payment.web.front;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.utils.FormatData2Json;
import com.dagongsoft.p2p.utils.SecurityUtil;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Payment;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping(value = "${adminPath}/financing/payment")
public class PaymentProcessController extends BaseController {

    @Autowired
    private PayRatingFeeService payRatingFeeService;
    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;

    public static PaymentParam paymentParam = new PaymentParam();

    /**
     * 填写订单页面
     *
     * @param payAmount
     * @param reportId
     * @param financingInformationId
     * @param userId
     * @param reportType
     * @param model
     * @return
     */
    @Deprecated
//	@RequestMapping("fillOrder")
    public String fillOrder(Double payAmount, String reportId, String financingInformationId,
                            String userId, Integer reportType, Model model) {
        return "/p2p/front/payment/fillOrder";
    }

    /**
     * "pickup" 是商户取货地址，即浏 览器导向地址，持卡人支付成功后，通联会将持卡人
     * 的浏览器导向到商户传送的pickupUrl上，同时将支付结果也一同通过这个地址送达
     * 这个地址需要对公可以访问，同时生成环境端口限制为80和443
     *
     * @param request
     * @param response
     * @throws ParseException
     */
    @RequestMapping("pickup")
    public String pickup(HttpServletRequest request, Model model) throws ParseException {
        String url = "";
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String merchantId = request.getParameter("merchantId");//商户号
        String version = request.getParameter("version");//版本号
        String language = request.getParameter("language");//语言
        String signType = request.getParameter("signType");//签名类型
        String payType = request.getParameter("payType");//支付方式
        String issuerId = request.getParameter("issuerId");//发卡方代码:
        String paymentOrderId = request.getParameter("paymentOrderId");//通联订单号(通联流水号)
        String orderNo = request.getParameter("orderNo");//商户订单号
        String orderDatetime = request.getParameter("orderDatetime");//商户订单提交时 间
        String orderAmount = request.getParameter("orderAmount");//商户订单金额
        String payDatetime = request.getParameter("payDatetime");//支付完成时间
        String payAmount = request.getParameter("payAmount");//订单实际支付金额
        String ext1 = request.getParameter("ext1");//扩展字段1
        String ext2 = request.getParameter("ext2");//扩展字段12
        String payResult = request.getParameter("payResult");//处理结果
        String errorCode = request.getParameter("errorCode");//错误代码
        String returnDatetime = request.getParameter("returnDatetime");//结果返回时间
        String signMsg = request.getParameter("signMsg");//签名字符串

        //验签是商户为了验证接收到的报文数据确实是支付网关发送的。
        //构造订单结果对象，验证签名。
        com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
        paymentResult.setMerchantId(merchantId);
        paymentResult.setVersion(version);
        paymentResult.setLanguage(language);
        paymentResult.setSignType(signType);
        paymentResult.setPayType(payType);
        paymentResult.setIssuerId(issuerId);
        paymentResult.setPaymentOrderId(paymentOrderId);
        paymentResult.setOrderNo(orderNo);
        paymentResult.setOrderDatetime(orderDatetime);
        paymentResult.setOrderAmount(orderAmount);
        paymentResult.setPayDatetime(payDatetime);
        paymentResult.setPayAmount(payAmount);
        paymentResult.setExt1(ext1);
        paymentResult.setExt2(ext2);
        paymentResult.setPayResult(payResult);
        paymentResult.setErrorCode(errorCode);
        paymentResult.setReturnDatetime(returnDatetime);

        //signMsg为服务器端返回的签名值。
        paymentResult.setSignMsg(signMsg);
        //signType为"1"时，必须设置证书路径。
        paymentResult.setCertPath(Payment.getConfig("certPath"));
//		paymentResult.setCertPath("/opt/conf/TLCert-test.cer"); 

        //验证签名：返回true代表验签成功；否则验签失败。
        boolean verifyResult = paymentResult.verify();

        //验签成功，还需要判断订单状态，为"1"表示支付成功。
        boolean paySuccess = verifyResult && payResult.equals("1");

        //根据订单编号查看订单信息
        P2pPaymentOfRatingCost P2pPaymentOfRatingCost = p2pPaymentOfRatingCostService.getInfoByOrderNo(orderNo);
        model.addAttribute("paymentOrderId", paymentOrderId);
        if (P2pPaymentOfRatingCost.getPaymentStatus() == 1) {
            return "p2p/front/payment/paymentSuccess";//支付成功页面
        }
        if (P2pPaymentOfRatingCost != null) {
            //收费项目 1-支付评级费 2-支付评级报告
            String chargingItem = P2pPaymentOfRatingCost.getChargingItem();
            if (StringUtils.isNotBlank(chargingItem)) {
                if (chargingItem.equals("1")) {//支付评级费，状态传 “3”-付款中

                    return payRatingFeeService.callbackOrder2(orderNo, 3,
                            new SimpleDateFormat("yyyyMMddHHmmss").parse(payDatetime), paymentOrderId);

                }
                if (chargingItem.equals("2")) {//支付评级报告，状态传 “3” 付款中
                    //callbackOrder方法中的"3"表示在付款中（支付中）
                    return payRatingFeeService.callbackOrder(orderNo, 3,
                            new SimpleDateFormat("yyyyMMddHHmmss").parse(payDatetime), paymentOrderId);
                }
            }
        }
        model.addAttribute("htmlProcess", "页面跳转完成");
        return "";
    }

    /**
     * receive 是后台通知地址，是通联网关服务器发起后台通知的地址
     * 可以接收到通联支付结果通知
     * 订单处理逻辑加在本地址请求上
     * 这个地址需要对公可以访问，同时生成环境端口限制为80和443
     * receiveUrl 后台通知地址只收到外网数据www开头的外网地址
     *
     * @param request
     * @param response
     */
    @RequestMapping("receive")
    public String receive(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ParseException {
        Map<String, Object> map = Maps.newHashMap();
        String url = "";
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //接收Server返回的支付结果
        String merchantId = request.getParameter("merchantId");//商户号
        String version = request.getParameter("version");//版本号
        String language = request.getParameter("language");//语言
        String signType = request.getParameter("signType");//签名类型
        String payType = request.getParameter("payType");//支付方式
        String issuerId = request.getParameter("issuerId");//发卡方代码:
        String paymentOrderId = request.getParameter("paymentOrderId");//通联订单号(通联流水号)
        String orderNo = request.getParameter("orderNo");//商户订单号
        String orderDatetime = request.getParameter("orderDatetime");//商户订单提交时 间
        String orderAmount = request.getParameter("orderAmount");//商户订单金额
        String payDatetime = request.getParameter("payDatetime");//支付完成时间
        String payAmount = request.getParameter("payAmount");//订单实际支付金额
        String ext1 = request.getParameter("ext1");//扩展字段1
        String ext2 = request.getParameter("ext2");//扩展字段12
        String payResult = request.getParameter("payResult");//处理结果
        String errorCode = request.getParameter("errorCode");//错误代码
        String returnDatetime = request.getParameter("returnDatetime");//结果返回时间
        String signMsg = request.getParameter("signMsg");//签名字符串

        //验签是商户为了验证接收到的报文数据确实是支付网关发送的。
        //构造订单结果对象，验证签名。
        com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
        paymentResult.setMerchantId(merchantId);
        paymentResult.setVersion(version);
        paymentResult.setLanguage(language);
        paymentResult.setSignType(signType);
        paymentResult.setPayType(payType);
        paymentResult.setIssuerId(issuerId);
        paymentResult.setPaymentOrderId(paymentOrderId);
        paymentResult.setOrderNo(orderNo);
        paymentResult.setOrderDatetime(orderDatetime);
        paymentResult.setOrderAmount(orderAmount);
        paymentResult.setPayDatetime(payDatetime);
        paymentResult.setPayAmount(payAmount);
        paymentResult.setExt1(ext1);
        paymentResult.setExt2(ext2);
        paymentResult.setPayResult(payResult);
        paymentResult.setErrorCode(errorCode);
        paymentResult.setReturnDatetime(returnDatetime);
        //signMsg为服务器端返回的签名值。
        paymentResult.setSignMsg(signMsg);
        //signType为"1"时，必须设置证书路径。
        paymentResult.setCertPath(Payment.getConfig("certPath"));
//		paymentResult.setCertPath("/opt/conf/TLCert-test.cer"); 

        //验证签名：返回true代表验签成功；否则验签失败。
        boolean verifyResult = paymentResult.verify();

        //验签成功，还需要判断订单状态，为"1"表示支付成功。
        boolean paySuccess = verifyResult && payResult.equals("1");

        System.out.println("---------receiveUrl接收的内容开始----------------");
        System.out.println("merchantId=" + merchantId);
        System.out.println("version=" + version);
        System.out.println("language=" + language);
        System.out.println("signType=" + signType);
        System.out.println("issuerId=" + issuerId);
        System.out.println("paymentOrderId=" + paymentOrderId);
        System.out.println("orderNo=" + orderNo);
        System.out.println("orderDatetime=" + orderDatetime);
        System.out.println("orderAmount=" + orderAmount);
        System.out.println("payDatetime=" + payDatetime);
        System.out.println("payAmount=" + payAmount);
        System.out.println("ext1=" + ext1);
        System.out.println("ext2=" + ext2);
        System.out.println("payResult=" + payResult);
        System.out.println("errorCode=" + errorCode);
        System.out.println("returnDatetime=" + returnDatetime);
        System.out.println("signMsg=" + signMsg);
        System.out.println("验证签名结果verifyResult=" + verifyResult);
        System.out.println("验签成功与否，ture表示支付成功： paySuccess=" + paySuccess);
        System.out.println("---------receiveUrl接收的内容结束----------------");

        //根据订单编号查看订单信息
        P2pPaymentOfRatingCost P2pPaymentOfRatingCost = p2pPaymentOfRatingCostService.getInfoByOrderNo(orderNo);
        model.addAttribute("paymentOrderId", paymentOrderId);
        //收费项目 1-支付评级费  2-支付评级报告
        String chargingItem = P2pPaymentOfRatingCost.getChargingItem();
        if (paySuccess) {//支付成功
            if (P2pPaymentOfRatingCost != null) {
                if (StringUtils.isNotBlank(chargingItem)) {
                    if (chargingItem.equals("1")) {//支付评级费，状态传 “1”- 支付完成

                        return payRatingFeeService.callbackOrder2(orderNo, 1,
                                new SimpleDateFormat("yyyyMMddHHmmss").parse(payDatetime), paymentOrderId);
                    }
                    if (chargingItem.equals("2")) {//支付评级报告，状态传 “1”- 支付完成
                        //callbackOrder方法中的"1"表示支付成功
                        return payRatingFeeService.callbackOrder(orderNo, 1,
                                new SimpleDateFormat("yyyyMMddHHmmss").parse(payDatetime), paymentOrderId);

                    }
                }
            }
        }
        model.addAttribute("serverProcess", "Server接收处理完成");
        return "";
    }

    /**
     * 处理支付请求信息签名
     * 提交订单后，进入第三方支付请求页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("enterPay")
    public String enterpayByHttp(HttpServletRequest request, HttpServletResponse response,
                                 Model model, PaymentParam paymentParam) {

        String serverUrl = Payment.getConfig("serverUrl");//通联支付接口服务器地址（订单提交地址）
        String key = Payment.getConfig("key");//用于计算signMsg的key值
        String version = Payment.getConfig("version");//版本号
        String language = Payment.getConfig("language");//语言 1代表utf-8
        String inputCharset = Payment.getConfig("inputCharset");//字符集
        String merchantId = Payment.getConfig("merchantId");//商户号
        String pickupUrl = Payment.getConfig("pickupUrl");//商户取货地址
        String receiveUrl = Payment.getConfig("receiveUrl");//商户系统通知地址
        String payType = Payment.getConfig("payType");//支付方式
        String signType = Payment.getConfig("signType");//签名类型

        //商户系统订单号 - 前台传,格式：NO20170419084523
        String orderNo = request.getParameter("orderNo");
        if (StringUtils.isNotBlank(orderNo)) {
            orderNo = orderNo.replace(" ", "");
        }
        //商户订单金额(单位分) - 前台传
        String orderAmount = request.getParameter("orderAmount");
        if (StringUtils.isNotBlank(orderAmount)) {
            orderAmount = orderAmount.replace(" ", "");
        }
        //商户订单生成时间格式：20170419084523 -前台传
        String orderDatetime = request.getParameter("orderDatetime");
        if (StringUtils.isNotBlank(orderDatetime)) {
            orderDatetime = orderDatetime.replace(" ", "");
        }
        String orderCurrency = Payment.getConfig("orderCurrency");//订单金额币种类型
        String orderExpireDatetime = paymentParam.getOrderExpireDatetime();

        //----根据不同的业务设置不同的过期时间----由前端页面传入过期时间，不传入，使用默认的配置时间
        //页面提交具有过期时间的orderExpireDatetime start
        if (orderExpireDatetime == null && "".equals(orderExpireDatetime)) {
            orderExpireDatetime = Payment.getConfig("orderExpireDatetime");//订单过期时间
        }
        //商户订单金额(单位分) - 前台传
        String repay = request.getParameter("repay");
        String payWhat = request.getParameter("payWhat");
        //如果是债项
        if ("debt".equals(payWhat)) {

            if ("repay".equals(repay)) {
                String financingInformationId = request.getParameter("financingInformationId");
                String uid = request.getParameter("uid");
                P2pPaymentOfRatingCost p2pPaymentOfRatingCost = createNewOrder(financingInformationId, uid);
                if (p2pPaymentOfRatingCost == null) {
                    return null;
                }
            }
        }

        //orderNo
        //this.setUserOrderTime(Payment);
        //页面提交具有过期时间的orderExpireDatetime end

        String payerTelephone = Payment.getConfig("payerTelephone");//付款人电话
        String payerEmail = Payment.getConfig("payerEmail");//付款人联系email
        String payerName = request.getParameter("paymentId");//付款方
        String payerIDCard = Payment.getConfig("payerIDCard");//付款人证件号
        String pid = Payment.getConfig("pid");//合作伙伴商户号
        String productName = request.getParameter("product");//商品名称
        String productId = Payment.getConfig("productId");//商品标识
        String productNum = Payment.getConfig("productNum");//商品数量:
        String productPrice = Payment.getConfig("productPrice");//商品单价
        String productDesc = Payment.getConfig("productDesc");//商品描述
        String ext1 = Payment.getConfig("ext1");//扩展字段1
        String ext2 = Payment.getConfig("ext2");//扩展字段2:
        String extTL = Payment.getConfig("extTL");//通联商户拓展业务字段，在v2.2.0版本之后才使用到的，用于开通分账等业务
        String issuerId = Payment.getConfig("issuerId");//发卡方代码
        String pan = Payment.getConfig("pan");//付款人支付卡号
        String tradeNature = request.getParameter("tradeNature");//贸易类型
        String sign = "";

        //若直连telpshx渠道，payerTelephone、payerName、payerIDCard、pan四个字段不可为空
        //其中payerIDCard、pan需使用公钥加密（PKCS1格式）后进行Base64编码
        if (null != payerIDCard && !"".equals(payerIDCard)) {
            try {
                //payerIDCard = SecurityUtil.encryptByPublicKey("C:\\TLCert.cer", payerIDCard);
                payerIDCard = SecurityUtil.encryptByPublicKey(
                        Payment.getConfig("certPath"), payerIDCard);
//        			payerIDCard = SecurityUtil.encryptByPublicKey("/opt/conf/TLCert.cer", payerIDCard);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (null != pan && !"".equals(pan)) {
            try {
                pan = SecurityUtil.encryptByPublicKey(Payment.getConfig("certPath"), pan);
//        			pan = SecurityUtil.encryptByPublicKey("/opt/conf/TLCert.cer", pan);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //构造订单请求对象，生成signMsg。
        com.allinpay.ets.client.RequestOrder requestOrder = new com.allinpay.ets.client.RequestOrder();
        if (null != inputCharset && !"".equals(inputCharset)) {
            requestOrder.setInputCharset(Integer.parseInt(inputCharset));
        }
        requestOrder.setPickupUrl(pickupUrl);
        requestOrder.setReceiveUrl(receiveUrl);
        requestOrder.setVersion(version);
        if (null != language && !"".equals(language)) {
            requestOrder.setLanguage(Integer.parseInt(language));
        }
        requestOrder.setSignType(Integer.parseInt(signType));
        requestOrder.setPayType(Integer.parseInt(payType));
        requestOrder.setIssuerId(issuerId);
        requestOrder.setMerchantId(merchantId);
        requestOrder.setPayerName(payerName);
        requestOrder.setPayerEmail(payerEmail);
        requestOrder.setPayerTelephone(payerTelephone);
        requestOrder.setPayerIDCard(payerIDCard);
        requestOrder.setPid(pid);
        requestOrder.setOrderNo(orderNo);
        requestOrder.setOrderAmount(Long.parseLong(orderAmount));
        requestOrder.setOrderCurrency(orderCurrency);
        requestOrder.setOrderDatetime(orderDatetime);
        requestOrder.setOrderExpireDatetime(orderExpireDatetime);
        requestOrder.setProductName(productName);
        if (null != productPrice && !"".equals(productPrice)) {
            requestOrder.setProductPrice(Long.parseLong(productPrice));
        }
        if (null != productNum && !"".equals(productNum)) {
            requestOrder.setProductNum(Integer.parseInt(productNum));
        }
        requestOrder.setProductId(productId);
        requestOrder.setProductDesc(productDesc);
        requestOrder.setExt1(ext1);
        requestOrder.setExt2(ext2);
        requestOrder.setExtTL(extTL);//通联商户拓展业务字段，在v2.2.0版本之后才使用到的，用于开通分账等业务
        requestOrder.setPan(pan);
        requestOrder.setTradeNature(tradeNature);
        requestOrder.setKey(key); //key为MD5密钥，密钥是在通联支付网关会员服务网站上设置。

        String strSrcMsg = requestOrder.getSrc(); // 此方法用于debug，测试通过后可注释。
        String strSignMsg = requestOrder.doSign(); // 签名，设为signMsg字段值。

        model.addAttribute("version", version);
        model.addAttribute("language", language);
        model.addAttribute("inputCharset", inputCharset);
        model.addAttribute("merchantId", merchantId);
        model.addAttribute("pickupUrl", pickupUrl);
        model.addAttribute("receiveUrl", receiveUrl);
        model.addAttribute("payType", payType);
        model.addAttribute("signType", signType);
        model.addAttribute("orderNo", orderNo);
        model.addAttribute("orderAmount", orderAmount);
        model.addAttribute("orderDatetime", orderDatetime);
        model.addAttribute("orderCurrency", orderCurrency);
        model.addAttribute("orderExpireDatetime", orderExpireDatetime);
        model.addAttribute("payerTelephone", payerTelephone);
        model.addAttribute("payerEmail", payerEmail);
        model.addAttribute("payerName", payerName);
        model.addAttribute("payerIDCard", payerIDCard);
        model.addAttribute("pid", pid);
        model.addAttribute("productName", productName);
        model.addAttribute("productId", productId);
        model.addAttribute("productNum", productNum);
        model.addAttribute("productPrice", productPrice);
        model.addAttribute("productDesc", productDesc);
        model.addAttribute("ext1", ext1);
        model.addAttribute("ext2", ext2);
        model.addAttribute("issuerId", issuerId);
        model.addAttribute("pan", pan);
        model.addAttribute("tradeNature", tradeNature);
        model.addAttribute("signMsg", strSignMsg);
        return "redirect:" + Payment.getConfig("serverUrl");
    }

    /**
     * p2p_payment_of_rating_cost向此表添加user_order_time 时间，在融资流程中，用于timer计算时间一天有效期限
     *
     * @return
     */
    private int setUserOrderTime() {
        Date date = new Date();

        return 0;
    }

    /**
     * 重新生成订单
     *
     * @param finacingInformationId 债项id
     * @param paymentId             userId用户id
     */
    private P2pPaymentOfRatingCost createNewOrder(String financingInformationId, String userId) {
        //读取数据库中是否含有订单，如果有此订单，在24小时之内就不在生成新订单

        P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
        p2pPaymentOfRatingCost.setId(IdGen.uuid());
        p2pPaymentOfRatingCost.setFinancingInformationId(financingInformationId);
        p2pPaymentOfRatingCost.setPaymentId(userId);
        p2pPaymentOfRatingCost.setOrderNo("NO" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
        p2pPaymentOfRatingCost.setOrderTime(new Date());
        p2pPaymentOfRatingCost.setPaymentStatus(0);//付款状态
        p2pPaymentOfRatingCost.setDelFlag("0");//正常状态，非删除
        p2pPaymentOfRatingCost.setChargingItem("1");
        double d = 5000.00;//评级费
        p2pPaymentOfRatingCost.setPaymentAmount(d);
        p2pPaymentOfRatingCost.setIsNewRecord(true);
        p2pPaymentOfRatingCostService.save(p2pPaymentOfRatingCost);
        return p2pPaymentOfRatingCost;
    }

    @RequestMapping("createNewDebtOrder")
    public void createNewDebtOrder(HttpServletRequest request, HttpServletResponse response) {
        String orderNo = request.getParameter("orderNo");
        String financingInformationId = request.getParameter("financingInformationId");
        String userId = request.getParameter("uid");
        String orderOldDatetime = request.getParameter("orderOldDatetime");

        //判断是否为过期的订单
        Date date = new Date(orderOldDatetime);
        long charge = (new Date()).getTime() - date.getTime();
        if (charge >= 24 * 60 * 60 * 1000L) {
            //TODO
        }
        //过期生成新的订单
        P2pPaymentOfRatingCost p2pPaymentOfRatingCost = createNewOrder(financingInformationId, userId);
        if (p2pPaymentOfRatingCost != null) {
            //TODO
            p2pPaymentOfRatingCostService.deleteFlag(orderNo);
        }
        //新生成订单后，需要更改之前的标识位,根据提交过来的订单号，删除原有的订单的paymentId和delflag

        //返回给ajax
        if (p2pPaymentOfRatingCost != null) {
            Date operatorTime = p2pPaymentOfRatingCost.getOrderTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String format = sdf.format(operatorTime);
            p2pPaymentOfRatingCost.setOrderTimeView(format);
            //2017-07-26
            //写回数据
            Double paymentAmount = p2pPaymentOfRatingCost.getPaymentAmount();
            NumberFormat nf = new DecimalFormat("#,###.00");
            String str = nf.format(paymentAmount);
            //暂时借用字段
            p2pPaymentOfRatingCost.setReportName(str);
            FormatData2Json.writeJson(response, p2pPaymentOfRatingCost);
        }
    }
}