package com.heiku.server.myserver.service;

import com.heiku.server.myserver.dao.RoomDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class RoomServiceTest {

    @Autowired
    private RoomDao roomDao;

    @Test
    public void addRoom() {
        String name = "U308";
        int number = 75;
        int type = 0;
        int status = 0;

        roomDao.addRoom(name, number, type, status);
        roomDao.addRoom("L101", 200, 2, 0);
        roomDao.addRoom("L102", 250, 2, 0);
        roomDao.addRoom("S306", 60, 1, 0);
        roomDao.addRoom("S307", 60, 1, 0);
    }
}