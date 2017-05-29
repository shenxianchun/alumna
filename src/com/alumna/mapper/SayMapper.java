package com.alumna.mapper;

import com.alumna.po.Review;
import com.alumna.po.Say;

import java.util.List;

public interface SayMapper {
	 
	//查询所有用户发表的说说 
	public List<Say> findsayAll()throws Exception;
	
	
	//查询一条说说id对应的所有回复
	public List<Review> findReview(int sayid)throws Exception;
	
	
	
	
}