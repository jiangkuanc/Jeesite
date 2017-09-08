package com.dagongsoft.p2p.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.StorageClient1;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.document.dao.P2pDocumentUploadRecordDao;
import com.dagongsoft.p2p.document.dao.P2pRateDocumentTemplateDao;
import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.feedback.dao.P2pReviewDocumentDao;
import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

/**
 * 文件上传/下载工具类
 *
 * @author DAGONG
 */
public class UploadFileUtils {
    private static P2pDocumentUploadRecordDao p2pDocumentUploadRecordDao = SpringContextHolder.getBean(P2pDocumentUploadRecordDao.class);
    private static P2pRateDocumentTemplateDao p2pRateDocumentTemplateDao = SpringContextHolder.getBean(P2pRateDocumentTemplateDao.class);
    private static P2pReviewDocumentDao p2pReviewDocumentDao = SpringContextHolder.getBean(P2pReviewDocumentDao.class);

    /**
     * 文件上传（上传到本地服务器）
     * @param multipartRequest
     * @param basePath
     * @param subPath
     * @return
     */
//	public static List<String> fileUpload(MultipartHttpServletRequest multipartRequest,String basePath,String subPath){
//		List<String> list = new ArrayList<String>();
//		List<MultipartFile> files = multipartRequest.getFiles("file");
////		String path = multipartRequest.getRealPath("uploadFiles");
//		String path = Global.getConfig("filePath");
//		for(int i=0;i<files.size();i++){
//			if(!files.get(i).isEmpty()){
//				String fileName = basePath+"/"+subPath+"/"+generateFileName(files.get(i));
//				list.add(fileName);
//				File newFile = new File(path+fileName);
//				if(!newFile.exists()){
//					newFile.mkdirs();
//				}
//				try {
//					files.get(i).transferTo(newFile);
//				} catch (Exception e){
//					e.printStackTrace();
//				}
//			}
//		}
//		return list;
//	}

//	/**
//	 * 文件上传（上传到本地服务器）
//	 * @param multipartRequest
//	 * @param basePath
//	 * @param subPath
//	 * @return
//	 */
//	public static List<String> fileUpload(MultipartHttpServletRequest multipartRequest,String basePath,String subPath,String[] filenames){
//		List<String> list = new ArrayList<String>();//文件地址
//		String path = Global.getConfig("filePath");
//		for(int i=0; i<filenames.length; i++){		
//			MultipartFile file = multipartRequest.getFile(filenames[i]);
//			if(!file.isEmpty()){
//				String fileName = basePath+"/"+subPath+"/"+generateFileName(file);
//				list.add(fileName);
//				File newFile = new File(path+fileName);
//				if(!newFile.exists()){
//					newFile.mkdirs();
//				}
//				try {
//					file.transferTo(newFile);
//				} catch (Exception e){
//					e.printStackTrace();
//				}
//			}
//		}
//		return list;
//	}

    /**
     * 生成时间戳文件名
     *
     * @return
     */
    public static String generateFileName(MultipartFile file) {
        String str = file.getOriginalFilename();
        String[] arr = str.split("\\.");
        str = arr[arr.length - 1];
        DateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
        return df.format(new Date()) + radomNumber(4) + "." + str;
    }

    /**
     * 生成随机数
     *
     * @param num
     * @return
     */
    public static String radomNumber(int num) {
        String str = "";
        Random r = new Random();
        for (int i = 0; i < num; i++) {
            str += r.nextInt(10);
        }
        return str;
    }

    public static List<String> getAllFileNames(MultipartHttpServletRequest multipartRequest) {
        List<String> list = new ArrayList<String>();
        List<MultipartFile> files = multipartRequest.getFiles("file");
        for (MultipartFile file : files) {
            list.add(file.getOriginalFilename());
        }
        return list;
    }


    /**
     * 打包下載
     *
     * @param zipName  压缩包文件名
     * @param fileName 压缩包内文件的名字
     * @param list     要下载的文件
     * @param response
     */
    public static void createZip(String zipName, String fileName[],
                                 List<File> list, HttpServletResponse response) {
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename="
                + parseGBK(zipName));
        InputStream input = null;
        try {
            ZipOutputStream zipOut = new ZipOutputStream(
                    response.getOutputStream());
            zipOut.setEncoding(System.getProperty("sun.jnu.encoding"));
            // zipOut.setComment(file.getName());
            for (int i = 0; i < list.size(); ++i) {
                input = new FileInputStream(list.get(i));
                zipOut.putNextEntry(new ZipEntry(fileName[i]));
                int temp = 0;
                while ((temp = input.read()) != -1) {
                    zipOut.write(temp);
                }
                input.close();
            }
            zipOut.close();
        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Content-Disposition", "");
            try {
                response.getWriter().write("文件不存在");
                response.getOutputStream().close();
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }
    }

    /**
     * 评级材料打包下载
     *
     * @param financingInformationId
     * @param rateDocumentTempId
     * @return
     */
    public static void rateInformation(String financingInformationId, String rateDocumentTempId, HttpServletResponse response) {
        try {
            P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload();
            p2pRateDocumentUpload.setFinancingInformationId(financingInformationId);
            p2pRateDocumentUpload.setRateDocumentTempId(rateDocumentTempId);
            P2pDocumentUploadRecord p2pDocumentUploadRecord = new P2pDocumentUploadRecord();
            p2pDocumentUploadRecord.setP2pRateDocumentUpload(p2pRateDocumentUpload);
            P2pRateDocumentTemplate p2pRateDocumentTemplate = new P2pRateDocumentTemplate();
            p2pRateDocumentTemplate.setId(rateDocumentTempId);
            String zipName = p2pRateDocumentTemplateDao.getTempNameById(p2pRateDocumentTemplate);
            zipName = zipName + ".zip";
            String path = Global.getConfig("filePath");
            List<String> addressLists = p2pDocumentUploadRecordDao.getAddress(p2pDocumentUploadRecord);

            List<File> files = new ArrayList<File>();
            String names[] = new String[addressLists.size()];
            for (int i = 0; i < addressLists.size(); i++) {
                File file = new File(path + addressLists.get(i));
                names[i] = p2pDocumentUploadRecordDao.getNameByAddress(addressLists.get(i));
                files.add(file);
            }
            createZip(zipName, names, files, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 复评材料打包下载
     *
     * @param financingInformationId
     * @param rateDocumentTempId
     * @return
     */
    public static void reviewDownloads(String rateResultViewId, HttpServletResponse response) {
        try {
            String zipName = "复评材料" + ".zip";
            String path = Global.getConfig("filePath");
            List<P2pReviewDocument> p2pReviewDocuments = p2pReviewDocumentDao.getByRateResultViewId(rateResultViewId);

            List<File> files = new ArrayList<File>();
            String names[] = new String[p2pReviewDocuments.size()];
            for (int i = 0; i < p2pReviewDocuments.size(); i++) {
                File file = new File(path + p2pReviewDocuments.get(i).getFileAddress());
                names[i] = p2pReviewDocuments.get(i).getFileName();
                files.add(file);
            }
            createZip(zipName, names, files, response);
        } catch (Exception e) {
            e.printStackTrace();
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

    /**
     * 下载
     * 文件命名规则：
     *
     * @param address
     * @param request
     * @param response
     * @return
     */

    public static void download(String address, HttpServletRequest request,
                                HttpServletResponse response) {
        // TODO Auto-generated method stub
        String[] a = address.split("/");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + a[a.length - 1]);
        try {
            String path = Global.getConfig("filePath");
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

    /**
     * 下载（保留原文件名）
     * 文件命名规则：
     * @param address
     * @param request
     * @param response
     * @return
     */
//	public static void download2(String address,String fileName, HttpServletRequest request,
//			HttpServletResponse response) {
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("multipart/form-data");
//		try {
//			response.setHeader("Content-Disposition", "attachment;fileName=\""+new String( fileName.getBytes("gb2312"), "ISO8859-1" ) + "\"");
//			String path = Global.getConfig("filePath");
//			InputStream inputStream = new FileInputStream(new File(path + address ));
//			OutputStream os = response.getOutputStream();
//			byte[] b = new byte[2048];
//			int length;
//			while ((length = inputStream.read(b)) > 0) {
//				os.write(b, 0, length);
//			}
//			 // 这里主要关闭。
//			os.close();
//
//			inputStream.close();
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}

    /**
     * fastDFS上传
     *
     * @param request
     * @return
     */
    public static List<String> fdfsUpload(MultipartHttpServletRequest request) {
        List<MultipartFile> files = request.getFiles("file");
        List<String> list = new ArrayList<String>();
        for (MultipartFile file : files) {
            if (file.getOriginalFilename().length() > 3) {
                list.add(fdfsUpload(file));
            }
        }
        return list;
    }

    /**
     * fastDFS上传
     *
     * @param request
     * @param fileNames
     * @return
     */
    public static List<String> fdfsUpload(MultipartHttpServletRequest request, String[] fileNames) {
        List<String> list = new ArrayList<String>();
        for (String name : fileNames) {
            list.add(fdfsUpload(request.getFile(name)));
        }
        return list;
    }

    /**
     * fastDFS上传
     *
     * @param file
     * @return
     */
    public static String fdfsUpload(MultipartFile file) {
        StorageClient1 client = null;
        FileInputStream input = null;
        InputStreamReader in = null;
        try {
            //获取上传文件名
            String fileName = file.getOriginalFilename();
            //获取文件名
            String fileName_str = fileName.substring(0, fileName.lastIndexOf("."));
            //文件类型
            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            byte[] images = file.getBytes();
            client = FdfsClientPool.getConnection(3000);
            //fastDFS方式  
            String fileId = "";
            //设置元信息  
            NameValuePair[] metaList = new NameValuePair[3];
            metaList[0] = new NameValuePair("fileName", fileName_str);
            //扩展名
            metaList[1] = new NameValuePair("fileExtName", fileExt);
            metaList[2] = new NameValuePair("fileLength", images.length + "");
            //上传文件  
            fileId = client.upload_file1(images, fileExt, metaList);
            /*if (image_url != null && !image_url.equals("")) {
                //修改时换了图片，删除原来的图片
            	client.delete_file1(image_url);
			}*/
            return fileId;
        } catch (Exception e) {
            FdfsClientPool.drop(client);
            e.printStackTrace();
        } finally {
            if (client != null) {
                FdfsClientPool.remove(client);
            }
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    /**
     * fastDFS文件地址转换（标识地址--》访问地址）
     *
     * @param realUrl
     * @return
     */
    public static String viewUrl(String realUrl) {
        String viewUrl = null;
        if (realUrl != null && !"".equals(realUrl)) {
            viewUrl = realUrl.substring(6);
            return Global.getConfig("fdfs.path") + viewUrl;
        }
        return null;
    }

    /**
     * fastDFS文件删除
     *
     * @param fileId
     */
    public static void fdfsDelete(String fileId) {
        //删除图片
        StorageClient1 client = null;
        client = FdfsClientPool.getConnection(3000);
        try {
            client.delete_file1(fileId);
        } catch (Exception e) {
            FdfsClientPool.drop(client);
            e.printStackTrace();
        } finally {
            if (client != null) {
                FdfsClientPool.remove(client);
            }
        }
    }

    /**
     * fastDFS文件下载（保留原文件名）
     *
     * @param fileId
     * @param specFileName
     * @param response
     */
    public static void fdfsDownload(String fileId, String specFileName, HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        try {
            response.setHeader("Content-Disposition", "attachment;fileName=\"" + new String(specFileName.getBytes("gb2312"), "ISO8859-1") + "\"");
            OutputStream os = response.getOutputStream();
            String groupName = fileId.substring(0, 6);
            String remoteFileName = fileId.substring(7);
            byte[] b = fdfsDownload(groupName, remoteFileName, specFileName);
            os.write(b);
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * fastDFS文件下载（不保留原文件名）
     *
     * @param fileId
     * @param response
     */
    public static void fdfsDownload(String fileId, HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        String[] a = fileId.split("/");
        try {
            response.setHeader("Content-Disposition", "attachment;fileName=" + a[a.length - 1]);
            OutputStream os = response.getOutputStream();
            String groupName = fileId.substring(0, 6);
            String remoteFileName = fileId.substring(7);
            byte[] b = fdfsDownload(groupName, remoteFileName, a[a.length - 1]);
            os.write(b);
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * fastDFS文件下载基本方法
     *
     * @param groupName
     * @param remoteFileName
     * @param specFileName
     * @return
     */
    public static byte[] fdfsDownload(String groupName, String remoteFileName, String specFileName) {
        byte[] content = null;
        StorageClient1 client = null;
        try {
            client = FdfsClientPool.getConnection(3000);
            content = client.download_file(groupName, remoteFileName);
        } catch (Exception e) {
            FdfsClientPool.drop(client);
            e.printStackTrace();
        } finally {
            if (client != null) {
                FdfsClientPool.remove(client);
            }
        }
        return content;
    }

    /**
     * 提取文本中的图片路径
     *
     * @param text
     * @return
     * @author Summer
     * @version 2017-04-18
     */
    public static List<String> getPathList(String text) {
        Pattern paUrl = Pattern.compile("<img.*? src=\"([^\"]+)");
        Matcher m = paUrl.matcher(text);
        List<String> listTemp = new ArrayList<String>();//存放临时路径
        while (m.find()) {
            listTemp.add(m.group(1));
        }
        return listTemp;
    }

    /**
     * 功能名称：富文本新增时处理，改变图片存储方式、路径
     * 功能说明：
     * 把旧的文本内容中的本地图片上传到文件服务器，删除本地图片，并替换旧的文本内容中的图片路径为文件服务器路径，把替换后的文本内容返回
     *
     * @param contentOld
     * @param request
     * @author Summer
     * @version 2017-04-18
     */
    public static String addChangeImage(String contentOld, HttpServletRequest request) {
        String contentNew = "";
        String path = request.getSession().getServletContext().getRealPath("/");
        String webPath = request.getContextPath();

        Pattern paUrl = Pattern.compile("<img.*? src=\"([^\"]+)");
        Matcher m = paUrl.matcher(contentOld);
        StorageClient1 client = null;
        while (m.find()) {
            String imagePath = m.group(1);
            String imagePathOld = imagePath;
            try {
                imagePath = URLDecoder.decode(imagePath, "UTF-8");
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }

            File f = new File(path + imagePath.replace(webPath, ""));
            InputStream is = null;
            try {
                is = new FileInputStream(f);
                byte[] images = new byte[(int) f.length()];
                is.read(images);
                //获取上传文件名
                //获取文件名
                String fileName_str = imagePath.substring(imagePath.lastIndexOf("/") + 1, imagePath.lastIndexOf("."));
                //文件类型
                String fileExt = imagePath.substring(imagePath.lastIndexOf(".") + 1).toLowerCase();
                client = FdfsClientPool.getConnection(3000);
                //fastDFS方式
                String fileId = "";
                //设置元信息
                NameValuePair[] metaList = new NameValuePair[3];
                metaList[0] = new NameValuePair("fileName", fileName_str);
                //扩展名
                metaList[1] = new NameValuePair("fileExtName", fileExt);
                metaList[2] = new NameValuePair("fileLength", images.length + "");
                //上传文件
                fileId = client.upload_file1(images, fileExt, metaList);
                contentNew = contentOld.replace(imagePathOld, UploadFileUtils.viewUrl(fileId));
                if (f.exists()) {
                    f.delete();
                }
            } catch (Exception e) {
                ////FdfsClientPool.drop(client);
                e.printStackTrace();
            } finally {
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (client != null) {
                    FdfsClientPool.remove(client);
                }
            }
        }
        List<String> imgpath = getPathList(contentOld);
        //删除存在本地的图片
        if (imgpath.size() != 0 && imgpath != null) {
            for (String img : imgpath) {
                try {
                    img = URLDecoder.decode(img, "UTF-8");
                } catch (UnsupportedEncodingException e1) {
                    e1.printStackTrace();
                }
                File f = new File(path + img.replace(webPath, ""));
                if (f.exists()) {
                    f.delete();
                }
            }
        }
        return contentNew;
    }

    /**
     * 功能名称：富文本修改时，改变图片存储方式、路径
     * 功能说明：
     * 1. OLD在NEW中没有的要删除服务器文件;
     * 2. NEW在OLD中没有的要先上传、后删除本地文件（还要替换text）
     * 3. 在OLD、NEW都有的，也就是没有变得，不需要处理
     *
     * @param contentNew 新的富文本内容
     * @param contentOld 旧的富文本内容
     * @param request
     * @author Summer
     * @version 2017-04-18
     */
    public static String updateChangeImage(String contentNew, String contentOld, HttpServletRequest request) {

        List<String> textListsNew = getPathList(contentNew);//包含页面新添加的路径
        List<String> textListsOld = getPathList(contentOld);//数据库的路径

        List<String> noChangePicList = new ArrayList<String>();//在OLD、NEW都有的，也就是没有变得，不需要处理

        //找出修改前后没变得图片
        for (String textNew1 : textListsNew) {
            for (String textOld : textListsOld) {
                if (textNew1.equals(textOld)) {
                    noChangePicList.add(textOld);
                }
            }
        }

        for (int i = 0; i < noChangePicList.size(); i++) {
            textListsNew.remove(noChangePicList.get(i));//移除未改变的图片路径
        }

        for (int i = 0; i < noChangePicList.size(); i++) {
            textListsOld.remove(noChangePicList.get(i));//移除未改变的图片路径
        }

        //1.添加
        String path = request.getSession().getServletContext().getRealPath("/");
        String webPath = request.getContextPath();
        StorageClient1 client = null;
        InputStream is = null;
        try {
            client = FdfsClientPool.getConnection(3000);
            if (textListsNew.size() != 0 && textListsNew != null) {
                for (String imagePath : textListsNew) {
                    String imagePathOld = imagePath;
                    try {
                        imagePath = URLDecoder.decode(imagePath, "UTF-8");
                    } catch (UnsupportedEncodingException e1) {
                        e1.printStackTrace();
                    }
                    File f = new File(path + imagePath.replace(webPath, ""));
                    is = new FileInputStream(f);
                    byte[] images = new byte[(int) f.length()];
                    is.read(images);
                    // 获取上传文件名
                    // 获取文件名
                    String fileName_str = imagePath.substring(imagePath.lastIndexOf("/") + 1, imagePath.lastIndexOf("."));
                    // 文件类型
                    String fileExt = imagePath.substring(imagePath.lastIndexOf(".") + 1).toLowerCase();
                    // fastDFS方式
                    String fileId = "";
                    // 设置元信息
                    NameValuePair[] metaList = new NameValuePair[3];
                    metaList[0] = new NameValuePair("fileName", fileName_str);
                    // 扩展名
                    metaList[1] = new NameValuePair("fileExtName", fileExt);
                    metaList[2] = new NameValuePair("fileLength", images.length + "");
                    // 上传文件
                    fileId = client.upload_file1(images, fileExt, metaList);
                    contentNew = contentNew.replace(imagePathOld, UploadFileUtils.viewUrl(fileId));
                }
            }
            // 2.删除图片
            if (textListsOld.size() != 0 && textListsOld != null) {
                for (String bb : textListsOld) {
                    String aa = bb.replace(Global.getConfig("fdfs.path"), "group1");
                    client.delete_file1(aa);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (client != null) {
                    FdfsClientPool.remove(client);
                }
            }
        }

        //删除存在本地的图片
        if (textListsNew.size() != 0 && textListsNew != null) {
            for (String img : textListsNew) {
                try {
                    img = URLDecoder.decode(img, "UTF-8");
                } catch (UnsupportedEncodingException e1) {
                    e1.printStackTrace();
                }
                File f = new File(path + img.replace(webPath, ""));
                if (f.exists()) {
                    f.delete();
                }
            }
        }
        return contentNew;
    }
}
