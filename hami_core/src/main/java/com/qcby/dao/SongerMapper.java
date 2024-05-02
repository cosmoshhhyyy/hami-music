package com.qcby.dao;

import com.qcby.model.Songer;
import com.qcby.query.SongerQuery;

import java.util.List;

public interface SongerMapper extends BaseDao<SongerQuery, Songer>{

    List<Songer> selectAll();

    Songer getSongerSong(Integer srid);
}