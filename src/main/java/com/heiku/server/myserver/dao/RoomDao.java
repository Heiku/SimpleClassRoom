package com.heiku.server.myserver.dao;

import com.heiku.server.myserver.entity.Classroom;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */

@Mapper
public interface RoomDao {

    @Insert("insert into classroom (name, number, type, status) values (#{name}, #{number}, #{type}, #{status})")
    int addRoom(@Param("name") String name, @Param("number") int number, @Param("type") int type, @Param("status") int status);


    @Select("select * from classroom where type = #{type} and status = 0")
    List<Classroom> selectByType(@Param("type") int type);


    @Update("update * from classroom set status = 0 where status = 2")
    void updateRoomStatus();

    @Select("select * from classroom")
    List<Classroom> selectAllRoom();


    @Select("select * from classroom where id = #{id}")
    Classroom selectByRoomId(String id);


    @Select("select * from classroom where name = #{name}")
    Classroom selectByRoomName(String name);

    @Delete("delete from classroom where id = #{id}")
    int deleteRoom(String id);

    @Select("select count(*) from classroom where status = 0")
    int queryNoUse();

    @Select("select count(*) from classroom where status = 2")
    int queryUse();

    @Select("select count(*) from classroom where status = 1")
    int queryProcess();
}
