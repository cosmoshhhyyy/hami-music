package com.qcby.service;

import com.qcby.model.Song;
import com.qcby.query.SongQuery;

import java.util.List;

public interface SongService extends BaseService<SongQuery, Song>{

    

    Song getSong(Integer sid);

    List<Song> selectSongBySids(List<Integer> list);
}
