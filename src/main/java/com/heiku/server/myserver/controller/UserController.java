package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.service.UserService;
import com.heiku.server.myserver.vo.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */


@Controller
@RequestMapping("/user")
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);


    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    @ResponseBody
    public Object doLogin(@RequestParam("userId") String userId,
                                  @RequestParam("psd") String password){

        Object obj = userService.login(userId, password);
        if (obj != null)
            return obj;

        return new Object();
    }
}
