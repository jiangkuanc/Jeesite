package com.dagongsoft.p2p.utils;

import java.security.MessageDigest;

/**
 * Md5加密算法工具类
 *
 * @author Administrator
 */
public class Md5UtilsForPay {

    public static String MD5Encode(String aData) throws SecurityException {
        String resultString = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            resultString = bytes2HexString(md.digest(aData.getBytes("UTF-8")));
        } catch (Exception e) {
            e.printStackTrace();
            throw new SecurityException("MD5 运算失败");
        }

        return resultString;
    }

    public static String bytes2HexString(byte[] b) {
        String ret = "";
        for (int i = 0; i < b.length; i++) {
            String hex = Integer.toHexString(b[i] & 0xFF);
            if (hex.length() == 1) {
                hex = '0' + hex;
            }
            ret += hex.toUpperCase();
        }
        return ret;
    }

}





