package com.alumna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alumna.po.Graduate;
import com.alumna.po.Student;
import com.alumna.po.User;
import com.alumna.service.UserService;

/**
 * 用户登陆注册，填写信息
* <p>Title: UserController.java<／p>
* <p>Description:描述 <／p>
* <p>Copyright:版权 2017<／p>
* @author xuchang
* @date 2017年5月27日
* @version 1.0alumna
*/
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	/**
	 * 登陆
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findLogin")
	public @ResponseBody String findLogin(@RequestBody User user,HttpSession session) throws Exception{
		System.out.println(user);
		User users=userService.findLogin(user);
		System.out.println(users+"==========");
		if(users==null){
			return "用户名或者密码错误";
		}else{
			session.setAttribute("uid", users.getId());
			session.setAttribute("number", users.getNumber());
			session.setAttribute("role", users.getRole());
			if("0".equals(users.getRole())){
				Student student=userService.findStudent(users.getId());
				session.setAttribute("photo", student.getPhoto());
				session.setAttribute("name", student.getName());
				session.setAttribute("entranceyear", student.getEntranceyear().substring(0,4));
				session.setAttribute("specialty", student.getSpecialty());
				session.setAttribute("email", student.getEmail());
				session.setAttribute("signature", student.getSignature());
			}
			if("1".equals(users.getRole())){
				Graduate graduate=userService.findGraduate(users.getId());
				session.setAttribute("photo", graduate.getPhoto());
				session.setAttribute("name", graduate.getName());
				session.setAttribute("entranceyear", graduate.getEntranceyear().substring(0, 4));
				session.setAttribute("specialty", graduate.getSpecialty());
				session.setAttribute("email", graduate.getEmail());
				session.setAttribute("signature", graduate.getSignature());
			}
		}
		return "登陆成功";
	}
	
	//退出
	@RequestMapping("/logout")
	public @ResponseBody String logout(HttpSession session)throws Exception{
		
		//session过期
		session.invalidate();
		
		return "退出成功";
	}
	
	
	
	@RequestMapping("/insertUser")
	public @ResponseBody boolean insertUser(@RequestBody User user,HttpSession session) throws Exception{
		
		int num=userService.findnumber(user.getNumber());
		if(num==0){
			userService.insertuser(user);
			session.setAttribute("uid", user.getId());
			session.setAttribute("number", user.getNumber());
			session.setAttribute("role", user.getRole());
		}else{
			return false;
		}
		return true;
	}
	
}
