package com.mushan.pojo;

import java.util.List;

public class Page<T> {
    public static final int PAGE_SIZE = 10;
    // 当前页数
    private int pageNo;
    // 每页数据个数
    private int pageSize = PAGE_SIZE;
    // 总记录数
    private int dataTotalCount;
    // 总页数
    private int pageTotal;
    // 当前页数据
    private List<T> items;

    // 分页调转的地址
    private String url;

    public Page() {
    }

    public Page(int pageNo, int pageSize, int dataTotalCount, int pageTotal, List<T> items, String url) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.dataTotalCount = dataTotalCount;
        this.pageTotal = pageTotal;
        this.items = items;
        this.url = url;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getDataTotalCount() {
        return dataTotalCount;
    }

    public void setDataTotalCount(int dataTotalCount) {
        this.dataTotalCount = dataTotalCount;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageToal) {
        this.pageTotal = pageToal;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", dataTotalCount=" + dataTotalCount +
                ", pageTotal=" + pageTotal +
                ", items=" + items +
                ", url='" + url + '\'' +
                '}';
    }
}
