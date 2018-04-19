package com.inyu.spider;

import com.inyu.spider.utils.HttpUtils;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

/**
 * @author jingo</n>
 *         TODO</n>
 */
public class ModCustomerInfo {

    public static void main(String[] args) {
        logIn();
//        logPost();
    }
    public static void logPost() {
        // 开始构造登录的信息：账号、密码、以及三个标记信息
        List<NameValuePair> info = new ArrayList<NameValuePair>();
        info.add(new BasicNameValuePair("loginName", "system"));
        info.add(new BasicNameValuePair("loginPass", "abc12345"));
        // 开始请求CSDN服务器进行登录操作。一个简单封装，直接获取返回结果
        long key = System.currentTimeMillis();
        String postUrl="http://60.12.11.47:8000/WPMS/login?"+key;
        String postGrl="http://60.12.11.47:8000/WPMS/";
        HttpUtils.sendPost(postUrl, info);
        String ret = HttpUtils.sendGet(postGrl);
        System.out.println(ret);
    }

    public static void logIn() {

        String url="http://www.loonscrm.cn:58231/api/login?username=15936158197&passwd=910125.slq";

        String token = LoginToCrm.logInGet(url);
        String startDate ="2017-10-15+14:54:00";
        String endDate ="2017-10-15+20:28:58";
        String pageNum = null;
        String pageSize = null;
//        List<Customer> customerList = getCustomerList(token,startDate,endDate,pageSize,pageNum);

        //更新联系日期
//        updateConateInfo(token, customerList);

    }


}
