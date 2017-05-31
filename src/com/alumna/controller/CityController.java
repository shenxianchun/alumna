package com.alumna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alumna.po.City;
import com.alumna.po.Colleges;
import com.alumna.service.CityService;


@Controller
@RequestMapping("/city")
public class CityController {
	
	//注入CityService
	@Autowired
	private CityService cityService;
	
	@RequestMapping("/city")
	public @ResponseBody List<City> querycitys() throws Exception{
		System.out.println("------省份查询start-----");
		List<City> citylist=cityService.findcityList();
		System.out.println("------省份查询end-----");
		//@ResponseBody将itemsCustom转成json输出
		return citylist;
	}
	
	@RequestMapping("/province")
	public @ResponseBody List<City> queryprovinces(@RequestBody City city) throws Exception{
		System.out.println("------市区查询start-----");
		System.out.println(city.getCityname());
		List<City> citylist=cityService.findprovinceList(city);
		if(citylist.size()==0){
			citylist.add(city);
		}
		System.out.println("------市区查询end-----");
		//@ResponseBody将itemsCustom转成json输出
		return citylist;
	}
	
	
	
	
	@RequestMapping("/querycolleges")
	public @ResponseBody List<Colleges> querycolleges() throws Exception{
		
		List<Colleges> collegesList=cityService.findcollegesList();
		System.out.println("院系查询：--->>>>"+collegesList.toString());
		//@ResponseBody将itemsCustom转成json输出
		return collegesList;
	}
	
	@RequestMapping("/queryspeciality")
	public @ResponseBody List<Colleges> queryspeciality(@RequestBody Colleges colleges) throws Exception{
		
		System.out.println(colleges.getName());
		
		List<Colleges> collegesList=cityService.findspecialityList(colleges);
		System.out.println("专业查询----》》》》"+collegesList.toString());
		if(collegesList.size()==0){
			collegesList.add(colleges);
		}
		//@ResponseBody将itemsCustom转成json输出
		return collegesList;
	}
	
	
	
	
}
