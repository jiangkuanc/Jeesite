package com.dagongsoft.p2p.utils;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.thinkgem.jeesite.common.config.Global;

public class FileDownLoad {
    public static void createZip(String zipName, String fileName[],
                                 String filePath[], HttpServletResponse response) {
        Map<String, byte[]> m = new HashMap<String, byte[]>();
        for (int i = 0; i < filePath.length; i++) {
            String groupName = filePath[i].substring(0, 6);
            String remoteFileName = filePath[i].substring(7);
            byte[] fdfs = UploadFileUtils.fdfsDownload(groupName, remoteFileName, fileName[i]);
            m.put(fileName[i], fdfs);
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename="
                + parseGBK(zipName));
        try {
            ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream());
            zipOut.setEncoding(System.getProperty("sun.jnu.encoding"));
            // zipOut.setComment(file.getName());
            for (int i = 0; i < fileName.length; ++i) {
                zipOut.setEncoding("GB2312");
                if (m.get(fileName[i]) != null) {
                    zipOut.putNextEntry(new ZipEntry(fileName[i]));
                    zipOut.write(m.get(fileName[i]));
                }
            }
            zipOut.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Content-Disposition", "");
            System.out.println(e.getMessage());
            try {
                response.getWriter().write("文件不存在");
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }
    }

    public static String parseGBK(String sIn) {
        if (sIn == null || sIn.equals(""))
            return sIn;
        try {
            return new String(sIn.getBytes("GBK"), "ISO-8859-1");
        } catch (UnsupportedEncodingException usex) {
            return sIn;
        }
    }

    public static List<String> fileUpload(MultipartHttpServletRequest multipartRequest, String basePath, String subPath) {
        List<String> list = new ArrayList<String>();
        List<MultipartFile> files = multipartRequest.getFiles("file");
//			String path = multipartRequest.getRealPath("uploadFiles");
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

    public static void fileRemove(String[] filePath) {
        for (int i = 0; i < filePath.length; i++) {
            File f = new File(Global.getConfig("ftp.path") + filePath[i]);
            f.delete();
        }
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
}
