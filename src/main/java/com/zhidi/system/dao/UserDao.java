package com.zhidi.system.dao;

import com.zhidi.base.dao.BaseDao;
import com.zhidi.system.entity.User;

/**
 * Created by Administrator on 2017/7/24.
 */
public interface UserDao extends BaseDao<User, String> {
    User login(String username);
}
