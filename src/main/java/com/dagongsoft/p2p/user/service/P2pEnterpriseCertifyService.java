/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditmanage.dao.CreditOverdueInfoDao;
import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 注册用户绑定企业，需进行企业认证Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pEnterpriseCertifyService extends CrudService<P2pEnterpriseCertifyDao, P2pEnterpriseCertify> {

    public P2pEnterpriseCertify get(String id) {
        return super.get(id);
    }

    public List<P2pEnterpriseCertify> findList(P2pEnterpriseCertify p2pEnterpriseCertify) {
        return super.findList(p2pEnterpriseCertify);
    }

    public Page<P2pEnterpriseCertify> findPage(Page<P2pEnterpriseCertify> page, P2pEnterpriseCertify p2pEnterpriseCertify) {
        return super.findPage(page, p2pEnterpriseCertify);
    }

    @Transactional(readOnly = false)
    public void save(P2pEnterpriseCertify p2pEnterpriseCertify) {
        super.save(p2pEnterpriseCertify);
    }

    @Transactional(readOnly = false)
    public void delete(P2pEnterpriseCertify p2pEnterpriseCertify) {
        super.delete(p2pEnterpriseCertify);
    }

    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;
    @Autowired
    private CreditOverdueInfoDao creditOverdueInfoDao;

    //企业列表分页
    public Page<P2pEnterpriseCertify> findEnterprisePage(Page<P2pEnterpriseCertify> page, P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertify.setPage(page);

        page.setList(p2pEnterpriseCertifyDao.findEnterpriseList(p2pEnterpriseCertify));
        return page;
    }

    /**
     * 添加或修改企业认证信息
     *
     * @param p2pEnterpriseCertify
     */
    @Transactional(readOnly = false)
    public void saveOrUpdateP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        try {
            if (p2pEnterpriseCertify.getId() == null || "".equals(p2pEnterpriseCertify.getId())) {
                p2pEnterpriseCertify.setId(IdGen.uuid());
                p2pEnterpriseCertifyDao.saveP2pEnterpriseCertify(p2pEnterpriseCertify);
            } else {
                p2pEnterpriseCertifyDao.updateP2pEnterpriseCertifyById(p2pEnterpriseCertify);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 通过属性单条查询企业认证基本信息
     *
     * @return
     */
    public P2pEnterpriseCertify findP2pEnterpriseCertifyByProperty(P2pEnterpriseCertify p2pEnterpriseCertify) {
        P2pEnterpriseCertify info = p2pEnterpriseCertifyDao.findP2pEnterpriseCertifyByProperty(p2pEnterpriseCertify);
        if (info != null) {
            info.setBusinessLicenseView(UploadFileUtils.viewUrl(info.getBusinessLicense()));
            if (info.getIdCardFront() != null && info.getIdCardBack() != null) {
                info.setIdCardFrontView(UploadFileUtils.viewUrl(info.getIdCardFront()));
                info.setIdCardBackView(UploadFileUtils.viewUrl(info.getIdCardBack()));
            }
        }
        return info;
    }

    /**
     * 通过企业ID修改企业认证状态信息
     *
     * @param p2pEnterpriseCertify
     */
    public void updateP2pEnterpriseCertifyById(P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertifyDao.updateP2pEnterpriseCertifyById(p2pEnterpriseCertify);
    }

    /**
     * 企业名称唯一性校验
     *
     * @param p2pEnterpriseCertify
     * @return
     */
    public boolean getByEnterpriseName(String enterpriseName) {
        String id = p2pEnterpriseCertifyDao.getByEnterpriseName(enterpriseName);
        return id != null ? false : true;
    }


    @Transactional(readOnly = false)
    public void updateEnterpriseOtherInfo(P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertifyDao.updateEnterpriseOtherInfo(p2pEnterpriseCertify);
    }

    public P2pEnterpriseCertify getByUserId(String userId) {
        return p2pEnterpriseCertifyDao.getByUserId(userId);
    }

    /**
     * 通过用户ID单条查询企业认证基本信息
     *
     * @return
     */
    public P2pEnterpriseCertify findP2pEnterpriseCertifyByUid(User user) {
        P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
        p2pEnterpriseCertify.setUser(user);
        return p2pEnterpriseCertifyDao.findP2pEnterpriseCertifyByProperty(p2pEnterpriseCertify);
    }

    /**
     * 查询信用记录列表
     *
     * @author Chace
     */
    public List<P2pEnterpriseCertify> findCreditList(P2pEnterpriseCertify p2pEnterpriseCertify) {
        return p2pEnterpriseCertifyDao.findCreditList(p2pEnterpriseCertify);
    }

    /**
     * 根据用户id查询信用记录详情
     *
     * @author Chace
     */
    public P2pEnterpriseCertify findCreditByUserId(P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertify = p2pEnterpriseCertifyDao.findCreditByUserId(p2pEnterpriseCertify);
        List<CreditOverdueInfo> creditOverdueInfoList = creditOverdueInfoDao.findByUserId(p2pEnterpriseCertify.getUserId());
        List<CreditOverdueInfo> list1 = new ArrayList<CreditOverdueInfo>();  //大公一带一路平台信用记录
        List<CreditOverdueInfo> list2 = new ArrayList<CreditOverdueInfo>(); //银行信贷信息信用记录
        List<CreditOverdueInfo> list3 = new ArrayList<CreditOverdueInfo>(); //其他借款平台信用记录
        if (creditOverdueInfoList != null && creditOverdueInfoList.size() > 0) {
            for (CreditOverdueInfo creditOverdueInfo : creditOverdueInfoList) {
                if ("1".equals(creditOverdueInfo.getDisposalAgency())) {
                    list1.add(creditOverdueInfo);
                }
                if ("2".equals(creditOverdueInfo.getDisposalAgency())) {
                    list2.add(creditOverdueInfo);
                }
                if ("3".equals(creditOverdueInfo.getDisposalAgency())) {
                    list3.add(creditOverdueInfo);
                }
            }
        }
        p2pEnterpriseCertify.setDagongList(list1);
        p2pEnterpriseCertify.setBankList(list2);
        p2pEnterpriseCertify.setOtherList(list3);
        return p2pEnterpriseCertify;
    }
}