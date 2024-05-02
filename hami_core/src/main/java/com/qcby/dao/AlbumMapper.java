package com.qcby.dao;

import com.qcby.model.Album;
import com.qcby.model.Mtype;
import com.qcby.query.AlbumQuery;

import java.util.List;
import java.util.Map;

public interface AlbumMapper extends BaseDao<AlbumQuery, Album>{

    List<Album> selectAlbumByName(Map<String, String> map);

    List<Album> selectAll();
}