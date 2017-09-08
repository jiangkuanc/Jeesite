package com.dagongsoft.p2p.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 信用级别判断工具类
 *
 * @author DAGONG
 */
public class RatingLevelUtils {

    private static List<String> list1 = new ArrayList<String>();//不需要补信
    private static List<String> list2 = new ArrayList<String>();//需要补信
    private static List<String> list3 = new ArrayList<String>();//直接流标

    static {
        list1.add("AAA");
        list1.add("AA+");
        list1.add("AA");
        list1.add("AA-");
        list2.add("A+");
        list2.add("A");
        list2.add("A-");
        list2.add("BBB+");
        list2.add("BBB");
        list2.add("BBB-");
        list2.add("BB+");
        list2.add("BB");
        list2.add("BB-");
        list3.add("B+");
        list3.add("B");
        list3.add("B-");
        list3.add("CCC");
        list3.add("CC");
        list3.add("C");
    }

    /**
     * 判断信用级别
     *
     * @param ratingLevel
     * @return
     */
    public static Integer determineLevel(String ratingLevel) {
        if (list1.contains(ratingLevel)) {
            return FinancingState.MARKET_STAFF_CONFIRMED;
        }
        if (list2.contains(ratingLevel)) {
            return FinancingState.SUPPLY_CREDIT;
        }
        if (list3.contains(ratingLevel)) {
            return FinancingState.FINANCING_EXPIRED;
        }
        return null;
    }

    /**
     * 报告发布前判断级别
     *
     * @param ratingLevel
     * @return
     */
    public static Integer firstDetermineLevel(String ratingLevel) {
        int currentStage = determineLevel(ratingLevel);
        if (currentStage == FinancingState.MARKET_STAFF_CONFIRMED || currentStage == FinancingState.SUPPLY_CREDIT) {
            return FinancingState.REPORT_AUDIT;
        } else {
            return FinancingState.PROJECT_KNOT;
        }
    }

    /**
     * 报告发布时判断信用级别
     *
     * @param ratingLevel
     * @return
     */
    public static Integer determineRatingLevel(String ratingLevel, int isHandRateCost) {
        if (list1.contains(ratingLevel)) {
            if (isHandRateCost == 1) {
                return FinancingState.CREDIT_RATING_SUCCESS;
            } else {
                return FinancingState.MARKET_STAFF_CONFIRMED;
            }
        }
        if (list2.contains(ratingLevel)) {
            return FinancingState.SUPPLY_CREDIT;
        }
        return null;
    }


    /**
     * 根据级别判断是否需要补信
     *
     * @param ratingLevel
     * @return
     */
    public static String isRepByLevel(String ratingLevel) {
        Integer currentStage = determineLevel(ratingLevel);
        if (currentStage.equals(FinancingState.MARKET_STAFF_CONFIRMED) || currentStage.equals(FinancingState.FINANCING_EXPIRED)) {
            return "0";
        } else {
            return "1";
        }
    }
}
