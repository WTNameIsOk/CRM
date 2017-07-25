package com.zhidi.base.service.impl;

import com.zhidi.base.dao.BaseDao;
import com.zhidi.base.service.BaseService;
import com.zhidi.util.Pager;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by DELL on 2017/7/13.
 */
public class BaseServiceImpl<T, PK extends Serializable> implements BaseService<T, PK> {

    private BaseDao<T, PK> baseDao;

    public void setBaseDao(BaseDao<T, PK> baseDao) {
        this.baseDao = baseDao;
    }

    @Override
    public T get(PK id) {
        return baseDao.get(id);
    }

    @Override
    public List<T> getAll() {
        return baseDao.getAll();
    }

    @Override
    public void delete(PK id) {
        baseDao.delete(id);
    }

    @Override
    public void save(T entity) {
        baseDao.save(entity);
    }

    @Override
    public void update(T entity) {
        baseDao.update(entity);
    }

    @Override
    public Pager getListByPager(Pager pager, DetachedCriteria detachedCriteria) {
        return baseDao.getListByPage(pager, detachedCriteria);
    }
}
