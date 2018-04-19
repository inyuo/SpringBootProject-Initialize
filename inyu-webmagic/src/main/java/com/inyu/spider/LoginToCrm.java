package com.inyu.spider;

import com.alibaba.fastjson.JSON;
import com.inyu.spider.utils.HttpUtils;
import org.apache.http.NameValuePair;

import java.util.List;
import java.util.Map;

/**
 * @author jingo</n>
 *         TODO</n>
 */
public class LoginToCrm {

    /**
     * 登录页面
     */
    public static String logInGet(String url) {
        // 开始构造登录的信息：账号、密码、以及三个标记信息
        String ret = HttpUtils.sendGet(url);
        // ret中会包含以下信息，进行判断即可。
        return judgeRet(ret);
    }

    private static String judgeRet(String ret) {
        String token;
        if (ret.indexOf("成功") > -1) {
            System.out.println("登陆成功。。。。。");
            Map map = (Map) JSON.parse(ret);
            token = String.valueOf(map.get("data"));
            return token;
        } else if (ret.indexOf("登录太频繁") > -1) {
            System.out.println("登录太频繁，请稍后再试。。。。。");
            return null;
        } else {
            System.out.println("登陆失败。。。。。");
            return null;
        }
    }

    public static void logInPost(String url, List<NameValuePair> info) {
        String ret = HttpUtils.sendPost(url, info);
        // ret中会包含以下信息，进行判断即可。
       // return judgeRet(ret);
    }
}
