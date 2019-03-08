package com.heiku.server.myserver.controller;

import com.heiku.server.myserver.constrants.ResultEnum;
import com.heiku.server.myserver.entity.Admin;
import com.heiku.server.myserver.service.UserService;
import com.heiku.server.myserver.util.ResultVOUtil;
import com.heiku.server.myserver.util.SessionUtil;
import com.heiku.server.myserver.vo.CurrentUser;
import com.heiku.server.myserver.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: Heiku
 * @Date: 2019/3/8
 */

@RequestMapping("auth")
@Controller
public class AdminUserController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/homeDoLogin", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO homeDoLogin(@RequestParam(name = "account") String account, @RequestParam(name = "password") String password) {
        Object object = userService.login(account, password);
        if (object == null){
                return ResultVOUtil.ok(null, ResultEnum.USER_QUERY_NO_EXITS);
        }
        Admin admin = (Admin) object;

        CurrentUser currentUser = new CurrentUser();
        currentUser.setId(Integer.valueOf(admin.getAdminId()));
        currentUser.setAccount(admin.getAdminId());
        currentUser.setName(admin.getName());

        SessionUtil.getSession().setAttribute("user", currentUser);
        return ResultVOUtil.ok(null, ResultEnum.USER_LOGIN_SUCCESS);

    }
}
