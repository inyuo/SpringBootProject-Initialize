package com.inyu.entity.exception;

/**
 * @author 你的名称
 * @createTime 2018527 下午 11:09
 * @description 27
 */
public class InyuException extends RuntimeException{
    private static final long serialVersionUID = 7259466483223112769L;
    private String msg;//自定义错误信息
    private String code;//自定义错误码
    public InyuException() {
        super();
    }

    public InyuException(String code, String msg)
    {
        this.code = code;
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
