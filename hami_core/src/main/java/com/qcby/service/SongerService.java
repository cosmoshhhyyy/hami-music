package com.qcby.service;

import com.qcby.model.Mtype;
import com.qcby.model.Songer;
import com.qcby.query.SongerQuery;

import java.util.List;

public interface SongerService extends BaseService<SongerQuery, Songer> {

    List<Songer> selectAll();

    Songer getSongerSong(Integer srid);
}
