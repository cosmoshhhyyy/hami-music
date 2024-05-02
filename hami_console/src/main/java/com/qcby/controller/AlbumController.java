package com.qcby.controller;

import com.qcby.model.Album;
import com.qcby.model.Mtype;
import com.qcby.query.AlbumQuery;
import com.qcby.query.MtypeQuery;
import com.qcby.service.AlbumService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/album")
@Controller
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("/list")
    public String list(AlbumQuery mq , Model model) {

        // 程序严谨性
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }

        Page<Album> page = albumService.selectByPage(mq);
        // 调用业务层查询，进行分页查询，返回前端想要的数据
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);

        return "album";
    }

    /**
     * 验证专辑名是否存在
     * 表单校验 ajax请求
     * @return
     */
    @ResponseBody
    @RequestMapping("/isName")
    public String isName(String aname) {

        Map<String ,String> map = new HashMap<>();
        map.put("aname", aname);
        List<Album> albums = albumService.selectAlbumByName(map);
        String flag = "false";

        if (albums.size() > 0) {
            flag = "true";
        }
        return flag;
    }

    @ResponseBody
    @RequestMapping("/addAlbum")
    public String addAlbum(Album album) {
        int insert = albumService.insert(album);

        return "success";

    }

    @ResponseBody
    @RequestMapping("/delAlbum")
    public String delAlbum(int aid) {
        int i = albumService.deleteByPrimaryKey(aid);

        return "success";
    }

    @RequestMapping("/getAlbum")
    @ResponseBody
    public Album getMtype(int aid) {

        Album album = albumService.selectByPrimaryKey(aid);
        return album;
    }

    @RequestMapping("/updateAlbum")
    @ResponseBody
    public String updateMtype(Album album) {

        albumService.updateByPrimaryKey(album);
        return "success";
    }
}
