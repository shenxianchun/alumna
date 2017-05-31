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
	<meta charset="UTF-8">
	<title>在校生信息</title>
	<link rel="stylesheet" href="css/edit.css">
	<link rel="stylesheet" href="css/semantic.min.css" />
</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部end -->
	    <div class="box">
	    	<!-- 左侧菜单 -->
	    	<%@include file="include/left.jsp" %>
	    	
	    	
			<!-- 右侧信息 -->
			<div class="right">
				<div class="edit"><img src="img/edit.jpg" alt="">编辑</div>
				<h4>基本资料</h4>
				<table>
					<tr>
						<td class="txt1">姓名：</td>
						<td><input class="txt2" type="text" id="name"></td>
					</tr>
					<tr>
						<td class="txt1">性别：</td>
						<td>
							<select class="txt4">
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="txt1">现居地：</td>
						<td>
							<div class="ui dropdown">
								<input type="hidden" id="city" value=""/>
								<div class="default text">选择城市</div>
								<i class="dropdown icon"></i><!-- 向下的箭头 -->
								<div class="menu" id="citylist">
									<!--省份列表  -->
								</div>
							</div>
							<div class="ui dropdown">
								<input type="hidden" id="province" value=""/>
								<div class="default text">先选择市区</div>
								<i class="dropdown icon"></i><!-- 向下的箭头 -->
								<div class="menu" id="provincelist">
									<!--市区列表  -->
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="txt1">入学年份：</td>
						<td><input class="txt2" type="date" value=""></td>
					</tr>
					<tr>
						<td class="txt1">学院：</td>
						<td>
							<div class="ui dropdown">
								<input type="hidden" id="colleges" value=""/>
								<div class="default text">选择院系</div>
								<i class="dropdown icon"></i><!-- 向下的箭头 -->
								<div class="menu" id="collegeslist">
									<!--院系列表  -->
								</div>
							</div>
						</td>
						
					</tr>
					<tr>
						<td class="txt1">专业：</td>
						<td>
							<div class="ui dropdown">
								<input type="hidden" id="speciality" value=""/>
								<div class="default text">先选择院系</div>
								<i class="dropdown icon"></i><!-- 向下的箭头 -->
								<div class="menu" id="specialitylist">
									<!--专业列表  -->
								</div>
							</div>
						</td>
						
					</tr>
					
					
					
					<tr>
						<td class="txt1">班级：</td>
						<td><input class="txt2" type="text" value=""></td>
					</tr>
					<tr>
						<td class="txt1">生日：</td>
						<td><input class="txt2" type="date" value=""></td>
					</tr>
					<tr>
						<td class="txt1">个性签名：</td>
						<td><textarea class="txt3"></textarea></td>
					</tr>
					<tr>
						<td class="txt1">兴趣爱好：</td>
						<td><textarea class="txt3"></textarea></td>
					</tr>
					<tr>
						<td class="txt1">电话：</td>
						<td><input class="txt2" type="text" value=""></td>
					</tr>
					<tr>
						<td class="txt1">邮箱：</td>
						<td><input class="txt2" type="text" value=""></td>
					</tr>
				</table>
				<div>
					<input id="edit_button" type="button" value="保存">
				</div>
			</div>
			
	    </div>
	</div>
	
	
	
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
	<script type="text/javascript" src="js/city.js"></script>
	<script type="text/javascript" src="js/colleges.js"></script>
	<!-- <script type="text/javascript" src="js/index.js"></script> -->
<script type="text/javascript">
$(function(){
	$(".ui.dropdown").dropdown();//下拉框生效
})
</script>
	
	
</body>
</html>