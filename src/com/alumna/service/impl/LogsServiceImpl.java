package com.alumna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alumna.mapper.LogsMapper;
import com.alumna.po.Logs;
import com.alumna.service.LogsService;

public class LogsServiceImpl implements LogsService{
	
	@Autowired
	private LogsMapper logsMapper;
	
	@Override
	public void insertLog(Logs logs) throws Exception {
		// TODO Auto-generated method stub
		logsMapper.insertLog(logs);
	}

	@Override
	public List<Logs> findUserlog(String uid) throws Exception {
		// TODO Auto-generated method stub
		return logsMapper.findUserlog(uid);
	}

	@Override
	public void deleteuserlog(String id) throws Exception {
		// TODO Auto-generated method stub
		logsMapper.deleteuserlog(id);
	}

	@Override
	public Logs findlog(String id) throws Exception {
		// TODO Auto-generated method stub
		return logsMapper.findlog(id);
	}
	
}
