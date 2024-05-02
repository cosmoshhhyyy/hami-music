package com.qcby.service.impl;

import com.qcby.dao.AlbumMapper;
import com.qcby.model.Album;
import com.qcby.query.AlbumQuery;
import com.qcby.service.AlbumService;
import com.qcby.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AlbumServiceImpl extends BaseServiceImpl<AlbumQuery, Album> implements AlbumService{

    private AlbumMapper albumMapper;


    @Autowired
    public void setAlbumMapper(AlbumMapper albumMapper) {
        this.albumMapper = albumMapper;
        this.baseDao = albumMapper;
    }

    @Override
    public List<Album> selectAlbumByName(Map<String, String> map) {
        return albumMapper.selectAlbumByName(map);
    }

    @Override
    public List<Album> selectAll() {
        return albumMapper.selectAll();
    }
}
