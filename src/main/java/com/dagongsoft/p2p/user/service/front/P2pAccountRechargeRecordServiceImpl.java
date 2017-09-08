package com.dagongsoft.p2p.user.service.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.user.entity.P2pAccountRechargeRecord;
import com.dagongsoft.p2p.user.dao.P2pAccountRechargeRecordDao;

/**
 * 充值记录ServiceImpl
 *
 * @author Chace
 * @version 2016-11-21
 */
@Transactional(readOnly = true)
@Service("p2pAccountRechargeRecordService")
public class P2pAccountRechargeRecordServiceImpl extends CrudService<P2pAccountRechargeRecordDao, P2pAccountRechargeRecord> implements P2pAccountRechargeRecordService {
    @Resource
    private P2pAccountRechargeRecordDao p2pAccountRechargeRecordDao;

    public P2pAccountRechargeRecord get(String id) {
        return super.get(id);
    }

    public List<P2pAccountRechargeRecord> findList(P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        return super.findList(p2pAccountRechargeRecord);
    }

    public Page<P2pAccountRechargeRecord> findPage(Page<P2pAccountRechargeRecord> page, P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        return super.findPage(page, p2pAccountRechargeRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        super.save(p2pAccountRechargeRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        super.delete(p2pAccountRechargeRecord);
    }

    /**
     * 根据userId查询充值记录
     *
     * @param p2pAccountRechargeRecord
     * @return list
     * @author Chace
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public List<P2pAccountRechargeRecord> getByUserId(P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        return p2pAccountRechargeRecordDao.getByUserId(p2pAccountRechargeRecord);
    }

}