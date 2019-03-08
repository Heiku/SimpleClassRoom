package com.heiku.server.myserver.service;

import com.heiku.server.myserver.dao.UserDao;
import com.heiku.server.myserver.entity.User;
import com.heiku.server.myserver.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Heiku
 * @Date: 2019/3/6
 */

@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    /**
     * 获取user对象
     *
     * @param userId
     * @return
     */
    public User getUserById(String userId){
        User user = userDao.getUserById(userId);

        return user;
    }


    /**
     * 登录
     *
     * @param userId
     * @param password
     * @return
     */
    public Object login(String userId, String password){
        if (StringUtils.isBlank(userId) || StringUtils.isBlank(password)){
            return null;
        }
        User user = userDao.getUserById(userId);
        if (user == null){
            return null;
        }

        String dbPsd = user.getPassword();
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);
        if (!checkPsd.equals(dbPsd)){
            return null;
        }

        // 到这登陆成功，返回对应的user信息
        int type = user.getType();
        if (type == 1){
            return userDao.getStudentById(userId);
        }else if (type == 2){
            return userDao.getTeacherById(userId);
        }else {
            return userDao.getAdminById(userId);
        }
    }


    /**
     * 添加用户信息
     */
    public void register(String userId, String password, int type){
        String checkPsd = MD5Util.fromPassToDBPass(password, MD5Util.SALT);

        int i = userDao.insertUser(userId, checkPsd, type);
    }


}
