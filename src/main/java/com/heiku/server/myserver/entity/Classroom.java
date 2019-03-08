package com.heiku.server.myserver.entity;

import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */
@Data
public class Classroom {

    private Integer id;

    /**
     * 教师名 A101
     */
    private String name;

    /**
     * 容纳人数
     */
    private Integer number;

    /**
     * 类型
     */
    private Integer type;

    /**
     * 状态
     */
    private Integer status;


    /*public Classroom(){

    }

    public Classroom(int id, String name,)*/
}
