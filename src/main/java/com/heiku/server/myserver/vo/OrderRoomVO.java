package com.heiku.server.myserver.vo;

import com.heiku.server.myserver.entity.Admin;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.entity.Teacher;
import lombok.Data;

import java.util.Date;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */
@Data
public class OrderRoomVO {

    private Integer id;

    /**
     * 教室名
     */
    private String roomName;

    /**
     * 用途
     */
    private String useFor;

    /**
     * 课节
     */
    private Integer classTime;

    /**
     * 教室类型
     */
    private Integer type;

    /**
     * 申请人id
     */
    private String studentId;

    /**
     * 辅导员id
     */
    private String teacherId;

    /**
     * 教保id
     */
    private String adminId;

    /**
     * 状态
     */
    private Integer status;

    private Date createTime;

    private Date modifyTime;


    private Student student;

    private Teacher teacher;

    private Admin admin;
}
