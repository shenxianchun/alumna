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
						<td>
							<c:choose>
				   				<c:when test="${student.name!=null}"> 
		                       		<input class="txt2" type="text" id="username" value="${student.name}"/>
		                        </c:when>
		                        <c:otherwise>
		                        	<input class="txt2" type="text" id="username"/>
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">性别：</td>
						<td>
							<select class="txt4" id="sex">
							<c:choose>
				   				<c:when test="${student.sex=='男'}"> 
		                       		<option value="男" selected="selected">男</option>
									<option value="女">女</option>
		                        </c:when>
		                        <c:otherwise>
			                        <option value="男">男</option>
									<option value="女" selected="selected">女</option>
		                        </c:otherwise>
	                        </c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td class="txt1" id="address">现居地：</td>
						<td>
						<c:choose>
				   				<c:when test="${student.address!=null}">
				                    <div class="ui dropdown">
										<input type="hidden" id="city" value="${student.address}"/>
										<div class="default text">${student.address}</div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="citylist">
											<!--省份列表  -->
										</div>
									</div>
									<div class="ui dropdown">
										<input type="hidden" id="province" value=""/>
										<div class="default text"></div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="provincelist">
											<!--市区列表  -->
										</div>
									</div>
		                        </c:when>
		                        <c:otherwise>
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
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">入学年份：</td>
						<td>
						<c:choose>
			   				<c:when test="${student.entranceyear!=null}"> 
	                       		<input class="txt2" type="date" id="entranceyear" value="${student.entranceyear}">
	                        </c:when>
	                        <c:otherwise>
		                       <input class="txt2" type="date" id="entranceyear">
	                        </c:otherwise>
	                    </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">学院：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.courtyard!=null}"> 
		                       		<div class="ui dropdown">
										<input type="hidden" id="colleges" value="${student.courtyard}"/>
										<div class="default text">${student.courtyard}</div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="collegeslist">
											<!--院系列表  -->
										</div>
									</div>
		                        </c:when>
		                        <c:otherwise>
			                       <div class="ui dropdown">
										<input type="hidden" id="colleges" value=""/>
										<div class="default text">选择院系</div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="collegeslist">
											<!--院系列表  -->
										</div>
									</div>
		                        </c:otherwise>
		                    </c:choose>
						</td>
						
					</tr>
					<tr>
						<td class="txt1">专业：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.specialty!=null}"> 
		                       		<div class="ui dropdown">
										<input type="hidden" id="specialty" value="${student.specialty}"/>
										<div class="default text">${student.specialty}</div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="specialitylist">
											<!--专业列表  -->
										</div>
									</div>
		                        </c:when>
		                        <c:otherwise>
			                       <div class="ui dropdown">
										<input type="hidden" id="specialty" value=""/>
										<div class="default text">先选择院系</div>
										<i class="dropdown icon"></i><!-- 向下的箭头 -->
										<div class="menu" id="specialitylist">
											<!--专业列表  -->
										</div>
									</div>
		                        </c:otherwise>
		                    </c:choose>
						</td>
					</tr>
					
					
					<tr>
						<td class="txt1">班级：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.banji!=null}"> 
		                       		<input class="txt2" type="text" id="banji" value="${student.banji}">
		                        </c:when>
		                        <c:otherwise>
		                        	<input class="txt2" type="text" id="banji">
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">生日：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.birthday!=null}"> 
		                       		<input class="txt2" type="date" id="birthday" value="${student.birthday}">
		                        </c:when>
		                        <c:otherwise>
		                        	<input class="txt2" type="date" id="birthday">
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">个性签名：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.signature!=null}"> 
		                       		<textarea class="txt3" id="signature">${student.signature}</textarea>
		                        </c:when>
		                        <c:otherwise>
		                        	<textarea class="txt3" id="signature"></textarea>
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">兴趣爱好：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.interest!=null}"> 
		                       		<textarea class="txt3" id="interest">${student.interest}</textarea>
		                        </c:when>
		                        <c:otherwise>
		                        	<textarea class="txt3" id="interest"></textarea>
		                        </c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td class="txt1">电话：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.tell!=null}"> 
		                       		<input class="txt2" type="text" id="tell" value="${student.tell}">
		                        </c:when>
		                        <c:otherwise>
		                        	<input class="txt2" type="text" id="tell">
		                        </c:otherwise>
	                        </c:choose>
							
						</td>
					</tr>
					<tr>
						<td class="txt1">邮箱：</td>
						<td>
							<c:choose>
				   				<c:when test="${student.email!=null}"> 
		                       		<input class="txt2" type="text" id="email" value="${student.email}">
		                        </c:when>
		                        <c:otherwise>
		                        	<input class="txt2" type="text" id="email">
		                        </c:otherwise>
	                        </c:choose>
						</td>
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
	<script type="text/javascript" src="js/student.js"></script>
	<script type="text/javascript" src="include/login.js"></script>
	<!-- <script type="text/javascript" src="js/index.js"></script> -->
<script type="text/javascript">
$(function(){
	$(".ui.dropdown").dropdown();//下拉框生效
})
</script>
	
	
</body>
</html>