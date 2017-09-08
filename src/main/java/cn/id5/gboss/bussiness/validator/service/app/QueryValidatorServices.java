package cn.id5.gboss.bussiness.validator.service.app;

import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.jws.WebService;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 */
@WebService(name = "QueryValidatorServices", targetNamespace = "http://app.service.validator.businesses.gboss.id5.cn")
public interface QueryValidatorServices {

    /**
     * @param param
     * @param userName
     * @param type
     * @param password
     * @return returns java.lang.String
     */
    @WebMethod
    @WebResult(name = "querySingleReturn", targetNamespace = "http://app.service.validator.businesses.gboss.id5.cn")
    public String querySingle(String userName, String password, String type, String param);

    /**
     * @param param
     * @param userName
     * @param type
     * @param password
     * @return returns java.lang.String
     */
    @WebMethod
    @WebResult(name = "queryBatchReturn", targetNamespace = "http://app.service.validator.businesses.gboss.id5.cn")
    public String queryBatch(String userName, String password, String type, String param);

}