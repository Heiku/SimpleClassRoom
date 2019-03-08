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


    @RequestMapping(value = "home")
    public String home() {
        return "/admin/home";
    }




    // user
    @RequestMapping(value = "user/{path}")
    public String toUser(@PathVariable String path) {
        return "/admin/user/" + path;
    }

    // classroom
    @RequestMapping(value = "classroom/{path}")
    public String toClassRoom(@PathVariable String path) {
        return "/admin/classroom/" + path;
    }

    // order
    @RequestMapping(value = "order/{path}")
    public String toOrder(@PathVariable String path) {
        return "/admin/order/" + path;
    }
}
