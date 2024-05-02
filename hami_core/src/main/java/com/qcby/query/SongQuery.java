package com.qcby.query;

import com.qcby.model.Song;

public class SongQuery extends Song {

    private Integer pageNo;

    private Integer pageSize = 5; // 页大小

    private Integer startNum;

    private String srname;

    private String aname;

    private Integer pageNoPortal = 1;

    public Integer getPageNoPortal() {
        return pageNoPortal;
    }

    public void setPageNoPortal(Integer pageNoPortal) {
        this.pageNoPortal = pageNoPortal;
    }

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

    public String getSrname() {
        return srname;
    }

    public void setSrname(String srname) {
        this.srname = srname;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }
}
