package com.heiku.server.myserver.dao;

import com.heiku.server.myserver.entity.Classroom;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
}
