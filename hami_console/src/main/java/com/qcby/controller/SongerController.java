package com.qcby.controller;

import com.qcby.model.Mtype;
import com.qcby.model.Songer;
import com.qcby.query.SongerQuery;
import com.qcby.service.MtypeService;
import com.qcby.service.SongerService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/songer")
@Controller
public class SongerController {

    @Autowired
    private SongerService songerService;
    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("/list")
    public String list(SongerQuery mq, Model model) {

        // 程序严谨性
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }

        Page<Songer> page = songerService.selectByPage(mq);
        // 调用业务层查询，进行分页查询，返回前端想要的数据
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);

        List<Mtype> mtypeList = mtypeService.selectAll();
        // 返回给前端所有流派信息
        model.addAttribute("mtypes", mtypeList);
        return "songer";
    }


    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        List<Mtype> mtypeList = mtypeService.selectAll();
        model.addAttribute("mtypes", mtypeList);
        return "addSonger";
    }

    @RequestMapping("/getSonger")
    public String getSong(int srid, Model model) {
        List<Mtype> mtypeList = mtypeService.selectAll();
        model.addAttribute("mtypes", mtypeList);
        Songer songer = songerService.selectByPrimaryKey(srid);
        model.addAttribute("songer", songer);
        return "updateSonger";
    }

    @RequestMapping("/add")
    public String add(Songer songer) {

        int insert = songerService.insert(songer);

        return "redirect:list";
    }

    @ResponseBody
    @RequestMapping("/delSonger")
    public String delSonger(int srid) {

        int i = songerService.deleteByPrimaryKey(srid);
        return "success";
    }

    @RequestMapping("/updateSonger")
    public String updateSonger(Songer songer) {
        System.out.println(songer.getIntro());
        System.out.println(songer.getTid());
        int i = songerService.updateByPrimaryKey(songer);

        return "redirect:list";
    }
}
