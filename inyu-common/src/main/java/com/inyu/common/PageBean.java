package com.inyu.common;

import java.util.List;

/**
 * @author : jingo
 * @version V1.0
 * @Project: jingo
 * @Package com.inyu.common
 * @Description: TODO
 * @date Date : 2018年06月02日 下午 12:04
 */
public class PageBean<T> extends BasicPageInfo {

    private List<T> itemList;

    public PageBean(Integer currentPage, Integer pageSize, Integer totalNum,  boolean isPage) {

        super(currentPage, pageSize, totalNum, isPage);
    }


    public List<T> getItemList() {
        return itemList;
    }

    public void setItemList(List<T> itemList) {
        this.itemList = itemList;
    }
}
