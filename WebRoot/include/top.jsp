<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校友网头部信息</title>
</head>
<body>
	<div class="header">
	        <ul>
	        	<li>
	        	   <img src="img/logo.png" />
	        	</li>
	        	<li>		
	    	       <span>大连</span>
	    	       <input type="text" placeholder="搜索您感兴趣的关键字">
	    	       <a href="#">搜 索</a>
	        	</li>
	        </ul>
	        <%if(session.getAttribute("uid")!=null){%>
	        	<ul style="display:block;">
	    		<li><a href="#" id="tui">[退出]</a></li>
	    	</ul>
	        <%}else{%>
	        <ul style="display:none;">
	    		<li><a href="#">[登陆]</a></li>
	    		<li><a href="#">[退出]</a></li>
	    	</ul>
	        <%}%>
	    	
	    </div>
	    <!-- 顶部结束 -->
	    <!-- 导航条开始 -->
	    <div  class="center-content">
	        <ul>
	        	<li>
	        	   <a  href="#">首页</a>
	        	</li>
	        	<li>
	        	  <a  href="javascript:;" id="persion" class="<%=session.getAttribute("uid")%>">个人主页</a>
	        	</li>
	        	<li>
	        	  <a  href="say/findSayAll.action?falg=flag">热门动态</a>
	        	</li>
	        	<li>
	        	  <a  href="#">校园活动</a>
	        	</li>
	        </ul>
	    </div>
	    <!-- 导航条结束 -->
</body>
</html>