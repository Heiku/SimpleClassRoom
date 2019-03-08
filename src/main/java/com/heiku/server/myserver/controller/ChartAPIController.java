package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.dao.RoomDao;
import com.heiku.server.myserver.service.RoomService;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.ClassRoomUseChart;
import com.heiku.server.myserver.vo.ResultVO;
import com.heiku.server.myserver.vo.X;
import com.heiku.server.myserver.vo.Y;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */

@RequestMapping(value = "api/chart")
@RestController
public class ChartAPIController {

    @Autowired
    private RoomDao roomDao;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResultVO queryRoomChart(){

        int use = roomDao.queryUse();
        int process = roomDao.queryProcess();
        int nouse = roomDao.queryNoUse();


        List<String> xList = new ArrayList<>();
        xList.add("未使用");
        xList.add("审批中");
        xList.add("使用中");
        X x = new X();
        x.setXList(xList);


        List<Integer> yList = new ArrayList<>();
        yList.add(nouse);
        yList.add(process);
        yList.add(use);
        Y y = new Y();
        y.setYList(yList);

        ClassRoomUseChart chart = new ClassRoomUseChart(x, y);

        return ResultVOUtil.ok(chart, ResultEnum.SUCCESS);
    }



    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ResultVO queryAdminChart(){
        return null;
    }
}
