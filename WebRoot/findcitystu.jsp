<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>找同城</title>
	<link rel="stylesheet" href="css/findstu.css">
	<link rel="stylesheet" href="css/semantic.min.css" />
</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部结束 -->
	    <div>
	    	<img src="img/city_bg.jpg" alt="" height="100px" width="1000px">
	    </div>
	    <div class="concent">
	    	<div class="box_title">
	    		<h4>校友列表</h4>
	    		<ul>
	    			<li style="width:150px; margin-left:57px;">
	    				<div class="ui dropdown">
							<input type="hidden" id="city" value=""/>
							<div class="default text">选择城市</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="citylist">
								<!--省份列表  -->
							</div>
						</div>
	    			</li>
	    			<li style="width:150px;margin-left:50px;">
	    				<div class="ui dropdown">
							<input type="hidden" id="province" value=""/>
							<div class="default text">先选择市区</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="provincelist">
								<!--市区列表  -->
							</div>
						</div>
	    			</li>
	    			<li style="width:100px;margin-left:50px;">
	    				<select class="txt2" id="entranceyear">
	    				<option value="">请选择</option>
	    					<option value="2000">2000</option>
	    					<option value="2001">2001</option>
	    					<option value="2002">2002</option>
	    					<option value="2003">2003</option>
	    					<option value="2004">2004</option>
	    					<option value="2005">2005</option>
	    					<option value="2006">2006</option>
	    					<option value="2007">2007</option>
	    					<option value="2008">2008</option>
	    					<option value="2009">2009</option>
	    					<option value="2010">2010</option>
	    					<option value="2011">2011</option>
	    					<option value="2012">2012</option>
	    					<option value="2013">2013</option>
	    					<option value="2014">2014</option>
	    					<option value="2015">2015</option>
	    					<option value="2016">2016</option>
	    					<option value="2017">2017</option>
	    				</select>
	    			</li>
	    			<li style="width:100px;margin-left:50px;">
	    				<select class="txt2" id="role">
	    					<option value="0">在校生</option>
	    					<option value="1">毕业生</option>
	    				</select>
	    			</li>
	    		</ul>
	    		<input type="button" id="save" value="搜索">
	    	</div>
	    	<div class="stubox">
	    		<table>
	    		<c:forEach items="${sessionScope.suser }" var="user">
	    			<tr>
	    				<td><a href="say/findotherUser.action?uid=${user.uid}"><img src="${user.photo}"></a></td>
	    				<td>${user.name}</td>
	    				<td>${fn:substring(user.entranceyear,0,4)}级</td>
	    				<td>${user.courtyard}</td>
	    				<td>${user.specialty}</td>
	    				<td>${user.banji}</td>
	    			</tr>
	    			</c:forEach>
	    		</table>
	    		<div class="tpage">
	    			<a href="#">上一页</a>
	    			<a href="#">下一页</a>
	    		</div>
	    	</div>
	    </div>
	</div>
	
	
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
	<script type="text/javascript" src="js/city.js"></script>
	<script type="text/javascript" src="include/login.js"></script>
	<script type="text/javascript" src="js/searchcitystu.js"></script>
	<!-- <script type="text/javascript" src="js/index.js"></script> -->
	
<script type="text/javascript">
$(function(){
	$(".ui.dropdown").dropdown();//下拉框生效
})
</script>
	
</body>
</html>