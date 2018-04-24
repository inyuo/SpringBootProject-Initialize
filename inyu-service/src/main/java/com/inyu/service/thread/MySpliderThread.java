package com.inyu.service.thread;

import com.inyu.service.AsyncSpliderService;
import org.springframework.beans.factory.annotation.Autowired;

public class MySpliderThread extends Thread {

    @Autowired
    private AsyncSpliderService asyncSpliderService;
    @Override
    public void run() {
        try {
            synchronized (this) {
                Thread.sleep(1000);
                asyncSpliderService.getPageInfo("","");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + "执行完毕");
    }
}
