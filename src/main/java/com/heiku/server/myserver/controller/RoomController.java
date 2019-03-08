package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.entity.Classroom;
import com.heiku.server.myserver.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomService roomService;


    @RequestMapping("/query")
    @ResponseBody
    public List<Classroom> queryRoom(@RequestParam("type") int type){
        return roomService.queryRoomByType(type);
    }
}
