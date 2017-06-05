<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>他人主页</title>
	<link rel="stylesheet" href="css/otherperson.css">
</head>
<body>
    <div class="bigbox">
    	<!-- 顶部开始 -->
		<%@include file="include/top.jsp" %>
	    <!-- 导航条结束 -->
	    <div class="box">
	    
	    	<div class="left">
	    	
               	<div class="person">
    			<img src="${sessionScope.user.photo}" alt="头像">
    			<p><a href="javascript:void(0);">${sessionScope.user.name}</a>
    			<span>${fn:substring(sessionScope.user.entranceyear,0,4)}</span></p>
	    	</div>
	    		<!-- 他人资料部分 -->
    		<div class="leftlist">
    			<ul>
    				<li>性别：<span>${sessionScope.user.sex}</span></li>
    				<li>入学年份：<span>${fn:substring(sessionScope.user.entranceyear,0,4)}</span></li>
    				<li>专业：<span>${sessionScope.user.specialty}</span></li>
    				<li>班级：<span>${sessionScope.user.banji}</span></li>
    				<li>生日：<span>${sessionScope.user.birthday}</span></li>
    				<li>个性签名：</br><span>${sessionScope.user.signature}</span></li>
    				<li>电话：</br><span>${sessionScope.user.tell}</span></li>
    				<li>邮箱：</br><span>${sessionScope.user.email}</span></li>
    				<!-- 毕业生 -->
    				<li>现居地：<span>${sessionScope.user.address}</span></li>
    				
    				<c:choose>
		   				<c:when test="${sessionScope.roles!=0}"> 
                       		<li>公司：<span>${sessionScope.user.company}</span></li>
    						<li>职位：<span>${sessionScope.user.job}</span></li>
    						<li>工作经验：<span>${sessionScope.user.worktime}年</span></li>
                        </c:when>
                       </c:choose>
    			</ul>
    		</div>
	    		<!-- 他人资料部分 -->
	    		
	    		<!--  -->
	    		
	    		
	    		
	    	</div>
	    	
	    	
	    	
	    	
	    	<div class="middle">
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
			                       		<a href="say/findotherUser.action?uid=${sayVo.graduate.uid}"><span class="user">${sayVo.graduate.name}：</span></a>
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
											<a href="say/findotherUser.action?uid=${reviewUserVo.student.uid}"><span class="user">${reviewUserVo.student.name}</span></a>
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
</body>
</html>