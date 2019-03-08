package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.entity.Classroom;
import com.heiku.server.myserver.entity.Student;
import com.heiku.server.myserver.service.RoomService;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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


    // type 可以是 0，1，2，3   -1 代表全部
    @RequestMapping(value = "/", method = GET)
    public ResultVO pageRoom(@RequestParam(required = false, defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "10") int limit,
                             @RequestParam(required = false, defaultValue = "false") boolean all,
                             @RequestParam(required = false, defaultValue = "-1")int type) {
        return roomService.listRoom(page, limit, all, type);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public ResultVO roomDetail(@PathVariable String id){
        return roomService.findRoomById(id);
    }


    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResultVO userCreate(Classroom classroom) {
        return roomService.addRoom(classroom);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public ResultVO userDelete(@PathVariable String id) {
        try {
            roomService.deleteRoom(id);
            return ResultVOUtil.ok(ResultEnum.SUCCESS);
        } catch (Exception e) {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


}
