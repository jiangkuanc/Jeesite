package com.thinkgem.jeesite.modules.sys.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Service
@Transactional(readOnly = true)
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 更新User的email字段信息
     */
    @Transactional(readOnly = false)
    public void updateByEmail(User user) {
        userDao.updateByEmail(user);
    }

    /**
     * 验证用户名是否被注册
     *
     * @param user
     * @return
     */
    public Boolean getByLoginName(User user) {
        User u = userDao.getLoginName(user);
        if (u != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证手机号是否被注册
     *
     * @param user
     * @return
     */
    public Boolean getByPhone(User user) {
        User u = userDao.getPhone(user);
        if (u != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 修改登录时间
     *
     * @param id
     */
    @Transactional(readOnly = false)
    public void updateLoginDate(User user) {
        user.setLoginDate(new Date());
        userDao.updateLoginDate(user);
    }

    /**
     * 修改密码
     *
     * @param user
     */
    @Transactional(readOnly = false)
    public void updatePwd(User user) {
        userDao.updatePasswordById(user);
    }

    /**
     * 替换手机号
     *
     * @param user
     */
    @Transactional(readOnly = false)
    public void updatePhone(User user) {
        userDao.updatePhoneById(user);
    }

    /**
     * 查询当前所有用户的姓名
     */
    public List<User> findAllNameList() {
        return userDao.findAllNameList();
    }

    /**
     * 根据Id查询User
     */
    public User findOneUserFromId(String id) {
        return userDao.getUserFromId(id);
    }

    /**
     * 累计注册会员
     */
    public Integer findAllCountMembers() {
        return userDao.findAllCountMembers();
    }

    /**
     * 查询当天登录的所有用户数
     */
    public Integer selectTodayLoginedUsersCount() {
        return userDao.selectTodayLoginedUsersCount();
    }

    /**
     * 查询所有用户数量
     */
    public Integer selectUsersCount() {
        return userDao.selectUsersCount();
    }

    /**
     * 跟新或插入一条验证信息
     *
     * @param user
     */
    @Transactional(readOnly = false)
    public void updateOrInsertValidInfo(User user) {
        if (user.getEmail() != null || !"".equals(user.getEmail())) {
            userDao.updateValidInfo(user);
        } else {
            userDao.InsertValidInfo(user);
        }
    }

    //查询偿债分析师和准入分析师
    public List<User> findThePersonNameList(User user) {
        return userDao.findThePersonNameList(user);
    }

    public List<User> findAllPersonal(User user) {
        return userDao.findAllPersonal(user);
    }

    /**
     * 根据id查询用户信息
     *
     * @param User
     * @return User
     * @author Chace
     */
    public User getById(User user) {
        return userDao.getById(user);
    }

    public User get2(String id) {
        return userDao.get2(id);
    }

    public String findOfficeIdById(String id) {
        return userDao.findOfficeIdById(id);
    }

    /**
     * 重置密码
     *
     * @param newPwd
     * @param phone
     */
    @Transactional(readOnly = false)
    public void resetPwd(String newPwd, String phone) {
        User user = new User();
        user.setPhone(phone);
        user = userDao.getPhone(user);
        user.setPassword(SystemService.entryptPassword(newPwd));
        userDao.updatePasswordById(user);
        // 清除用户缓存
        user.setLoginName(user.getLoginName());
        UserUtils.clearCache(user);
    }

    /**
     * 根据手机号查用户id
     */
    public String getIdByPhone(String phone) {
        return userDao.getIdByPhone(phone);
    }

    /**
     * 更新User的真实姓名name字段信息
     */
    @Transactional(readOnly = false)
    public void updateByName(User user) {
        userDao.updateByName(user);
    }
}
