package com.qcby.dao;

 import com.qcby.model.Song;
 import com.qcby.query.SongQuery;

 import java.util.List;

public interface SongMapper extends BaseDao<SongQuery, Song>{
    

    Song getSong(Integer sid);

    List<Song> selectSongBySids(List<Integer> list);
}
