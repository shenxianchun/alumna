package com.alumna.service;

import java.util.List;

import com.alumna.po.City;
import com.alumna.po.Colleges;


public interface CityService {
	//查询所有省份
	public List<City> findcityList()throws Exception;
	//根据省份查询市区
	public List<City> findprovinceList(City city)throws Exception;
	
	//查询所有院系
	public List<Colleges> findcollegesList()throws Exception;
	//根据院系查询专业
	public List<Colleges> findspecialityList(Colleges colleges)throws Exception;
}
