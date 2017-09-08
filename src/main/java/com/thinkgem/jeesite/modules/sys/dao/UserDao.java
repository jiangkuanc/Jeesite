/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface UserDao extends CrudDao<User> {

    /**
     * 更新User表的email信息
     */
    public void updateByEmail(User user);

    /**
     * 根据登录名称查询用户
     *
     * @param loginName
     * @return
     */
    public User getByLoginName(User user);

    /**
     * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
     *
     * @param user
     * @return
     */
    public List<User> findUserByOfficeId(User user);

    /**
     * 查询全部用户数目
     *
     * @return
     */
    public long findAllCount(User user);

    /**
     * 更新用户密码
     *
     * @param user
     * @return
     */
    public int updatePasswordById(User user);

    /**
     * 更新登录信息，如：登录IP、登录时间
     *
     * @param user
     * @return
     */
    public int updateLoginInfo(User user);

    /**
     * 删除用户角色关联数据
     *
     * @param user
     * @return
     */
    public int deleteUserRole(User user);

    /**
     * 插入用户角色关联数据
     *
     * @param user
     * @return
     */
    public int insertUserRole(User user);

    /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
    public int updateUserInfo(User user);

    /**
     * 验证用户名是否被注册
     *
     * @param user
     * @return
     */
    public User getLoginName(User user);

    /**
     * 验证手机号是否被注册
     *
     * @param user
     * @return
     */
    public User getPhone(User user);

    /**
     * 前台用户登录验证
     *
     * @param user
     * @return
     */
    public User userLogin(User user);

    /**
     * 修改登录时间
     *
     * @param id
     */
    public void updateLoginDate(User user);

    /**
     * 获得所有用户的name
     */
    public List<User> findAllNameList();

    /**
     * 根据ID获得User
     */
    public User getUserFromId(String id);

    /**
     * 累计注册会员
     */
    public Integer findAllCountMembers();

    /**
     * 查询当天登录的所有用户数量
     */
    public Integer selectTodayLoginedUsersCount();

    /**
     * 查询用户数量
     *
     * @return
     */
    public Integer selectUsersCount();

    /**
     * 更新用户手机号
     *
     * @param user
     */
    public void updatePhoneById(User user);

    //更新验证信息
    public void updateValidInfo(User user);

    //插入一条新的验证信息
    public void InsertValidInfo(User user);

    //查询偿债分析师和准入分析师
    public List<User> findThePersonNameList(User user);

    //获取用户id前缀为prefix的最大值
    public String getMaxId(String prefix);

    /**
     * 获取企业用户列表
     *
     * @param user
     * @author Zeus
     */
    public List<User> getEnterpriseList(User user);

    /**
     * 获取企业其他基本信息
     *
     * @param user
     * @return
     * @author Zeus
     */
    public User getOtherBaseInfo(User user);

    /**
     * 获取企业认证列表
     *
     * @param user
     * @author Zeus
     */
    public List<User> getEnterpriseCertifyList(User user);

    /**
     * 获取投资机构列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getAgencyList(User user);

    /**
     * 投资机构基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getAgencyBaseInfo(String userid);

    /**
     * 获取个人列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getPersonalList(User user);

    /**
     * 个人基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getPersonalBaseInfo(String userid);

    /**
     * 获取个人认证列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getPersonalCertifyList(User user);


    /**
     * 获取投资收益列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getInvestmentIncomeList(User user);


    public List<User> findAllPersonal(User user);

    /**
     * 根据id查询用户信息
     *
     * @param User
     * @return User
     * @author Chace
     */
    public User getById(User user);

    public User get2(String id);

    public String findOfficeIdById(String id);

    //企业待身份认证数量
    public Integer getEnterpriseIdentityCertifyNum();

    //企业待认证数量
    public Integer getEnterpriseCertifyNum();

    //个人待认证数量
    public Integer getPersonalCertifyNum();

    /**
     * 根据手机号查询用户信息
     *
     * @param phone
     * @return
     * @author Quincy
     */
    public User getUserByPhone(String phone);

    /**
     * 根据手机号查用户id
     */
    public String getIdByPhone(String phone);

    /**
     * 获取评估公司列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getAssetList(User user);

    /**
     * 获取担保公司列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getGuaranteeList(User user);

    /**
     * 评估公司基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getAssetBaseInfo(String userid);

    /**
     * 评估公司基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public User getGuaranteeBaseInfo(String userid);

    /**
     * 修改一带一路网站和服务平台关联编号
     *
     * @param relationId
     */
    public void updateRelationId(String relationId, String phone);

    /**
     * 通过电话查找用户
     *
     * @param phone
     * @return
     */
    public User selectUserByPhone(String phone);

    /**
     * 根据用户编号更新关联字段
     *
     * @return
     * @author xsc
     */

    public int updateUserForRelationId(String userId, String relationId);

    /**
     * 更新User表的真实姓名name信息
     */
    public void updateByName(User user);
}
