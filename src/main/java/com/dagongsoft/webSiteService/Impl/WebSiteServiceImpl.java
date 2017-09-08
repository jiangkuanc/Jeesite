package com.dagongsoft.webSiteService.Impl;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.dagongsoft.webSiteService.WebSiteService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.utils.Coder;
import com.thinkgem.jeesite.modules.sys.utils.DESCoder;
import com.thinkgem.jeesite.modules.sys.utils.RSACoder;

@Service("webSiteService")
@WebService(serviceName = "webSiteService")
public class WebSiteServiceImpl implements WebSiteService {
    @Resource
    private UserDao userDao;

    @WebMethod(exclude = false)
    @Override
    public String synchronization(String key, String sign, String data) {
        if (StringUtils.isNotBlank(key)) {
            try {
                if (RSACoder.verify(Coder.decryptBASE64(data), Global.getConfig("publicKey"), sign)) {
                    byte[] desKeyByte = RSACoder.decryptByPublicKey(Coder.decryptBASE64(key), Global.getConfig("publicKey"));
                    String jsonData = new String(DESCoder.decrypt(Coder.decryptBASE64(data), desKeyByte), "utf-8");
                    JSONObject j = JSONObject.parseObject(jsonData);
                    int num = userDao.updateUserForRelationId(j.getString("userId"), j.getString("relationId"));
                    if (num == 1) {
                        return "true";
                    } else {
                        return "false";
                    }

                }
            } catch (Exception e) {
                return "false";
            }
        }
        return "false";
    }

}
