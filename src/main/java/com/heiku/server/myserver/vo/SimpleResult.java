package com.heiku.server.myserver.vo;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */
public class SimpleResult {

    private int code;
    private String msg;

    public SimpleResult(){

    }

    public SimpleResult(int code, String msg){
        this.code = code;
        this.msg = msg;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
