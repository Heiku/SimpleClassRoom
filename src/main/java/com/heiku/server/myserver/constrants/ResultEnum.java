package com.heiku.server.myserver.constrants;

import lombok.Getter;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */

@Getter
public enum  ResultEnum {
    SUCCESS(0, "成功"),
    ERROR(1, "失败"),


    USER_QUERY_NO_EXITS(10001, "查找不到该用户"),
    USER_LOGIN_PASSWD_FAIL(10010, "密码错误"),
    USER_LOGIN_SUCCESS(10009, "登陆成功"),
    ROOM_SAME(10011, "已存在相同的教室"),
    ;


    private Integer code;
    private String message;

    ResultEnum(Integer code, String msg){
        this.code = code;
        this.message = msg;
    }
}
