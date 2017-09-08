package com.dagongsoft.p2p.feedback.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.feedback.dao.P2pRatingResultViewDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.feedback.service.P2pRatingResultViewService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 评级结果意见表ServiceImpl
 *
 * @author Quincy
 * @version 2016-11-10
 */
@Transactional(readOnly = true)
@Service("p2pRatingResultViewService")
public class P2pRatingResultViewServiceImpl extends CrudService<P2pRatingResultViewDao, P2pRatingResultView> implements P2pRatingResultViewService {

    public P2pRatingResultView get(String id) {
        return super.get(id);
    }

    public List<P2pRatingResultView> findList(P2pRatingResultView p2pRatingResultView) {
        return super.findList(p2pRatingResultView);
    }

    public Page<P2pRatingResultView> findPage(Page<P2pRatingResultView> page, P2pRatingResultView p2pRatingResultView) {
        return super.findPage(page, p2pRatingResultView);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRatingResultView p2pRatingResultView) {
        super.save(p2pRatingResultView);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRatingResultView p2pRatingResultView) {
        super.delete(p2pRatingResultView);
    }


}