package com.heiku.server.myserver.vo;

import com.heiku.server.myserver.entity.Teacher;
import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */
@Data
public class StudentVO {

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


    private Teacher teacher;
}
