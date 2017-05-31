<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="left">
  		<div class="person">
  			<img src="<%=session.getAttribute("photo") %>" alt="头像">
  			<p><a href="javascript:;" id="name"><%=session.getAttribute("name") %></a>
  			<span><%=session.getAttribute("entranceyear") %></span></p>
  		</div>
  		<div class="leftlist">
  			<ul>
  				<li><a href="#">上传头像</a></li>
  				<li><a href="user/findUser.action">编辑资料</a></li>
  				<li><a href="#">发表文章</a></li>
  				<li><a href="#">我的相册</a></li>
  				<li><a href="#">找校友</a></li>
  				<li><a href="#">找同城</a></li>
  			</ul>
  		</div>
  	</div>
</body>
</html>