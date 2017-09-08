package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;

public class PageModel {
    //结果集
    private List list;
    //查询记录数
    private int totalRecords;
    //每页多少条数据
    private int pageSize;
    //第几页
    private int pageNo;
    //总页数
    private int totalPages;

    //总页数
    public int getTotalPages() {
        return (totalRecords + pageSize - 1) / pageSize;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    //取得首页
    public int getTopPage() {
        return 1;
    }

    //上一页
    public int getPreviousPage() {
        if (pageNo <= 1) {
            return 1;
        }
        return pageNo - 1;
    }

    //下一页
    public int getNextPageNo() {
        if (pageNo >= getBottomPageNo()) {
            return getBottomPageNo();
        }
        return pageNo + 1;
    }

    //取得尾页
    public int getBottomPageNo() {
        return getTotalPages();
    }

    public void setList(List list) {
        this.list = list;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public List getList() {
        return list;
    }

}
























