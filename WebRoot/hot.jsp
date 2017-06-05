<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>热门动态</title>
	<link rel="stylesheet" href="css/hot.css">

</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 顶部结束 -->
	    
	    <div class="concent">
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
		                <div class="praises-total" uid="${sessionScope.uid }" sayid="${sayVo.say.id}" total="${sayVo.count}" style="display: block;">${sayVo.count}个人觉得很赞</div>
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
		    <div class="right">
		    	<ul>
		    		<li>
		    			<img src="img/aaa.jpg" alt="">
		    			<a href="say/findSayAll.action?falg=flag" class="meau1">查看全部</a>
		    		</li>
		    		<li>
		    			<img src="img/aaa.jpg" alt="">
		    			<a href="say/findSayAll.action?falg=flag" class="meau2">最新发布</a>
		    		</li>
		    		<li>
		    			<img src="img/aaa.jpg" alt="">
		    			<a href="say/findCountloves.action" class="meau3">点赞最多</a>
		    		</li>
		    		<li>
		    			<img src="img/aaa.jpg" alt="">
		    			<a href="say/findCountreview.action" class="meau4">评论最多</a>
		    		</li>
		    	</ul>
		    </div>
	    </div>
	</div>
	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>