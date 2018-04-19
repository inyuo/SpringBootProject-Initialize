package com.inyu.spider;

import com.inyu.spider.utils.HttpUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.message.BasicNameValuePair;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 * @date 0022, 2017年10月22日
 */
public class HuangYeConfInter {

    private static  final String baseUrl_huangye88 = "https://www.biquge5200.com/";

   public static boolean  getPageInfo() throws IOException {
        HttpUriRequest httpUriRequest = new HttpPost(baseUrl_huangye88);
        // 添加必要的头信息
        httpUriRequest
                .setHeader("Accept",
                        "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
        httpUriRequest.setHeader("Accept-Encoding", "gzip,deflate,sdch");
        httpUriRequest.setHeader("Host", "b2b.huangye88.com");
        httpUriRequest.setHeader("Referer", "http://b2b.huangye88.com/qiye2630656/");
        httpUriRequest.setHeader("Upgrade-Insecure-Requests", "1");
        httpUriRequest.setHeader("Accept-Language", "zh-CN,zh;q=0.8");
        httpUriRequest.setHeader("Connection", "keep-alive");
        httpUriRequest.setHeader("Content-Type", "application/x-www-form-urlencoded");
        // 模拟浏览器，否则CSDN服务器限制访问
        httpUriRequest
                .setHeader(
                        "User-Agent",
                        "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1.11) Gecko/20071127 Firefox/2.0.0.11");
        // 【特别注意】：这个一定需要和登录用同一个“httpClient”，不然会失败。登陆信息全部在“httpClient”中保存
        // 开始构造post信息
       List<NameValuePair> nvps = new ArrayList<NameValuePair>();
//       nvps.add(new BasicNameValuePair("js", "1"));
//       nvps.add(new BasicNameValuePair("flag", "1"));
//       nvps.add(new BasicNameValuePair("res", "46BDDCE56C738D68E676D8BD77F7A3ACF32389FAB6868D15F49C6B397631D03193234336DA05376A518GJ1Z1Kw=="));
       // 开始请求CSDN服务器进行登录操作。一个简单封装，直接获取返回结果
        String ret = HttpUtils.sendGet( baseUrl_huangye88);
        System.out.println("获取页面信息："+ret);
        return Boolean.TRUE;
    }


   public static void write2Txt(String content) throws IOException {
		 /* 写入Txt文件 */
        File writename = new File("D:\\compare.txt"); // 相对路径，如果没有则要建立一个新的output。txt文件
        FileWriter out = new FileWriter(writename,true);
        out.write(content+"\r\n"); // \r\n即为换行
        out.close(); // 最后记得关闭文件
    }
}

