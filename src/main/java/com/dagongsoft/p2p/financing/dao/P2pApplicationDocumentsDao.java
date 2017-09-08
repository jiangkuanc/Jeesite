/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import com.dagongsoft.p2p.financing.entity.P2pApplicationDocuments;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 融资申请材料DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pApplicationDocumentsDao extends CrudDao<P2pApplicationDocuments> {

    /**
     * 根据financingInformationId查找
     *
     * @param financingInformationId
     */
    public P2pApplicationDocuments getByFiId(String financingInformationId);


    /**
     * 添加审核材料信息
     *
     * @param p2pApplicationDocuments
     */
    public void saveP2pApplicationDocuments(P2pApplicationDocuments p2pApplicationDocuments);

    /**
     * 修改审核材料信息
     *
     * @param p2pApplicationDocuments
     */
    public void updateP2pApplicationDocuments(P2pApplicationDocuments p2pApplicationDocuments);

    /**
     * 通过融资项目ID单挑查询
     *
     * @param p2pFinancingInformation
     * @return
     */
    public P2pApplicationDocuments findP2pApplicationDocumentsByFid(P2pFinancingInformation p2pFinancingInformation);
}