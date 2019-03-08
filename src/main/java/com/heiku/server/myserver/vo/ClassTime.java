package com.heiku.server.myserver.vo;

import java.util.List;

/**
 * @author JiaHong Lin
 * @date 2019/3/5
 */
public enum  ClassTime {
    ONE(1, "9:00 - 10:20"),
    TWO(2, "10:40 - 12:00"),
    THREE(3, "13:50 - 15:10"),
    FOUR(4, "15:30 - 16:50"),
    FIVE(5, "17:00 - 18:20"),
    SIX(6, "19:00 - 20:20"),
    SEVEN(7, "20:30 - 21:50")
    ;

    public int id;
    public String time;

    ClassTime(int id, String time) {
        this.id = id;
        this.time = time;
    }


    public static int getIdByTime(String time){
        for (ClassTime classTime : ClassTime.values()){
            if (classTime.time.equals(time)){
                return classTime.id;
            }
        }

        return 0;
    }

    public static String getTimeById(int id){
        for (ClassTime classTime : ClassTime.values()){
            if (classTime.id == id){
                return classTime.time;
            }
        }

        return "";
    }

}
