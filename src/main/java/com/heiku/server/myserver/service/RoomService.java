package com.heiku.server.myserver.service;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.dao.RoomDao;
import com.heiku.server.myserver.entity.Classroom;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.vo.ResultVO;
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


    /**
     *
     * @param page
     * @param limit
     * @param all
     * @param type
     * @return
     */
    public ResultVO listRoom(int page, int limit, boolean all, int type) {
        if (type == -1){
            return ResultVOUtil.ok(roomDao.selectAllRoom(), ResultEnum.SUCCESS);
        }

        List<Classroom> classroomList = roomDao.selectByType(type);

        return ResultVOUtil.ok(classroomList, 10,  ResultEnum.SUCCESS);
    }


    /**
     *
     * @param id
     * @return
     */
    public ResultVO findRoomById(String id) {
        Classroom classroom = roomDao.selectByRoomId(id);
        if (classroom == null){
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
        return ResultVOUtil.ok(classroom, ResultEnum.SUCCESS);
    }


    /**
     *
     * @param classroom
     * @return
     */
    public ResultVO addRoom(Classroom classroom){
        String name = classroom.getName();
        int number = classroom.getNumber();
        int type = classroom.getType();
        int status = 0;

        try {
            Classroom r1 = roomDao.selectByRoomName(name);
            if (r1 != null){
                ResultVOUtil.error(ResultEnum.ROOM_SAME);
            }

            roomDao.addRoom(name, number, type, status);

            Classroom room = roomDao.selectByRoomName(name);

            return ResultVOUtil.ok(room, ResultEnum.SUCCESS);
        }catch (Exception e){
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }


    public void deleteRoom(String id) {
        roomDao.deleteRoom(id);
    }
}
