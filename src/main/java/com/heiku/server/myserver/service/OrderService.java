package com.heiku.server.myserver.service;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.dao.RoomOrderDao;
import com.heiku.server.myserver.dao.UserDao;
import com.heiku.server.myserver.entity.*;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.ClassTime;
import com.heiku.server.myserver.vo.OrderRoomVO;
import com.heiku.server.myserver.vo.ResultVO;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @Author: Heiku
 * @Date: 2019/3/7
 */

@Service
public class OrderService {

    @Autowired
    private RoomOrderDao roomOrderDao;

    @Autowired
    private UserDao userDao;


    public int addOrderInfo(String roomName, String useFor, int classTime, int type, String studentId){
        RoomOrder roomOrder = roomOrderDao.queryOrder(roomName, classTime);
        if (roomOrder != null){
            return -2;
        }

        Student student = userDao.getStudentById(studentId);
        if (student == null){
            return -1;
        }
        String teacherId = student.getTeacherId();
        //String adminId = "13001001";

        List<Admin> adminList = userDao.quertAllAdmin();
        Random random = new Random();
        int n = random.nextInt(adminList.size());

        String adminId = adminList.get(n).getAdminId();

        int status = 0;
        Date createTime = new Date();
        Date modifyTime = new Date();


        int result =  roomOrderDao.insertOrderInfo(roomName, useFor, classTime, type, studentId, teacherId, adminId, status, createTime, modifyTime);

        // 更新教室状态
        if (result > 0){
            roomOrderDao.updateRoom(roomName, 1);
        }

        return result;
    }


    public List<OrderClassRoom> queryOrder(String userId, int type){
        List<OrderClassRoom> list = new ArrayList<>();
        if (type == 1){
            List<RoomOrder> stuOrderList = roomOrderDao.queryOrderForStudent(userId);
            list = getOrderRoomList(list, stuOrderList);
        }else if (type == 2){
            List<RoomOrder> teaOrderList = roomOrderDao.queryOrderForTeacher(userId);
            list = getOrderRoomList(list, teaOrderList);
        }else if (type == 3){
            List<RoomOrder> admOrderList = roomOrderDao.queryOrderForAdmin(userId);
            list = getOrderRoomList(list, admOrderList);
        }

        return list;
    }


    public int checkOrderRoom(String userId, int userType, String roomName, int classTime, int pass){
        if (userId.isEmpty() || userType <= 0 || roomName.isEmpty()){
            return -1;
        }
        int role = 0;
        if (userType == 2){
            role = 1;
        }else if (userType == 3){
            role = 2;
        }
        int i = 0;
        if (pass == 1){
            i = roomOrderDao.checkRoomOrder(userId, role, roomName, classTime);

            // 教保审批成功
            if (role == 2){
                roomOrderDao.updateRoom(roomName, 2);
            }
        }else {
            i = roomOrderDao.checkRoomOrderFail(userId, role, roomName, classTime);

            if (role == 2){
                roomOrderDao.updateRoom(roomName, 0);
            }
        }

        if (i <= 0)
            return -1;

        return 1;
    }


    public List<OrderClassRoom> getOrderRoomList(List<OrderClassRoom> returnList, List<RoomOrder> dataList){
        if (!dataList.isEmpty()){
            for (RoomOrder roomOrder : dataList){
                OrderClassRoom orderClassRoom = new OrderClassRoom();
                BeanUtils.copyProperties(roomOrder, orderClassRoom);

                String studentId = roomOrder.getStudentId();
                Student student = userDao.getStudentById(studentId);

                orderClassRoom.setStudent(student);
                returnList.add(orderClassRoom);
            }
        }
        return returnList;
    }









    public ResultVO listOrder(int page, int limit, boolean all) {
        List<RoomOrder> roomOrderList = roomOrderDao.listOrders();
        List<OrderRoomVO> voList = new ArrayList<>();
        if (!roomOrderList.isEmpty()){
            for (RoomOrder order : roomOrderList) {
                OrderRoomVO vo = transToOrderVO(order);
                voList.add(vo);
            }


            for (OrderRoomVO vo : voList){
                System.out.println(vo.getId());
            }
        }
        return ResultVOUtil.ok(voList, 10, ResultEnum.SUCCESS);
    }

    private OrderRoomVO transToOrderVO(RoomOrder order) {
        OrderRoomVO vo = new OrderRoomVO();
        BeanUtils.copyProperties(order, vo);

        vo.setTimeStr(ClassTime.getTimeById(order.getClassTime()));

        String studentId = order.getStudentId();
        String teacherId = order.getTeacherId();
        String adminId = order.getAdminId();

        Student student = userDao.getStudentById(studentId);
        Teacher teacher = userDao.getTeacherById(teacherId);
        Admin admin = userDao.getAdminById(adminId);

        vo.setStudent(student);
        vo.setTeacher(teacher);
        vo.setAdmin(admin);

        return vo;
    }


    public ResultVO findOrderById(String id) {
        RoomOrder roomOrder = roomOrderDao.queryOrderById(id);
        OrderRoomVO vo = transToOrderVO(roomOrder);

        if (roomOrder == null){
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
        return ResultVOUtil.ok(vo, ResultEnum.SUCCESS);
    }




}
