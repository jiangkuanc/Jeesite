package com.dagongsoft.p2p.feedback.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;
import com.dagongsoft.p2p.feedback.dao.P2pReviewDocumentDao;
import com.dagongsoft.p2p.feedback.service.P2pReviewDocumentService;

/**
 * 复评材料表ServiceImpl
 *
 * @author Quincy
 * @version 2016-11-10
 */
@Transactional(readOnly = true)
@Service("p2pReviewDocumentService")
public class P2pReviewDocumentServiceImpl extends CrudService<P2pReviewDocumentDao, P2pReviewDocument> implements P2pReviewDocumentService {

    public P2pReviewDocument get(String id) {
        return super.get(id);
    }

    public List<P2pReviewDocument> findList(P2pReviewDocument p2pReviewDocument) {
        return super.findList(p2pReviewDocument);
    }

    public Page<P2pReviewDocument> findPage(Page<P2pReviewDocument> page, P2pReviewDocument p2pReviewDocument) {
        return super.findPage(page, p2pReviewDocument);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pReviewDocument p2pReviewDocument) {
        super.save(p2pReviewDocument);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pReviewDocument p2pReviewDocument) {
        super.delete(p2pReviewDocument);
    }

}