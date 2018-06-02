package com.inyu.entity.enu;

/**
 * @author : jingo
 * @version V1.0
 * @Project: jingo
 * @Package com.inyu.entity.enu
 * @Description: TODO
 * @date Date : 2018年06月02日 上午 11:50
 */
public enum ExceptionEnum {
    //通过括号赋值,而且必须带有一个参构造器和一个属性跟方法，否则编译出错
    //赋值必须都赋值或都不赋值，不能一部分赋值一部分不赋值；如果不赋值则不能写构造器，赋值编译也出错
    INVALID_PARAM(1,"入参异常","invalid_param"),
    CONNECT_REFUSED(2,"拒绝连接","connect_refused");
    int index;
    String chineseName;
    String englishName;

    ExceptionEnum(int index, String chineseName, String englishName) {
        this.index = index;
        this.chineseName = chineseName;
        this.englishName = englishName;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }
}
