package com.zhidi.system.service.impl;

import com.zhidi.base.service.impl.BaseServiceImpl;
import com.zhidi.system.dao.UserDao;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/7/24.
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User, String> implements UserService {
    @Resource
    private UserDao userDao;
    @Resource
    public void setBaseDao(UserDao userDao) {
        super.setBaseDao(userDao);
    }

    @Override
    public User login(String username) {
        return userDao.login(username);
    }
}
