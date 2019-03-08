package com.heiku.server.myserver.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Data
public class RoomDetail {

    private Integer id;

    /**
     * 教室id
     */
    private Integer roomId;

    /**
     * 教室名
     */
    private String roomName;

    /**
     * 操作人id
     */
    private String userId;

    /**
     * 操作人姓名
     */
    private String userName;

    /**
     * 操作类型
     */
    private Integer type;

    /**
     * 创建时间
     */
    private Date createTime;
}
