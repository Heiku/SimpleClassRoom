package com.heiku.server.myserver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */

@Controller
public class HelloController {

    @RequestMapping(value = "/try")
    public String hello(ModelMap modelMap){
        return "try";
    }
}
