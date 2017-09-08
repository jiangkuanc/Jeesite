package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pGuaranteeDao;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 担保公司表ServiceImpl
 *
 * @author Sora
 * @version 2016-11-15
 */
@Transactional(readOnly = true)
@Service("p2pGuaranteeService")
public class P2pGuaranteeService extends CrudService<P2pGuaranteeDao, P2pGuarantee> {

    @Autowired
    private P2pGuaranteeDao p2pGuaranteeDao;

    public P2pGuarantee get(String id) {
        return super.get(id);
    }

    public List<P2pGuarantee> findList(P2pGuarantee p2pGuarantee) {
        return super.findList(p2pGuarantee);
    }

    public Page<P2pGuarantee> findPage(Page<P2pGuarantee> page, P2pGuarantee p2pGuarantee) {
        return super.findPage(page, p2pGuarantee);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pGuarantee p2pGuarantee) {
        super.save(p2pGuarantee);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pGuarantee p2pGuarantee) {
        super.delete(p2pGuarantee);
    }

    /**
     * 加载担保公司列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pGuarantee> loadAllList() {
        return p2pGuaranteeDao.loadAllList();
    }
}