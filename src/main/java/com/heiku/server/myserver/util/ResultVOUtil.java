package com.heiku.server.myserver.util;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.vo.ResultVO;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */
public class ResultVOUtil {

    public static ResultVO ok() {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setData(null);
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMsg(ResultEnum.SUCCESS.getMessage());
        return resultVO;
    }
    /**
     * 将数据封装成一个成功的resultVO返回
     *
     * @param object
     * @return
     */
    public static ResultVO ok(Object object) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setData(object);
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMsg(ResultEnum.SUCCESS.getMessage());
        return resultVO;
    }

    public static ResultVO ok(Object object, Long count) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setCount(count);
        resultVO.setData(object);
        resultVO.setCode(0);
        resultVO.setMsg("成功");
        return resultVO;
    }

    public static ResultVO ok(Object object, Integer code, String msg) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setData(object);
        resultVO.setCode(code);
        resultVO.setMsg(msg);
        return resultVO;
    }

    public static ResultVO error(Object object) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(false);
        resultVO.setData(object);
        resultVO.setCode(ResultEnum.ERROR.getCode());
        resultVO.setMsg(ResultEnum.ERROR.getMessage());
        return resultVO;
    }

    public static ResultVO error(ResultEnum resultEnum) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setCode(resultEnum.getCode());
        resultVO.setMsg(resultEnum.getMessage());
        return resultVO;
    }

    public static ResultVO ok(Object object, ResultEnum resultEnum) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setData(object);
        resultVO.setCode(resultEnum.getCode());
        resultVO.setMsg(resultEnum.getMessage());
        return resultVO;
    }

    public static ResultVO ok(Integer code, String msg) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setData(null);
        resultVO.setMsg(msg);
        resultVO.setCode(code);
        return resultVO;
    }

    public static ResultVO ok(Object object, Long count, ResultEnum resultEnum) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setCount(count);
        resultVO.setData(object);
        resultVO.setCode(resultEnum.getCode());
        resultVO.setMsg(resultEnum.getMessage());
        return resultVO;
    }

    public static ResultVO ok(Object object, long count, ResultEnum resultEnum) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(true);
        resultVO.setCount(count);
        resultVO.setData(object);
        resultVO.setCode(resultEnum.getCode());
        resultVO.setMsg(resultEnum.getMessage());
        return resultVO;
    }

    public static ResultVO error(Integer code, String msg) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(false);
        resultVO.setMsg(msg);
        resultVO.setCode(code);
        return resultVO;
    }

    public static ResultVO error(Object object, Integer code, String msg) {
        ResultVO resultVO = new ResultVO();
        resultVO.setSuccess(false);
        resultVO.setData(object);
        resultVO.setMsg(msg);
        resultVO.setCode(code);
        return resultVO;
    }
}
