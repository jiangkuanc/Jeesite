package com.dagongsoft.p2p.utils;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 后台用户注册校验
 *
 * @author DAGONG
 */
public class FormValidator {

    /**
     * 校验登录名和密码格式
     *
     * @param user
     * @return
     */
    public static int userValidator(User user) {
        String regex = "^(?![^a-zA-Z]+$)(?!\\d+$).{4,16}$";
        String regex2 = "^1[3|5|7|8|][0-9]{9}$";
        //String regex3 = "^[a-zA-Z0-9_\\.]*$";
        //String regex3 = "(?=.*[\\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+)";
        String regex3 = ".*";
        boolean matches = user.getPassword().matches(regex3);
        if (user.getLoginName() != null && !"".equals(user.getLoginName()) && user.getLoginName().length() >= 4
                && user.getLoginName().length() <= 16 && user.getPassword() != null && !"".equals(user.getPassword())
                && user.getPassword().length() >= 8 && user.getPassword().matches(regex3)) {
            if (user.getLoginName().matches(regex)) {
                return 1;
            }
            if (user.getLoginName().matches(regex2)) {
                return 2;
            }
            return 3;
        } else {
            return 3;
        }
    }

    public static int userValidator2(User user) {
        String regex = "^(?![^a-zA-Z]+$)(?!\\d+$).{4,16}$";
        String regex2 = "^1[3|5|7|8|][0-9]{9}$";
        String regex3 = ".*";
        //String regex3 = "^[a-zA-Z0-9_\\.]*$";
//			String regex3 = "(?=.*[\\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+)";
        boolean matches = user.getPassword().matches(regex3);
        if (user.getLoginName() != null && !"".equals(user.getLoginName()) && user.getLoginName().length() >= 4
                && user.getLoginName().length() <= 16 && user.getPassword() != null && !"".equals(user.getPassword())
                && user.getPassword().length() >= 6 && user.getPassword().matches(regex3)) {
            if (user.getLoginName().matches(regex)) {
                return 1;
            }
            if (user.getLoginName().matches(regex2)) {
                return 2;
            }
            return 3;
        } else {
            return 3;
        }
    }

    /**
     * 校验手机号码格式
     *
     * @param user
     * @return
     */
    public static boolean phoneValidator(User user) {
        String regex = "^1[3|5|7|8|][0-9]{9}$";
        if (user.getPhone().matches(regex)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 校验真实姓名格式
     *
     * @param p2pRegUserCertify
     * @return
     */
    public static boolean realNameValidator(P2pRegUserCertify p2pRegUserCertify) {
        String regex = "^[\u4E00-\u9FA5]{2,}$";
        if (p2pRegUserCertify.getRealName().matches(regex)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 校验身份证号格式
     *
     * @param p2pRegUserCertify
     * @return
     */
    public static boolean idNumberValidator(P2pRegUserCertify p2pRegUserCertify) {
        String regex = "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
        if (p2pRegUserCertify.getIdNumber().matches(regex)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 校验图片类型
     *
     * @param multipartRequest
     * @return
     */
    public static boolean imageTypeValidator(MultipartHttpServletRequest multipartRequest) {
        List<MultipartFile> files = multipartRequest.getFiles("file");
        for (int i = 0; i < files.size(); i++) {
            if (!files.get(i).isEmpty()) {
                String suffixName = files.get(i).getOriginalFilename().split("\\.")[1];
                if (!suffixName.equals("jpg") || !suffixName.equals("jpeg") || !suffixName.equals("png")
                        || !suffixName.equals("bmp")) {
                    return false;
                }
            }
        }
        return true;
    }
}
