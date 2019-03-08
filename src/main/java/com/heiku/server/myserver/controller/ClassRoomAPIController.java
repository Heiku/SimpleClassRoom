package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.service.RoomService;
import com.heiku.server.myserver.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */

@RequestMapping(value = "api/classroom")
@RestController
public class ClassRoomAPIController {

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/", method = GET)
    public ResultVO pageRoom(@RequestParam(required = false, defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "10") int limit,
                             @RequestParam(required = false, defaultValue = "false") boolean all) {
        return roomService.listRoom(page, limit, all);
    }
}
