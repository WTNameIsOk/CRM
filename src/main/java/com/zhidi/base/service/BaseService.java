package com.zhidi.base.service;

import com.zhidi.util.Pager;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by DELL on 2017/7/13.
 */
public interface BaseService<T, PK extends Serializable> {

    public T get(PK id);

    public List<T> getAll();

    public void delete(PK id);

    public void save(T entity);

    public void update(T entity);

    public Pager getListByPager(Pager pager, DetachedCriteria detachedCriteria);

}
