package com.inyu.controller;

import java.util.ArrayList;
import java.util.List;

public class RunThread extends Thread {
    //线程计数器需要对所有线程可见，是共享变量
    int threads = 0;
    //创建线程锁
    private static Object lock = new Object();

    public void setThreads(int threads) {
        this.threads = threads;
    }

    public void parseToVisitUrltoRedis() throws Exception {
        //用来保存新提取出来的url列表
        List<String> urlList = new ArrayList<String>();
        while (true) {

        }
    }

    public void run() {
        try {
            parseToVisitUrltoRedis();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
