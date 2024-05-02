package com.qcby.controller;

import com.qcby.model.Mtype;
import com.qcby.model.Song;
import com.qcby.model.Songer;
import com.qcby.query.SongQuery;
import com.qcby.query.SongerQuery;
import com.qcby.service.MtypeService;
import com.qcby.service.SongerService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/songer")
public class SongerController {

    @Autowired
    private SongerService songerService;

    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("/dofindAll")
    public String doFindAll(SongerQuery mq, Model model) {

        if(mq.getPageNo() == null){
            mq.setPageNo(1);
        }
        mq.setPageSize(20);
        Page<Songer> page = songerService.selectByPage(mq);
        List<Mtype> mtypes = mtypeService.selectAll();

        List<List<Songer>> list = new ArrayList<>();
        List<Songer> slist = page.getList();
        List<Songer> list1 = null;
        for (int i = 0; i < 20; i++) {
            if(i % 5 == 0){
                list1 = new ArrayList<>();
                list.add(list1);
            }
            Songer s = null;
            if(i < slist.size()){
                s = slist.get(i);
                list1.add(s);
            }

        }
        model.addAttribute("sList", list);
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        model.addAttribute("mtypes", mtypes);
        return "songers";
    }

    @RequestMapping("/getSonger")
    public String getSonger(Integer srid, Model model) {

        Songer songer = songerService.getSongerSong(srid);

        model.addAttribute("songer", songer);
        return "songer";
    }
}
