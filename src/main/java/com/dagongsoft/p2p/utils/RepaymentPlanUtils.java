package com.dagongsoft.p2p.utils;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dagongsoft.p2p.financing.dao.FinancingDao;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentRecordDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

import freemarker.core._RegexBuiltins.matchesBI;


public class RepaymentPlanUtils {
    private static P2pFinancingRatingInfoDao friDao = SpringContextHolder.getBean(P2pFinancingRatingInfoDao.class);
    private static P2pBeforeMatchDebtStateDao bmdsDao = SpringContextHolder.getBean(P2pBeforeMatchDebtStateDao.class);
    //	private static P2pRepaymentRecordDao p2pRepaymentRecordDao = SpringContextHolder.getBean(P2pRepaymentRecordDao.class);
    private static P2pFinancingInformationDao fiDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);
    private static FinancingDao financingDao = SpringContextHolder.getBean(FinancingDao.class);

    /**
     * 生成还款计划
     *
     * @param P2pFinancingInformation
     * @return List<Map<String, Object>>
     */
    public static List<Map<String, Object>> getRepaymentPlan(P2pFinancingInformation fi) {
        fi = fiDao.get(fi.getId());
        try {
            double amount = fi.getFinancingAmount();//融资金额
            int maturity = fi.getFinancingMaturity();//融资期限
            String mode = fi.getRepaymentMode();//还款方式
            //月利率
            P2pFinancingRatingInfo fri = friDao.getByFiId(fi.getId());
            double rate = Double.parseDouble(fri.getRecommendedRate()) / 12;
            //放款日期
            Date date = fi.getGivingOutTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date = sdf.parse(sdf.format(date));
            if (maturity == 0 || mode == null || "".equals(mode) || date == null || amount == 0) {
                System.out.println("error");
                return null;
            }
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            //保留两位小数
            DecimalFormat df = new DecimalFormat("#0.00");
            //按月付息，到期还本
            if ("1".equals(mode)) {
                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //还款时间
                    cal.add(Calendar.MONTH, 1);
                    Date time = cal.getTime();
                    map.put("time", time);
                    //应还利息
                    double interest = amount * rate;
                    map.put("interest", df.format(interest));

                    //应还本金0
                    if (i == maturity) {
                        map.put("principal", df.format(amount));
                    } else {
                        map.put("principal", df.format(0));
                    }
                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //等额本息
            if ("2".equals(mode)) {

                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //还款时间
                    cal.add(Calendar.MONTH, 1);
                    Date time = cal.getTime();
                    map.put("time", time);

                    //应还利息
                    double interest = ((Math.pow(1 + rate, maturity) - Math.pow(1 + rate, i - 1)) / (Math.pow(1 + rate, maturity) - 1) * rate * amount);
                    map.put("interest", df.format(interest));

                    //应还本金
                    double principal = (Math.pow(1 + rate, i - 1) / (Math.pow(1 + rate, maturity) - 1)) * rate * amount;

                    map.put("principal", df.format(principal));

                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //一次性还本付息
            if ("3".equals(mode)) {

                Map<String, Object> map = new HashMap<String, Object>();
                //还款时间
                cal.add(Calendar.MONTH, maturity);
                Date time = cal.getTime();
                map.put("time", time);

                //应还利息
                double interest = 0;
                interest += amount * rate * maturity;
                map.put("interest", df.format(interest));

                //应还本金
                map.put("principal", df.format(amount));
                //期数
                map.put("phase", "1/1");
                list.add(map);
            }

            return list;
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }

    /**
     * 生成待还款列表
     *
     * @param p2pFinancingInformation
     * @return list
     */
    public static List<Map<String, Object>> getPendingRepaymentList(P2pFinancingInformation p2pFinancingInformation) {
//		List<P2pRepaymentRecord> list1 = p2pRepaymentRecordDao.findP2pRepaymentRecordList(p2pFinancingInformation.getId());//已还款列表
        List<Map<String, Object>> list2 = getRepaymentPlan(p2pFinancingInformation);//还款计划列表
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (list2 != null) {
            for (Map<String, Object> map : list2) {
//				if(list1.size() > 0){
//					String recoedTime = sdf.format(list1.get(0).getPlanRepaymentDate());
//					String time = sdf.format(map.get("time"));
//					if(time.equals(recoedTime)){
//						list1.remove(0);
//					}else{
//						if(((Date) map.get("time")).getTime() < new Date().getTime()){
//							map.put("overdue", 1);
//							long nd = 24*60*60*1000;
//							long diff = new Date().getTime()-((Date) map.get("time")).getTime();
//							int overdueDay = (int) (diff/nd);
//							map.put("overdueDay", overdueDay);//逾期天数
//						}
//						list.add(map);
//					}
//				}else{
//					if(((Date) map.get("time")).getTime() < new Date().getTime()){
//						map.put("overdue", 1);
//						long nd = 24*60*60*1000;
//						long diff = new Date().getTime()-((Date) map.get("time")).getTime();
//						int overdueDay = (int) (diff/nd);
//						map.put("overdueDay", overdueDay);//逾期天数
//					}
//					list.add(map);
//				}
            }
        }
        //按时间查询
        if (p2pFinancingInformation.getEndDate() != null && p2pFinancingInformation.getBeginDate() != null) {
            for (int i = list.size(); i > 0; i--) {
                if (((Date) list.get(i - 1).get("time")).getTime() < p2pFinancingInformation.getBeginDate().getTime() ||
                        ((Date) list.get(i - 1).get("time")).getTime() > p2pFinancingInformation.getEndDate().getTime()) {
                    list.remove(i - 1);
                }
            }
        }
        return list;
    }

    /**
     * 待还款总金额
     *
     * @return
     */
    public static Integer loadAllRepayAmountByUser(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getPendingRepaymentList(p2pFinancingInformation);
        double sum = (double) 0;
        for (Map<String, Object> map : list) {
            if (map.get("principal") != null && !"0.00".equals(map.get("principal"))) {
                sum += Double.parseDouble(map.get("principal").toString());
            }
            if (map.get("interest") != null && !"0.00".equals(map.get("interest"))) {
                sum += Double.parseDouble(map.get("interest").toString());
            }

        }
        return (int) sum;
    }

    /**
     * 获得债项未还的逾期总天数以及逾期总次数
     *
     * @param p2pFinancingInformation
     * @return
     */
    public static Map<String, Object> getDaysOfOverdueOfPending(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getPendingRepaymentList(p2pFinancingInformation);
        int days = 0;
        int count = 0;
        double amount = 0;
        for (Map<String, Object> map : list) {
            if (((Date) map.get("time")).getTime() < new Date().getTime()) {
                count++;
                days += (new Date().getTime() - ((Date) map.get("time")).getTime()) / (24 * 60 * 60 * 1000);
                amount += Double.parseDouble(map.get("interest").toString()) + Double.parseDouble(map.get("principal").toString());
            }
        }
        Map<String, Object> newMap = new HashMap<String, Object>();
        newMap.put("daysOfOverdue", days);
        newMap.put("countOfOverdue", count);
        newMap.put("amountOfOverdue", amount);
        return newMap;
    }


    /**
     * 获得当前债项还款记录信息	1.未还款	2.已逾期	3.已还款
     *
     * @param p2pFinancingInformation
     * @return
     */
    public static List<Map<String, Object>> repaymentRecord(P2pFinancingInformation p2pFinancingInformation) {
//		List<P2pRepaymentRecord> list1 = p2pRepaymentRecordDao.findP2pRepaymentRecordList(p2pFinancingInformation.getId());//已还款列表
        List<Map<String, Object>> list2 = getRepaymentPlan(p2pFinancingInformation);//还款计划列表
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> map : list2) {
//			if(list1 != null && list1.size() > 0){
//					String recoedTime = sdf.format(list1.get(0).getPlanRepaymentDate());
//					String time = sdf.format(map.get("time"));
//					if(time.equals(recoedTime)){
//						map.put("state", 3);
//						map.put("realTime", list1.get(0).getRealRepaymentDate());
//						list1.remove(0);
//					}else{
//						if(((Date) map.get("time")).getTime() < new Date().getTime()){
//							map.put("state", 2);
//						}else{
//							map.put("state", 1);
//						}
//					}
//			}else{
//				if(((Date) map.get("time")).getTime() < new Date().getTime()){
//					map.put("state", 2);
//				}else{
//					map.put("state", 1);
//				}
//			}
        }
        return list2;
    }

    /**
     * 获得债项总逾期天数、次数、逾期总金额、逾期偿还金额、逾期待还金额
     *
     * @param p2pFinancingInformation
     * @return
     */
    public static Map<String, Object> getDaysOfOverdue(P2pFinancingInformation p2pFinancingInformation) {
        int days = 0;
        int count = 0;
        double amount = 0;
        double repayAmount = 0;
        double waitRepayAmount = 0;
        //未还逾期
        Map<String, Object> map = getDaysOfOverdueOfPending(p2pFinancingInformation);

        days = (Integer) map.get("daysOfOverdue");
        count = (Integer) map.get("countOfOverdue");
        amount = (Double) map.get("amountOfOverdue");
        waitRepayAmount = (Double) map.get("amountOfOverdue");

        //已还逾期
//		List<P2pRepaymentRecord> list = p2pRepaymentRecordDao.findOverdueRecordByFiId(p2pFinancingInformation.getId());
//			for(P2pRepaymentRecord record:list) {
//				days += Integer.parseInt(record.getDaysOfOverdue());
//				amount += record.getPlanRepaymentAmount();
//				repayAmount += record.getPlanRepaymentAmount();
//			}
//		count += list.size();
//		//逾期总天数
//		map.put("daysOfOverdue", days);
//		//逾期总次数
//		map.put("countOfOverdue", count);
//		//逾期总金额
//		map.put("amountOfOverdue", amount);
//		//逾期偿还金额
//		map.put("repayAmountOfOverdue", repayAmount);
//		//逾期待还金额
//		map.put("waitRepayAmount", waitRepayAmount);
//		
        return map;
    }


    /**
     * 逾期记录
     *
     * @param p2pFinancingInformation
     * @return
     */
    public static List<Map<String, Object>> getOverdueRecord(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        //已还逾期
//		List<P2pRepaymentRecord> list1 = p2pRepaymentRecordDao.findOverdueRecordByFiId(p2pFinancingInformation.getId());
//		for(P2pRepaymentRecord record:list1) {
//			Map<String,Object> map1 = new HashMap<String, Object>();
//
//			List<Map<String,Object>> list2 = getRepaymentPlan(p2pFinancingInformation);
//			for(Map<String,Object> map:list2) {
//				if(map.get("time").equals(record.getPlanRepaymentDate())){
//					//应还日期
//					map1.put("time", map.get("time"));
//					//应还本金
//					map1.put("principal",map.get("principal") );
//					//应还利息
//					map1.put("interest", map.get("interest"));
//				}
//			}
//			//实际还款日期
//			map1.put("realTime", record.getRealRepaymentDate());
//			//实际还款金额
//			map1.put("realAmount", record.getRealRepaymentAmount());
//			//逾期天数
//			map1.put("OverdueDays", record.getDaysOfOverdue());
//			//当前期数
//			map1.put("phase", getPhase(record.getPlanRepaymentDate(),p2pFinancingInformation));
//			list.add(map1);
//		}
        //未还逾期
        List<Map<String, Object>> list3 = getPendingRepaymentList(p2pFinancingInformation);
        for (Map<String, Object> map : list3) {
            if (((Date) map.get("time")).getTime() < new Date().getTime()) {
                Map<String, Object> map3 = new HashMap<String, Object>();
                //应还日期
                map3.put("time", map.get("time"));
                //应还本金
                map3.put("principal", map.get("principal"));
                //应还利息
                map3.put("interest", map.get("interest"));
                //逾期天数
                map3.put("OverdueDays", (new Date().getTime() - ((Date) map.get("time")).getTime()) / (24 * 60 * 60 * 1000));
                //当前期数
                map3.put("phase", getPhase((Date) map.get("time"), p2pFinancingInformation));
                list.add(map3);
            }
        }

        return list;
    }

    /**
     * 生成还款记录列表
     *
     * @param p2pFinancingInformation
     * @param user
     */
    @SuppressWarnings("null")
    public static List<Map<String, Object>> getRepaymentRecord(P2pFinancingInformation p2pFinancingInformation) {
        if (p2pFinancingInformation == null || p2pFinancingInformation.getId() == null) {
            return null;
        }
//		List<P2pRepaymentRecord> list1 = p2pRepaymentRecordDao.findP2pRepaymentRecordList(p2pFinancingInformation.getId());//已还款列表
        List<Map<String, Object>> list2 = getRepaymentPlan(p2pFinancingInformation);//还款计划列表
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (list2 != null) {
            for (Map<String, Object> map : list2) {
//				for(P2pRepaymentRecord record:list1){
//					String recoedPlanTime = sdf.format(record.getPlanRepaymentDate());
//					String time = sdf.format(map.get("time"));
//					if(time.equals(recoedPlanTime)){
                //					//是否逾期
                //					try {
                //						if(((Date) map.get("time")).getTime() < sdf.parse(recoedPlanTime).getTime()){
                //							map.put("overdue", 1);
                //						}else {
                //							map.put("overdue", 0);
                //						}
                //					} catch (ParseException e) {
                // 						e.printStackTrace();
                //					}
                //实还本金
//						map.put("realPrincipal", map.get("principal"));
//						//实还利息
//						map.put("realInterest", map.get("interest"));
//						//实还金额
//						map.put("realAmount", record.getRealRepaymentAmount());
//						//实还时间
//						map.put("realTime", record.getRealRepaymentDate());
//						//还款凭证
//						map.put("repaymentVoucher", record.getRepaymentVoucher());
//					}
//				}
//				list.add(map);
            }
        }
        return list;
    }

    /**
     * 应还全部本金、利息、实还本金、利息、实还总金额
     *
     * @param List<Map<String,Object>>
     * @return map
     */
    public static Map<String, Object> getSum(P2pFinancingInformation p2pFinancingInformation) {
        //自动生成还款计划
        List<Map<String, Object>> list = RepaymentPlanUtils.getRepaymentRecord(p2pFinancingInformation);
        Map<String, Object> sumMap = new HashMap<String, Object>();
        double sumPrincipal = 0.00;
        double sumInterest = 0.00;
        double sumRealPrincipal = 0.00;
        double sumRealInterest = 0.00;
        double sumRealAmount = 0.00;
        if (list != null) {
            for (Map<String, Object> map : list) {
                if (map.containsKey("principal")) {
                    sumPrincipal += Double.parseDouble(String.valueOf(map.get("principal")));
                }
                if (map.containsKey("interest")) {
                    sumInterest += Double.parseDouble(String.valueOf(map.get("interest")));
                }
                if (map.containsKey("realPrincipal")) {
                    sumRealPrincipal += Double.parseDouble(String.valueOf(map.get("realPrincipal")));
                }
                if (map.containsKey("realInterest")) {
                    sumRealInterest += Double.parseDouble(String.valueOf(map.get("realInterest")));
                }
                if (map.containsKey("realAmount")) {
                    sumRealAmount += (Double) map.get("realAmount");
                }
            }
        }
        //保留两位小数
        DecimalFormat df = new DecimalFormat("#0.00");
        //应还总本金
        sumMap.put("sumPrincipal", df.format(sumPrincipal));
        //应还总利息
        sumMap.put("sumInterest", df.format(sumInterest));
        //实还总本金
        sumMap.put("sumRealPrincipal", df.format(sumRealPrincipal));
        //实还总利息
        sumMap.put("sumRealInterest", df.format(sumRealInterest));
        //实还总金额
        sumMap.put("sumRealAmount", df.format(sumRealAmount));
        return sumMap;
    }

    /**
     * 获得指定日期期数
     *
     * @param Date yyyy-MM-dd
     * @return String
     */
    public static String getPhase(Date date, P2pFinancingInformation fi) {
        List<Map<String, Object>> list = getRepaymentPlan(fi);
        for (Map<String, Object> map : list) {
            if (((Date) map.get("time")).getTime() >= date.getTime()) {
                return (String) map.get("phase");
            }
        }
        //指定日期超过最晚日期则为最后期数
        return (String) list.get(list.size() - 1).get("phase");
    }

    /**
     * 获得债项当前期数
     *
     * @param
     * @return
     */
    public static String getCurrentPhase(String fiId) {
//		List<P2pRepaymentRecord> list = p2pRepaymentRecordDao.findP2pRepaymentRecordList(fiId);//已还款列表
        Integer sum = fiDao.get(fiId).getFinancingMaturity();//总期数
//		if(list.size()<sum){
//			return list.size()+1+"/"+sum;
//		}else if(list.size()==sum){
//			return list.size()+"/"+sum;
//		}
        return null;
    }


    /**
     * 获得债项当前时间还款信息
     *
     * @param
     * @return
     */
    public static Map<String, Object> getCurrentRepayment(String fiId) {
        try {
            P2pFinancingInformation fi = fiDao.get(fiId);
            List<Map<String, Object>> list = getRepaymentPlan(fi);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date = sdf.parse(sdf.format(date));
            if (list != null) {
                for (Map<String, Object> map : list) {
                    if (((Date) map.get("time")).getTime() >= date.getTime()) {
                        //还款倒计时
                        int countdownDays = (int) ((((Date) map.get("time")).getTime() - date.getTime()) / (24 * 60 * 60 * 1000));
                        System.err.println(countdownDays);
                        map.put("countdownDays", countdownDays);
                        return map;
                    }
                }
            }
            //指定日期超过最晚日期则为空
            return null;
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 最后一次逾期时间
     */
    public static String getLastOverdueDate(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getOverdueRecord(p2pFinancingInformation);
        Date date = (Date) list.get(0).get("time");
        for (int i = 0; i < list.size(); i++) {
            if (((Date) list.get(i).get("time")).getTime() >= date.getTime()) {
                date = (Date) list.get(i).get("time");
            }
        }
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    /**
     * 连续逾期天数
     */
    public static int getLXYQTS(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getOverdueRecord(p2pFinancingInformation);
        if (list != null && list.size() != 0) {
            int num = 0;
            Date date = (Date) list.get(0).get("time");
            for (int i = 0; i < list.size(); i++) {
                if (((Date) list.get(i).get("time")).getTime() >= date.getTime()) {
                    num = Integer.parseInt(list.get(i).get("OverdueDays").toString());
                }
            }
            return num;
        } else {
            return 0;
        }
    }

    /**
     * 获得债项还款计划(不包括还款时间)
     */
    public static List<Map<String, Object>> getRepaymentPlan2(P2pFinancingInformation fi) {
        if (fi == null) {
            return null;
        }
        if (fi.getId() == null || "".equals(fi.getId())) {
            return null;
        }
        fi = fiDao.get(fi.getId());
        try {
            double amount = fi.getFinancingAmount();//融资金额
            int maturity = fi.getFinancingMaturity();//融资期限
            String mode = fi.getRepaymentMode();//还款方式
            //利率
            P2pFinancingRatingInfo fri = friDao.getByFiId(fi.getId());

            //System.out.println(Double.parseDouble(fri.getRecommendedRate()));
            double rate = Double.parseDouble(fri.getRecommendedRate()) / 12;

            if (maturity == 0 || mode == null || "".equals(mode) || amount == 0) {
                System.out.println("error");
                return null;
            }
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            //保留两位小数
            DecimalFormat df = new DecimalFormat("#0.00");
            //按月付息，到期还本
            if ("1".equals(mode)) {
                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //应还利息
                    double interest = amount * rate;
                    map.put("interest", df.format(interest));

                    //应还本金0
                    if (i == maturity) {
                        map.put("principal", df.format(amount));
                    } else {
                        map.put("principal", df.format(0));
                    }
                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //等额本息
            if ("2".equals(mode)) {

                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //应还利息
                    double interest = ((Math.pow(1 + rate, maturity) - Math.pow(1 + rate, i - 1)) / (Math.pow(1 + rate, maturity) - 1) * rate * amount);
                    map.put("interest", df.format(interest));

                    //应还本金
                    double principal = (Math.pow(1 + rate, i - 1) / (Math.pow(1 + rate, maturity) - 1)) * rate * amount;

                    map.put("principal", df.format(principal));

                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //一次性还本付息
            if ("3".equals(mode)) {

                Map<String, Object> map = new HashMap<String, Object>();

                //应还利息
                double interest = 0;
                interest += amount * rate * maturity;
//					for(int i=1;i<=maturity;i++) {
//						interest += (amount+interest)*rate;
//					}
                map.put("interest", df.format(interest));

                //应还本金
                map.put("principal", df.format(amount));
                //期数
                map.put("phase", "1/1");
                list.add(map);
            }

            return list;
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }

    /**
     * 获得债项还款计划总金额
     */
    public static String getRepaymentAmount(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getRepaymentPlan2(p2pFinancingInformation);
        if (list == null) {
            return null;
        }
//		BigDecimal b0 = new BigDecimal(0);
        Double b0 = 0.00;
        for (Map<String, Object> map : list) {

//			BigDecimal b1 = new BigDecimal((String) map.get("principal"));
//			BigDecimal b2 = new BigDecimal((String) map.get("interest"));

            String b1 = map.get("principal").toString();
            String b2 = map.get("interest").toString();
            System.out.println(b1 + "-------------" + b2 + map.get("phase").toString());
            try {
                b0 += Double.parseDouble(b1);
                b0 += Double.parseDouble(b2);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }


//			b0 = b0.add(b1);
//			b0 = b0.add(b2);
        }
        System.out.println(b0);
        return b0.toString();
    }

    /**
     * 获取债项指定状态时间
     */
    public static Date getDebtStageTime(String fiId, String stage) {
        return financingDao.getDebtStageTime(fiId, stage);
    }

    /**
     * 获取企业类型（性质）
     */
    public static String getEnterpriseNature(String userID) {
        return financingDao.getEnterpriseNature(userID);
    }


    /**
     * 按申请利率获得债项还款计划总金额
     */
    public static String getRepaymentAmountByApplyRate(P2pFinancingInformation p2pFinancingInformation) {
        List<Map<String, Object>> list = getRepaymentPlanByApplyRate(p2pFinancingInformation);
        if (list == null) {
            return null;
        }
        double amount = 0;
        for (Map<String, Object> map : list) {
            //System.out.println(map.get("principal").toString()+""+map.get("interest"));
            amount += Double.parseDouble(map.get("principal").toString()) + Double.parseDouble(map.get("interest").toString());
        }
        return String.valueOf(amount);
    }

    /**
     * 按申请利率生成还款计划
     *
     * @param P2pFinancingInformation
     * @return List<Map<String, Object>>
     */
    public static List<Map<String, Object>> getRepaymentPlanByApplyRate(P2pFinancingInformation fi) {
        fi = fiDao.get(fi.getId());
        try {
            double amount = fi.getFinancingAmount();//融资金额
            int maturity = fi.getFinancingMaturity();//融资期限
            String mode = fi.getRepaymentMode();//还款方式
            //利率
            P2pFinancingRatingInfo fri = friDao.getByFiId(fi.getId());

            double rate = Double.parseDouble(fi.getApplicationRate()) / 12;
            if (maturity == 0 || mode == null || "".equals(mode) || amount == 0) {
                System.out.println("error");
                return null;
            }
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            //保留两位小数
            DecimalFormat df = new DecimalFormat("#0.00");
            //按月付息，到期还本
            if ("1".equals(mode)) {
                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //应还利息
                    double interest = amount * rate;
                    map.put("interest", df.format(interest));

                    //应还本金0
                    if (i == maturity) {
                        map.put("principal", df.format(amount));
                    } else {
                        map.put("principal", df.format(0));
                    }
                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //等额本息
            if ("2".equals(mode)) {

                for (int i = 1; i <= maturity; i++) {
                    Map<String, Object> map = new HashMap<String, Object>();

                    //应还利息
                    double interest = ((Math.pow(1 + rate, maturity) - Math.pow(1 + rate, i - 1)) / (Math.pow(1 + rate, maturity) - 1) * rate * amount);
                    map.put("interest", df.format(interest));

                    //应还本金
                    double principal = (Math.pow(1 + rate, i - 1) / (Math.pow(1 + rate, maturity) - 1)) * rate * amount;

                    map.put("principal", df.format(principal));

                    //期数
                    map.put("phase", i + "/" + maturity);
                    list.add(map);
                }
            }
            //一次性还本付息
            if ("3".equals(mode)) {

                Map<String, Object> map = new HashMap<String, Object>();

                //应还利息
                double interest = 0;
                interest += amount * rate * maturity;
//					for(int i=1;i<=maturity;i++) {
//						interest += (amount+interest)*rate;
//					}
                map.put("interest", df.format(interest));

                //应还本金
                map.put("principal", df.format(amount));
                //期数
                map.put("phase", "1/1");
                list.add(map);
            }

            return list;
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }

}
