package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.entity.OrderClassRoom;
import com.heiku.server.myserver.service.OrderService;
import com.heiku.server.myserver.vo.Result;
import com.heiku.server.myserver.vo.SimpleResult;
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
@RequestMapping("/roomorder")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/create")
    @ResponseBody
    public SimpleResult createOrder(@RequestParam("roomName") String roomName, @RequestParam("useFor") String useFor,
                                    @RequestParam("classTime") int classTime, @RequestParam("type") int type,
                                    @RequestParam("studentId") String studentId){
        int result = orderService.addOrderInfo(roomName, useFor, classTime, type, studentId);
        if (result > 0){
            return new SimpleResult(200, "预约成功");
        }else if (result == -2){
            return new SimpleResult(101, "该时段教室以被预约");
        }else {
            return new SimpleResult(100, "预约失败");
        }
    }


    @RequestMapping("/query")
    @ResponseBody
    public List<OrderClassRoom> queryOrder(@RequestParam("userId") String userId, @RequestParam("userType") int userType){
        return orderService.queryOrder(userId, userType);
    }


    @RequestMapping("/check")
    @ResponseBody
    public SimpleResult checkOrder(@RequestParam("userId") String userId, @RequestParam("userType") int userType,
                                   @RequestParam("roomName") String roomName, @RequestParam("classTime") int classTime,
                                   @RequestParam("pass") int pass){
        int result = orderService.checkOrderRoom(userId, userType, roomName, classTime, pass);
        if (result >= 0){
            return new SimpleResult(201, "审批成功");
        }else {
            return new SimpleResult(102, "审批失败");
        }
    }
}
