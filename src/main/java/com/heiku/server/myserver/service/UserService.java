package com.heiku.server.myserver.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.dao.UserDao;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.entity.Teacher;
import com.heiku.server.myserver.entity.User;
import com.heiku.server.myserver.util.MD5Util;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.Result;
import com.heiku.server.myserver.vo.ResultVO;
import com.heiku.server.myserver.vo.StudentVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    /**
     * 获取user对象
     *
     * @param userId
     * @return
     */
    public User getUserById(String userId){
        User user = userDao.getUserById(userId);

        return user;
    }


    /**
     * 登录
     *
     * @param userId
     * @param password
     * @return
     */
    public Object login(String userId, String password){
        if (StringUtils.isBlank(userId) || StringUtils.isBlank(password)){
            return null;
        }
        User user = userDao.getUserById(userId);
        if (user == null){
            return null;
        }

        String dbPsd = user.getPassword();
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);
        if (!checkPsd.equals(dbPsd)){
            return null;
        }

        // 到这登陆成功，返回对应的user信息
        int type = user.getType();
        if (type == 1){
            return userDao.getStudentById(userId);
        }else if (type == 2){
            return userDao.getTeacherById(userId);
        }else {
            return userDao.getAdminById(userId);
        }
    }


    /**
     * 添加用户信息
     */
    public void register(String userId, String password, int type){
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);

        int i = userDao.insertUser(userId, checkPsd, type);
    }



    public ResultVO listUser(int page, int limit, boolean all) {
        if (all){
            return ResultVOUtil.ok(userDao.queryAllStudent(), ResultEnum.SUCCESS);
        }
        PageHelper.startPage(page, limit);
        List<Student> studentList = userDao.queryAllStudent();

        List<StudentVO> voList = new ArrayList<>();
        if (!studentList.isEmpty()){
            for (Student student : studentList){
                StudentVO vo = transToStudentVO(student);
                voList.add(vo);
            }
        }
        return ResultVOUtil.ok(voList, 5, ResultEnum.SUCCESS);
    }


    public ResultVO findUserById(String id) {
        Student student = userDao.getStudentById(id);
        StudentVO vo = transToStudentVO(student);

        if (student == null){
            return ResultVOUtil.error(ResultEnum.USER_QUERY_NO_EXITS);
        }
        return ResultVOUtil.ok(vo, ResultEnum.SUCCESS);
    }

    public ResultVO addStudent(Student student) {
        String studentId = student.getStudentId();
        String name = student.getName();
        int gender = student.getGender();
        String faculty = student.getFaculty();
        String subject = student.getSubject();
        String teacherId = student.getTeacherId();

        StudentVO vo = transToStudentVO(student);
        try {
            userDao.insertStudent(studentId, name, gender, faculty, subject, teacherId);

            // 为新增的学生添加默认的账号
            register(studentId, "sise", 1);

            return ResultVOUtil.ok(vo, ResultEnum.SUCCESS);
        }catch (Exception e){
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    public ResultVO updateStudent(Student student) {
        try {
            String studentId = student.getStudentId();

            String name = student.getName();
            int gender = student.getGender();
            String faculty = student.getFaculty();
            String subject = student.getSubject();
            String teacherId = student.getTeacherId();

            userDao.updateStudent(studentId, name, gender, faculty, subject, teacherId);
            Student stu = userDao.getStudentById(studentId);
            StudentVO vo = transToStudentVO(stu);

            return ResultVOUtil.ok(vo, ResultEnum.SUCCESS);
        }catch (Exception e){
            return ResultVOUtil.error(ResultEnum.ERROR);
        }

    }


    public ResultVO getAllTeacher() {
        List<Teacher> teacherList = userDao.queryAllTeacher();
        return ResultVOUtil.ok(teacherList, ResultEnum.SUCCESS);
    }


    /**
     * student中的 teacher_id -> teacher entity
     *
     * @param student
     * @return
     */
    public StudentVO transToStudentVO(Student student){
        StudentVO vo = new StudentVO();
        BeanUtils.copyProperties(student, vo);

        String teacherId = student.getTeacherId();
        Teacher teacher = userDao.getTeacherById(teacherId);

        vo.setTeacher(teacher);

        return vo;
    }


    /**
     *
     * @param id
     */
    public void deleteStudent(String id) {
        userDao.removeStudent(id);
    }
}
