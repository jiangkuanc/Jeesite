package com.dagongsoft.p2p.utils;

import java.io.IOException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.core.io.ClassPathResource;

/**
 * fastdfs客户端工具类
 *
 * @author FGQ
 */
public class FdfsClientPool {

    private static Log logger = LogFactory.getLog(FdfsClientPool.class);
    //最大连接数,可以写配置文件
    private static int size = 100;
    //被使用的连接，该map本身线程安全
    private static ConcurrentHashMap<StorageClient1, Object> busyConnectionPool = null;
    //空闲的连接,该队列本身线程安全
    private static ArrayBlockingQueue<StorageClient1> idleConnectionPool = null;

    static {
        init(size);
    }

    /**
     * 初始化客户端
     */
    private static void initClientGlobal() {
        ClassPathResource cpr = new ClassPathResource("fdfs_client.conf");
        try {
            ClientGlobal.init(cpr.getClassLoader().getResource("fdfs_client.conf").getPath());
        } catch (IOException | MyException e) {
            e.printStackTrace();
        }
    }

    /**
     * 初始化连接池
     *
     * @param size
     */
    public static void init(int sizeNum) {
        if (busyConnectionPool != null) {
            busyConnectionPool.clear();
        } else {
            busyConnectionPool = new ConcurrentHashMap<StorageClient1, Object>();
        }
        if (idleConnectionPool != null) {
            idleConnectionPool.clear();
        } else {
            idleConnectionPool = new ArrayBlockingQueue<StorageClient1>(size);
        }
        initClientGlobal();
        TrackerServer trackerServer = null;
        try {
            TrackerClient trackerClient = new TrackerClient();
            //只需要一个tracker server连接
            trackerServer = trackerClient.getConnection();
            StorageServer storageServer = null;
            StorageClient1 storageClient1 = null;
            for (int i = 0; i < sizeNum; i++) {
                storageClient1 = new StorageClient1(trackerServer, storageServer);
                idleConnectionPool.add(storageClient1);
                logger.info("初始化fastdfs连接池::" + i);
            }
        } catch (IOException e) {
            logger.error("初始化fastdfs连接池失败：" + e.getStackTrace());
            e.printStackTrace();
        } finally {
            //关闭trackerServer连接
            if (trackerServer != null) {
                try {
                    trackerServer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 从连接池中取出连接
     *
     * @param waitTime 毫秒
     * @return
     */
    public static StorageClient1 getConnection(int waitTime) {
        logger.info("从连接池中获取连接");
        StorageClient1 storageClient1 = null;
        try {
            //获取该队列头部，如果没有可用元素则等待指定时间
            storageClient1 = idleConnectionPool.poll(waitTime, TimeUnit.SECONDS);
            if (storageClient1 != null) {
                //key,value
                busyConnectionPool.put(storageClient1, new Object());
            }
            System.out.println("ffffffff=" + idleConnectionPool.size());
        } catch (InterruptedException e) {
            logger.error("重fastdfs连接池中获取连接失败：" + e.getStackTrace());
            storageClient1 = null;
            e.printStackTrace();
        }
        return storageClient1;
    }

    /**
     * 客户端用完之后回收连接
     *
     * @param storageClient1
     */
    public static void remove(StorageClient1 storageClient1) {
        if (busyConnectionPool.remove(storageClient1) != null) {
            idleConnectionPool.add(storageClient1);
        }
        System.out.println("ggggggg=" + idleConnectionPool.size());
    }

    /**
     * 如果连接无效则抛弃，新建连接来补充到池里
     *
     * @param storageClient1
     */
    public static void drop(StorageClient1 storageClient1) {
        if (busyConnectionPool.remove(storageClient1) != null) {
            TrackerServer trackerServer = null;
            TrackerClient trackerClient = new TrackerClient();
            try {
                trackerServer = trackerClient.getConnection();
                StorageClient1 newStorageClient1 = new StorageClient1(trackerServer, null);
                idleConnectionPool.add(newStorageClient1);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (trackerServer != null) {
                    try {
                        trackerServer.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
