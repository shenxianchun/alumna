package com.alumna.service.impl;

import java.util.List;

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

	@Override
	public void insertStudent(Student student) throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertStudent(student);
	}

	@Override
	public void insertGraduate(Graduate graduate) throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertGraduate(graduate);
	}

	@Override
	public void updateStudent(Student student) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateStudent(student);
	}

	@Override
	public void updateGraduate(Graduate graduate) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateGraduate(graduate);
	}

	@Override
	public void updatePhotoStudent(Student student) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updatePhotoStudent(student);
	}

	@Override
	public void updatePhotoGraduate(Graduate graduate) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updatePhotoGraduate(graduate);
	}

	@Override
	public List<Student> findStudentSearch(String s_where) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findStudentSearch(s_where);
	}

	@Override
	public List<Graduate> findGraduateSearch(String s_where) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findGraduateSearch(s_where);
	}

	@Override
	public List<Student> findStudentCity(String s_where) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findStudentCity(s_where);
	}

	@Override
	public List<Graduate> findGraduateCity(String s_where) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findGraduateCity(s_where);
	}

	@Override
	public int findCountsay(String uid) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findCountsay(uid);
	}

	@Override
	public int findCountloves(String uid) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findCountloves(uid);
	}

	@Override
	public int findCountreview(String uid) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findCountreview(uid);
	}

}
