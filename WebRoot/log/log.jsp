<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="css/personal.css">
	<link rel="stylesheet" href="css/semantic.min.css" />
</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="../include/top.jsp" %>
	    <!-- 顶部结束 -->
	    <div class="box">
	    <!-- 个人主页左边导航栏start -->
	    	<%@include file="../include/left.jsp" %>
	    <!-- 个人主页左边导航栏end -->
	    	<div class="middle" style="width:830px;">
	    		<div class="newtext-box">
		    		<div style="width:100px;height:50px;margin-left:270px;margin-top:10px;">
		    			<div class="ui input">
						   <input type="text" id="title" placeholder="请输入标题" style="width:300px;text-align:center;">
						</div>
		    		</div>
		    			<script id="container" name="content" type="text/plain" style="width:830px;height:400px;">
       					
    					</script>
		    		<button class="newbtn" id="save">发 表</button>
			    </div>
				
	    	</div>
	    	
	    </div>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="include/login.js"></script>
	<script type="text/javascript" src="js/log.js"></script>
	<script type="text/javascript" src="js/say.js"></script>
	 <!-- 配置文件 -->
    <script type="text/javascript" src="log/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="log/ueditor.all.js"></script>
    
</body>
</html>