package com.dagongsoft.p2p.utils;

import java.util.LinkedHashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public class MyJsonObject extends JSONObject {
    private Map map;

    public MyJsonObject() {
        this.map = new LinkedHashMap();
    }
}
