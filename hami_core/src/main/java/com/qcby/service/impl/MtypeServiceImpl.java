package com.qcby.service.impl;

import com.qcby.dao.AlbumMapper;
import com.qcby.dao.MtypeMapper;
import com.qcby.model.Mtype;
import com.qcby.model.Songer;
import com.qcby.query.MtypeQuery;
import com.qcby.service.MtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 流派业务层
 */
@Service
public class MtypeServiceImpl extends BaseServiceImpl<MtypeQuery, Mtype> implements MtypeService{

    private MtypeMapper mtypeMapper;


    @Autowired
    public void setMtypeMapper(MtypeMapper mtypeMapper) {
        this.mtypeMapper = mtypeMapper;
        this.baseDao = mtypeMapper;
    }

    @Override
    public List<Mtype> selectAll() {
        return mtypeMapper.selectAll();
    }
}
