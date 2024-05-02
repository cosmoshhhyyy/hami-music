package com.qcby.service;

import com.qcby.model.Album;
import com.qcby.model.Mtype;
import com.qcby.query.AlbumQuery;

import java.util.List;
import java.util.Map;

public interface AlbumService extends BaseService<AlbumQuery, Album>{


    List<Album> selectAlbumByName(Map<String, String> map);

    List<Album> selectAll();
}
