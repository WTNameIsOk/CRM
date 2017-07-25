package com.zhidi.system.dao.impl;

import com.zhidi.base.dao.impl.BaseDaoImpl;
import com.zhidi.system.dao.UserDao;
import com.zhidi.system.entity.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/24.
 */
@Repository
public class UserDaoImpl extends BaseDaoImpl<User,String> implements UserDao {
    @Override
    public User login(String username) {
        Query query = getSession().createQuery("from User where username=:username");
        query.setParameter("username", username);
        return (User) query.uniqueResult();
    }
}
