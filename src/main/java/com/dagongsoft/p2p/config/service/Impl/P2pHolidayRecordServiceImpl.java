package com.dagongsoft.p2p.config.service.Impl;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.config.dao.P2pHolidayRecordDao;
import com.dagongsoft.p2p.config.entity.P2pHolidayRecord;
import com.dagongsoft.p2p.config.service.P2pHolidayRecordService;
import com.dagongsoft.p2p.feedback.dao.P2pRatingResultViewDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingLevelUtils;
import com.dagongsoft.p2p.utils.RatingState;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 假期管理ServiceImpl
 *
 * @author Quincy
 * @version 2017-02-08
 */
@Transactional(readOnly = true)
@Service("p2pHolidayRecordService")
@Lazy(false)
public class P2pHolidayRecordServiceImpl extends CrudService<P2pHolidayRecordDao, P2pHolidayRecord> implements P2pHolidayRecordService {

    @Resource
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;

    @Resource
    private P2pHolidayRecordDao p2pHolidayRecordDao;

    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    @Resource
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    @Resource
    private P2pRatingResultViewDao p2pRatingResultViewDao;

    @Resource
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;

    public P2pHolidayRecord get(String id) {
        return super.get(id);
    }

    public List<P2pHolidayRecord> findList(P2pHolidayRecord p2pHolidayRecord) {
        return super.findList(p2pHolidayRecord);
    }

    public Page<P2pHolidayRecord> findPage(Page<P2pHolidayRecord> page, P2pHolidayRecord p2pHolidayRecord) {
        return super.findPage(page, p2pHolidayRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pHolidayRecord p2pHolidayRecord) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int month = Integer.parseInt(p2pHolidayRecord.getMonth().substring(0, p2pHolidayRecord.getMonth().length() - 1));
        String monthString = "";
        if (month < 10) {
            monthString = "0" + month;
        } else {
            monthString = String.valueOf(month);
        }
        String u = "http://www.easybots.cn/api/holiday.php?m=" + p2pHolidayRecord.getGetYear() + monthString;
        try {
            URL url = new URL(u);
            // 得到URLConnection对象
            URLConnection connection = url.openConnection();
            InputStream is = connection.getInputStream();
            byte[] bs = new byte[1024];
            int len = 0;
            StringBuffer sb = new StringBuffer();
            while ((len = is.read(bs)) != -1) {
                String str = new String(bs, 0, len);
                sb.append(str);
            }
            String strs = sb.toString();
            if (!"".equals(strs) && strs.length() > 2) {
                strs = strs.substring(11, strs.length() - 2);
                strs = strs.replaceAll(",", ":");
                String[] strings = strs.split(":");
                List<String> list = new ArrayList<String>();
                for (int i = 0; i < strings.length; i += 2) {
                    String a = strings[i];
                    a = a.replace("\"", "");
                    list.add(a);
                }
                for (int i = 0; i < list.size(); i++) {
                    P2pHolidayRecord p2pHolidayRecord2 = new P2pHolidayRecord();
                    p2pHolidayRecord2.setOperateTime(p2pHolidayRecord.getOperateTime());
                    p2pHolidayRecord2.setOperationPerson(p2pHolidayRecord.getOperationPerson());
                    p2pHolidayRecord2.setHoliday(sdf.parse(p2pHolidayRecord.getGetYear() + "-" + monthString + "-" + list.get(i)));
                    super.save(p2pHolidayRecord2);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pHolidayRecord p2pHolidayRecord) {
        super.delete(p2pHolidayRecord);
    }

    @Override
//	@Scheduled(cron = "0 1-59 * * * ?")
    @Scheduled(cron = "0 0 0 * * ?  ")
//	@Scheduled(cron = "0 0/3 * * * ?")
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void autoSelectReportResult1() {
        //工作日
        int workDay = 0;
        //查询待确认评级结果状态下的债项的评级报告发布时间
        List<P2pFinancingRatingInfo> list = p2pFinancingRatingInfoDao.findReportPublishTime1();
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //设置当前时间为最终时间
        Date endTime = new Date();
        //遍历债项
        for (P2pFinancingRatingInfo p2p : list) {
            //报告发布时间的年份
            int thisYear = p2p.getPublishTime().getYear() + 1900;
            //如果报告发布时间年份为当前年份，则下一年为当前年份+1,否则下一年为当前年份
            int nextYear = thisYear == endTime.getYear() ? thisYear + 1 : endTime.getYear() + 1900;
            //得到今年和明年的所有假日
            List<P2pHolidayRecord> list2 = p2pHolidayRecordDao.findHoildayByYear(thisYear, nextYear);
            //将假期转换成字符串
            StringBuffer holidays = new StringBuffer();
            for (P2pHolidayRecord holiday : list2) {
                holidays.append(sdf.format(holiday.getHoliday()) + ",");
            }
            //计算开始时间和最终时间相差几天
            int days = (int) ((endTime.getTime() - p2p.getPublishTime().getTime()) / (1000 * 3600 * 24));
            //循环相差的每一天是否为假期，如果不是工作日+1
            Timestamp tempDate;
            for (int i = 0; i <= days; i++) {
                tempDate = new Timestamp(p2p.getPublishTime().getTime() + i * 86400000);
                if (holidays.indexOf(sdf.format((Date) tempDate)) == -1) {
                    workDay += 1;
                }
            }
            if (workDay >= 3 && workDay < 5) {
                //计算到期时间
                int d = 0;
                int count = 0;
                Date overTime = null;
                while (d <= 5) {
                    tempDate = new Timestamp(p2p.getPublishTime().getTime() + count * 86400000);
                    if (holidays.indexOf(sdf.format((Date) tempDate)) == -1) {
                        d += 1;
                    }
                    count++;
                    overTime = (Date) tempDate;
                }
                /*
                 * 发送站内信、短信（即将到期提醒）
				 */
                Map<String, String> map = MsgLetterTemplate.getPjjgjjdq(p2p.getP2pFinancingInformation().getFinacingName(), overTime);
                MsgUtils.sendLetter(p2p.getP2pFinancingInformation().getApplicantsId(), map);
                String content = MsgSmsTemplate.getPjjgjjdq(overTime);
                MsgUtils.sendSMS(p2p.getP2pFinancingInformation().getApplicantsId(), content);
            }
            //如果相差工作日大于等于5天，则自动确认结果
            if (workDay >= 5) {
                P2pRatingResultView p2pRatingResultView = new P2pRatingResultView(IdGen.uuid());
                p2pRatingResultView.setFinancingInformationId(p2p.getFinancingInformationId());
                p2pRatingResultView.setViewType("3");
                //设置意见反馈时间
                p2pRatingResultView.setViewTime(new Date());
                p2pRatingResultView.setAuditState("0");
                p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);//添加意见反馈记录
                //判断级别
                int currentStage = RatingLevelUtils.firstDetermineLevel(p2p.getRatingLevel());
                if (currentStage == FinancingState.PROJECT_KNOT) {
                    Map<String, String> map = MsgLetterTemplate.getWyyjbBB(p2p.getP2pFinancingInformation().getFinacingName(), p2p.getRatingLevel());
                    MsgUtils.sendLetter(p2p.getP2pFinancingInformation().getApplicantsId(), map);
                    String content = MsgSmsTemplate.getWyyjbBB(p2p.getRatingLevel());
                    MsgUtils.sendSMS(p2p.getP2pFinancingInformation().getApplicantsId(), content);
                }
                P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(p2pRatingResultView.getFinancingInformationId());
                p2pFinancingInformation.setCurrentStage(Integer.toString(currentStage));
                p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);//修改债项状态
                /*
				 * 添加债项进展信息
				 */
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
                p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
                p2pBeforeMatchDebtState.setStateTime(new Date());
                p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
				/*
				 * 发送站内信、短信
				 */
                Map<String, String> map = MsgLetterTemplate.getPjjgyjdq();
                MsgUtils.sendLetter(p2p.getP2pFinancingInformation().getApplicantsId(), map);
                String content = MsgSmsTemplate.getPjjgyjdq();
                MsgUtils.sendSMS(p2p.getP2pFinancingInformation().getApplicantsId(), content);
            }
        }
    }

    @Override
    @Scheduled(cron = "0 1-59 * * * ?")
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void autoSelectReportResult2() {
        //工作日
        int workDay = 0;
        //查询待确认评级结果状态下的债项的评级报告发布时间
        List<P2pFinancingRatingInfo> list = p2pFinancingRatingInfoDao.findReportPublishTime2();
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //设置当前时间为最终时间
        Date endTime = new Date();
        //遍历债项
        for (P2pFinancingRatingInfo p2p : list) {
            //报告发布时间的年份
            int thisYear = p2p.getPublishTime().getYear() + 1900;
            //如果报告发布时间年份为当前年份，则下一年为当前年份+1,否则下一年为当前年份
            int nextYear = thisYear == endTime.getYear() ? thisYear + 1 : endTime.getYear() + 1900;
            //得到今年和明年的所有假日
            List<P2pHolidayRecord> list2 = p2pHolidayRecordDao.findHoildayByYear(thisYear, nextYear);
            //将假期转换成字符串
            StringBuffer holidays = new StringBuffer();
            for (P2pHolidayRecord holiday : list2) {
                holidays.append(holiday.getHoliday() + ",");
            }
            //计算开始时间和最终时间相差几天
            int days = (int) ((endTime.getTime() - p2p.getPublishTime().getTime()) / (1000 * 3600 * 24));
            //循环相差的每一天是否为假期，如果不是工作日+1
            Timestamp tempDate;
            for (int i = 0; i <= days; i++) {
                tempDate = new Timestamp(p2p.getPublishTime().getTime() + i * 86400000);
                if (holidays.indexOf(sdf.format((Date) tempDate)) == -1) {
                    workDay += 1;
                }
            }
            //如果相差工作日大于等于5天，则自动确认结果
            if (workDay >= 5) {
                //添加意见反馈记录
                P2pRatingResultView p2pRatingResultView = new P2pRatingResultView(IdGen.uuid());
                p2pRatingResultView.setFinancingInformationId(p2p.getFinancingInformationId());
                p2pRatingResultView.setViewType("3");
                p2pRatingResultView.setViewTime(new Date());
                p2pRatingResultView.setAuditState("0");
                p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);
                //修改债项状态
                P2pRatingServiceInfo p2pRatingServiceInfo = new P2pRatingServiceInfo(p2pRatingResultView.getFinancingInformationId());
                p2pRatingServiceInfo.setCurrentStage(Integer.toString(RatingState.NEED_PUBLISH_REPORT));
                p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);
                //添加债项进展信息
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(p2pRatingServiceInfo.getId());
                p2pBeforeMatchDebtState.setProgressStage(p2pRatingServiceInfo.getCurrentStage());
                p2pBeforeMatchDebtState.setStateTime(new Date());
                p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            }
        }
    }

    /**
     * 查询指定年每个月的节假日
     *
     * @author Chace
     */
    public List<P2pHolidayRecord> getHoildays(P2pHolidayRecord p2pHolidayRecord) {
        List<P2pHolidayRecord> list = p2pHolidayRecordDao.getHoildays(p2pHolidayRecord);
        for (P2pHolidayRecord h : list) {

        }
        return p2pHolidayRecordDao.getHoildays(p2pHolidayRecord);
    }

}