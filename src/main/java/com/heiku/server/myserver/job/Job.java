package com.heiku.server.myserver.job;

import com.heiku.server.myserver.dao.RoomDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 *
 * 定时更新classroom的状态
 */
@Component
public class Job {

    @Autowired
    private RoomDao roomDao;


    /**
     * 每天23：00 进行
     */
    @Scheduled(cron = "0 0 23 * * ? ")
    public void updateClassRoomStatus(){
        roomDao.updateRoomStatus();
    }

}
