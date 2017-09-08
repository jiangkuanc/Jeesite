package com.dagongsoft.p2p.utils;

import java.util.Collections;
import java.util.List;

public class ListPageUtils<T> {
    /**
     * 当前页数
     * 初始化数据为1
     */
    private int pageNum = 1;


    /**
     * 每页显示条数
     */
    private int pageSize = 2;

    /**
     * 总页数
     */
    private int pageCount;

    /**
     * 原集合
     */
    private static List data;


    public ListPageUtils(List<T> data) {

        if (data == null || data.isEmpty()) {
            throw new IllegalArgumentException("data must be not empty!");
        }

        this.data = data;
        this.pageCount = data.size() / pageSize;
        if (data.size() % pageSize != 0) {
            this.pageCount++;
        }

    }

    /**
     * 得到分页后的数据
     *
     * @param pageNum 页码
     * @return 分页后结果
     * @pageNum:当前页码
     */
    public List<T> getPagedList(int pageNums) {
        int fromIndex = (pageNums - 1) * pageSize;
        if (fromIndex >= data.size()) {
            return Collections.emptyList();
        }

        int toIndex = pageNums * pageSize;
        if (toIndex >= data.size()) {
            toIndex = data.size();
        }
        return data.subList(fromIndex, toIndex);
    }

    public int getPageSize() {
        return pageSize;
    }

    public List<T> getData() {
        return data;
    }

    public int getPageCount() {
        return pageCount;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }


    public List<T> toNextPage() {
        pageNum++;//页数加一
        if (pageNum > pageCount) {
            pageNum--;
        }
        return this.getPagedList(pageNum);
    }

    public List<T> toBackPage() {
        pageNum--;//页数加一
        if (pageNum == 0) {
            pageNum = 1;
        }
        return this.getPagedList(pageNum);
    }

    public List<T> toFirstPage() {
        pageNum = 1;
        return this.getPagedList(pageNum);
    }

    public List<T> toLastPage() {
        pageNum = pageCount;
        return this.getPagedList(pageNum);
    }


    public List<T> toGoPage(int p) {

        if (p < 0) {
            pageNum = 1;
        }
        if (p > pageCount) {
            pageNum = pageCount;
        }
        return this.getPagedList(pageNum);
    }
    
    
    
    
/*    public static void main(String[] args) {
        Integer[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
        List<Integer> list = Arrays.asList(array);
 
        ListPageUtil<Integer> pager = new ListPageUtil<Integer>(list, 10);
        
        System.out.println(pager.getPageCount());
 
        List<Integer> page1 = pager.getPagedList(1);
        System.out.println(page1);
 
        List<Integer> page2 = pager.getPagedList(2);
        System.out.println(page2);
 
        List<Integer> page3 = pager.getPagedList(3);
        System.out.println(page3);
    }*/
}
