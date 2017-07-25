package com.zhidi.system.action;

import com.zhidi.base.action.BaseAction;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.UserService;
import com.zhidi.util.ResultData;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * Created by lx on 2017/7/24.
 */
@ParentPackage("struts-default")
@Namespace("/user")
public class UserAction extends BaseAction {

    @Resource
    private UserService userService;
    private User user;

    @Action("login")
    public void list() throws IOException {
        //如果user对象为空
        if (user == null) {
            resultData = ResultData.buildFailureResult("用户名或密码为空！");
            printJSONObject(resultData);
            return;
        }
        if (StringUtils.isEmpty(user.getUsername())) {
            resultData = ResultData.buildFailureResult("用户名为空!");
            printJSONObject(resultData);
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            resultData = ResultData.buildFailureResult("密码为空！");
            printJSONObject(resultData);
            return;
        }


        User user = userService.login(this.user.getUsername());
        if (user == null)
            resultData = ResultData.buildFailureResult("用户不存在！");
        else {
            if (!user.getPassword().equals(this.user.getPassword()))
                resultData.buildFailureResult("密码错误！");
            else {
                getSession().setAttribute("user",user);
                resultData.buildSuccessResult("请求成功!");
            }
        }
        printJSONObject(resultData);
    }

    @Action(value = "index", results = {
            @Result(location = "list.jsp")
    })
    public String listByPage() {
        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
