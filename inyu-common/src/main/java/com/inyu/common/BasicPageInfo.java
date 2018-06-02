package com.inyu.common;

/**
 * @author : jingo
 * @version V1.0
 * @Project: jingo
 * @Package com.inyu.common
 * @Description: TODO
 * @date Date : 2018年06月02日 下午 12:04
 */
public class BasicPageInfo {
    // 当前页
    private Integer currentPage = 1;
    // 每页显示的总条
    private Integer pageSize = 20;
    // 总条
    private Integer totalNum;
    // 总页
    private Integer totalPage;

    // 是否分页 默认不分页
    private Boolean isPage =false;

    public BasicPageInfo(Integer currentPage, Integer pageSize, Integer totalNum, boolean isPage) {
        int totalPage = totalNum/pageSize;         // 页数
        if (!(totalNum%pageSize==0)){
            totalPage++;
        }
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalNum = totalNum;
        this.totalPage = totalPage;
        this.isPage = isPage;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public boolean isPage() {
        return isPage;
    }

    public void setPage(boolean page) {
        isPage = page;
    }



}
