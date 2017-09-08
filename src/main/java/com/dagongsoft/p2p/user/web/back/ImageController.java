package com.dagongsoft.p2p.user.web.back;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "${adminPath}/image")
public class ImageController {

    @RequestMapping(value = "linkMobile")
    public String linkMobile() {
        return "p2p/front/user/mobileApp";
    }

    @RequestMapping(value = "test")
    public void test(HttpServletResponse response, HttpServletRequest request) {
        String address = null;
        String mode = request.getParameter("mode");
        if (mode != null && "1".equals(mode)) {
            address = "MobileApp/silkroaditfin.ipa";
        } else {
            address = "MobileApp/silkroaditfin.apk";
        }
        String[] a = address.split("/");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + a[a.length - 1]);
        try {
            String path = request.getSession().getServletContext().getRealPath("/");
            InputStream inputStream = new FileInputStream(new File(path + address));
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            // 这里主要关闭。
            os.close();

            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
