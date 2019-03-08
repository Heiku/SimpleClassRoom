package com.heiku.server.myserver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */
@RequestMapping(value = "admin")
@Controller
public class HelloController {

    @RequestMapping("login")
    public String toLogin(){
        return "/admin/login";
    }

    @RequestMapping(value = "/index")
    public String hello(){
        return "/admin/main/main";
    }

    @RequestMapping(value = "user/{path}")
    public String toUser(@PathVariable String path) {
        return "/admin/user/" + path;
    }

    @RequestMapping(value = "home")
    public String home() {
        return "/admin/home";
    }
}
