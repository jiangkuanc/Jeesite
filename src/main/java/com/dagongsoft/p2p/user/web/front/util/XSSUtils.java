package com.dagongsoft.p2p.user.web.front.util;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 防止XSS攻击工具类
 *
 * @author Joe
 */
public class XSSUtils {

    private static final Logger logger = LoggerFactory.getLogger(XSSUtils.class);

    /**
     * 对传入的请求参数进行xss抵制
     *
     * @param data
     * @return 过滤后的参数
     */
    public static String escapeHtml(String input) {
        if (!StringUtils.isBlank(input)) {
            String message = "";
            try {
                message = StringEscapeUtils.escapeHtml3(input);
                if (!StringUtils.equals(input, message)) {
                    throw new XSSException("XSS拦截");
                } else {
                    return message;
                }
            } catch (XSSException e) {
                logger.warn("拦截掉xss攻击的字符串:" + e);
            }
            return StringEscapeUtils.escapeHtml3(input);
        }
        return input;

    }
}
