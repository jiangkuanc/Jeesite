package com.dagongsoft.p2p.config.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.config.dao.P2pIndustryclassiDao;
import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.P2pIndustryclassiService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 行业分类ServiceImpl
 *
 * @author Quincy
 * @version 2016-11-23
 */
@Transactional(readOnly = false)
@Service("p2pIndustryclassiService")
public class P2pIndustryclassiServiceImpl extends CrudService<P2pIndustryclassiDao, P2pIndustryclassi> implements P2pIndustryclassiService {
    @Resource
    P2pIndustryclassiDao p2pIndustryclassiDao;

    public P2pIndustryclassi get(String id) {
        return super.get(id);
    }

    public List<P2pIndustryclassi> findList(P2pIndustryclassi p2pIndustryclassi) {
        return super.findList(p2pIndustryclassi);
    }

    public Page<P2pIndustryclassi> findPage(Page<P2pIndustryclassi> page, P2pIndustryclassi p2pIndustryclassi) {
        return super.findPage(page, p2pIndustryclassi);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pIndustryclassi p2pIndustryclassi) {
        super.save(p2pIndustryclassi);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pIndustryclassi p2pIndustryclassi) {
        super.delete(p2pIndustryclassi);
    }

    @Override
    public P2pIndustryclassi getByIndustyNum(String industrynum) {
        return p2pIndustryclassiDao.getByIndustyNum(industrynum);
    }

    /**
     * 加载一级行业列表
     *
     * @return
     * @author Chace
     */
    public List<P2pIndustryclassi> findTopCategory() {
        return p2pIndustryclassiDao.findTopCategory();
    }

}