package com.thinkgem.jeesite.modules.sys.utils;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class DESCoder extends Coder {
    /**
     * 生成密钥
     *
     * @return
     * @throws Exception
     */
    public static byte[] initKey() throws Exception {
        return initKey(null);
    }

    public static byte[] initKey(String seed) throws Exception {
        SecureRandom secureRandom = null;

        if (seed != null) {
            secureRandom = new SecureRandom(decryptBASE64(seed));
        } else {
            secureRandom = new SecureRandom();
        }

        KeyGenerator kg = KeyGenerator.getInstance(KEY_DES);
        kg.init(secureRandom);

        SecretKey secretKey = kg.generateKey();

        return secretKey.getEncoded();
    }

    /**
     * 解密
     *
     * @param data
     * @param key
     * @return
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data, byte[] key) throws Exception {
        Key k = toKey(key);

        Cipher cipher = Cipher.getInstance(KEY_DES);
        cipher.init(Cipher.DECRYPT_MODE, k);

        return cipher.doFinal(data);
    }
}
