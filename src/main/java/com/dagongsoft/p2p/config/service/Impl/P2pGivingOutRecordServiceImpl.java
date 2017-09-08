package com.dagongsoft.p2p.config.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.config.entity.P2pGivingOutRecord;
import com.dagongsoft.p2p.config.dao.P2pGivingOutRecordDao;
import com.dagongsoft.p2p.config.service.P2pGivingOutRecordService;
import com.dagongsoft.p2p.utils.UploadFileUtils;

/**
 * 放款审核记录ServiceImpl
 *
 * @author Chace
 * @version 2017-02-17
 */
@Transactional(readOnly = true)
@Service("p2pGivingOutRecordService")
public class P2pGivingOutRecordServiceImpl extends CrudService<P2pGivingOutRecordDao, P2pGivingOutRecord> implements P2pGivingOutRecordService {

    public P2pGivingOutRecord get(String id) {
        return super.get(id);
    }

    public List<P2pGivingOutRecord> findList(P2pGivingOutRecord p2pGivingOutRecord) {
        p2pGivingOutRecord.setGivingOutVoucher(UploadFileUtils.viewUrl(p2pGivingOutRecord.getGivingOutVoucher()));
        return super.findList(p2pGivingOutRecord);
    }

    public Page<P2pGivingOutRecord> findPage(Page<P2pGivingOutRecord> page, P2pGivingOutRecord p2pGivingOutRecord) {
        return super.findPage(page, p2pGivingOutRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pGivingOutRecord p2pGivingOutRecord) {
        super.save(p2pGivingOutRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pGivingOutRecord p2pGivingOutRecord) {
        super.delete(p2pGivingOutRecord);
    }

}