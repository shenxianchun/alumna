package com.alumna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alumna.mapper.CityMapper;
import com.alumna.po.City;
import com.alumna.po.Colleges;
import com.alumna.service.CityService;


public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityMapper cityMapper;
	
	@Override
	public List<City> findcityList() throws Exception {
		//通过cityMapper查询数据库
		return cityMapper.findcityList();
	}

	@Override
	public List<City> findprovinceList(City cityname) throws Exception {
		//通过cityMapper查询数据库
		return cityMapper.findprovinceList(cityname);
	}

	@Override
	public List<Colleges> findcollegesList() throws Exception {
		// TODO Auto-generated method stub
		return cityMapper.findcollegesList();
	}

	@Override
	public List<Colleges> findspecialityList(Colleges colleges) throws Exception {
		// TODO Auto-generated method stub
		return cityMapper.findspecialityList(colleges);
	}

}
