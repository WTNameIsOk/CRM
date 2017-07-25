package com.zhidi.system.service;

import com.zhidi.base.service.BaseService;
import com.zhidi.system.entity.User;

/**
 * Created by Administrator on 2017/7/24.
 */
public interface UserService extends BaseService<User, String> {
    User login(String username);
}
