package com.heiku.server.myserver.service;

import com.heiku.server.myserver.dao.RoomDao;
import com.heiku.server.myserver.entity.Classroom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */

@Service
public class RoomService {

    @Autowired
    private RoomDao roomDao;

    public void addRoom(String name, int number, int type, int status){
        int n = roomDao.addRoom(name, number, type, status);
    }


    public List<Classroom> queryRoomByType(int type){
        return roomDao.selectByType(type);
    }
}
