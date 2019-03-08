package com.heiku.server.myserver.dao;

import com.heiku.server.myserver.entity.RoomOrder;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */
@Mapper
public interface RoomOrderDao {

    @Insert("insert into room_order (room_name, use_for, class_time, type, student_id, teacher_id, admin_id, status, create_time, modify_time) " +
            "values (#{roomName}, #{useFor}, #{classTime}, #{type}, #{studentId}, #{teacherId}, #{adminId}, #{status}, #{createTime}, #{modifyTime})")
    int insertOrderInfo(@Param("roomName") String roomName, @Param("useFor") String useFor, @Param("classTime") int classTime,
                        @Param("type") int type, @Param("studentId") String studentId, @Param("teacherId") String teacherId,
                        @Param("adminId") String adminId, @Param("status") int status, @Param("createTime")Date createTIme,
                        @Param("modifyTime") Date modifyTime);


    @Select("select * from room_order where room_name = #{roomName} and class_time = #{classTime}")
    RoomOrder queryOrder(String roomName, int classTime);



    @Select("select * from room_order where student_id = #{studentId}")
    List<RoomOrder> queryOrderForStudent(@Param("studentId") String studentId);

    @Select("select * from room_order where teacher_id = #{teacherId} and status = 0")
    List<RoomOrder> queryOrderForTeacher(@Param("teacherId") String teacherId);

    @Select("select * from room_order where admin_id = #{adminId} and status = 1")
    List<RoomOrder> queryOrderForAdmin(@Param("adminId") String adminId);


    @Update("update classroom set status = #{status} where name = #{roomName}")
    int updateRoom(@Param("roomName") String roomName, @Param("status") int status);


    @Update("update room_order set status = #{role} where room_name = #{roomName} and class_time = #{classTime}")
    int checkRoomOrder(String userId, int role, String roomName, int classTime);

    @Update("update room_order set status = 3 where room_name = #{roomName} and class_time = #{classTime}")
    int checkRoomOrderFail(String userId, int role, String roomName, int classTime);
}
