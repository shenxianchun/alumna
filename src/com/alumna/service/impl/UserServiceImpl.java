package com.alumna.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.alumna.mapper.UserMapper;
import com.alumna.po.Graduate;
import com.alumna.po.Student;
import com.alumna.po.User;
import com.alumna.service.UserService;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User findLogin(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findLogin(user);
	}

	@Override
	public Student findStudent(Integer uid) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findStudent(uid);
	}

	@Override
	public Graduate findGraduate(Integer uid) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findGraduate(uid);
	}

	@Override
	public int findnumber(String number) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findnumber(number);
	}

	@Override
	public void insertuser(User user) throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertuser(user);
	}

	@Override
	public String findRole(int id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findRole(id);
	}

}
