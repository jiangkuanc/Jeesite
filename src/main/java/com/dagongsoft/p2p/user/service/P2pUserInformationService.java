/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.utils.StaticUserBodyType;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户信息表Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pUserInformationService extends CrudService<P2pUserInformationDao, P2pUserInformation> {

    public P2pUserInformation get(String id) {
        return super.get(id);
    }

    public List<P2pUserInformation> findList(P2pUserInformation p2pUserInformation) {
        return super.findList(p2pUserInformation);
    }

    public Page<P2pUserInformation> findPage(Page<P2pUserInformation> page, P2pUserInformation p2pUserInformation) {
        return super.findPage(page, p2pUserInformation);
    }

    @Transactional(readOnly = false)
    public void save(P2pUserInformation p2pUserInformation) {
        super.save(p2pUserInformation);
    }

    @Transactional(readOnly = false)
    public void delete(P2pUserInformation p2pUserInformation) {
        super.delete(p2pUserInformation);
    }

    @Autowired
    private P2pUserInformationDao p2pUserInformationDao;

    /**
     * 用户账号注册时添加用户其他信息
     *
     * @param p2pUserInformation
     */
    @Transactional(readOnly = false)
    public void userRegister(P2pUserInformation p2pUserInformation) {
        //前台用戶註冊
        p2pUserInformationDao.userRegister(p2pUserInformation);

    }


    /**
     * 查询当前用户账号的认证状态
     *
     * @param id
     * @return
     */
    public Integer findCertificateState(String userId) {
        return p2pUserInformationDao.findCertificateState(userId);
    }

    /**
     * 修改当前用户账号的认证状态
     *
     * @param p2pUserInformation
     */
    @Transactional(readOnly = false)
    public void updateCertificateState(P2pUserInformation p2pUserInformation) {
        p2pUserInformationDao.updateCertificateState(p2pUserInformation);
    }

    @Transactional(readOnly = false)
    public void updateBindState(P2pUserInformation p2pUserInformation) {
        p2pUserInformationDao.updateBindState(p2pUserInformation);
    }

    /**
     * 通过用户ID查询密码锁定状态
     *
     * @param id
     * @return
     */
    public Integer findLockState(String userId) {
        return p2pUserInformationDao.findLockState(userId);
    }

    /**
     * 通过用户ID修改密码锁定状态
     *
     * @param p2pUserInformation
     */
    @Transactional(readOnly = false)
    public void updateLockState(P2pUserInformation p2pUserInformation) {
        p2pUserInformationDao.updateLockState(p2pUserInformation);
    }

    /**
     * 通过用户ID修改密码锁定时间
     *
     * @param p2pUserInformation
     */
    @Transactional(readOnly = false)
    public void updateLockTime(P2pUserInformation p2pUserInformation) {
        p2pUserInformation.setLockTime(new Date());
        p2pUserInformationDao.updateLockTime(p2pUserInformation);
    }

    /**
     * 通过用户主体类型查询ID最大值
     *
     * @param userBodyType
     * @return
     */
    public Integer findMaxIdByUserBodyType(Integer userBodyType) {
        return p2pUserInformationDao.findMaxIdByUserBodyType(userBodyType);
    }

    /**
     * 生成用户信息编号
     *
     * @param userBodyType
     * @return
     */
    public String createUserInformationId(Integer userBodyType) {
        DecimalFormat df = new DecimalFormat("000000");
        Integer id = findMaxIdByUserBodyType(userBodyType) + 1;
        if (userBodyType == StaticUserBodyType.ENTERPRISE) {
            return "DGP" + df.format(id);
        }
        if (userBodyType == StaticUserBodyType.FINACE) {
            return "DGE" + df.format(id);
        }
        return IdGen.uuid();
    }


    /**
     * 定时解锁用户账号锁定状态
     * 每天0点清空所有账号锁定状态
     * 0 0 0 * * ?
     */
    @Scheduled(cron = "0 0 0 * * ? ")
    @Transactional(readOnly = false)
    public void clearLockState() {
        p2pUserInformationDao.clearLockState();
    }

    //投资机构列表分页
    public Page<P2pUserInformation> findBankPage(Page<P2pUserInformation> page, P2pUserInformation p2pUserInformation) {

        p2pUserInformation.setPage(page);
        page.setList(p2pUserInformationDao.findBankList(p2pUserInformation));
        return page;
    }

    /**
     * 通过用户ID查询用户信息表
     *
     * @param user
     * @return
     */
    public P2pUserInformation findP2pUserInformationByUser(User user) {
        return p2pUserInformationDao.findP2pUserInformationByUser(user);
    }

    /**
     * 查询系统今日注册的用户数
     */
    public Integer selectTodayRegUsersCount() {
        return p2pUserInformationDao.selectTodayRegUsersCount();
    }

    /**
     * 通过用户ID添加用户头像
     */
    @Transactional(readOnly = false)
    public void saveOrUpdateUserPic(P2pUserInformation p2pUserInformation) {
        //根据ID判断用户头像是否是第一次添加
        if (p2pUserInformation.getUserpic() == null || "".equals(p2pUserInformation.getUserpic())) {
            p2pUserInformationDao.saveUserPic(p2pUserInformation);//保存头像
        } else {
            p2pUserInformationDao.updateUserPic(p2pUserInformation);//更新头像
        }
    }

    /**
     * 通过用户ID查询用户头像
     */
    public P2pUserInformation findUserPicByUserId(P2pUserInformation p2pUserInformation) {
        return p2pUserInformationDao.findUserPicByUserId(p2pUserInformation);
    }

    /**
     * 通过用户ID查询融资用户头像
     */
    public P2pUserInformation findFinancingUserPicById(String id) {
        return p2pUserInformationDao.findFinancingUserPicById(id);
    }

/*	*//**
     * 企业列表分页
     * @param page
     * @param p2pEnterpriseCertify
     * @return
     *//*
    public Page<User> findEnterpriseUserPage(Page<User> page, User user) {
		p2pEnterpriseCertify.setPage(page);
		List<P2pEnterpriseCertify> test = p2pEnterpriseCertifyDao.findEnterpriseList(User);		
		page.setList(p2pEnterpriseCertifyDao.findEnterpriseList(p2pEnterpriseCertify));
		return page;
	}*/

    /**
     * 添加联系人信息
     *
     * @param p2pUserInformation
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void updateContactInfo(P2pUserInformation p2pUserInformation) {
        p2pUserInformationDao.updateContactInfo(p2pUserInformation);
    }

    /**
     * 查询融资企业联系人信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pUserInformation findContactInfo(String userId) {
        return p2pUserInformationDao.findContactInfo(userId);
    }

    /**
     * 修改对接人信息
     *
     * @param user
     * @param p2pUserInformation
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void updateDockedInfo(User user, P2pUserInformation p2pUserInformation) {
        p2pUserInformationDao.updateDockedInfo(p2pUserInformation);
        p2pUserInformationDao.updateDockedName(user);
    }

    /**
     * 查询机构用户对接人信息
     *
     * @param p2pUserInformation
     * @return p2pUserInformation
     * @author Chace
     */
    public P2pUserInformation findDockedInfo(P2pUserInformation p2pUserInformation) {
        return p2pUserInformationDao.findDockedInfo(p2pUserInformation);
    }

    /**
     * 查询机构用户信息
     *
     * @author Chace
     */
    public P2pUserInformation getContactByUserId(P2pUserInformation p2pUserInformation) {
        return p2pUserInformationDao.getContactByUserId(p2pUserInformation);
    }
}



