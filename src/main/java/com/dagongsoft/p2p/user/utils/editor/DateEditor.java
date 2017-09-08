package com.dagongsoft.p2p.user.utils.editor;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 将客户端的字符串类型绑定为Date类型
 *
 * @author DAGONG
 */
public class DateEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(text);
        } catch (Exception e) {
            format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date = format.parse(text);
            } catch (Exception e1) {
                e.printStackTrace();
            }
        }
        setValue(date);
    }
}
