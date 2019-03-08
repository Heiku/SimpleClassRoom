package com.heiku.server.myserver.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */

@Data
public class ResultVO<T> implements Serializable {

    private static final long serialVersionUID = -2588765608385866461L;

    private boolean success;

    private Integer code;

    private String msg;

    private Long count;

    private T data;

}
