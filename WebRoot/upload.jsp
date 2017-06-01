<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//System.out.println("2121");
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	//获取客户端上传的工厂类
	FileItemFactory factory = new DiskFileItemFactory();
	
	//创建容器的文件上传类
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	//解析文件上传的对象
	List<FileItem> fileItems = upload.parseRequest(request);//解析请求
	System.out.println(fileItems.size()+"===========");
	//指定上传的服务器目录
	String uploadPath=request.getRealPath("/photo");
	String number=session.getAttribute("number").toString();
	//如果目录不存在就创建
	File rootPath=new File(uploadPath);
	if(!rootPath.exists()) rootPath.mkdirs();
	//将文件写入到服务器目录中
	HashMap<String,Object> map = new HashMap<String,Object>();
	for(FileItem fileItem : fileItems){
		String name=fileItem.getName();//得到文件名
		String ext = name.substring(name.lastIndexOf("."),name.length());//得到后缀
		String fname = number+ext;//由系统时间命名上传的文件
		File fileName = new File(rootPath,fname);//上传
		session.setAttribute("photo","photo/"+fname);
		map.put("fname", "photo/"+fname);
		map.put("ext",ext);//后缀
		map.put("name",name);//原文件名
		if(!fileItem.isFormField()){
			fileItem.write(fileName);
		}
	}
	//out.print("success");
	out.print(JSONUtil.serialize(map));
	
	//返回上传数据即可
%>


