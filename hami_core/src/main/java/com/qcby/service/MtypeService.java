package com.qcby.service;

import com.qcby.dao.BaseDao;
import com.qcby.model.Album;
import com.qcby.model.Mtype;
import com.qcby.model.Songer;
import com.qcby.query.MtypeQuery;

import java.util.List;

public interface MtypeService extends BaseService<MtypeQuery, Mtype>{

    // 查询所有流派信息
    List<Mtype> selectAll();
}
