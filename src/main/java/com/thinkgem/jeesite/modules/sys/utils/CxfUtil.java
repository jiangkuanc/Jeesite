package com.thinkgem.jeesite.modules.sys.utils;


import java.util.HashMap;
import java.util.Map;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;


public class CxfUtil {

    private static Object obj;

    public static void init(Class o, String url) {
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
        Map property = new HashMap();
        property.put("force", false);
        factory.setProperties(property);
        factory.setAddress(url);
        factory.setServiceClass(o);
        obj = factory.create();
        //以下代码通过代理方式设置超时时间
        Client proxy = ClientProxy.getClient(obj);
        HTTPConduit conduit = (HTTPConduit) proxy.getConduit();
        HTTPClientPolicy policy = new HTTPClientPolicy();
        policy.setConnectionTimeout(2 * 60 * 60 * 1000);
        policy.setReceiveTimeout(2 * 60 * 60 * 1000);
        conduit.setClient(policy);  
        
   /*     TLSClientParameters tlsCP = new TLSClientParameters();
        
     // 服务器证书库
     String keyPassword = "password";
     KeyStore keyStore = KeyStore.getInstance("JKS");
     String keyStoreLoc = "";
     keyStore.load(new FileInputStream(keyStoreLoc),
             keyPassword.toCharArray());
     KeyManager[] myKeyManagers = getKeyManagers(keyStore, keyPassword);
     tlsCP.setKeyManagers(myKeyManagers);
      
     // 证书信任库
     KeyStore trustStore = KeyStore.getInstance("JKS");
     String trustStoreLoc = contextPath + "/truststore.jks";
     trustStore.load(new FileInputStream(trustStoreLoc),
             keyPassword.toCharArray());
     TrustManager[] myTrustStoreKeyManagers = getTrustManagers(trustStore);
     tlsCP.setTrustManagers(myTrustStoreKeyManagers);
      
     // The following is not recommended and would not be done in a
     // prodcution environment,
     // this is just for illustrative purpose
     tlsCP.setDisableCNCheck(true);
      
     httpConduit.setTlsClientParameters(tlsCP);*/
    }

    public static Object getObject(Class o, String url) {
        init(o, url);
        return obj;
    }
}
