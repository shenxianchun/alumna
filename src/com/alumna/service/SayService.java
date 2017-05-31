package com.alumna.service;

import java.util.List;

import com.alumna.po.Loves;
import com.alumna.po.Review;
import com.alumna.po.Say;

public interface SayService {
	//查询所有用户发表的说说 
	public List<Say> findsayAll()throws Exception;
	
	//查询指定用户发表的说说 
	public List<Say> findSayUser(String uid)throws Exception;
	
	//查询一条说说id对应的所有回复
	public List<Review> findReview(int sayid)throws Exception;
	
	//统计每条说说的点赞数
	public int findCountLoves(int sayid)throws Exception;
	
	//插入点赞人信息
	public void insertLoves(Loves loves)throws Exception;
	
	//查找点赞人是否点过赞
	public int findLoves(Loves loves)throws Exception;
	
	//取消赞
	public void deleteLoves(Loves loves)throws Exception;
	
	//说说评论
	public void insertReview(Review review)throws Exception;
	
	//发表说说
	public void insertSay(Say say)throws Exception;
	
	//删除id
	public void deleteSay(String id)throws Exception;
}
