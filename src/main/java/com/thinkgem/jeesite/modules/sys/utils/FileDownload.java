package com.thinkgem.jeesite.modules.sys.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.thinkgem.jeesite.common.config.Global;

@Controller
public class FileDownload implements ServletContextAware {
    //Spring这里是通过实现ServletContextAware接口来注入ServletContext对象  
    private ServletContext servletContext;


    @RequestMapping("file/download")
    public void fileDownload(HttpServletResponse response) {
        //获取网站部署路径(通过ServletContext对象)，用于确定下载文件位置，从而实现下载  
        String path = servletContext.getRealPath("/");

        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型  
        response.setContentType("multipart/form-data");
        //2.设置文件头：最后一个参数是设置下载文件名(假如我们叫a.pdf)  
        response.setHeader("Content-Disposition", "attachment;fileName=" + "a.pdf");
        ServletOutputStream out;
        //通过文件路径获得File对象(假如此路径中有一个download.pdf文件)  
        File file = new File(path + "download/" + "download.pdf");

        try {
            FileInputStream inputStream = new FileInputStream(file);

            //3.通过response获取ServletOutputStream对象(out)  
            out = response.getOutputStream();
            int b = 0;
            byte[] buffer = new byte[512];
            while (b != -1) {
                b = inputStream.read(buffer);
                //4.写到输出流(out)中  
                out.write(buffer, 0, b);
            }
            inputStream.close();
            out.close();
            out.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void fileDownload(String fileName, String filePath, HttpServletResponse response) {
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=" + parseGBK(fileName));
        File file = new File(filePath);
        OutputStream out = null;
        try {
            FileInputStream inputStream = new FileInputStream(file);
            out = response.getOutputStream();
            int b = 0;
            while (b != -1) {
                b = inputStream.read();
                out.write(b);
            }
            inputStream.close();
            out.close();
            out.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static String parseGBK(String fileName) {
        if (fileName == null || "".equals(fileName))
            return fileName;
        try {
            return new String(fileName.getBytes("GBK"), "ISO-8859-1");
        } catch (UnsupportedEncodingException usex) {
            return fileName;
        }
    }

    public static List<String> fileUpload(MultipartHttpServletRequest multipartRequest, String basePath, String subPath) {
        List<String> list = new ArrayList<String>();
        List<MultipartFile> files = multipartRequest.getFiles("file");
//		String path = multipartRequest.getRealPath("uploadFiles");
        String path = Global.getConfig("ftp.path");
        for (int i = 0; i < files.size(); i++) {
            if (!files.get(i).isEmpty()) {
                String fileName = basePath + File.separator + subPath + File.separator + generateFileName(files.get(i), i);
                list.add(fileName);
                File newFile = new File(path + File.separator + fileName);
                if (!newFile.exists()) {
                    newFile.mkdirs();
                }
                try {
                    files.get(i).transferTo(newFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    /**
     * 生成时间戳文件名  多文件防止重复
     *
     * @return
     */
    public static String generateFileName(MultipartFile file, int i) {
        String str = file.getOriginalFilename();
        str = str.split("\\.")[1];
        DateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
        return df.format(new Date()) + i + "." + str;
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}  