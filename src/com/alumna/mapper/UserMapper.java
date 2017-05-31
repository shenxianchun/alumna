package com.alumna.mapper;

import com.alumna.po.Graduate;
import com.alumna.po.Student;
import com.alumna.po.User;

public interface UserMapper {
	//登陆
    public User findLogin(User user)throws Exception;
    
    //根据传入的uid查询对应的在校生信息
    public Student findStudent(Integer uid)throws Exception;
    
    //根据传入的uid查询对应的毕业生信息
    public Graduate findGraduate(Integer uid)throws Exception;
    
    public int findnumber(String number)throws Exception;
    
    //插入用户
    public void insertuser(User user)throws Exception;
    
    //根据传入的id查询用户的角色
    public String findRole(int id)throws Exception;
    
    //插入在校生信息
    public void insertStudent(Student student)throws Exception;
    
    //插入毕业生信息
    public void insertGraduate(Graduate graduate)throws Exception;
    
    
    //更新在校生信息
    public void updateStudent(Student student)throws Exception;
    
    //更新毕业生信息
    public void updateGraduate(Graduate graduate)throws Exception;
    
    
    
}