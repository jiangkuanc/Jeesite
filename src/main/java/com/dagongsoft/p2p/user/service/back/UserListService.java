package com.dagongsoft.p2p.user.service.back;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pAssetValuationService;
import com.dagongsoft.p2p.user.service.P2pGuaranteeService;
import com.dagongsoft.p2p.utils.AuthenticationStatus;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.StaticUserBodyType;
import com.dagongsoft.p2p.utils.StaticUserRole;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 用户管理：用户列表Service
 *
 * @author Zeus
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class UserListService {

    @Resource
    private UserDao userDao;
    @Resource
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;
    @Resource
    private SystemService systemService;
    @Resource
    private P2pUserInformationDao p2pUserInformationdao;
    @Resource
    private P2pAssetValuationService p2pAssetValuationService;
    @Resource
    private P2pGuaranteeService p2pGuaranteeService;

    /**
     * 企业用户列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getEnterpriseList(User user) {
        return userDao.getEnterpriseList(user);
    }

    /**
     * 企业用户列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getEnterprisePage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getEnterpriseList(user));
        return page;
    }

    /**
     * 获取企业其他基本信息
     *
     * @param user
     * @return
     * @author Zeus
     */
    public User getOtherBaseInfo(User user) {
        User u = userDao.getOtherBaseInfo(user);
        P2pUserInformation p2pUserInformation = u.getP2pUserInformation();
        String userpic = null;
        String viewUrl = null;
        if (p2pUserInformation != null) {
            userpic = p2pUserInformation.getUserpic();
            viewUrl = UploadFileUtils.viewUrl(userpic);
            u.getP2pUserInformation().setUserpic(viewUrl);
        }
        return u;
    }

    /**
     * 获取企业基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public P2pEnterpriseCertify getEnterpriseBaseInfo(String userid) {
        P2pEnterpriseCertify info = p2pEnterpriseCertifyDao.getEnterpriseBaseInfo(userid);
        if (info.getBusinessLicense() != null && !"".equals(info.getBusinessLicense())) {
            info.setBusinessLicenseView(UploadFileUtils.viewUrl(info.getBusinessLicense()));
        }
        return info;
    }

    /**
     * 投资机构列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getAgencyList(User user) {
        List<User> list = userDao.getAgencyList(user);
        for (User u : list) {
            if (u.getP2pUserInformation().getCooperationPlan() != null && !"".equals(u.getP2pUserInformation().getCooperationPlan())) {
                u.getP2pUserInformation().setCooperationPlan(UploadFileUtils.viewUrl(u.getP2pUserInformation().getCooperationPlan()));
            }
        }
        return list;
    }

    /**
     * 投资机构列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getAgencyPage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getAgencyList(user));
        return page;
    }

    /**
     * 投资机构后台注册
     *
     * @param user
     * @param p2pUserInformation
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void agencyRegister(MultipartHttpServletRequest multipartRequest, User user, P2pUserInformation p2pUserInformation) {
        user.getRoleList().add(new Role(StaticUserRole.INSTITUTIONAL_INVESTOR));//给新注册用户添加角色
        user.setPassword(SystemService.entryptPassword(user.getPassword()));//密码加密sha-1
        user.setOffice(new Office("100"));
        systemService.saveUser(user);
        //将用户信息添加到用户信息表中
        p2pUserInformation.preInsert();
        p2pUserInformation.setUser(user);
        p2pUserInformation.setUserBodyType(StaticUserBodyType.FINACE);//设置用户主体类型为投资银行（机构）
        p2pUserInformation.setRegTime(new Date());//设置注册时间
        p2pUserInformation.setUserFrom("2");//设置用户来源为线下
        p2pUserInformation.setLockState(0);//设置账号锁定状态为0
        p2pUserInformation.setCertificateState(AuthenticationStatus.NEW_REGISTERED_USERS);//用户认证状态
        //文件上传
        String[] filename = {"cooperationPlanfile", "businessLicensefile", "legalPersonIdcardfile", "dockingIdscanningfile"};
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest, filename);//文件上传

        p2pUserInformation.setCooperationPlan(list.get(0));
        p2pUserInformation.setBusinessLicense(list.get(1));
        p2pUserInformation.setLegalPersonIdcard(list.get(2));
        p2pUserInformation.setDockingIdscanning(list.get(3));

        p2pUserInformationdao.bankRegister(p2pUserInformation);
    }

    /**
     * 投资机构基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getAgencyBaseInfo(String userid) {
        User user = userDao.getPersonalBaseInfo(userid);
        user.getP2pUserInformation().setBusinessLicense(UploadFileUtils.viewUrl(user.getP2pUserInformation().getBusinessLicense()));
        user.getP2pUserInformation().setLegalPersonIdcard(UploadFileUtils.viewUrl(user.getP2pUserInformation().getLegalPersonIdcard()));
        user.getP2pUserInformation().setDockingIdscanning(UploadFileUtils.viewUrl(user.getP2pUserInformation().getDockingIdscanning()));
        return user;
    }

    /**
     * 个人列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getPersonalList(User user) {
        return userDao.getPersonalList(user);
    }

    /**
     * 个人列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getPersonalPage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getPersonalList(user));
        return page;
    }

    /**
     * 个人基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getPersonalBaseInfo(String userid) {
        User user = userDao.getPersonalBaseInfo(userid);
        user.getP2pUserInformation().setUserpic(UploadFileUtils.viewUrl(user.getP2pUserInformation().getUserpic()));
        return user;
    }

    /**
     * 评估公司列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getAssetList(User user) {
        List<User> list = userDao.getAssetList(user);
        for (User u : list) {
            if (u.getP2pAssetValuation().getCooperationPlan() != null && !"".equals(u.getP2pAssetValuation().getCooperationPlan())) {
                u.getP2pAssetValuation().setCooperationPlan(UploadFileUtils.viewUrl(u.getP2pAssetValuation().getCooperationPlan()));
            }
        }
        return list;
    }

    /**
     * 评估公司列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getAssetPage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getAssetList(user));
        return page;
    }

    /**
     * 评估公司后台注册
     *
     * @param user
     * @param p2pUserInformation
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void assetRegister(MultipartHttpServletRequest multipartRequest, P2pAssetValuation p2pAssetValuation) {

        User user = p2pAssetValuation.getUser();
        user.getRoleList().add(new Role(StaticUserRole.ASSET_COMPANY));//给新注册用户添加角色
        user.setPassword(SystemService.entryptPassword(user.getPassword()));//密码加密sha-1
        user.setOffice(new Office("100"));
        systemService.saveUser(user);
        //将用户信息添加到用户信息表中
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.preInsert();
        p2pUserInformation.setUser(user);
        p2pUserInformation.setUserpic("default/head.png");//设置默认头像
        p2pUserInformation.setUserBodyType(StaticUserBodyType.ASSET);//设置用户主体类型为投资银行（机构）
        p2pUserInformation.setRegTime(new Date());//设置注册时间
        p2pUserInformation.setUserFrom("2");//设置用户来源为线下
        p2pUserInformation.setLockState(0);//设置账号锁定状态为0
        p2pUserInformation.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS);//用户认证状态
        p2pUserInformationdao.bankRegister(p2pUserInformation);


        //文件上传
        String[] filename = {"cooperationPlanfile", "businessLicensefile", "legalPersonIdcardfile", "dockingIdscanningfile"};
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest, filename);//文件上传
        p2pAssetValuation.setCooperationPlan(list.get(0));
        p2pAssetValuation.setBusinessLicense(list.get(1));
        p2pAssetValuation.setLegalPersonIdcard(list.get(2));
        p2pAssetValuation.setDockingIdscanning(list.get(3));

        p2pAssetValuation.setUserId(user.getId());
        p2pAssetValuationService.save(p2pAssetValuation);
    }

    /**
     * 评估公司基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getAssetBaseInfo(String userid) {
        User user = userDao.getAssetBaseInfo(userid);
        user.getP2pAssetValuation().setBusinessLicense(UploadFileUtils.viewUrl(user.getP2pAssetValuation().getBusinessLicense()));
        user.getP2pAssetValuation().setLegalPersonIdcard(UploadFileUtils.viewUrl(user.getP2pAssetValuation().getLegalPersonIdcard()));
        user.getP2pAssetValuation().setCooperationPlan(UploadFileUtils.viewUrl(user.getP2pAssetValuation().getCooperationPlan()));
        user.getP2pAssetValuation().setDockingIdscanning(UploadFileUtils.viewUrl(user.getP2pAssetValuation().getDockingIdscanning()));
        return user;
    }

    /**
     * 担保公司基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getGuaranteeBaseInfo(String userid) {
        User user = userDao.getAssetBaseInfo(userid);
        user.getP2pGuarantee().setBusinessLicense(UploadFileUtils.viewUrl(user.getP2pGuarantee().getBusinessLicense()));
        user.getP2pGuarantee().setLegalPersonIdcard(UploadFileUtils.viewUrl(user.getP2pGuarantee().getLegalPersonIdcard()));
        user.getP2pGuarantee().setCooperationPlan(UploadFileUtils.viewUrl(user.getP2pGuarantee().getCooperationPlan()));
        user.getP2pGuarantee().setDockingIdscanning(UploadFileUtils.viewUrl(user.getP2pGuarantee().getDockingIdscanning()));
        return user;
    }


    /**
     * 担保公司列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getGuaranteeList(User user) {
        List<User> list = userDao.getGuaranteeList(user);
        for (User u : list) {
            if (u.getP2pGuarantee().getCooperationPlan() != null && !"".equals(u.getP2pGuarantee().getCooperationPlan())) {
                u.getP2pGuarantee().setCooperationPlan(UploadFileUtils.viewUrl(u.getP2pGuarantee().getCooperationPlan()));
            }
        }
        return list;
    }

    /**
     * 担保公司列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getGuaranteePage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getGuaranteeList(user));
        return page;
    }

    /**
     * 担保公司后台注册
     *
     * @param user
     * @param p2pUserInformation
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void guaranteeRegister(MultipartHttpServletRequest multipartRequest, P2pGuarantee p2pGuarantee) {

        User user = p2pGuarantee.getUser();
        user.getRoleList().add(new Role(StaticUserRole.GUARANTEE_COMPANY));//给新注册用户添加角色
        user.setPassword(SystemService.entryptPassword(user.getPassword()));//密码加密sha-1
        user.setOffice(new Office("100"));
        systemService.saveUser(user);
        //将用户信息添加到用户信息表中
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.preInsert();
        p2pUserInformation.setUser(user);
        p2pUserInformation.setUserpic("default/head.png");//设置默认头像
        p2pUserInformation.setUserBodyType(StaticUserBodyType.GUARANTEE);//设置用户主体类型为投资银行（机构）
        p2pUserInformation.setRegTime(new Date());//设置注册时间
        p2pUserInformation.setUserFrom("2");//设置用户来源为线下
        p2pUserInformation.setLockState(0);//设置账号锁定状态为0
        p2pUserInformation.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS);//用户认证状态
        p2pUserInformationdao.bankRegister(p2pUserInformation);


        //文件上传
        String[] filename = {"cooperationPlanfile", "businessLicensefile", "legalPersonIdcardfile", "dockingIdscanningfile"};
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest, filename);//文件上传
        p2pGuarantee.setCooperationPlan(list.get(0));
        p2pGuarantee.setBusinessLicense(list.get(1));
        p2pGuarantee.setLegalPersonIdcard(list.get(2));
        p2pGuarantee.setDockingIdscanning(list.get(3));

        p2pGuarantee.setUserId(user.getId());
        p2pGuaranteeService.save(p2pGuarantee);
    }
}
