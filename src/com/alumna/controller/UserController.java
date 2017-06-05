package com.alumna.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		System.out.println(users+"用户登陆==========");
		if(users==null){
			return "用户名或者密码错误";
		}else{
			session.setAttribute("uid", users.getId());
			session.setAttribute("number", users.getNumber());
			session.setAttribute("role", users.getRole());
			//统计动态、点赞、评论数
			session.setAttribute("say", userService.findCountsay(users.getId().toString()));
			session.setAttribute("loves",userService.findCountloves(users.getId().toString()));
			session.setAttribute("review", userService.findCountreview(users.getId().toString()));
			
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
	/*@RequestMapping(value = "/userImg", produces = "application/json;charset=UTF-8")
	public @ResponseBody boolean userImg(@RequestBody MultipartFile files)throws Exception{
		 boolean result = false;
	        String realPath;
	            if (!files.isEmpty()) {  
	                   String uniqueName=files.getOriginalFilename();//得到文件名
	                    realPath="G:"+File.separator+uniqueName;//文件上传的路径这里为E盘
	                  
	                    files.transferTo(new File(realPath));   // 转存文件
	                    result = true;           
	                }
	
	        return result;
	}*/
	//更新头像信息
	@RequestMapping("/updatePhoto")
	public @ResponseBody boolean updatePhoto(@RequestBody User user,HttpSession session)throws Exception{
		System.out.println(user.getNum()+"后缀名是《《《《《《《《《《");
		Student student=new Student();
		Graduate graduate=new Graduate();
		String role=session.getAttribute("role").toString();
		int uid=Integer.parseInt(session.getAttribute("uid").toString());
		String photo="photo/"+session.getAttribute("number").toString()+user.getNum();
		System.out.println(photo+"照片的地址加路径--------------------------");
		if("0".equals(role)){
			student.setUid(uid);
			student.setPhoto(photo);
			userService.updatePhotoStudent(student);
		}else{
			graduate.setUid(uid);
			graduate.setPhoto(photo);
			userService.updatePhotoGraduate(graduate);
		}
		return true;
	}
	
	@RequestMapping("/SearchUser")
	public @ResponseBody String SearchUser(@RequestBody Student student,HttpSession session)throws Exception{
		String s_where="";
		String courtyard=student.getCourtyard();
		String specialty=student.getSpecialty();
		String entranceyear=student.getEntranceyear();
//		System.out.println(courtyard+":->"+":->"+specialty+":->"+entranceyear);
		if(!"".equals(courtyard)){
			s_where+=" AND courtyard='"+courtyard+"'";
		}
		if(!"".equals(specialty)){
			s_where+=" AND specialty='"+specialty+"'";
		}
		if(!"".equals(entranceyear)){
			s_where+=" AND entranceyear LIKE '"+entranceyear+"%'";
		}
		System.out.println("校友查询条件是："+s_where+"角色是："+student.getRole());
		if("0".equals(student.getRole())){
			session.setAttribute("suser",userService.findStudentSearch(s_where));
		}else{
			session.setAttribute("suser",userService.findGraduateSearch(s_where));
		}
		return "搜索成功";
	}

	@RequestMapping("/SearchUserCity")
	public @ResponseBody String SearchUserCity(@RequestBody Student student,HttpSession session)throws Exception{
		
		String s_where="";
		String address="";
		String city=student.getCity();
		String province=student.getProvince();
		String entranceyear=student.getEntranceyear();
		if(!"".equals(province)){
			address=city+"-"+province;
		}else{
			address=city;
		}
//		System.out.println(courtyard+":->"+":->"+specialty+":->"+entranceyear);
		if(!"".equals(address)){
			s_where+="AND address LIKE '%"+address+"%'";
		}
		if(!"".equals(entranceyear)){
			s_where+=" AND entranceyear LIKE '"+entranceyear+"%'";
		}
		System.out.println("同城查询条件是："+s_where+"角色是："+student.getRole());
		if("0".equals(student.getRole())){
			session.setAttribute("suser",userService.findStudentCity(s_where));
		}else{
			session.setAttribute("suser",userService.findGraduateCity(s_where));
		}
		return "搜索成功";
	}
	
	
}
