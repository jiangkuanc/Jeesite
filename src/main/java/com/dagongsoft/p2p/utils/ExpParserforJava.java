package com.dagongsoft.p2p.utils;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 表达式解析
 *
 * @author DAGONG
 */
public class ExpParserforJava implements ExpParser {
    /**
     * 定义运算符
     */
    private static List<String> lc = new ArrayList<String>();

    static {
        lc.add("+");
        lc.add("`");
        lc.add("*");
        lc.add("/");
    }

    /**
     * 定义逻辑运算符
     */
    private static List<String> lj = new ArrayList<String>();

    static {
        lj.add(">");
        lj.add("<");
        lj.add("=");
        lj.add("!");
        lj.add("≥");
        lj.add("≤");
        lj.add("if");
    }

    /**
     * 判断该字符串中是否包含逻辑符号
     *
     * @param str
     * @return
     */
    private static boolean containsLJ(String str) {
        for (int i = 0; i < str.length(); i++) {
            if (lj.contains(String.valueOf(str.charAt(i)))) {
                return true;
            }
        }
        return false;
    }

    /**
     * int数组注释,第一个标识:0自带函数 1自定义函数;第二个标识:参数个数
     */
    private static Map<String, int[]> funMap = new HashMap<String, int[]>();

    static {
        // 自带函数,可利用反射机制
        funMap.put("abs", new int[]{0, 1});
        funMap.put("acos", new int[]{0, 1});
        funMap.put("asin", new int[]{0, 1});
        funMap.put("atan", new int[]{0, 1});
        funMap.put("cbrt", new int[]{0, 1});
        funMap.put("ceil", new int[]{0, 1});
        funMap.put("cos", new int[]{0, 1});
        funMap.put("cosh", new int[]{0, 1});
        funMap.put("exp", new int[]{0, 1});
        funMap.put("expm1", new int[]{0, 1});
        funMap.put("floor", new int[]{0, 1});
        funMap.put("log", new int[]{0, 1});
        funMap.put("log10", new int[]{0, 1});
        funMap.put("log1p", new int[]{0, 1});
        funMap.put("random", new int[]{0, 1});
        funMap.put("rint", new int[]{0, 1});
        funMap.put("round", new int[]{0, 1});
        funMap.put("signum", new int[]{0, 1});
        funMap.put("sin", new int[]{0, 1});
        funMap.put("sinh", new int[]{0, 1});
        funMap.put("sqrt", new int[]{0, 1});
        funMap.put("tan", new int[]{0, 1});
        funMap.put("tanh", new int[]{0, 1});
        funMap.put("max", new int[]{0, 2});
        funMap.put("min", new int[]{0, 2});
        // 自定义函数
        funMap.put("if", new int[]{1, 3});
        funMap.put("mod", new int[]{1, 2});
        funMap.put("int", new int[]{1, 1});
    }

    /**
     * 公式初始化转换
     *
     * @param str
     * @return 处理过的计算客串
     */
    private static String strCast(String str) {
        str = str.toLowerCase();// 去除空格，变小写

        if (str == null ? true : str.length() == 0)
            return "0";
        if (!checkFormula(str))
            return "0";
        str = str.replaceAll("\\*-", "**");
        str = str.replaceAll("\\|\\|", "~");
        str = str.replaceAll("\\|", "~");
        str = str.replaceAll("&&", "&");
        str = str.replaceAll("-\\*", "**");
        str = str.replaceAll("/-", "//");
        str = str.replaceAll("-/", "//");
        str = str.replaceAll("\\+-", "-");
        str = str.replaceAll("-\\+", "-");
        str = str.replaceAll("-", "`");
        str = str.replaceAll("\\*\\*", "*-");
        str = str.replaceAll("//", "/-");
        str = str.replaceAll(" ", "");
        return str;
    }

    /**
     * 检查公式中括号出现次数是否正确
     *
     * @param formulaStr
     * @return 公式中的括号是否成对
     */
    private static boolean checkFormula(String formulaStr) {
        boolean flag = true;
        int count = 0;
        for (int i = 0; i < formulaStr.length(); i++) {
            String s = String.valueOf(formulaStr.charAt(i));
            if ("(".equals(s))
                count++;
            else if (")".equals(s))
                count--;
        }
        flag = count == 0;
        return flag;
    }

    /**
     * 分割函数
     *
     * @param str
     * @param bs
     * @return 分割后的客串
     */
    private static String[] spliteFun(String str, String bs) {
        List<String> list = new ArrayList<String>();
        String bds = "";
        int bracket = 0;
        int len = str.length();
        for (int i = 0; i < len; i++) {
            String s = String.valueOf(str.charAt(i));
            if ("(".equals(s)) {
                bracket++;
            } else if (")".equals(s)) {
                bracket--;
            }

            if (bracket == 0 && bs.equals(s)) {
                list.add(bds);
                bds = "";
                continue;
            }

            bds += s;
        }
        list.add(bds);

        String[] ss = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            ss[i] = list.get(i);
        }

        return ss;
    }

    /**
     * 用户自定义函数
     *
     * @param str
     * @param funStr
     * @return 处理用户自定义函数
     */
    public static String customFun(String str, String funStr) {
        String reval = "0";

        String[] gss = spliteFun(str, ",");
        if ("if".equals(funStr)) {
            if (compare(gss[0])) {
                reval = calculate(gss[1]);
            } else {
                reval = calculate(gss[2]);
            }

        }
        return reval;
    }

    /**
     * 逻辑表达式判断
     *
     * @param str
     * @return true or false
     */
    private static boolean compare(String str) {
        boolean flag = false;
        boolean bs = false;
        int len = str.length();
        String ljbds = "";
        BigDecimal d_left = new BigDecimal("0");
        BigDecimal d_right = new BigDecimal("0");
        if (str.indexOf("~") > -1) {
            for (String ss : str.split("~")) {
                if (ss.equals("true")) {
                    return true;
                } else if (ss.equals("false")) {

                } else if (compare(ss)) {
                    return true;
                }
            }
            return false;
        }

        if (str.indexOf("&") > -1) {
            for (String ss : str.split("&")) {
                if (ss.equals("true")) {

                } else if (ss.equals("false")) {
                    return false;
                } else if (!compare(ss)) {
                    return false;
                }
            }
            return true;
        }

        for (int i = 0; i < len; i++) {
            String s = String.valueOf(str.charAt(i));
            if (lj.contains(s)) {
                for (int j = i; j < len; j++) {
                    String ts = String.valueOf(str.charAt(j));
                    if (lj.contains(ts)) {
                        ljbds += ts;
                    } else {
                        bs = true;
                        break;
                    }
                }
            }
            if (bs)
                break;
        }
        String[] s = str.split(ljbds);
        d_left = new BigDecimal(calculate(s[0]));
        d_right = new BigDecimal(calculate(s[1]));
        if ("<".equals(ljbds)) {
            if (d_left.compareTo(d_right) == -1)
                return true;
        } else if (">".equals(ljbds)) {
            if (d_left.compareTo(d_right) == 1)
                return true;
        } else if ("==".equals(ljbds) || "=".equals(ljbds)) {
            if (d_left.compareTo(d_right) == 0)
                return true;
        } else if (">=".equals(ljbds) || "≥".equals(ljbds)) {
            if (d_left.compareTo(d_right) == 0
                    || d_left.compareTo(d_right) == 1)
                return true;
        } else if ("<=".equals(ljbds) || "≤".equals(ljbds)) {
            if (d_left.compareTo(d_right) == 0
                    || d_left.compareTo(d_right) == -1)
                return true;
        } else if ("<>".equals(ljbds) || "!=".equals(ljbds)) {
            if (d_left.compareTo(d_right) != 0)
                return true;
        }

        return flag;
    }

    /**
     * 递归调用
     *
     * @return
     */
    private static boolean compa(String str) {
        String reval = "";
        String bds = "";
        int bracket = 0;// 对应括号个数
        int pos = 0;
        int len = str.length();

        for (int i = 0; i < len; i++) {
            String s = String.valueOf(str.charAt(i));
            pos = i;
            bracket = 0;
            if (!lc.contains(s)) {// 如果没遇到运算符
                if ("(".equals(s)) {// 如果遇到左括号
                    // 如果是普通运算
                    for (int j = i + 1; j < len; j++) {
                        pos++;
                        String ts = String.valueOf(str.charAt(j));
                        if ("(".equals(ts))
                            bracket++;
                        else if (")".equals(ts)) {
                            bracket--;
                            if (bracket == -1) {
                                String ss = str.substring(i + 1, pos);
                                reval += containsLJ(ss) ? compa(ss) : calculate(ss);
                                i = pos;
                                break;
                            }
                        }
                    }
                } else {// 累加总表达式和最后一个运算数(或函数)
                    reval += s;
                }
            } else {// 遇到运算符最后一个运算数(或函数)清空
                reval += s;
            }
        }

        return compare(reval);
    }

    /**
     * 求数值
     *
     * @param str
     * @return
     */
    public static String calc(String str) {
        return calculate(strCast(str));
    }

    /**
     * 求布尔表达式
     *
     * @param str
     * @return
     */
    public static boolean calcBoolean(String str) {

        return compa(strCast(str));
    }

    /**
     * 递归调用运算
     *
     * @param str
     * @return String
     */
    private static String calculate(String str) {

        String reval = "";
        String bds = "";
        int bracket = 0;// 对应括号个数
        int pos = 0;
        boolean title = false;
        if (str.substring(0, 1).equals("`")) {
            str = str.substring(1);
            title = true;
        }

        int len = str.length();

        for (int i = 0; i < len; i++) {
            String s = String.valueOf(str.charAt(i));
            pos = i;
            bracket = 0;
            if (!lc.contains(s)) {// 如果没遇到运算符
                if ("(".equals(s)) {// 如果遇到左括号
                    if (funMap.containsKey(bds)) {// 如果左括号前是函数
                        for (int j = i + 1; j < len; j++) {// 从左括号后开始循环
                            pos++;// 累计移动字符位数
                            String ts = String.valueOf(str.charAt(j));// 单个字符
                            // reval+=ts;
                            if ("(".equals(ts))// 如果是左括号累计
                                bracket++;
                            else if (")".equals(ts)) {// 如果是右括号进行减少
                                bracket--;
                                if (bracket == -1) {// 如果是-1,标识括号结束
                                    reval = reval.substring(0, reval.length()
                                            - bds.length());// 重新获得去掉函数头的表达式
                                    reval += funCalculate(
                                            str.substring(i + 1, j), bds);// 表达式加上函数结果,形成新表达式
                                    i = pos;// 计数器增加
                                    bds = "";// 函数头清空
                                    break;// 退出本次循环
                                }
                            }
                        }
                    } else {// 如果是普通运算
                        for (int j = i + 1; j < len; j++) {
                            pos++;
                            String ts = String.valueOf(str.charAt(j));
                            if ("(".equals(ts))
                                bracket++;
                            else if (")".equals(ts)) {
                                bracket--;
                                if (bracket == -1) {
                                    reval += calculate(str
                                            .substring(i + 1, pos));
                                    i = pos;
                                    bds = "";
                                    break;
                                }
                            }
                        }
                    }
                } else {// 累加总表达式和最后一个运算数(或函数)
                    bds += s;
                    reval += s;
                }
            } else {// 遇到运算符最后一个运算数(或函数)清空
                bds = "";
                reval += s;
            }
        }

        if (title)
            reval = "-" + reval;
        return szys(reval);
    }

    /**
     * 函数运算
     *
     * @param gs
     * @param flag
     * @return String
     */
    private static String funCalculate(String gs, String funStr) {
        String rval = "0";
        if (funMap.containsKey(funStr)) {
            int[] csi = funMap.get(funStr);
            try {
                if (csi[0] == 0) {// java内部函数,通过反射调用
                    Class[] cs = new Class[csi[1]];
                    Object[] objs = new Object[csi[1]];
                    String[] gss = zlcs(gs);
                    for (int i = 0; i < csi[1]; i++) {
                        cs[i] = double.class;
                        objs[i] = new Double(calculate(gss[i]));
                    }
                    Class cls = Class.forName("java.lang.Math");
                    Method m = cls.getMethod(funStr, cs);
                    rval = String.valueOf(m.invoke(cls, objs));
                } else if (csi[0] == 1) {// 自定义函数
                    rval = customFun(gs, funStr);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return rval;
    }

    /**
     * 公式里的参数分割
     *
     * @param str
     * @return String[]
     */
    private static String[] zlcs(String str) {
        int len = str.length();
        boolean flag = true;
        String tstr = "";

        for (int i = 0; i < len; i++) {
            String s = String.valueOf(str.charAt(i));
            if ("(".equals(s)) {
                flag = false;
            } else if (")".equals(s)) {
                flag = true;
            }
            if (flag && ",".equals(s)) {
                tstr += "@";
            } else {
                tstr += s;
            }
        }

        return tstr.split("@");

    }

    /**
     * 四则运算表达式处理
     *
     * @param str
     * @return String
     */
    private static String szys(String gs) {
        gs = gs + "+0"; // 因为下面的计算是遇到符号才进行,所以多加入一个计算符号,不影响值.
        String c1 = "";// 第一个运算符号
        String c2 = "";// 第二个运算符号
        String s1 = "";// 第一个运算数
        String s2 = "";// 第二个运算数
        String s3 = "";// 第三个运算数

        int len = gs.length();
        for (int i = 0; i < len; i++) {
            String s = String.valueOf(gs.charAt(i));// 获得该位置字符并转换成字符串做比较

            if (lc.contains(s)) { // 如果是运算符号
                if (c1.length() == 0)// 如果第一个运算符号为空,加入
                    c1 = s;
                else if (c2.length() == 0) {// 否则,如果第二个运算符号为空,加入
                    c2 = s;// 第二个运算符号
                    if ("+".equals(c2) || "`".equals(c2)) {// 如果第二个运算符号级别低,那么进行计算
                        s1 = _4zys(s1, c1, s2);// 第一个和第二个数计算
                        c1 = c2;// 保存第二个运算符,其他为空
                        c2 = "";
                        s2 = "";
                    }
                } else {// 上述都保存过
                    if ("+".equals(s) || "`".equals(s)) {// 如果第三个运算符级别低,进行运算
                        s2 = _4zys(s2, c2, s3);// 先算第二三个数,保存至第二个
                        s1 = _4zys(s1, c1, s2);// 再算第一二个,保存至第一个
                        c1 = s;// 保存当前运算符,其他为空
                        s2 = "";
                        c2 = "";
                        s3 = "";
                    } else {// 如果第三个运算符级别高
                        s2 = _4zys(s2, c2, s3);// 先算第二三个数,保存至第二个
                        c2 = s;// 前面不动,保存运算符
                        s3 = "";
                    }
                }
            } else if (s1.length() > 0 && c1.length() > 0 && c2.length() == 0) {// 如果第一个数,第一个运算符已保存,第二个运算符未保存,保存第二哥数
                s2 += s;
            } else if (c1.length() == 0) {// 如果没有运算符,保存第一个数
                s1 += s;
            } else if (s1.length() > 0 && s2.length() > 0 && c1.length() > 0
                    && c2.length() > 0) {// 如果第一二个数和运算符都有,保存第三个数
                s3 += s;
            }
        }
        return s1;
    }

    /**
     * 基本四则运算
     *
     * @param c1 运算数1
     * @param s1 运算符(加减乘除)
     * @param c2 运算数2
     * @return String
     */
    private static String _4zys(String c1, String s1, String c2) {
        String reval = "0";

        try {
            BigDecimal ln = new BigDecimal(c1);
            BigDecimal rn = new BigDecimal(c2);
            if ("+".equals(s1)) {
                return (ln.add(rn)) + "";
            } else if ("`".equals(s1)) {
                return (ln.subtract(rn)) + "";
            } else if ("*".equals(s1)) {
                return (ln.multiply(rn)) + "";
            } else if ("/".equals(s1)) {
                //	if (rn.compareTo(new BigDecimal("0")) == 0) {
                //			return ln.divide(new BigDecimal("1")) +"";
                //		} else {
                return ln.divide(rn, 10, BigDecimal.ROUND_HALF_DOWN) + "";
                //	}
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
        }

        return reval;
    }

    public String evaluate(String expstr) throws ExpParseException {
        if (containsLJ(expstr)) {
            /*return calcBoolean(expstr)+"";*/
            return customFun("if(,,)", expstr);
        } else {
            return calc(expstr);
        }
    }


}