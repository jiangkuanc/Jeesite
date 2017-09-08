/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户信息表DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pUserInformationDao extends CrudDao<P2pUserInformation> {


    // 查询投资机构数据列表
    public List<P2pUserInformation> findBankList(P2pUserInformation p2pUserInformation);

    //用户注册时添加用户信息
    public void userRegister(P2pUserInformation p2pUserInformation);

    //用户注册时添加用户信息
    public void bankRegister(P2pUserInformation p2pUserInformation);

    //通过用户ID查询用户账号认证状态
    public Integer findCertificateState(String userId);

    //通过用户ID修改用户账号认证状态
    public void updateCertificateState(P2pUserInformation p2pUserInformation);

    public void updateBindState(P2pUserInformation p2pUserInformation);

    //通过用户ID查询密码锁定状态
    public Integer findLockState(String userId);

    //通过用户ID修改密码锁定状态
    public void updateLockState(P2pUserInformation p2pUserInformation);

    //通过用户ID修改密码锁定时间
    public void updateLockTime(P2pUserInformation p2pUserInformation);

    //通过用户主体类型查询ID最大值
    public Integer findMaxIdByUserBodyType(Integer userBodyType);

    //定时解锁用户账号锁定状态
    public void clearLockState();

    //通过用户ID查询用户信息表
    public P2pUserInformation findP2pUserInformationByUser(User user);

    //查询今日注册的用户数
    public Integer selectTodayRegUsersCount();


    //通过用户ID上传用户头像
    public void saveUserPic(P2pUserInformation p2pUserInformation);

    //通过用户ID替换用户头像
    public void updateUserPic(P2pUserInformation p2pUserInformation);

    //通过用户ID将头像查询出来
    public P2pUserInformation findUserPicByUserId(P2pUserInformation p2pUserInformation);

    //通过ID查找融资人头像
    public P2pUserInformation findFinancingUserPicById(String id);

    public P2pUserInformation getByUserId(String userId);

    //根据userid修改状态
    public void updateState(@Param("userId") String userId, @Param("certificateState") String certificateState);

    /**
     * 添加融资企业联系人信息
     *
     * @param p2pUserInformation
     * @author Quincy
     */
    public void updateContactInfo(P2pUserInformation p2pUserInformation);

    /**
     * 查询融资企业联系人信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pUserInformation findContactInfo(String userId);

    /**
     * 修改对接人信息
     *
     * @param user
     * @param p2pUserInformation
     * @author Quincy
     */
    public void updateDockedInfo(P2pUserInformation p2pUserInformation);

    /**
     * 修改对接人姓名
     *
     * @param user
     * @author Quincy
     */
    public void updateDockedName(User user);

    /**
     * 查询机构用户对接人信息
     *
     * @param p2pUserInformation
     * @return p2pUserInformation
     * @author Chace
     */
    public P2pUserInformation findDockedInfo(P2pUserInformation p2pUserInformation);

    /**
     * 根据用户id查询机构用户联系方式
     *
     * @param p2pUserInformation
     * @return p2pUserInformation
     * @author Chace
     */
    public P2pUserInformation getContactByUserId(P2pUserInformation p2pUserInformation);
}