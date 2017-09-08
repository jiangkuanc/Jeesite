package com.dagongsoft.p2p.utils;

import org.apache.ibatis.ognl.OgnlException;

import javax.script.ScriptException;
import java.util.*;
import java.util.Map.Entry;


/**
 * 该工具类用于公式计算
 *
 * @author DAGONG
 */
public class FormulaUtil {

    /**
     * 公式计算方法
     *
     * @param map
     * @param expString
     * @return
     * @throws FormulaException
     */
    public static String calculate(Map<String, Object> map, String expString) throws FormulaException {
        //ExpParser expParse = new ExpParserJava();
        //ExpParser expParse = new ExpParserOgnl();
        //return new DecimalFormat("#.######").format(expParse.evaluate(setFormulaParam(map,expString)));
        String exp = setFormulaParam(map, expString);
        if (exp.indexOf("@") > -1) {
            throw new FormulaException("公式中存在未能替换的值 formula=" + exp);
        }
        ExpParser expParse = new ExpParserforJava();
        return expParse.evaluate(exp);
    }


    /**
     * 还原公式计算方法不含有
     *
     * @param map
     * @param expString
     * @return
     * @throws Exception
     * @throws FormulaException
     */

    public static Double HY(Map<String, Object> map, String expString) throws Exception {
        //ExpParser expParse = new ExpParserJava();
        //ExpParser expParse = new ExpParserOgnl();
        //return new DecimalFormat("#.######").format(expParse.evaluate(setFormulaParam(map,expString)));
        String exp = FormulaUtil.setFormulaParam(map, expString);

        ExpParserScript expw = new ExpParserScript();
        /*return expParse.evaluate(exp);*/
        Double b = expw.hYGS(exp);

        return b;
    }

    /**
     * 参数设置方法
     *
     * @param map
     * @param expString
     * @return
     */
    public static String setFormulaParam(Map<String, Object> map, String expString) {
        if (expString != null) {
            Set<Entry<String, Object>> set = map.entrySet();
            Iterator<Entry<String, Object>> iterator = set.iterator();
            while (iterator.hasNext()) {
                Entry<String, Object> e = iterator.next();
                if (e.getValue() == null) continue;
                String value;
                if (e.getValue() instanceof String) {
                    value = e.getValue() + "";
                } else {
                    value = e.getValue().toString();
                }
                expString = expString.replace(e.getKey(), value);
            }
        }
        return expString;
    }

    /**
     * 分析公式计算方法含有零的
     *
     * @param map
     * @param expString
     * @return
     * @throws Exception
     * @throws FormulaException
     */

    public static Double assay_IncloudZero(Map<String, Object> map, String expString) throws Exception {
        //ExpParser expParse = new ExpParserJava();
        //ExpParser expParse = new ExpParserOgnl();
        //return new DecimalFormat("#.######").format(expParse.evaluate(setFormulaParam(map,expString)));
        String exp = FormulaUtil.setFormulaParamIncloudZero(map, expString);
        ExpParserScript expw = new ExpParserScript();
        /*return expParse.evaluate(exp);*/
        Double b = expw.hYGS(exp);

        return b;
    }

    /**
     * 参数设置方法含有零
     *
     * @param map
     * @param expString
     * @return
     */
    public static String setFormulaParamIncloudZero(Map<String, Object> map, String expString) {
        if (expString != null) {
            Set<Entry<String, Object>> set = map.entrySet();
            Iterator<Entry<String, Object>> iterator = set.iterator();
            while (iterator.hasNext()) {
                Entry<String, Object> e = iterator.next();
                String value = null;
                if (e.getValue() == null) {
                    value = "0";
//   	        		continue;
                } else if (e.getValue() instanceof String) {
                    value = e.getValue() + "";
                } else {
                    value = e.getValue().toString();
                }
                expString = expString.replace(e.getKey(), value);
            }
        }
        return expString;
    }

    public static void main(String[] args) throws OgnlException, ScriptException {
//    	System.out.println(Arrays.toString("(@CWZB000040+@CWZB000054+@CWZB000041+@CWZB000055+@CWZB000094)/(@CWZB000039-@CWZB000032-@CWZB000035)>1".split("[/,>,<,+,\\-,*,(,)]")));
        //   System.out.println((int)5/3);        System.out.println((float) 5/3);        System.out.println((double) 5/3);

        //	FormulaUtil.analyzeExp("@CWZB000040+@CWZB000054");

        //	System.out.println((1120/3941>0.5||(1120+111)/3941>0.2)&&3941-14775139<0);


        //	ExpParser expParse = ExpParserScript.getInstance();
        //	ExpParser expParse = new ExpParserJava();
        //	ExpParser expParse = new ExpParserOgnl();
        //4.9022874190000005E7
        //
        //	System.out.println(expParse.evaluate("49022874.19+0.0"));
        try {
            Map map = new HashMap();
            map.put("@aaaaa", "1000");
            System.out.println(FormulaUtil.calculate(map, "100>=@aaaaa"));
        } catch (FormulaException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//        [1,1)
//    	ResourceBundle bundle = ResourceBundle.getBundle("oldFinancialWarning");
//    	System.out.println(bundle.getKeys().nextElement());
//    	Enumeration<String> keys = bundle.getKeys() ;
//    	while(keys.hasMoreElements()) {
//    		System.out.println(keys.nextElement());
//    	}

//    	String expr = "1111111111111111*0.2";  
//    	Map<String,String> map = new HashMap();
//    	map.put("@1(0)","1234567890.1");
//    	map.put("@2(-12)","0.2");
//    	map.put("@3(-12)","5");
//    	map.put("@4(-12)","2");
//		int count = 1;
//		

//		ExpParser expParse = ExpParserScript.getInstance();
//		System.out.println(expParse.);

        //	Long begin1 = System.currentTimeMillis();
        //	OgnlContext context = new OgnlContext();
        //for(int i=0;i<count;i++){
//			System.out.println(Ognl.getValue(Ognl.parseExpression("3.0/10"), context, context)+"@"); 
        //System.out.println(Ognl.parseExpression("1==1/0"));
        //Ognl.getValue(Ognl.parseExpression(setFormulaParam(map,expr)), context, context);
        //}
//		Long end1 = System.currentTimeMillis();
//		System.out.println(end1-begin1+"ognl耗时");

//		
//		Long begin = System.currentTimeMillis();
//		for(int i=0;i<count;i++){
//			System.out.println(FormulaUtil.calculate(map, expr));
//		}
//		Long end = System.currentTimeMillis();
//		System.out.println(end-begin+"js耗时");
//
////		
        //	ScriptEngineManager manager = new ScriptEngineManager();
        //	ScriptEngine engine = manager.getEngineByName("javascript");
        //	Long begin3 = System.currentTimeMillis();
        //for(int i=0;i<count;i++){
        //engine.eval(setFormulaParam(map,expr));
        //	System.out.println(engine.eval("12222217142.92+12222111731.27"));
        //}
        //	Long end3 = System.currentTimeMillis();
        //	System.out.println(end3-begin3+"script耗时");
//
//		Long begin4 = System.currentTimeMillis();
//		for(int i=0;i<count;i++){
        //	Expression e = (Expression) new JexlEngine().createExpression("1112222217142.92+3512222111731.27");
        //	System.out.println(e.evaluate(null));
//			//e.evaluate(null);
//		}
//		Long end4 = System.currentTimeMillis();
//		System.out.println(end4-begin4+"jexl耗时");


//    	Evaluator evaluator = new net.sourceforge.jeval.Evaluator();    
//    	try {   
//    		String str = "46657142.92+2365731.27";
//    		System.out.println(evaluator.evaluate(str, false, false)); 
//    		} 
//    	catch (EvaluationException e) {   // TODO Auto-generated catch block   e.printStackTrace();  }
//    	}
//    	
    }

    /**
     * 解析公式获得公式中使用了哪些指标
     *
     * @param expString
     * @return
     */
    public static List<String> analyzeExp(String expString) {
        List<String> list = new ArrayList();
        for (int i = 0; i < expString.length(); i++) {
            char temp1 = expString.charAt(i);
            if ('@' == temp1) {
                int begin = i;
                int mid = expString.length() - 1;
                int end = expString.length() - 1;
                for (int x = i + 1; x < expString.length(); x++) {
                    char temp2 = expString.charAt(x);
                    if ('(' == temp2) {
                        mid = x;
                    }
                    if (')' == temp2) {
                        end = x;
                        break;
                    }
                }
                list.add(expString.substring(begin + 1, mid) + "." + expString.substring(mid + 1, end));
                i = end + 1;
            }
        }
        return list;
    }

    /**
     * 根据和评级所用的财务报表日期的相距月份，调整当前报表的指标公式
     */
    public static String updateFormulaDate(String expString, int apart) {
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < expString.length(); i++) {
            char temp1 = expString.charAt(i);
            buf.append(temp1);
            if ('@' == temp1) {
                int mid = expString.length() - 1;
                int end = expString.length() - 1;
                boolean ok = false;
                for (int x = i + 1; x < expString.length(); x++) {
                    char temp2 = expString.charAt(x);
                    buf.append(temp2);
                    if ('(' == temp2) {
                        mid = x + 1;
                        for (int y = x + 1; y < expString.length(); y++) {
                            char temp3 = expString.charAt(y);
                            if (')' == temp3) {
                                end = y;
                                buf.append(Integer.parseInt(expString.substring(mid, end)) + apart);
                                buf.append(temp3);
                                ok = true;
                                break;
                            }
                        }
                    }
                    if (ok) break;
                }
                i = end;
            }

        }
        return buf.toString();
    }
}
