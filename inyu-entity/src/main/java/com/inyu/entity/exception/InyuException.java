package com.inyu.entity.exception;

/**
 * @author 你的名称
 * @createTime 2018527 下午 11:09
 * @description 27
 */
public class InyuException extends RuntimeException{
    private static final long serialVersionUID = 7259466483223112769L;
    private String index;//自定义错误码
    private String msg;//自定义错误信息
    public InyuException() {
        super();
    }

    public InyuException(String index, String msg)
    {
        super(index+"\n"+msg);
        this.index = index;
        this.msg = null;
    }
    public InyuException(String index, Object... msg)
    {
        super();
        this.index = index;
        this.msg = null;
    }
    public InyuException(String index, Object  msg,Throwable throwable)
    {
        super(index+"\n"+msg,throwable);
        this.index = index;
        this.msg = null;
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }
}
