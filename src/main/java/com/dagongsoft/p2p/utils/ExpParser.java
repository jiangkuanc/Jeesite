package com.dagongsoft.p2p.utils;


/**
 * 表达式解析
 *
 * @author DAGONG
 */
public interface ExpParser {

    /**
     * Parser entry point 解析器入口
     *
     * @param expstr 表达式字符串
     * @return 表达式的值
     * @
     */
    public String evaluate(String expstr) throws ExpParseException;

}