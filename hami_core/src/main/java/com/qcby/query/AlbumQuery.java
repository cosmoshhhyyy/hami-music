package com.qcby.query;

import com.qcby.model.Album;

public class AlbumQuery extends Album {

    private Integer pageNo;

    private Integer pageSize = 5; // 页大小

    private Integer startNum;

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
}
