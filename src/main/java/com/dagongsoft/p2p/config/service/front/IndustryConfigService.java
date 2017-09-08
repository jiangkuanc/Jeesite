package com.dagongsoft.p2p.config.service.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.config.dao.P2pIndustryclassiDao;
import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;

@Service
@Transactional(readOnly = true)
public class IndustryConfigService {

    @Autowired
    private P2pIndustryclassiDao p2pIndustryclassiDao;

    /**
     * 加载一级行业列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pIndustryclassi> findTopCategory() {
        return p2pIndustryclassiDao.findTopCategory();
    }

    /**
     * 加载二级行业列表
     *
     * @param industryNum
     * @return
     * @author Quincy
     */
    public List<P2pIndustryclassi> findSecondCategory(String industryNum) {
        return p2pIndustryclassiDao.findSecondCategory(industryNum);
    }

    public List<P2pIndustryclassi> findList(P2pIndustryclassi p2pIndustryclassi) {
        return p2pIndustryclassiDao.findList(p2pIndustryclassi);
    }
}
