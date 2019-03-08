package com.heiku.server.myserver.entity;

import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Data
public class Student {

    /**
     * 学生号
     */
    private String studentId;

    /**
     * 姓名
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

    /**
     * 专业方向
     */
    private String subject;

    /**
     * 辅导员id
     */
    private String teacherId;
}
