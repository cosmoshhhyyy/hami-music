package com.qcby.service.impl;


import com.qcby.dao.AlbumMapper;
import com.qcby.dao.SongerMapper;
import com.qcby.model.Songer;
import com.qcby.query.SongerQuery;
import com.qcby.service.SongerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongerServiceImpl extends BaseServiceImpl<SongerQuery, Songer> implements SongerService {

    private SongerMapper songerMapper;

    @Autowired
    public void setSongerMapper(SongerMapper songerMapper) {
        this.songerMapper = songerMapper;
        this.baseDao = songerMapper;
    }

    @Override
    public List<Songer> selectAll() {
        return songerMapper.selectAll();
    }

    @Override
    public Songer getSongerSong(Integer srid) {
        return songerMapper.getSongerSong(srid);
    }
}
