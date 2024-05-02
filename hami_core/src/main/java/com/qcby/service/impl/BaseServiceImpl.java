package com.qcby.service.impl;

import com.qcby.dao.BaseDao;
import com.qcby.service.BaseService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Method;
import java.util.List;

public class BaseServiceImpl<Q, T> implements BaseService<Q, T>{


    /*@Autowired
    private BaseDao<T> baseDao;*/

    protected BaseDao<Q, T> baseDao;
    @Override
    public int deleteByPrimaryKey(Integer tid) {
        return baseDao.deleteByPrimaryKey(tid);
    }

    @Override
    public int insert(T record) {
        return baseDao.insert(record);
    }

    @Override
    public int insertSelective(T record) {
        return 0;
    }

    @Override
    public T selectByPrimaryKey(Integer tid) {
        return baseDao.selectByPrimaryKey(tid);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseDao.updateByPrimaryKey(record);
    }

    @Override
    public Page<T> selectByPage(Q mq) {

        // 1. 先准备一个要返回的承载数据的页对象
        // 获取调用的对象，反射
        Page<T> page = new Page<T>();
        Class<?> mqclass = mq.getClass();
        try {
            // 设置pageNo
            Method getPageNO = mqclass.getDeclaredMethod("getPageNo", null);
            Integer PageNO = (Integer) getPageNO.invoke(mq, null);

            Method getPageSize = mqclass.getDeclaredMethod("getPageSize", null);
            Integer PageSize = (Integer) getPageSize.invoke(mq, null);
            page.setPageNo(PageNO);
            page.setPageSize(PageSize);
            // 设置startnum
            Method setStartNum = mqclass.getDeclaredMethod("setStartNum", Integer.class);
            setStartNum.invoke(mq, (PageNO - 1) * PageSize);
            page.setStartNum((PageNO - 1) * PageSize);

            Integer totalCount = baseDao.selectCount(mq);
            page.setTotalCount(totalCount);

            List<T> list =  baseDao.selectPage(mq);
            page.setList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 设置pageSize

        // 设置totalpage
        // 查询数据库 mapper baseDao 查询满足条件的数据集合
        // startnum mq.tname

        // 查询数据库 满足条件的数据总量 page的totalCount设置上值

        return page;
    }
}
