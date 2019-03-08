package com.heiku.server.myserver.entity;

import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Data
public class User {

    /**
     * 账号id
     */
    private Integer id;

    /**
     * 账号名：默认的是学号/工号
     */
    private String name;

    /**
     * 密码
     */
    private String password;

    /**
     * 用户类型
     */
    private Integer type;

}
