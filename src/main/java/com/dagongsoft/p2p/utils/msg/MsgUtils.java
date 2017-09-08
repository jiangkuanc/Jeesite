package com.dagongsoft.p2p.utils.msg;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.dagongsoft.p2p.msg.dao.MsgLetterRecordDao;
import com.dagongsoft.p2p.msg.dao.MsgSmsRecordDao;
import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.dagongsoft.p2p.msg.web.Md5Utils;
import com.dagongsoft.p2p.msg.web.SSLClient;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * @author Zeus
 * @2017-2-23
 */
public class MsgUtils {

    private static MsgSmsRecordDao msgSmsRecordDao = SpringContextHolder.getBean(MsgSmsRecordDao.class);
    private static MsgLetterRecordDao msgLetterRecordDao = SpringContextHolder.getBean(MsgLetterRecordDao.class);

    /**
     * 发送短信
     *
     * @param recId   接收人id
     * @param content 内容
     * @return
     * @throws Exception
     */
    public static boolean sendSMS(String recId, String content) {
        User user = UserUtils.get(recId);
        String phone = user.getPhone();
        if (phone != null) {
            //查询每个手机号当天接收短信条数  超出限制则不发送请求
            int count = msgSmsRecordDao.getCountByOhone(phone);
            String state1 = "0";
            boolean state = false;
            if (count < 100) {
                //发送短信
                state = sendSmsApi(phone, null, content);
                if (state) {
                    state1 = "1";
                }
            }
            //录入数据库
            MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
            msgSmsRecord.setId(IdGen.uuid());
            msgSmsRecord.setUser(UserUtils.get("1"));
            msgSmsRecord.setSmsContent(content);
            msgSmsRecord.setRecId(recId);
            msgSmsRecord.setSendDate(new Date());
            msgSmsRecord.setSendState(state1);
            msgSmsRecord.setTelnum(phone);
            msgSmsRecordDao.insert(msgSmsRecord);
            return state;
        } else {
            return false;
        }
    }

    public static void sendLetter(String recId, Map<String, String> map) {
        MsgLetterRecord msgLetterRecord = new MsgLetterRecord();
        User user = new User();
        user.setId("1");
        msgLetterRecord.setUser(user);
        msgLetterRecord.setRecId(recId);
        msgLetterRecord.setTitle(map.get("title"));
        msgLetterRecord.setContent(map.get("content"));
        msgLetterRecord.setSendDate(new Date());
        msgLetterRecord.setReadState("0");
        msgLetterRecord.setId(IdGen.uuid());
        msgLetterRecordDao.insert(msgLetterRecord);
    }

    public static boolean sendEmail() {
        return false;
    }

    /**
     * 发送Sms消息内容(指定内容)
     *
     * @param phone
     * @param session
     * @param date
     * @return
     * @throws Exception
     */
    private static boolean sendSmsApi(String phone, Date date, String content) {
        HttpPost post = null;
        try {
            String result = "";
            HttpClient client = new SSLClient();
            post = new HttpPost("https://dx.ipyy.net/smsJson.aspx");
            List<NameValuePair> list = new ArrayList<NameValuePair>();
            list.add(new BasicNameValuePair("userid", ""));
            list.add(new BasicNameValuePair("account", "KA00002"));
            list.add(new BasicNameValuePair("password", Md5Utils
                    .md5("KA0000200")));
            list.add(new BasicNameValuePair("mobile", phone));
            list.add(new BasicNameValuePair("content", content));
            list.add(new BasicNameValuePair("sendTime", ""));
            list.add(new BasicNameValuePair("extno", ""));
            list.add(new BasicNameValuePair("action", "send"));
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,
                    "utf-8");
            post.setEntity(entity);
            HttpResponse response = client.execute(post);
            if (response != null) {
                HttpEntity resEntity = response.getEntity();
                if (resEntity != null) {
                    result = EntityUtils.toString(resEntity, "utf-8");
                    if (StringUtils.contains(result, "操作成功")) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
}
