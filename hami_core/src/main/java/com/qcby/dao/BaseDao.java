package com.qcby.dao;

import com.qcby.model.Album;

import java.util.List;

public interface BaseDao<Q, T> {

    int deleteByPrimaryKey(Integer aid);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    List<T> selectPage(Q mq);

    Integer selectCount(Q mq);
}
