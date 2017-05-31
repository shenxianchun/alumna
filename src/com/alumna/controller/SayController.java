package com.alumna.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alumna.po.Graduate;
import com.alumna.po.Loves;
import com.alumna.po.Review;
import com.alumna.po.ReviewUserVo;
import com.alumna.po.Say;
import com.alumna.po.Student;
import com.alumna.po.User;
import com.alumna.po.UserSayVo;
import com.alumna.service.SayService;
import com.alumna.service.UserService;

@Controller
@RequestMapping("/say")
public class SayController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private SayService sayService;
	
	//查找全部说说
	@RequestMapping("/findSayAll")
	public ModelAndView findSayAll()throws Exception{
		List<UserSayVo> sayVolist=new ArrayList<UserSayVo>();
		ModelAndView modelAndView=new ModelAndView();
		List<Say> saylist=sayService.findsayAll();
		for(Say say:saylist){
			UserSayVo userSayVo=new UserSayVo();
			userSayVo.setSay(say);//设置一条说说
			System.out.println("------------说说start-----------------------");
			System.out.println("这是第一条说说："+say.getContent()+"说说id："+say.getId()+"用户uid:"+say.getUid());
			System.out.println("------------说说end,接下来是该条说说对应的评论-----------------------");
			userSayVo.setCount(sayService.findCountLoves(say.getId()));//设置点赞的人数
			List<Review> reviewlist=sayService.findReview(say.getId());//得到回复list
			
			List<ReviewUserVo> reviewUserVos=new ArrayList<ReviewUserVo>();//创建回复扩展类
			for(Review review:reviewlist){
				ReviewUserVo reviewUserVo=new ReviewUserVo();
				reviewUserVo.setReview(review);//设置第一条评论
				String role=userService.findRole(review.getUid());
				if("0".equals(role)){
					Student student=userService.findStudent(review.getUid());
					reviewUserVo.setStudent(student);
					System.out.println("来自"+student.getName()+"的评论");
				}else{
					Graduate graduate=userService.findGraduate(review.getUid());
					reviewUserVo.setGraduate(graduate);
					System.out.println("来自"+graduate.getName()+"的评论");
				}
				System.out.println("评论的内容是："+review.getContent());
				reviewUserVos.add(reviewUserVo);
			}
			System.out.println("------------评论end-----------------------");
			userSayVo.setReviewUserVos(reviewUserVos);
			
			String role=userService.findRole(say.getUid());
			if("0".equals(role)){
				Student student=userService.findStudent(say.getUid());
				userSayVo.setStudent(student);
				System.out.println("这是"+student.getName()+"发表的说说");
			}else{
				Graduate graduate=userService.findGraduate(say.getUid());
				System.out.println("这是"+graduate.getName()+"发表的说说");
				userSayVo.setGraduate(graduate);
			}
			sayVolist.add(userSayVo);//添加一个信息
		}
		System.out.println("=============="+sayVolist);
		modelAndView.addObject("sayVolist",sayVolist);
		modelAndView.setViewName("xiaoyou");
		return modelAndView;
	}
	
	
	//查找全部说说
	@RequestMapping("/findSayUser")
	public ModelAndView findSayUser(HttpServletRequest request)throws Exception{
		
		String uid=request.getParameter("uid");
		ModelAndView modelAndView=new ModelAndView();
		if(uid==null){
			modelAndView.addObject("sayVolist",null);
			modelAndView.setViewName("personal");
			return modelAndView;
		}
		
		List<UserSayVo> sayVolist=new ArrayList<UserSayVo>();
		List<Say> saylist=sayService.findSayUser(uid);
		for(Say say:saylist){
			UserSayVo userSayVo=new UserSayVo();
			userSayVo.setSay(say);//设置一条说说
			System.out.println("------------说说start-----------------------");
			System.out.println("这是第一条说说："+say.getContent()+"说说id："+say.getId()+"用户uid:"+say.getUid());
			System.out.println("------------说说end,接下来是该条说说对应的评论-----------------------");
			userSayVo.setCount(sayService.findCountLoves(say.getId()));//设置点赞的人数
			List<Review> reviewlist=sayService.findReview(say.getId());//得到回复list
			
			List<ReviewUserVo> reviewUserVos=new ArrayList<ReviewUserVo>();//创建回复扩展类
			for(Review review:reviewlist){
				ReviewUserVo reviewUserVo=new ReviewUserVo();
				reviewUserVo.setReview(review);//设置第一条评论
				String role=userService.findRole(review.getUid());
				if("0".equals(role)){
					Student student=userService.findStudent(review.getUid());
					reviewUserVo.setStudent(student);
					System.out.println("来自"+student.getName()+"的评论");
				}else{
					Graduate graduate=userService.findGraduate(review.getUid());
					reviewUserVo.setGraduate(graduate);
					System.out.println("来自"+graduate.getName()+"的评论");
				}
				System.out.println("评论的内容是："+review.getContent());
				reviewUserVos.add(reviewUserVo);
			}
			System.out.println("------------评论end-----------------------");
			userSayVo.setReviewUserVos(reviewUserVos);
			
			String role=userService.findRole(say.getUid());
			if("0".equals(role)){
				Student student=userService.findStudent(say.getUid());
				userSayVo.setStudent(student);
				System.out.println("这是"+student.getName()+"发表的说说");
			}else{
				Graduate graduate=userService.findGraduate(say.getUid());
				System.out.println("这是"+graduate.getName()+"发表的说说");
				userSayVo.setGraduate(graduate);
			}
			sayVolist.add(userSayVo);//添加一个信息
		}
		System.out.println("=============="+sayVolist);
		modelAndView.addObject("sayVolist",sayVolist);
		modelAndView.setViewName("personal");
		return modelAndView;
	}
	
	
	
	
	//点赞
	@RequestMapping("/insertLove")
	public void insertLove(@RequestBody Loves loves)throws Exception{
		
		if(sayService.findLoves(loves)==0){
			sayService.insertLoves(loves);
		}
		
	}
	//取消赞
	@RequestMapping("/deleteLove")
	public void deleteLove(@RequestBody Loves loves)throws Exception{
		
		if(sayService.findLoves(loves)==1){
			sayService.deleteLoves(loves);
		}
	}
	
	//说说评论
	@RequestMapping("/insertReview")
	public void insertReview(@RequestBody Review review)throws Exception{
		sayService.insertReview(review);
	}
	
	//发表说说
	@RequestMapping("/insertSay")
	public void insertSay(@RequestBody Say say)throws Exception{
		sayService.insertSay(say);
	}
	//发表说说
	@RequestMapping("/deleteSay")
	public void deleteSay(@RequestBody Say say)throws Exception{
		sayService.deleteSay(say.getId().toString());
	}
	
}
