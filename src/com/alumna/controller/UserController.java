package com.alumna.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public @ResponseBody List<String> insertUser(@RequestBody User user,HttpSession session) throws Exception{
		List<String> list=new ArrayList<String>();
		int num=userService.findnumber(user.getNumber());
		if(num==0){
			userService.insertuser(user);
			User users=userService.findLogin(user);
			session.setAttribute("uid", users.getId());
			session.setAttribute("number", users.getNumber());
			session.setAttribute("role", users.getRole());
			if("0".equals(users.getRole())){
				Student student=new Student();
				student.setUid(users.getId());
				student.setNumber(users.getNumber());
				userService.insertStudent(student);
			}else{
				Graduate graduate=new Graduate();
				graduate.setUid(users.getId());
				graduate.setNumber(users.getNumber());
				userService.insertGraduate(graduate);
			}
			list.add(users.getId().toString());
			list.add(users.getRole());
		}else{
			return null;
		}
		return list;
	}
	
	@RequestMapping("/findUser")
	public ModelAndView findUser(HttpServletRequest request,HttpSession session)throws Exception{
		int uid=Integer.parseInt(session.getAttribute("uid").toString());
		String role=session.getAttribute("role").toString();
		ModelAndView modelAndView=new ModelAndView();
		if("0".equals(role)){
			Student student=userService.findStudent(uid);
			modelAndView.addObject("student",student);
			modelAndView.setViewName("edit_student");
		}else{
			Graduate graduate=userService.findGraduate(uid);
			modelAndView.addObject("graduate",graduate);
			modelAndView.setViewName("edit_graduate");
		}
		return modelAndView;
	}
	
	
	//更新在校生信息
	@RequestMapping("/updateStudent")
	public @ResponseBody boolean updateStudent(@RequestBody Student student,HttpSession session)throws Exception{
		student.setUid(Integer.parseInt(session.getAttribute("uid").toString()));
		userService.updateStudent(student);
		
		
		student=userService.findStudent(student.getUid());
		session.setAttribute("photo", student.getPhoto());
		session.setAttribute("name", student.getName());
		session.setAttribute("entranceyear", student.getEntranceyear().substring(0,4));
		session.setAttribute("specialty", student.getSpecialty());
		session.setAttribute("email", student.getEmail());
		session.setAttribute("signature", student.getSignature());
		
		
		
		return true;
	}
	
	//更新毕业生信息
	@RequestMapping("/updateGraduate")
	public @ResponseBody boolean updateGraduate(@RequestBody Graduate graduate,HttpSession session)throws Exception{
		
		graduate.setUid(Integer.parseInt(session.getAttribute("uid").toString()));
		userService.updateGraduate(graduate);
		
		graduate=userService.findGraduate(graduate.getUid());
		session.setAttribute("photo", graduate.getPhoto());
		session.setAttribute("name", graduate.getName());
		session.setAttribute("entranceyear", graduate.getEntranceyear().substring(0, 4));
		session.setAttribute("specialty", graduate.getSpecialty());
		session.setAttribute("email", graduate.getEmail());
		session.setAttribute("signature", graduate.getSignature());
		
		
		
		return true;
	}
	
	
	
}
