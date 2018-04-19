package com.inyu.spider;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class HuangYeConfInterTest {

    @Autowired
    private   HuangYeConfInter huangYeConfInter;

    @Test
    public void getPageInfo() {
        try {
            huangYeConfInter.getPageInfo();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void setHuangYeConfInter(HuangYeConfInter huangYeConfInter) {
        this.huangYeConfInter = huangYeConfInter;
    }
}