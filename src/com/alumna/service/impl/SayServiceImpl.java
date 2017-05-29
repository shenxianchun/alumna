package com.alumna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alumna.mapper.SayMapper;
import com.alumna.po.Review;
import com.alumna.po.Say;
import com.alumna.service.SayService;

public class SayServiceImpl implements SayService {
	@Autowired
	private SayMapper sayMapper;
	
	@Override
	public List<Say> findsayAll() throws Exception {
		// TODO Auto-generated method stub
		return sayMapper.findsayAll();
	}

	@Override
	public List<Review> findReview(int sayid) throws Exception {
		// TODO Auto-generated method stub
		return sayMapper.findReview(sayid);
	}

}
