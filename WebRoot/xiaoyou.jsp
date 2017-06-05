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
	<title>校友网</title>
	<link rel="stylesheet" href="css/xiaoyou.css">
</head>
   <body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部开始 -->
	    <div>
	    	<!-- 轮播图开始 -->
			<div id="photo">
	            <img id="imglist" src="img/101.jpg" name="im" width="100%" height="100%">
	            <div id="imgbuttons">
	                <ul id="number">
	                    <li style="background:#00BEB7"></li>
	                    <li></li>
	                    <li></li>
	                    <li></li>
	                    <li></li>
	                </ul>
	            </div>
			</div>
			<!-- 轮播图结束-->
			<!-- 登录模块开始 -->
			<%@include file="include/login.jsp" %>
			<!-- 登录模块结束 -->
		</div>
		<!-- 条件筛选开始 -->
		<div class="menu">
			<a class="one" href="#">热门动态</a>
			<a class="two" href="#">时间↑↓</a>
			<div class="three">
				<a href="#">年级：全部</a>
				<div class="three_on">
					<a href="#">大一</a>
					<a href="#">大二</a>
					<a href="#">大三</a>
					<a href="#">大四</a>
					<a href="#">已毕业</a>
				</div>
			</div>
			<div class="three">
				<a href="#">专业：全部</a>
				<div class="three_on">
					<a href="#">全部</a>
					<a href="#">计算机</a>
					<a href="#">经管</a>
					<a href="#">国商</a>
					<a href="#">土建</a>
					<a href="#">自动化</a>
					<a href="#">文法</a>
				</div>
			</div>
			<div class="four">
				<a class="on" href="#"><span class="check"></span><span>点赞最多</span></a>
				<a class="on" href="#"><span class="check"></span><span>评论最多</span></a>
			</div>
		</div>
		<!-- 条件筛选结束 -->
		<div class="bottom">
			<!-- 校友动态开始 -->
			<div id="list">
			<c:forEach items="${sayVolist }" var="sayVo">
		        <div class="box clearfix">
		            <a class="close" href="javascript:;">×</a>
		            <c:choose>
				   <c:when test="${sayVo.student!=null}"> 
				   	 <img class="head" src="${sayVo.student.photo}" alt=""/>
		            <div class="content">
		                <div class="main">
		                    <p class="txt">
		                    	<c:choose>
					   				<c:when test="${sayVo.student.uid!=sessionScope.uid}"> 
			                       		<span class="user"><a href="say/findotherUser.action?uid=${sayVo.student.uid}">${sayVo.student.name}</a>：</span>
			                        </c:when>
			                        <c:otherwise>
			                        	<span class="user">我：</span>
			                        </c:otherwise>
		                        </c:choose>
				   </c:when>
				   <c:otherwise>
				   	<img class="head" src="${sayVo.graduate.photo}" alt=""/>
		            <div class="content">
		                <div class="main">
		                    <p class="txt">
		                    	<c:choose>
					   				<c:when test="${sayVo.graduate.uid!=sessionScope.uid}"> 
			                       		<span class="user"><a href="say/findotherUser.action?uid=${sayVo.graduate.uid}">${sayVo.graduate.name}</a>：</span>
			                        </c:when>
			                        <c:otherwise>
			                        	<span class="user">我：</span>
			                        </c:otherwise>
		                        </c:choose>
				   </c:otherwise>
				 </c:choose>${sayVo.say.content}
		                    </p>
		                    <img class="pic" src="${sayVo.say.image}" alt=""/>
		                </div>
		                <div class="info clearfix">
		                    <span class="time">${sayVo.say.createtime}</span>
		                    <a class="praise" href="javascript:;">赞</a>
		                </div>
		                <div class="praises-total" uid="${sessionScope.uid }" sayid="${sayVo.say.id}" total="${sayVo.count}" style="display: none;"></div>
		               	
		                <div class="comment-list">
		                <c:forEach items="${sayVo.reviewUserVos }" var="reviewUserVo">
		                	<c:choose>
				   				<c:when test="${reviewUserVo.student!=null}"> 
				   				<div class="comment-box clearfix" user="other">
		                        <img class="myhead" src="${reviewUserVo.student.photo}" alt=""/>
		                        <div class="comment-content">
		                            <p class="comment-text">
		                            <c:choose>
										<c:when test="${reviewUserVo.student.uid!=sessionScope.uid}"> 
											<a href="say/findotherUser.action?uid=${reviewUserVo.student.uid}"><span class="user">${reviewUserVo.student.name}：</span></a>
										</c:when>
										<c:otherwise>
											<span class="user">我：</span>
										</c:otherwise>
									</c:choose>
					            </c:when>
							    <c:otherwise>
							    <div class="comment-box clearfix" user="other">
		                        <img class="myhead" src="${reviewUserVo.graduate.photo}" alt=""/>
		                        <div class="comment-content">
		                            <p class="comment-text">
		                            <c:choose>
										<c:when test="${reviewUserVo.graduate.uid!=sessionScope.uid}"> 
											<a href="say/findotherUser.action?uid=${reviewUserVo.graduate.uid}"><span class="user">${reviewUserVo.graduate.name}：</span></a>
										</c:when>
										<c:otherwise>
											<span class="user">我：</span>
										</c:otherwise>
									</c:choose>
		                            
							    </c:otherwise>
				 			</c:choose>
		                            	${reviewUserVo.review.content}</p>
		                            <p class="comment-time">
		                                ${reviewUserVo.review.createtime}
		                                <a href="javascript:;" class="comment-praise" total="0" my="0">赞</a>
		                                <a href="javascript:;" class="comment-operate">回复</a>
		                            </p>
		                        </div>
		                    </div>
		                    
		                   </c:forEach> 
		                </div>
		                <div class="text-box">
		                    <textarea class="comment" autocomplete="off" uid="${sessionScope.uid }" sayid="${sayVo.say.id}">评论…</textarea>
		                    <button class="btn ">回 复</button>
		                    <span class="word"><span class="length">0</span>/140</span>
		                </div>
		            </div>
		        </div>
		        </c:forEach>
		    </div>
		    <!-- 校友动态结束 -->
		    
		    
		    <!-- 可能认识的人 -->
		    <div class="right">
				<div class="right_one">
					<h2>热门文章</h2>
				<ul>
					<li><a href="#">◇ 做一颗成长路上的北极星——访机电工程学院“北极星”项目负责团队</a></li>
					<li><a href="#">◇ 心怀善念 助梦前行——“IT义锋”爱心实践团活动纪实</a></li>
					<li><a href="#">◇ 三大举措让学生“就业不再难”——我校全力推进毕业生就业工作纪实</a></li>
					<li><a href="#">◇ 美丽新疆 萦绕我心——文法学院第二届“新疆美”主题实践活动侧记</a></li>
					<li><a href="#">◇ 创先争优作表率  立足岗位育人才——访经济管理学院经济系教工党支部</a></li>
					<li><a href="#">◇ 扬帆起航绽放梦想——访我校“聚会邦”创新创业团队 </a></li>
				</ul>
				</div>
				<div class="right_two">
					<h2>近期校园活动</h2>
					<ul>
						<li><img src="img/art1.jpg" alt=""></li>
					</ul>
				</div>
			</div>
			<!-- 结束 -->
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/xiaoyou.js"></script>
	<script type="text/javascript" src="include/login.js"></script>
</body>
</html>