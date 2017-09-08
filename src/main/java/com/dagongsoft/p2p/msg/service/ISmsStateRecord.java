package com.dagongsoft.p2p.msg.service;

import javax.servlet.http.HttpSession;

import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 短信记录服务接口类
 *
 * @author DAGONG
 */
public interface ISmsStateRecord {

    /**
     * 记录短信成功状态信息
     * 状态值为 1
     *
     * @param msgSmsRecord
     * @param user
     * @param session
     * @return
     */
    public MsgSmsRecord recordSmsSuccessState(MsgSmsRecord msgSmsRecord, User user, HttpSession session);

    /**
     * 记录短信失败状态信息
     * 状态值为 0
     *
     * @param msgSmsRecord
     * @param user
     * @param session
     * @return
     */
    public MsgSmsRecord recordSmsFailureState(MsgSmsRecord msgSmsRecord, User user, HttpSession session);

    /**
     * 根据userId判断该手机是否已验证
     *
     * @param userId 用户id
     * @return
     */
    public boolean isSmsPhoneCertify(String userId, MsgSmsRecordService msgSmsRecordService);


}
