package com.alumna.po;

public class City {
    private Integer id;

    private Integer provice;

    private String cityname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProvice() {
        return provice;
    }

    public void setProvice(Integer provice) {
        this.provice = provice;
    }

    public String getCityname() {
        return cityname;
    }

    public void setCityname(String cityname) {
        this.cityname = cityname == null ? null : cityname.trim();
    }
}