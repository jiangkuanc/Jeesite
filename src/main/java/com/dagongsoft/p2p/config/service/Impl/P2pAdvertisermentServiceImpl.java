package com.dagongsoft.p2p.config.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.config.entity.P2pAdvertiserment;
import com.dagongsoft.p2p.config.dao.P2pAdvertisermentDao;
import com.dagongsoft.p2p.config.service.P2pAdvertisermentService;
import com.dagongsoft.p2p.utils.UploadFileUtils;

/**
 * 广告ServiceImpl
 *
 * @author Chace
 * @version 2016-12-19
 */
@Transactional(readOnly = true)
@Service("p2pAdvertisermentService")
public class P2pAdvertisermentServiceImpl extends CrudService<P2pAdvertisermentDao, P2pAdvertiserment> implements P2pAdvertisermentService {

    @Resource
    private P2pAdvertisermentDao p2pAdvertisermentDao;

    public P2pAdvertiserment get(String id) {
        return super.get(id);
    }

    public List<P2pAdvertiserment> findList(P2pAdvertiserment p2pAdvertiserment) {
        return super.findList(p2pAdvertiserment);
    }

    public Page<P2pAdvertiserment> findPage(Page<P2pAdvertiserment> page, P2pAdvertiserment p2pAdvertiserment) {
        Page<P2pAdvertiserment> findPage = super.findPage(page, p2pAdvertiserment);
        List<P2pAdvertiserment> list = findPage.getList();
        for (P2pAdvertiserment ad : list) {
            String adPicture0 = ad.getAdPicture();
            String adPicture = UploadFileUtils.viewUrl(adPicture0);
            ad.setAdPicture(adPicture);
        }
        return findPage;

    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAdvertiserment p2pAdvertiserment) {
        super.save(p2pAdvertiserment);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAdvertiserment p2pAdvertiserment) {
        super.delete(p2pAdvertiserment);
    }

    /**
     * 查询不同位置的广告
     *
     * @param p2pAdvertiserment
     * @return p2pAdvertiserment
     * @author Chace
     */
    public List<P2pAdvertiserment> findByType(P2pAdvertiserment p2pAdvertiserment) {
        return p2pAdvertisermentDao.findByType(p2pAdvertiserment);
    }

    /**
     * 查询不同位置广告启用条数
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    public int getCount(P2pAdvertiserment p2pAdvertiserment) {
        return p2pAdvertisermentDao.getCount(p2pAdvertiserment);
    }

    /**
     * 修改广告启用状态
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void changeStage(P2pAdvertiserment p2pAdvertiserment) {
        p2pAdvertisermentDao.changeStage(p2pAdvertiserment);
    }

    /**
     * 停用左/右广告
     *
     * @author Chace
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void stopLeftOrRight(P2pAdvertiserment p2pAdvertiserment) {
        p2pAdvertisermentDao.stopLeftOrRight(p2pAdvertiserment);
    }

    //返回size个轮播图
    @Override
    public List<P2pAdvertiserment> takeTurn(Integer size) {
        List<P2pAdvertiserment> takeTurn = p2pAdvertisermentDao.takeTurn(size);
        for (P2pAdvertiserment p2pAdvertiserment : takeTurn) {
            String adPicture = p2pAdvertiserment.getAdPicture();
            String viewFileUrl = UploadFileUtils.viewUrl(adPicture);
            p2pAdvertiserment.setAdPicture(viewFileUrl);
        }
        return takeTurn;
    }
}