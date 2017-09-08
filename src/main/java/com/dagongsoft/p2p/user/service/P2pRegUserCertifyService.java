/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pRegUserCertifyDao;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 注册用户的身份认证状态及材料Service
 *
 * @author zhenghsuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pRegUserCertifyService extends CrudService<P2pRegUserCertifyDao, P2pRegUserCertify> {

    public P2pRegUserCertify get(String id) {
        return super.get(id);
    }

    public List<P2pRegUserCertify> findList(P2pRegUserCertify p2pRegUserCertify) {
        return super.findList(p2pRegUserCertify);
    }

    public Page<P2pRegUserCertify> findPage(Page<P2pRegUserCertify> page, P2pRegUserCertify p2pRegUserCertify) {
        return super.findPage(page, p2pRegUserCertify);
    }

    @Transactional(readOnly = false)
    public void save(P2pRegUserCertify p2pRegUserCertify) {
        super.save(p2pRegUserCertify);
    }

    @Transactional(readOnly = false)
    public void delete(P2pRegUserCertify p2pRegUserCertify) {
        super.delete(p2pRegUserCertify);
    }

    @Autowired
    private P2pRegUserCertifyDao p2pRegUserCertifyDao;
    @Autowired
    private P2pUserInformationDao p2pUserInformationDao;


    public P2pRegUserCertify getByUserId(String userId) {
        return p2pRegUserCertifyDao.getByUserId(userId);
    }

    /**
     * 查询当前身份证号是否存在
     *
     * @param idNumber
     * @return
     */
    public boolean getByIdNumber(String idNumber) {
        if (p2pRegUserCertifyDao.getByIdNumber(idNumber) == null || "".equals(p2pRegUserCertifyDao.getByIdNumber(idNumber))) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 添加或修改用户账号实名认证信息
     *
     * @param p2pRegUserCertifyDao
     */
    @Transactional(readOnly = false)
    public void saveOrUpdateUserCertify(P2pRegUserCertify p2pRegUserCertify, User user) {
        if (p2pRegUserCertify.getId() == null || "".equals(p2pRegUserCertify.getId())) {
            p2pRegUserCertify.setId(IdGen.uuid());
            p2pRegUserCertifyDao.saveP2pRegUserCertify(p2pRegUserCertify);
            //进行更改用户认证状态
            P2pUserInformation p2pUserInformation = new P2pUserInformation();
            p2pUserInformation.setUser(user);
            if (user.getRoleList().get(0).getId().equals("102")) {
                p2pUserInformation.setCertificateState(CertificateState.IDENTITY_CERTIFICATION_FINISHED);//更改用户认证状态
            }
            if (user.getRoleList().get(0).getId().equals("104")) {
                p2pUserInformation.setCertificateState(2001);//更改用户认证状态
            }
            p2pUserInformationDao.updateCertificateState(p2pUserInformation);
        } else {
            p2pRegUserCertifyDao.updateP2pRegUserCertify(p2pRegUserCertify);
        }
    }

    /**
     * 通过属性单条查询实名认证基本信息
     *
     * @param p2pRegUserCertify
     * @return
     */
    public P2pRegUserCertify findP2pRegUserCertifyByProperty(P2pRegUserCertify p2pRegUserCertify) {
        P2pRegUserCertify info = p2pRegUserCertifyDao.findP2pRegUserCertifyByProperty(p2pRegUserCertify);
        if (info != null && !"".equals(info)) {
            info.setIdCardInhandView(UploadFileUtils.viewUrl(info.getIdCardInhand()));
            info.setIdCardFrontView(UploadFileUtils.viewUrl(info.getIdCardFront()));
            info.setIdCardBackView(UploadFileUtils.viewUrl(info.getIdCardBack()));
            if (info.getPowerOfAttorney() != null && !"".equals(info.getPowerOfAttorney())) {
                info.setPowerOfAttorneyView(UploadFileUtils.viewUrl(info.getPowerOfAttorney()));
            }
        }
        return info;
    }


    /**
     * 查询实名待认证数量
     *
     * @return
     */
    public Integer getRegUserCertifyNumbers() {
        return p2pRegUserCertifyDao.getRegUserCertifyNumbers();
    }

    /**
     * 查询实名待认证企业名称及时间
     */

    public List<P2pRegUserCertify> getRegUserCertifyNameAndTime() {
        return p2pRegUserCertifyDao.getRegUserCertifyNameAndTime();
    }

    /**
     * 通过用户ID查询实名认证基本信息
     *
     * @param p2pRegUserCertify
     * @return
     */
    public P2pRegUserCertify findP2pRegUserCertifyByUid(User user) {
        P2pRegUserCertify p2pRegUserCertify = new P2pRegUserCertify();
        p2pRegUserCertify.setUser(user);
        return p2pRegUserCertifyDao.findP2pRegUserCertifyByProperty(p2pRegUserCertify);
    }
}