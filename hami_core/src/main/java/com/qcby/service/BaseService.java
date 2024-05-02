package com.qcby.service;

import com.qcby.model.Mtype;
import com.qcby.util.Page;

public interface BaseService <Q, T>{
    int deleteByPrimaryKey(Integer tid);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    public Page<T> selectByPage(Q mq);
}
