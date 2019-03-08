package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.service.UserService;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static org.springframework.web.bind.annotation.RequestMethod.*;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */
@RequestMapping(value = "api/user")
@RestController
public class UserAPIController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = GET)
    public ResultVO pageUser(@RequestParam(required = false, defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "10") int limit,
                             @RequestParam(required = false, defaultValue = "false") boolean all) {
        return userService.listUser(page, limit, all);
    }


    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public ResultVO userDetail(@PathVariable String id){
        return userService.findUserById(id);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResultVO userCreate(Student student) {
        return userService.addStudent(student);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.PUT)
    public ResultVO userUpdate(Student student) {
        return userService.updateStudent(student);
    }


    // 请求所有辅导员
    @RequestMapping(value = "/teacher" ,method = RequestMethod.GET)
    public ResultVO getAllTeacher(){
        return userService.getAllTeacher();
    }
}
