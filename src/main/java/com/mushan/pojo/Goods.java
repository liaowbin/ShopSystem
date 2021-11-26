package com.mushan.pojo;

import java.math.BigDecimal;
import java.util.Arrays;

/**
 * 商品类
 */
public class Goods {
    // 商品id
    private Integer id;
    // 商品标题
    private String title;
    // 商品价格
    private BigDecimal price;
    // 商品库存
    private Integer stock;
    // 商品图片路径
    private String img;
    // 商品分类id
    private Integer classifyId;
    // 商品分类名称
    private String classifyName;
    // 商品描述
    private String describe;

    public Goods() {
    }

    public Goods(Integer id, String title, BigDecimal price, Integer stock, String img, Integer classifyId, String describe) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.stock = stock;
        this.img = img;
        this.classifyId = classifyId;
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", img='" + img + '\'' +
                ", classifyId=" + classifyId +
                ", classifyName='" + classifyName + '\'' +
                ", describe='" + describe + '\'' +
                '}';
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }
}
