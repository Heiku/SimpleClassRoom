package com.heiku.server.myserver.vo;

public enum  CodeMsg {

    SUCCESS(0, "Success"),
    SERVER_ERROR(500100, "服务端异常"),
    BIND_ERROR(500101, "参数校验异常"),
    REQUEST_ILLEGAL(500102, "请求非法"),
    ACCESS_FREQUENT(500103, "访问次数限制"),

    // LOGIN
    SESSION_ERROR(500210, "Session不存在或已经失效"),
    PASSWORD_EMPTY(500211, "登录密码不能为空"),
    MOBILE_EMPTY(500212, "手机号不能为空"),
    MOBILE_ERROR(500213, "手机格式错误"),
    MOBILE_NOT_EXIST(500214, "手机号不存在"),
    PASSWORD_ERROR(500215, "密码错误"),


    // SECKILL
    SECKILL_OVER(500500, "商品已经被秒杀完了"),
    SECKILL_REPEATE(500501, "不允许重复参与秒杀活动"),
    SECKILL_FAIL(500502, "秒杀失败"),


    // ORDER
    ORDER_NOT_EXIST(500400, "订单不存在");

    private int code;
    private String msg;


    CodeMsg(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }


    public CodeMsg fillArgs(Object... args){
        // code 不变
        int code = this.code;

        String message = String.format(this.msg, args);

        return null;
    }



    @Override
    public String toString() {
        return "CodeMsg [code= " + code + ", msg= " + msg + "]";
    }
}
