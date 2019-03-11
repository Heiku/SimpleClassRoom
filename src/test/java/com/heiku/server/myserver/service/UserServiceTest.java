package com.heiku.server.myserver.service;

import com.heiku.server.myserver.dao.UserDao;
import com.heiku.server.myserver.entity.User;
import com.heiku.server.myserver.util.MD5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void getUserById() {
        String userId = "1540128100";
        System.out.println(userDao.getUserById(userId));
    }

    @Test
    public void login() {
        String userId = "1540128100";
        String password = "sise";
        User user = userDao.getUserById(userId);

        String dbPsd = user.getPassword();
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);
        if (!checkPsd.equals(dbPsd)){
            System.out.println("密码不一致");
        }


        int type = user.getType();
        if (type == 1){
            System.out.println(userDao.getStudentById(userId));
        }else if (type == 2){
            System.out.println(userDao.getTeacherById(userId));
        }else {
            System.out.println(userDao.getAdminById(userId));
        }
    }

    @Test
    public void register() {
        /*String userId = "12001001";
        String password = "siset";
        int type = 2;
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);

        userDao.insertUser(userId, checkPsd, type);*/

        String userId = "13001002";
        String password = "sisea";
        int type = 2;
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);

        userDao.insertUser(userId, checkPsd, type);


        /*String userId = "12001002";
        String password = "siset";
        int type = 2;
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);

        userDao.insertUser(userId, checkPsd, type);*/
    }


}