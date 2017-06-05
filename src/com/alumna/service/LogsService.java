package com.alumna.service;

import java.util.List;

import com.alumna.po.Logs;

public interface LogsService {
	//发表日志
	public void insertLog(Logs logs)throws Exception;
	
	//查找用户的文章
	public List<Logs> findUserlog(String uid)throws Exception;
	
	//删除文章
	public void deleteuserlog(String id)throws Exception;
	
	//单篇文章展示
	public Logs findlog(String id)throws Exception;
}
