package com.inyu.service.impl;

import com.inyu.common.DateUtil;
import com.inyu.dal.master.QuartzProxyMapper;
import com.inyu.entity.QuartzProxy;
import com.inyu.service.AsyncQuartzProxyService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/20/020.
 */
@Service
public class AsyncQuartzProxyServiceImpl implements AsyncQuartzProxyService {

    private Logger logger= LoggerFactory.getLogger(AsyncQuartzProxyServiceImpl.class);

    private TransactionTemplate transactionTemplate;

    @Autowired
    QuartzProxyMapper quartzProxyMapper;

    @Override
    public List<QuartzProxy> getProxyList() {
        return quartzProxyMapper.selectAll();
    }

    @Override
    public List<QuartzProxy> selectProxyListByStatus(Integer status) {
        Map params = new HashMap();
        params.put("status",status);
        return quartzProxyMapper.selectProxyListByStatus(params);
    }

    @Override
    public QuartzProxy findById(long id) {
        return quartzProxyMapper.selectByPrimaryKey(id);
    }

    @Override
    public QuartzProxy findByIp(String ip) {
        Map map=new HashMap();
        map.put("ip",ip);
        return quartzProxyMapper.queryProxyByIp(map);
    }

    @Override
    public int saveProxy(QuartzProxy proxy) {
        Map params = new HashMap();
        params.put("ip",proxy.getIp());

        // 查重
        QuartzProxy byIp = quartzProxyMapper.queryProxyByIp(params);
        if (byIp==null){
            initProxy(proxy);
            return quartzProxyMapper.insert(proxy);
        }else {
            byIp.setLastValidate(DateUtil.getNowDate());
            byIp.setPort(proxy.getPort());
            byIp.setSpread(proxy.getSpread());
            byIp.setStatus(proxy.getStatus());
            return quartzProxyMapper.updateByPrimaryKey(proxy);
        }
    }

    private void initProxy(QuartzProxy proxy) {
        if (StringUtils.isBlank(proxy.getType())){
            proxy.setType("Http");
        }
        if (StringUtils.isBlank(proxy.getLocation())){
            proxy.setLocation("未知");
        }
        if (proxy.getLastValidate() == null){
            proxy.setLastValidate(DateUtil.getNowDate());
        }
        if (proxy.getSpread() == null){
            proxy.setSpread(0f);
        }
        if (proxy.getStatus() == null){
            proxy.setSpread(0f);
        }
    }

    @Override
    public int updateProxy(QuartzProxy proxy) {
        return quartzProxyMapper.updateByPrimaryKey(proxy);
    }

}
