package com.heiku.server.myserver.service;

import com.heiku.server.myserver.dao.RoomOrderDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderServiceTest {

    @Autowired
    private RoomOrderDao roomOrderDao;

    @Test
    public void addOrderInfo() {
        String roomName = "A101";
        String useFor = "用于信工一班开展周期班会";
        int classTime = 6;
        int type = 3;
        String studentId = "1540128100";
        String teacherId = "12001001";
        String adminId = "13001001";
        int status = 0;
        Date createTime = new Date();
        Date modifyTime = new Date();

       roomOrderDao.insertOrderInfo(roomName, useFor, classTime, type, studentId, teacherId, adminId, status, createTime, modifyTime);
    }
}