/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package com.inyu.service.impl;

import com.google.code.kaptcha.Producer;
import com.inyu.common.DateUtil;
import com.inyu.dal.master.SysCaptchaMapper;
import com.inyu.entity.SysCaptcha;
import com.inyu.entity.exception.InyuException;
import com.inyu.service.AsyncSysCaptchaService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;
import java.util.Date;

/**
 * 验证码
 *
 * @author Mark sunlightcs@gmail.com
 * @since 2.0.0 2018-02-10
 */
@Service("sysCaptchaService")
public class AsyncSysCaptchaServiceImpl implements AsyncSysCaptchaService {
    @Autowired
    private Producer producer;
    @Autowired
    private SysCaptchaMapper sysCaptchaMapper;

    @Override
    public BufferedImage getCaptcha(String uuid) {
        if(StringUtils.isBlank(uuid)){
            throw new InyuException("uuid不能为空");
        }
        //生成文字验证码
        String code = producer.createText();

        SysCaptcha captchaEntity = new SysCaptcha();
        captchaEntity.setUuid(uuid);
        captchaEntity.setCode(code);
        //5分钟后过期
        captchaEntity.setGmtExpire(DateUtil.addDateMinutes(new Date(), 5));
        sysCaptchaMapper.insert(captchaEntity);

        return producer.createImage(code);
    }

    @Override
    public boolean validate(String uuid, String code) {
        SysCaptcha captchaEntity = sysCaptchaMapper.selectByUid(uuid);
        if(captchaEntity == null){
            return false;
        }

        //删除验证码
        sysCaptchaMapper.deleteByUid(uuid);

        if(captchaEntity.getCode().equalsIgnoreCase(code) && captchaEntity.getGmtExpire().getTime() >= System.currentTimeMillis()){
            return true;
        }

        return false;
    }
}
