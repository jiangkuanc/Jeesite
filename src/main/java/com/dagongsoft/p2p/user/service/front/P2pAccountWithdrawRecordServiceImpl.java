package com.dagongsoft.p2p.user.service.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.user.entity.P2pAccountWithdrawRecord;
import com.dagongsoft.p2p.user.dao.P2pAccountWithdrawRecordDao;

/**
 * 提现记录ServiceImpl
 *
 * @author Chace
 * @version 2016-11-21
 */
@Transactional(readOnly = true)
@Service("p2pAccountWithdrawRecordService")
public class P2pAccountWithdrawRecordServiceImpl extends CrudService<P2pAccountWithdrawRecordDao, P2pAccountWithdrawRecord> implements P2pAccountWithdrawRecordService {

    @Resource
    private P2pAccountWithdrawRecordDao p2pAccountWithdrawRecordDao;

    public P2pAccountWithdrawRecord get(String id) {
        return super.get(id);
    }

    public List<P2pAccountWithdrawRecord> findList(P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        return super.findList(p2pAccountWithdrawRecord);
    }

    public Page<P2pAccountWithdrawRecord> findPage(Page<P2pAccountWithdrawRecord> page, P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        return super.findPage(page, p2pAccountWithdrawRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        super.save(p2pAccountWithdrawRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        super.delete(p2pAccountWithdrawRecord);
    }

    /**
     * 根据userId查询提现记录
     *
     * @param P2pAccountWithdrawRecord
     * @return list
     * @author Chace
     */
    public List<P2pAccountWithdrawRecord> getByUserId(P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        return p2pAccountWithdrawRecordDao.getByUserId(p2pAccountWithdrawRecord);
    }

    @Override
    @Transactional(readOnly = false)
    public void update(P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        p2pAccountWithdrawRecordDao.update(p2pAccountWithdrawRecord);
    }

}