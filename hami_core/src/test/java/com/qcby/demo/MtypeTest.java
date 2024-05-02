package com.qcby.demo;

import com.qcby.model.Mtype;
import com.qcby.service.MtypeService;
import com.qcby.service.impl.MtypeServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MtypeTest {

    @Autowired
    MtypeService mtypeService;

    @Test
    public void testAdd() {
        Mtype mtype = new Mtype();
        mtype.setTname("测试");
        mtype.setTdesc("流程介绍");
        int count = mtypeService.insert(mtype);
        System.out.println(count);
    }
}
