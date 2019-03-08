package com.heiku.server.myserver.dao;

import com.heiku.server.myserver.entity.Admin;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.entity.Teacher;
import com.heiku.server.myserver.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

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


    @Select("select * from  student")
    List<Student> queryAllStudent();

    @Insert("insert into student(student_id, name, gender, faculty, subject, teacher_id) values (#{studentId}, #{name}," +
            "#{gender}, #{faculty}, #{subject}, #{teacherId})")
    int insertStudent(String studentId, String name, int gender, String faculty, String subject, String teacherId);

    @Update("update student set name = #{name} and gender = #{gender} and faculty = #{faculty} and subject = #{subject}" +
            "and teacher_id = #{teacherId} where student_id = #{studentId}")
    int updateStudent(String studentId, String name, int gender, String faculty, String subject, String teacherId);


    @Select("select * from teacher")
    List<Teacher> queryAllTeacher();

    @Delete("delete from student where student_id = #{id}")
    void removeStudent(String id);
}
