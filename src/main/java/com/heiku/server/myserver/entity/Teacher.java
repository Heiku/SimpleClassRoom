package com.heiku.server.myserver.entity;

import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */
@Data
public class Teacher {

    /**
     * 教师工号
     */
    private String teacherId;

    /**
     * 教师姓名
     */
    private String name;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 院系
     */
    private String faculty;
}
