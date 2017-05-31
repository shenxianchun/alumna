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
</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部结束 -->
	    <div class="box">
	    <!-- 个人主页左边导航栏start -->
	    	<%@include file="include/left.jsp" %>
	    <!-- 个人主页左边导航栏end -->
	    	<div class="middle">
	    		<div class="newtext-box">
		    		<img src="img/abc.png" alt="">
		    		<textarea class="newcomment" uid="${sessionScope.uid }">说点什么…</textarea>
		    		<button class="newbtn">发 表</button>
			        <span class="word"><span class="length">0</span>/140</span>
			    </div>

			    <div id="list">
			    	<c:forEach items="${sayVolist }" var="sayVo">
		        <div class="box clearfix">
		            <a class="close" sayid="${sayVo.say.id }" href="javascript:;" style="width:47px;">删除</a>
		            <c:choose>
				   <c:when test="${sayVo.student!=null}"> 
				   	 <img class="head" src="${sayVo.student.photo}" alt=""/>
		            <div class="content">
		                <div class="main">
		                    <p class="txt">
		                    	<c:choose>
					   				<c:when test="${sayVo.student.uid!=sessionScope.uid}"> 
			                       		<span class="user">${sayVo.student.name}：</span>
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
			                       		<span class="user">${sayVo.graduate.name}：</span>
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
											<span class="user">${reviewUserVo.student.name}</span>
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
											<span class="user">${reviewUserVo.graduate.name}：</span>
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
			    <div class="more">加载更多>></div>
	    	</div>
	    	<div class="right">
				<div class="right_one">
					<h2>可能认识的人</h2>
					<ul>
						<li class="clearfix">
							<div>
								<img src="img/1.jpg" alt="">
							</div>
							<a href="#">张三 </a><br>
							<span>☆ 没有学生学不会只有方法对不对。</span>
						</li>
						<li class="clearfix">
							<div>
								<img src="img/2.jpg" alt="">
							</div>
							<a href="#">李四 </a><br>
							<span>☆ 走自己的路让别人说去吧。</span>
						</li>
						<li class="clearfix">
							<div>
								<img src="img/3.jpg" alt="">
							</div>
							<a href="#">王五 </a><br>
							<span>☆ 编程虐我千百遍我待编程如初恋。</span>
						</li>
						<li class="clearfix">
							<div>
								<img src="img/4.jpg" alt="">
							</div>
							<a href="#">赵六 </a><br>
							<span>☆ 没有学生学不会只有方法对不对。</span>
						</li>
						<li class="clearfix">
							<div>
								<img src="img/1.jpg" alt="">
							</div>
							<a href="#">段七 </a><br>
							<span>☆ 走自己的路让别人说去吧。</span>
						</li>
					</ul>
				</div>
			</div>
	    </div>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="include/login.js"></script>
	<script type="text/javascript" src="js/say.js"></script>
</body>
</html>