package com.qcby.service.impl;

import com.qcby.query.SongQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcby.dao.SongMapper;
import com.qcby.model.Song;
import com.qcby.service.SongService;

import java.util.List;

@Service
public class SongServiceImpl extends BaseServiceImpl<SongQuery, Song> implements SongService {

   private SongMapper songMapper;

   @Autowired
   public void setSongMapper(SongMapper songMapper) {
      this.songMapper = songMapper;
      this.baseDao=songMapper;
   }


   @Override
   public Song getSong(Integer sid) {
      return songMapper.getSong(sid);
   }

   @Override
   public List<Song> selectSongBySids(List<Integer> list) {
      return songMapper.selectSongBySids(list);
   }
}
