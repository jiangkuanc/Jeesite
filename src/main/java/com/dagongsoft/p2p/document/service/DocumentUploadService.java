package com.dagongsoft.p2p.document.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.document.dao.P2pDocumentUploadRecordDao;
import com.dagongsoft.p2p.document.dao.P2pRateDocumentTemplateDao;
import com.dagongsoft.p2p.document.dao.P2pRateDocumentUploadDao;
import com.dagongsoft.p2p.document.dao.P2pSupplyDocumentUploadDao;
import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 融资材料上传Service
 *
 * @author qichao
 */
@Service
@Transactional(readOnly = true)
public class DocumentUploadService extends CrudService<P2pRateDocumentUploadDao, P2pRateDocumentUpload> {

    @Autowired
    private P2pRateDocumentTemplateDao p2pRateDocumentTemplateDao;

    @Autowired
    private P2pDocumentUploadRecordDao p2pDocumentUploadRecordDao;

    @Autowired
    private P2pSupplyDocumentUploadDao p2pSupplyDocumentUploadDao;

    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    @Autowired
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;

    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;

    private static P2pRateDocumentUploadDao p2pRateDocumentUploadDao = SpringContextHolder.getBean(P2pRateDocumentUploadDao.class);

    /**
     * 评级材料上传
     *
     * @param multipartRequest
     * @param p2pRateDocumentUpload
     * @param user
     * @return
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public List<P2pDocumentUploadRecord> documentUpload(MultipartHttpServletRequest multipartRequest, P2pRateDocumentUpload p2pRateDocumentUpload, User user) {
        P2pRateDocumentUpload p2p = p2pRateDocumentUploadDao.findRecord(p2pRateDocumentUpload);
        String subPath = p2pRateDocumentTemplateDao.get(p2pRateDocumentUpload.getRateDocumentTempId()).getEnName();//加载材料分类用于上传分类
        //判断是否上传过这种材料，如果没有添加记录并上传，如果有直接上传
//		P2pDocumentUploadRecord p2pDocumentUploadRecord = null;
        List<P2pDocumentUploadRecord> list = null;
        if (p2p != null) {
            list = attachmentRecord(multipartRequest, user, p2p, null, subPath);
            p2p.setUploadTime(new Date());
            p2pRateDocumentUploadDao.updateUploadTime(p2p);
        } else {
            p2pRateDocumentUpload.setUploadTime(new Date());
            p2pRateDocumentUpload.setId(IdGen.uuid());
            p2pRateDocumentUploadDao.insertUploadRecord(p2pRateDocumentUpload);
            list = attachmentRecord(multipartRequest, user, p2pRateDocumentUpload, null, subPath);
        }
        for (P2pDocumentUploadRecord doc : list) {
            doc.setFileId(doc.getFileAddress());
        }
        return list;
    }

    /**
     * 根据债项ID查询材料列表
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findRateDocumentList(String financingInformationId) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadDao.findRateDocumentList(financingInformationId);
        for (P2pRateDocumentUpload p2p : list) {
            if (p2p.getP2pDocumentUploadRecordList() != null) {
                List<P2pDocumentUploadRecord> list2 = p2p.getP2pDocumentUploadRecordList();
                for (P2pDocumentUploadRecord doc : list2) {
                    if (doc != null) {
                        doc.setFileId(doc.getFileAddress());
                        doc.setFileAddress(UploadFileUtils.viewUrl(doc.getFileAddress()));
                    }
                }
            }
        }
        return list;
    }

    /**
     * 根据文件地址删除上传记录
     *
     * @param id
     */
    @Transactional(readOnly = false)
    public void delDocById(String fileId) {
        UploadFileUtils.fdfsDelete(fileId);
        p2pDocumentUploadRecordDao.deleteAttachment(fileId);
    }

    /**
     * 简单上传记录列表（加载已提交材料选项卡）rejectState 1:已提交,2:未提交,0:所有
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findSimpleList(String financingInformationId, Integer rejectState) {
        if (rejectState == 1) {
            return p2pRateDocumentUploadDao.findSimpleList1(financingInformationId);
        } else if (rejectState == 2) {
            List<P2pRateDocumentUpload> list = p2pRateDocumentUploadDao.findSimpleList2(financingInformationId);
            for (P2pRateDocumentUpload docs : list) {
                for (P2pDocumentUploadRecord doc : docs.getP2pDocumentUploadRecordList()) {
                    doc.setFileId(doc.getFileAddress());
                    doc.setFileAddress(UploadFileUtils.viewUrl(doc.getFileAddress()));
                }
            }
            return list;
        } else {
            return p2pRateDocumentUploadDao.findSimpleList(financingInformationId);
        }
    }

    /**
     * 修改驳回状态(未通过时提交材料使用)
     *
     * @param p2pRateDocumentUpload
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void updateIsReject(String id) {
        P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload(id);
        p2pRateDocumentUpload.setIsReject(null);
        p2pRateDocumentUpload.setRejectReason(null);
        p2pRateDocumentUploadDao.updateIsReject(p2pRateDocumentUpload);
    }

    /**
     * 添加附件上传的记录
     *
     * @param multipartRequest
     * @param user
     * @param p2pRateDocumentUpload
     * @param subPath
     * @return
     * @author Quincy
     */
    public List<P2pDocumentUploadRecord> attachmentRecord(MultipartHttpServletRequest multipartRequest, User user,
                                                          P2pRateDocumentUpload p2pRateDocumentUpload, P2pSupplyDocumentUpload p2pSupplyDocumentUpload,
                                                          String subPath) {
        List<P2pDocumentUploadRecord> list2 = new ArrayList<P2pDocumentUploadRecord>();
        if (p2pRateDocumentUpload != null && p2pSupplyDocumentUpload == null) {
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            for (int i = 0; i < list.size(); i++) {
                P2pDocumentUploadRecord p2pDocumentUploadRecord = new P2pDocumentUploadRecord(IdGen.uuid());
                p2pDocumentUploadRecord.setRateDocumentUploadId(p2pRateDocumentUpload.getId());
                p2pDocumentUploadRecord.setFileAddress((list.get(i)));
                p2pDocumentUploadRecord.setFileName(multipartRequest.getFiles("file").get(i).getOriginalFilename());
                p2pDocumentUploadRecordDao.insertAttachment(p2pDocumentUploadRecord);
                list2.add(p2pDocumentUploadRecord);
            }
            return list2;
        } else {
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            for (int i = 0; i < list.size(); i++) {
                P2pDocumentUploadRecord p2pDocumentUploadRecord = new P2pDocumentUploadRecord(IdGen.uuid());
                p2pDocumentUploadRecord.setRateDocumentUploadId(p2pSupplyDocumentUpload.getId());
                p2pDocumentUploadRecord.setFileAddress((list.get(i)));
                p2pDocumentUploadRecord.setFileName(multipartRequest.getFiles("file").get(i).getOriginalFilename());
                p2pDocumentUploadRecordDao.insertAttachment(p2pDocumentUploadRecord);
                list2.add(p2pDocumentUploadRecord);
            }
            return list2;
        }

    }

    /**
     * 提交评级材料时，将基本信息作为一项材料进行添加
     *
     * @param p2pRateDocumentUpload
     */
    @Transactional(readOnly = false)
    public void insertUploadRecord(P2pRateDocumentUpload p2pRateDocumentUpload) {
        p2pRateDocumentUploadDao.insertUploadRecord(p2pRateDocumentUpload);
    }

    /**
     * 补充材料上传
     *
     * @param multipartRequest
     * @param p2pRateDocumentUpload
     * @param user
     * @return
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public List<P2pDocumentUploadRecord> supplyUpload(MultipartHttpServletRequest multipartRequest, P2pSupplyDocumentUpload p2pSupplyDocumentUpload,
                                                      User user) {
        P2pSupplyDocumentUpload p2p = p2pSupplyDocumentUploadDao.findRecord(p2pSupplyDocumentUpload);
        String subPath = p2pRateDocumentTemplateDao.get(p2pSupplyDocumentUpload.getRateDocumentTempId()).getEnName();//加载材料分类用于上传分类
        //判断是否上传过这种材料，如果没有添加记录并上传，如果有直接上传
//		P2pDocumentUploadRecord p2pDocumentUploadRecord = null;
        List<P2pDocumentUploadRecord> list = null;
        if (p2p != null) {
            list = attachmentRecord(multipartRequest, user, null, p2p, subPath);
            p2p.setUploadDate(new Date());
            p2pSupplyDocumentUploadDao.updateUploadTime(p2p);
        } else {
            p2pSupplyDocumentUpload.setUploadDate(new Date());
            p2pSupplyDocumentUpload.setId(IdGen.uuid());
            p2pSupplyDocumentUpload.setUploadId(user.getId());
            p2pSupplyDocumentUpload.setUploadFlag(0);
            p2pSupplyDocumentUploadDao.insert(p2pSupplyDocumentUpload);
            list = attachmentRecord(multipartRequest, user, null, p2pSupplyDocumentUpload, subPath);
        }
        for (P2pDocumentUploadRecord doc : list) {
            doc.setFileId(doc.getFileAddress());
        }
        return list;
    }

    /**
     * 提交补充材料
     *
     * @param p2pFinancingInformation
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void supplySubmit(P2pFinancingInformation p2pFinancingInformation,
                             P2pRatingServiceInfo p2pRatingServiceInfo) {
        if (p2pFinancingInformation != null || p2pRatingServiceInfo != null) {
            if (p2pFinancingInformation != null) {
                //更改补充材料提交开关
                p2pFinancingInformationDao.updateP2pFinancingInformation(p2pFinancingInformation);
            } else {
                p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);
            }
            //修改上传标记
            p2pSupplyDocumentUploadDao.updateUploadFlag();
        }
    }

    /**
     * 根据债项ID查询补充材料列表
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pSupplyDocumentUpload> findSupplyDocumentList(String financingInformationId) {
        return p2pSupplyDocumentUploadDao.findSupplyDocumentList(financingInformationId);
    }

    /**
     * 根据材料类型和行业加载材料模板
     *
     * @param tempType
     * @param industryNum
     * @return
     */
    public List<P2pRateDocumentTemplate> findListByTypeAndIndustry(Integer tempType, String industryNum) {
        P2pRateDocumentTemplate p2pRateDocumentTemplate = new P2pRateDocumentTemplate();
        p2pRateDocumentTemplate.setIndustryNum(industryNum);
        p2pRateDocumentTemplate.setTempType(tempType);
        return p2pRateDocumentTemplateDao.findListByTypeAndIndustry(p2pRateDocumentTemplate);
    }

    /**
     * 根据材料类型和行业加载补充材料模板
     *
     * @param tempType
     * @param industryNum
     * @return
     */
    public List<P2pRateDocumentTemplate> findListByTypeAndIndustry(String industryNum) {
        P2pRateDocumentTemplate p2pRateDocumentTemplate = new P2pRateDocumentTemplate();
        p2pRateDocumentTemplate.setIndustryNum(industryNum);
        return p2pRateDocumentTemplateDao.findSupplyListByIndustry(p2pRateDocumentTemplate);
    }

    /**
     * 根据项目Id查询补充材料对应行业
     *
     * @param projectBasicId
     * @return
     */
    public String findSupplyIndustryByProjectId(String projectBasicId) {
        return p2pRateDocumentTemplateDao.findSupplyIndustryByProjectId(projectBasicId);
    }

    public String findEnterpriseShareholders(String financingInformationId) {
        String industryNum = p2pEnterpriseCertifyDao.findindustryNumByFid(financingInformationId);
        if (!"C".equals(industryNum) && !"F".equals(industryNum) && !"L".equals(industryNum) && !"M".equals(industryNum)) {
            industryNum = "0";
        }
        String tempId = p2pRateDocumentTemplateDao.findEnterpriseShareholders(industryNum, "企业股东名单");
        return tempId;
    }
}
