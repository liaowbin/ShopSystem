package com.mushan.pojo;

/**
 * 商品分类
 */
public class Classify {

    public static Short SHOW = 1;

    public static String LOGO_DEFAULT_URL = "logo_default.png";

    private Integer id;
    // 分类名称
    private String name;
    // 是否显示
    private Short isShow = SHOW;
    // logo地址
    private String logo = LOGO_DEFAULT_URL;

    public Classify() {
    }

    public Classify(Integer id, String name, Short isShow, String logo) {
        this.id = id;
        this.name = name;
        this.isShow = isShow;
        this.logo = logo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Short getIsShow() {
        return isShow;
    }

    public void setIsShow(Short isShow) {
        this.isShow = isShow;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Override
    public String toString() {
        return "Classify{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isShow=" + isShow +
                ", logo='" + logo + '\'' +
                '}';
    }
}
