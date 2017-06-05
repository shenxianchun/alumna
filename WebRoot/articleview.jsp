<%@ page language="java" import="java.util.*,com.alumna.po.*" 
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>我的文章</title>
	<link rel="stylesheet" href="css/article.css">

</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部结束 -->
	    <div class="box">
	    	<%@include file="include/left.jsp" %>
	    	
	    	<div class="right">
	    		<div id="title" style="margin:0 auto;text-align:center;line-height:50px;">
	    			<h1>${log.title }</h1>
	    		</div>
	    		<div id="content" style="margin-left:50px;">${log.content }</div>
	    	</div>
	    	
	    </div>
	</div>
</body>
</html>