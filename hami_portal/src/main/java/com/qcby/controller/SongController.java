package com.qcby.controller;

import com.qcby.model.Mtype;
import com.qcby.model.Song;
import com.qcby.model.Songer;
import com.qcby.query.SongQuery;
import com.qcby.service.MtypeService;
import com.qcby.service.SongService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("/dofindAll")
    public String doFindAll(SongQuery mq, Model model) {

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
        return "search";
    }

    @RequestMapping("/play")
    public String play(String sids, Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        String[] idsArr = null;
        if (sids != null && !"".equals(sids)) {
            idsArr = sids.split(",");

        }

        Cookie[] cookies = request.getCookies();
        // 创建一个集合，integer集合 查询数据库
        String cookieIds = null;

        String[] idsArrCookie = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String cname = cookie.getName();
                if ("playids".equals(cname)) {
                    // 获取当前播放列表中的值
                    cookieIds = cookie.getValue();
                    cookieIds = URLDecoder.decode(cookieIds, "UTF-8");
                }
            }
        }

        // 拿到cookie的值后，判断是否为空，不为空，解析
        if (cookieIds != null) {
            idsArrCookie = cookieIds.split(",");
        }

        List<Integer> list = new ArrayList<>();
        // 定义往前端返回的数据

        cookieIds = "";

        if (idsArr != null) {
            // 遍历数据将数据中的字符串中的id值放入到集合当中去
            for (String s : idsArr) {
                list.add(new Integer(s));
                cookieIds = cookieIds + s + ",";
            }
            if (idsArrCookie != null && !"".equals(idsArrCookie)) {
                for (String s: idsArrCookie) {
                    Integer sid = new Integer(s);
                    Boolean exits = false;
                    for (Integer i : list) {
                        if (sid.equals(i)) {
                            exits = true;
                            break;
                        }
                    }
                    if (!exits) {
                        list.add(sid);
                        cookieIds = cookieIds + s + ",";
                    }
                }
            }
        }

        List<Song> songs= songService.selectSongBySids(list); // 通过集合里的sid值，查询所以的歌曲

        cookieIds = URLEncoder.encode(cookieIds, "UTF-8");
        Cookie cookie = new Cookie("playids", cookieIds);

        cookie.setPath("/");
        cookie.setMaxAge(60*60*24*30);
        response.addCookie(cookie);
        model.addAttribute("songs", songs);

        return "player";
    }

    @ResponseBody
    @RequestMapping("/getSong")
    public Song getSong(Integer sid) {
        Song song = songService.getSong(sid);

        return song;
    }
}
