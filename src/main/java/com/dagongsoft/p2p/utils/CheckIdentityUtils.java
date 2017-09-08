package com.dagongsoft.p2p.utils;

import java.security.Key;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.xerces.impl.dv.util.Base64;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import cn.id5.gboss.bussiness.validator.service.app.QueryValidatorServices;

import com.thinkgem.jeesite.common.config.Global;

/**
 * 身份证号和姓名匹配查询
 *
 * @author Quincy
 */
public class CheckIdentityUtils {

    private static String username;        //用户名
    private static String password;        //密码
    private static String datasource;    //数据类型
    private static String key;            //加密解密key
    private static String vector;        //加密解密向量

    static {
        username = Global.getConfig("userCertify.username");
        password = Global.getConfig("userCertify.password");
        datasource = Global.getConfig("userCertify.dataType");
        key = Global.getConfig("userCertify.key");
        vector = Global.getConfig("userCertify.vector");
    }

    /**
     * 执行身份证号和姓名是否匹配操作
     *
     * @param p2pCertificationDatabase
     * @return
     * @throws Exception
     * @author Quincy
     */
    public static boolean checkIdentity(String param) throws Exception {
        //解析XML
        Document document = DocumentHelper.parseText(param);
        Element root = document.getRootElement();
        List<Element> list1 = root.elements("policeCheckInfos");//policeCheckInfos
        List<Element> list2 = list1.get(0).elements("policeCheckInfo");//policeCheckInfo
        Integer compStatus = Integer.parseInt(((Element) list2.get(0).elements("compStatus").get(0)).getText());
        return compStatus == 3 ? true : false;
    }

    /**
     * 调用实名认证webservice进行匹配查询
     *
     * @param str
     * @return
     * @throws Exception
     * @author Quincy
     */
    public static String queryIsMatch(String param) throws Exception {
//		proxy.setEndpoint("http://gboss.id5.cn/services/QueryValidatorServices?wsdl");

        return "";
    }

    /**
     * 加密算法（实名认证webservice参数）
     *
     * @param key
     * @param data
     * @return
     * @throws Exception
     * @author Quincy
     */
    public static String encode(String key, byte[] data) throws Exception {
        DESKeySpec dks = new DESKeySpec(key.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        //key的长度不能够小于8位字节
        Key secretKey = keyFactory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        IvParameterSpec iv = new IvParameterSpec(vector.getBytes()); //向量
        AlgorithmParameterSpec paramSpec = iv;
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, paramSpec);
        byte[] bytes = cipher.doFinal(data);
        return Base64.encode(bytes);
    }

    /**
     * 解密算法（实名认证webservice返回值）
     *
     * @param key
     * @param data
     * @return
     * @throws Exception
     */
    public static byte[] decode(String key, byte[] data) throws Exception {
        try {
            SecureRandom sr = new SecureRandom();
            DESKeySpec dks = new DESKeySpec(key.getBytes());
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            //key 的长度不能够小于 8 位字节
            Key secretKey = keyFactory.generateSecret(dks);
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            IvParameterSpec iv = new IvParameterSpec(vector.getBytes()); //向量
            AlgorithmParameterSpec paramSpec = iv;
            cipher.init(Cipher.DECRYPT_MODE, secretKey, paramSpec);
            return cipher.doFinal(data);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);
        }
    }
}
