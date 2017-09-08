/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 认证审核记录，包含个人身份认证、企业身份认证DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pAuditRecordDao extends CrudDao<P2pAuditRecord> {
    // 根据userid和audit_type查询认证记录
    public List<P2pAuditRecord> findAuditRecordListByIdAndType(P2pAuditRecord p2pAuditRecord);

    public List<P2pAuditRecord> findById(String id);
}