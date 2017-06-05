package com.alumna.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alumna.po.Logs;
import com.alumna.service.LogsService;

@Controller
@RequestMapping("/log")
public class LogsController {
	@Autowired
	private LogsService logsService;
	
	//发表文章
	@RequestMapping("/insertLog")
	public @ResponseBody String insertLog(@RequestBody Logs logs,HttpSession session)throws Exception{
		
		String uid=session.getAttribute("uid").toString();
		logs.setUid(Integer.parseInt(uid));
		logsService.insertLog(logs);
		
		return "发表成功";
	}
	
	//查找用户文章
	@RequestMapping("/findUserlog")
	public ModelAndView findUserlog(HttpServletRequest request)throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		String uid=request.getParameter("uid");

		List<Logs> loglist=logsService.findUserlog(uid);
		modelAndView.addObject("loglist",loglist);
		modelAndView.setViewName("article");
		return modelAndView;
	}
	
	//删除用户文章
	@RequestMapping("/deleteuserlog")
	public String deleteuserlog(HttpServletRequest request,HttpSession session)throws Exception{
		String id=request.getParameter("id");
		logsService.deleteuserlog(id);
		String uid=session.getAttribute("uid").toString();
		
		return "redirect:findUserlog.action?uid="+uid;
	}
	
	
	//文章查看
	@RequestMapping("/findlog")
	public ModelAndView findlog(HttpServletRequest request)throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
		String id=request.getParameter("id");
		Logs log=logsService.findlog(id);
		modelAndView.addObject("log",log);
		
		modelAndView.setViewName("articleview");
		
		return modelAndView;
	}
	
	
}
