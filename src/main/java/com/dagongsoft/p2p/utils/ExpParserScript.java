package com.dagongsoft.p2p.utils;

import javax.script.*;
import java.util.List;


/**
 * 表达式解析
 *
 * @author DAGONG
 *         <p>
 *         Math 对象的方法
 *         parseInt(5/2) 丢弃小数部分,保留整数部分
 *         ceil(5/2) 向上取整,有小数就整数部分加1
 *         round(5/2) 四舍五入
 *         floor(5/2) 向下取整
 *         abs(x) 返回数的绝对值 1 2 3
 *         acos(x) 返回数的反余弦值 1 2 3
 *         asin(x) 返回数的反正弦值 1 2 3
 *         atan(x) 以介于 -PI/2 与 PI/2 弧度之间的数值来返回 x 的反正切值 1 2 3
 *         atan2(y,x) 返回从 x 轴到点 (x,y) 的角度（介于 -PI/2 与 PI/2 弧度之间） 1 2 3
 *         ceil(x) 对一个数进行上舍入。 1 2 3
 *         cos(x) 返回数的余弦 1 2 3
 *         exp(x) 返回 e 的指数。 1 2 3
 *         floor(x) 对一个数进行下舍入。 1 2 3
 *         log(x) 返回数的自然对数（底为e） 1 2 3
 *         max(x,y) 返回 x 和 y 中的最高值 1 2 3
 *         min(x,y) 返回 x 和 y 中的最低值 1 2 3
 *         pow(x,y) 返回 x 的 y 次幂 1 2 3
 *         random() 返回 0 ~ 1 之间的随机数 1 2 3
 *         round(x) 把一个数四舍五入为最接近的整数 1 2 3
 *         sin(x) 返回数的正弦 1 2 3
 *         sqrt(x) 返回数的平方根 1 2 3
 *         tan(x) 返回一个角的正切 1 2 3
 *         toSource() 代表对象的源代码 1 4 -
 *         valueOf() 返回一个 Math 对象的原始值
 */
public class ExpParserScript implements ExpParser {

    private static ExpParserScript uniqueInstance = null;
    private static ScriptEngineManager scriptEngineManager;
    private static ScriptEngine scriptEngine;

    public ExpParserScript() {

    }

    public static ExpParser getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new ExpParserScript();
            scriptEngineManager = new ScriptEngineManager();
            scriptEngine = scriptEngineManager.getEngineByName("javascript");
        }
        return uniqueInstance;
    }

    /**
     * 解析器入口
     *
     * @param expstr 表达式字符串
     * @return 表达式的值
     * @
     */
    public String evaluate(String expstr) {
        try {
            return "" + (Double) scriptEngine.eval(expstr);
        } catch (ScriptException e) {
            throw new ExpParseException("表达式解析异常", e);
        }
    }

    /**
     * 计算boolean
     *
     * @param expstr 表达式字符串
     * @return 表达式的值
     * @
     */
    public boolean evaluateBoolean(String expstr) {
        try {
            return (Boolean) scriptEngine.eval(expstr);
        } catch (ScriptException e) {
            throw new ExpParseException("表达式解析异常", e);
        }
    }

    public Double hYGS(String e) throws Exception {
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        List<ScriptEngineFactory> engineFactories = scriptEngineManager.getEngineFactories();
        /*if(engineFactories.size() == 0) {
            System.out.println("本JVM尚不支持任何脚本引擎");
    		       
    		}  */                
    /*	System.out.println("本JVM支持的脚本引擎有:");
        for(ScriptEngineFactory engineFactory : engineFactories) {
    		System.out.println("引擎名称:" + engineFactory.getEngineName());
    		System.out.println("\t可被ScriptEngineManager识别的名称:" + engineFactory.getNames());
    		System.out.println("\t该引擎支持的脚本语言名称:" + engineFactory.getLanguageName());
    		System.out.println("\t是否线程安全:" + engineFactory.getParameter("THREADING"));
    		} */

        ScriptEngine engine = new ScriptEngineManager().getEngineByName("ecmascript");
        Compilable compilable = (Compilable) engine;
        Bindings bindings = engine.createBindings(); //Local级别的Binding  +
        String script = "function add(formula){return (new Function(\"return \" + formula))(); } add(a)"; //定义函数并调用
        CompiledScript JSFunction = compilable.compile(e); //解析编译脚本函数
        //bindings.put("a", "49022874.19!=(46657142.92+2365731.27)"); //通过Bindings加入参数
        Double result = (Double) JSFunction.eval(bindings);
//	    System.out.println((Double)result); //调用缓存着的脚本函数对象，Bindings作为参数容器传入  
        return result;
    }
}