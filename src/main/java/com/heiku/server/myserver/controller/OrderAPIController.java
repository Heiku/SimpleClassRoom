package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.service.OrderService;
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
@RequestMapping(value = "api/order")
@RestController
public class OrderAPIController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/", method = GET)
    public ResultVO pageUser(@RequestParam(required = false, defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "10") int limit,
                             @RequestParam(required = false, defaultValue = "false") boolean all) {
        return orderService.listOrder(page, limit, all);
    }
}
