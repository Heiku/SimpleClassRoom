package com.heiku.server.myserver.dao;

import com.heiku.server.myserver.entity.Admin;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.entity.Teacher;
import com.heiku.server.myserver.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Mapper
public interface UserDao {

    @Insert("insert into user (name, password, type) values (#{userId}, #{psd}, #{type})")
    int insertUser(@Param("userId") String userId, @Param("psd") String psd, @Param("type") int type);


    @Select("select * from user where name = #{userId}")
    User getUserById(@Param("userId") String userId);



    @Select("select * from student where student_id = #{userId}")
    Student getStudentById(@Param("userId") String studentId);

    @Select("select * from teacher where teacher_id = #{userId}")
    Teacher getTeacherById(@Param("userId") String teacherId);

    @Select("select * from admin where admin_id = #{userId}")
    Admin getAdminById(@Param("userId") String adminId);

}
