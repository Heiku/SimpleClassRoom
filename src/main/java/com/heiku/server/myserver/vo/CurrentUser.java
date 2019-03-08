package com.heiku.server.myserver.vo;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @description:
 * @create: 2018-12-22 15:01
 **/
@Data
@ToString
public class CurrentUser implements Serializable {

    private Integer id;

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 姓名
     */
    private String name;


    public CurrentUser(Integer id, String account, String password, String name, String phone, String email) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.name = name;

    }

    public CurrentUser() {
    }
}
