package com.heiku.server.myserver.vo;

import lombok.Data;

/**
 * @Author: Heiku
 * @Date: 2019/3/9
 */
@Data
public class ClassRoomUseChart {

    private X xObj;
    private Y yObj;

    public ClassRoomUseChart(X xObj, Y yObj){
        this.xObj = xObj;
        this.yObj = yObj;
    }

}
