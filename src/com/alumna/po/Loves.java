package com.alumna.po;

import java.util.Date;

public class Loves {
    private Integer id;

    private Integer uid;

    private Integer sayid;

    private Date lovetime;

    private String state;
    
    private String num;
    
    /**
	 * @return the num
	 */
	public String getNum() {
		return num;
	}

	/**
	 * @param num the num to set
	 */
	public void setNum(String num) {
		this.num = num;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getSayid() {
        return sayid;
    }

    public void setSayid(Integer sayid) {
        this.sayid = sayid;
    }

    public Date getLovetime() {
        return lovetime;
    }

    public void setLovetime(Date lovetime) {
        this.lovetime = lovetime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}