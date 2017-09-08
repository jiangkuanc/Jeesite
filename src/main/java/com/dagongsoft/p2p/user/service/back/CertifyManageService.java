/**
 *
 */
package com.dagongsoft.p2p.user.service.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @author Zeus
 * @2016-10-27
 */
@Service
@Transactional(readOnly = true)
public class CertifyManageService {

    @Resource
    private UserDao userDao;
    @Resource
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Resource
    private P2pAuditRecordService p2pAuditRecordService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Resource
    private P2pUserInformationService p2pUserInformationService;
    @Resource
    private P2pUserInformationDao p2pUserInformationDao;
    @Resource
    private MsgLetterRecordService msgLetterRecordService;

    /**
     * 企业认证列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getEnterpriseCertifyList(User user) {
        return userDao.getEnterpriseCertifyList(user);
    }

    /**
     * 企业认证列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getEnterpriseCertifyPage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getEnterpriseCertifyList(user));
        return page;
    }

    /**
     * 企业代理人身份认证审核
     *
     * @param p2pAuditRecord
     * @param p2pRegUserCertify
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void enterpriseAgentAudit(P2pAuditRecord p2pAuditRecord, P2pRegUserCertify p2pRegUserCertify) {
        //身份认证表修改认证状态
        p2pRegUserCertify.setId(p2pAuditRecord.getReferenceId());
        p2pRegUserCertify.setAuditState(Integer.parseInt(p2pAuditRecord.getAuditOpinion()));
        p2pRegUserCertify.setAuditPersonId(p2pAuditRecord.getAuditPersonId());
        p2pRegUserCertify.setAuditTime(p2pAuditRecord.getAuditTime());
        p2pRegUserCertify.setAuditExplain(p2pAuditRecord.getAuditResult());
        p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, null);

        //保存认证记录
        p2pAuditRecordService.save(p2pAuditRecord);

        //发送站内信、短信
        Map<String, String> map = new HashMap<String, String>();
        String content = null;
        if (p2pRegUserCertify.getAuditState() == 1) {
            map = MsgLetterTemplate.getQysfrzcg();
            content = MsgSmsTemplate.getQysfrzcg();
        }
        if (p2pRegUserCertify.getAuditState() == 2) {
            map = MsgLetterTemplate.getQysfrzsb();
            content = MsgSmsTemplate.getQysfrzsb();
        }
        MsgUtils.sendLetter(p2pRegUserCertify.getUserId(), map);
        MsgUtils.sendSMS(p2pRegUserCertify.getUserId(), content);
    }

    /**
     * 个人身份认证审核
     *
     * @param p2pAuditRecord
     * @param p2pRegUserCertify
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void personalAgentAudit(P2pAuditRecord p2pAuditRecord, P2pRegUserCertify p2pRegUserCertify) {
        //身份认证表修改认证状态
        p2pRegUserCertify.setId(p2pAuditRecord.getReferenceId());
        p2pRegUserCertify.setAuditState(Integer.parseInt(p2pAuditRecord.getAuditOpinion()));
        p2pRegUserCertify.setAuditPersonId(p2pAuditRecord.getAuditPersonId());
        p2pRegUserCertify.setAuditTime(p2pAuditRecord.getAuditTime());
        p2pRegUserCertify.setAuditExplain(p2pAuditRecord.getAuditResult());
        p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, null);

        //保存认证记录
        p2pAuditRecordService.save(p2pAuditRecord);

        //修改用户信息表状态

        if (p2pRegUserCertify.getAuditState() == 1) {
            p2pUserInformationDao.updateState(p2pRegUserCertify.getUserId(), "1010");
        }
        if (p2pRegUserCertify.getAuditState() == 2) {
            p2pUserInformationDao.updateState(p2pRegUserCertify.getUserId(), "3001");
        }
    }

    /**
     * 企业认证审核
     *
     * @param p2pAuditRecord
     * @param p2pEnterpriseCertify
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void enterpriseAudit(P2pAuditRecord p2pAuditRecord, P2pEnterpriseCertify p2pEnterpriseCertify) {

        //企业认证表修改认证状态
        P2pEnterpriseCertify p1 = p2pEnterpriseCertifyService.get(p2pAuditRecord.getReferenceId());
        p1.setAuditState(Integer.parseInt(p2pAuditRecord.getAuditOpinion()));
        p1.setAuditPersonId(p2pAuditRecord.getAuditPersonId());
        p1.setAuditTime(p2pAuditRecord.getAuditTime());
        p1.setAuditExplain(p2pAuditRecord.getAuditResult());
        p1.setLicenseIsReject(p2pAuditRecord.getLicenseIsReject());
        p1.setLicenseRejectReason(p2pAuditRecord.getLicenseRejectReason());
        p1.setFrontIsReject(p2pAuditRecord.getFrontIsReject());
        p1.setFrontRejectReason(p2pAuditRecord.getFrontRejectReason());
        p1.setBackIsReject(p2pAuditRecord.getBackIsReject());
        p1.setBackRejectReason(p2pAuditRecord.getBackRejectReason());
        p2pEnterpriseCertifyService.saveOrUpdateP2pEnterpriseCertify(p1);

        //保存认证记录
        p2pAuditRecord.setIsEntLegalRep(p1.getIsEntLegalRep());
        p2pAuditRecordService.save(p2pAuditRecord);

        //更改用户信息表认证状态
        P2pUserInformation pui = new P2pUserInformation();
        pui.setUser(p2pEnterpriseCertifyService.get(p2pAuditRecord.getReferenceId()).getUser());
        //认证成功
        if ("1".equals(p2pAuditRecord.getAuditOpinion())) {
            pui.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS);
            //认证失败
        } else if ("2".equals(p2pAuditRecord.getAuditOpinion())) {
            pui.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_FAILURE);
        }
        p2pUserInformationService.updateCertificateState(pui);

        //发送站内信、短信
        Map<String, String> map = new HashMap<String, String>();
        String content = null;
        if ("1".equals(p2pAuditRecord.getAuditOpinion())) {
            map = MsgLetterTemplate.getQyrzcg();
            content = MsgSmsTemplate.getQyrzcg();
        }
        if ("2".equals(p2pAuditRecord.getAuditOpinion())) {
            map = MsgLetterTemplate.getQyrzsb();
            content = MsgSmsTemplate.getQyrzsb();
        }
        MsgUtils.sendLetter(p1.getUser().getId(), map);
        MsgUtils.sendSMS(p1.getUser().getId(), content);
    }


    /**
     * 个人认证列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getPersonalCertifyList(User user) {
        return userDao.getPersonalCertifyList(user);
    }

    /**
     * 个人认证列表分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getPersonalCertifyPage(Page<User> page, User user) {
        user.setPage(page);
        page.setList(getPersonalCertifyList(user));
        return page;
    }

    // 企业待身份认证数量
    public Integer getEnterpriseIdentityCertifyNum() {
        return userDao.getEnterpriseIdentityCertifyNum();
    }

    // 企业待认证数量
    public Integer getEnterpriseCertifyNum() {
        return userDao.getEnterpriseCertifyNum();
    }

    // 个人待认证数量
    public Integer getPersonalCertifyNum() {
        return userDao.getPersonalCertifyNum();

    }
}
