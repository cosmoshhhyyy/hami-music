package com.qcby.controller;

import com.qcby.model.Mtype;
import com.qcby.query.MtypeQuery;
import com.qcby.service.MtypeService;
import com.qcby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 流派模块的表现层
 * 实现接收请求
 * CURD
 */
@RequestMapping("/mtype")
@Controller
public class MtypeController {

    /**
     * 注入流派的业务层
     * 调用流程查询逻辑
     */
    @Autowired
    private MtypeService mtypeService;

    /**
     * 查询流派信息管理
     * 分页条件查询
     * 流派名称 查看的页码 每页展示数
     * @return
     */
    @RequestMapping("/list")
    public String list(MtypeQuery mq ,Model model) {

        // 程序严谨性
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }

        Page<Mtype> page = mtypeService.selectByPage(mq);
        // 调用业务层查询，进行分页查询，返回前端想要的数据
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        return "mtype";
    }

    @RequestMapping("/addMtype")
    @ResponseBody
    public String addMtype(Mtype mtype) {

        int insert = mtypeService.insert(mtype);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delMtype")
    public String delMtype(int tid) {

        int i = mtypeService.deleteByPrimaryKey(tid);
        return "success";
    }

    @RequestMapping("/getMtype")
    @ResponseBody
    public Mtype getMtype(int tid) {

        Mtype res = mtypeService.selectByPrimaryKey(tid);
        return res;
    }

    @RequestMapping("/updateMtype")
    @ResponseBody
    public String updateMtype(Mtype mtype) {

        mtypeService.updateByPrimaryKey(mtype);
        return "success";
    }
}
