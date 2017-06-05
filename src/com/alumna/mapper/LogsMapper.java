package com.alumna.mapper;

import com.alumna.po.Logs;

import java.util.List;

public interface LogsMapper {
	
	//发表日志
	public void insertLog(Logs logs)throws Exception;
	
	//查找用户的文章
	public List<Logs> findUserlog(String uid)throws Exception;
	
	//删除文章
	public void deleteuserlog(String id)throws Exception;
	
	//单篇文章展示
	public Logs findlog(String id)throws Exception;
	
}