package com.alumna.po;

import java.util.List;

public class User {
    private Integer id;

    private String number;

    private String password;

    private String role;
    
    private String num;
    
    private List<Say> says;//一个用户对应多条说说
    
    /**
	 * @return the says
	 */
	public List<Say> getSays() {
		return says;
	}

	/**
	 * @param says the says to set
	 */
	public void setSays(List<Say> says) {
		this.says = says;
	}

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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }
}