package com.qcby.util;

import java.util.List;

/**
 * 自定义页类
 * 页对象前端展现，返回
 */
public class Page<T> {

    // 1. 页码
    private Integer pageNo = 1;
    // 2. 每页展示数量
    private Integer pageSize = 5;
    // 3. 开始行号
    private Integer startNum = 0;
    // 4. 总页数
    private Integer totalPage = 0;
    // 5. 数据集合
    private List<T> list;
    // 6. 总记录数
    private Integer totalCount = 0;

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getTotalPage() {
        totalPage = totalCount/pageSize;
        if(totalCount == 0 || totalCount%pageSize != 0){
            totalPage++;
        }

        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
}
