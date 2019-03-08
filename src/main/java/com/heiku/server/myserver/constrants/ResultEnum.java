package com.heiku.server.myserver.constrants;

import lombok.Getter;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */

@Getter
public enum  ResultEnum {
    SUCCESS(0, "成功"),
    ERROR(1, "失败");


    private Integer code;
    private String message;

    ResultEnum(Integer code, String msg){
        this.code = code;
        this.message = msg;
    }
}
