package com.qcby.dao;

import com.qcby.model.Mtype;
import com.qcby.query.MtypeQuery;
import org.springframework.stereotype.Controller;

import java.util.List;


public interface MtypeMapper extends BaseDao<MtypeQuery, Mtype>{

    List<Mtype> selectAll();
}