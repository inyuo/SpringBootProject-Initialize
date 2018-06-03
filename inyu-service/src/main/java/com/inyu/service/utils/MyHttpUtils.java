package com.inyu.service.utils;

import com.inyu.common.BasicResult;
import com.inyu.entity.QuartzProxy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 自定义浏览器信息 2getPageInfo
 */
public class MyHttpUtils {

    public static final String TAG = "MyHttpUtils";
    public static CloseableHttpClient httpClient = HttpClients.createDefault();
    public static HttpClientContext context = new HttpClientContext();
    private static Logger logger = LoggerFactory.getLogger(MyHttpUtils.class);

    private MyHttpUtils() {

    }

    public static String sendGet(String url, Map<String,String> headers,QuartzProxy quartzProxy) {
        CloseableHttpResponse response = null;
        String content = null;
        HttpHost proxy=null;
        try {
            // 依次是代理地址，代理端口号，协议类型
            if (quartzProxy!=null){
                proxy = new HttpHost(quartzProxy.getIp(), Integer.parseInt(quartzProxy.getPort()), quartzProxy.getType());
            }
            RequestConfig config = RequestConfig.custom().setProxy(proxy).build();

            HttpGet get = new HttpGet(url);
            get.setConfig(config);
            // nvps是包装请求参数的list
            if (!CollectionUtils.isEmpty(headers)) {
                for (String key : headers.keySet()) {
                    get.setHeader(key,headers.get(key));
                }
            }
            response = httpClient.execute(get, context);
            HttpEntity entity = response.getEntity();
            content = EntityUtils.toString(entity);
            EntityUtils.consume(entity);
            return content;
        } catch (Exception e) {
            logger.error("sendGet is Error :",e);
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e1) {
                    logger.error("response.close()   Error :",e1);
                }
            }
        }finally {
            return content;
        }
    }

    public static BasicResult sendPost(String url, List<NameValuePair> nvps) {
        CloseableHttpResponse response = null;
        BasicResult bs = new BasicResult();
        String content = null;
        try {
            // 　HttpClient中的post请求包装类
            HttpPost post = new HttpPost(url);
            // nvps是包装请求参数的list
            if (nvps != null) {
                post.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
            }
            // 执行请求用execute方法，content用来帮我们附带上额外信息
            response = httpClient.execute(post, context);
            // 得到相应实体、包括响应头以及相应内容
            HttpEntity entity = response.getEntity();
            // 得到response的内容
            content = EntityUtils.toString(entity);
            bs.setData(content);
            // System.out.println(TAG + "POST:" + content);
            // 　关闭输入流
            EntityUtils.consume(entity);
            return bs;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return bs;
    }

    public static void checkProxyIp(String ip,String port) {

            String testUrl="http://www.baidu.com";
            int statusCode = 0;
            try {
                HttpHost proxy = new HttpHost("115.218.120.184", 8080, "http");
                RequestConfig config = RequestConfig.custom()
                        .setProxy(proxy)
                        // 读取数据超时时间（默认30秒 30000ms） 单位毫秒（ms）
                        .setSocketTimeout(30000)
                        // 连接超时时间（默认10秒 10000ms） 单位毫秒（ms）
                        .setConnectTimeout(10000)
                        .build();
                HttpGet get = new HttpGet(testUrl);
                get.setConfig(config);

                CloseableHttpResponse response = httpClient.execute(get, context);

            } catch (Exception e) {
                System.out.println("ip " + testUrl + " is not aviable");
            }
            if(statusCode>0){
                System.out.format("%s:%s-->%sn", ip, port,statusCode);
            }

    }
}
