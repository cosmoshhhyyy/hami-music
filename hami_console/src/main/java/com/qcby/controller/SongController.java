package com.qcby.controller;

import com.qcby.model.Album;
import com.qcby.model.Mtype;
import com.qcby.model.Song;
import com.qcby.model.Songer;
import com.qcby.query.SongQuery;
import com.qcby.query.SongerQuery;
import com.qcby.service.AlbumService;
import com.qcby.service.MtypeService;
import com.qcby.service.SongService;
import com.qcby.service.SongerService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;
    @Autowired
    private MtypeService mtypeService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private SongerService songerService;

    @RequestMapping("/list")
    public String list(SongQuery mq, Model model) {

        // 程序严谨性
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }

        Page<Song> page = songService.selectByPage(mq);
        // 调用业务层查询，进行分页查询，返回前端想要的数据
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);

        List<Mtype> mtypeList = mtypeService.selectAll();

        // 返回给前端所有流派信息
        model.addAttribute("mtypes", mtypeList);

        return "song";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {

        List<Mtype> mtypeList = mtypeService.selectAll();
        List<Album> albumList = albumService.selectAll();
        List<Songer> songerList = songerService.selectAll();
        model.addAttribute("mtypes", mtypeList);
        model.addAttribute("albums", albumList);
        model.addAttribute("songers", songerList);
        return "addSong";
    }


    /**
     * 添加歌曲
     * @param song
     * @return
     */
    @RequestMapping("/add")
    public String add(Song song) {
        String pic = songerService.selectByPrimaryKey(song.getSrid()).getPic();
        song.setPic(pic);
        int insert = songService.insert(song);
        return "redirect:list";
    }

    /**
     * 删除歌曲
     * @param sid
     * @return
     */
    @ResponseBody
    @RequestMapping("/delSong")
    public String delSong(int sid) {
        int i = songService.deleteByPrimaryKey(sid);

        return "success";
    }

    /**
     * 回显歌曲，根据id
     */

    @RequestMapping("/getSong")
    public String getSong(int sid, Model model) {
        List<Mtype> mtypeList = mtypeService.selectAll();
        List<Album> albumList = albumService.selectAll();
        List<Songer> songerList = songerService.selectAll();
        model.addAttribute("mtypes", mtypeList);
        model.addAttribute("albums", albumList);
        model.addAttribute("songers", songerList);
        Song song = songService.selectByPrimaryKey(sid);
        model.addAttribute("song", song);
        return "updateSong";
    }

    @RequestMapping("/updateSong")
    public String updateSong(Song song) {

        System.out.println("sid=" + song.getSid());
        int i = songService.updateByPrimaryKey(song);
        return "redirect:list";
    }

}
