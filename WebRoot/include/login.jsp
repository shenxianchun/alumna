<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="loginbox">
<%
String number=(String)session.getAttribute("number");
String role=(String)session.getAttribute("role");
if(number!=null){%> 
<div class="login_after">
	<div class="login_box">
		<div class="logintitle">
			<img src="<%=session.getAttribute("photo") %>" alt="头像"/>
		</div>
		<div>
			<ul>
				<li class="myname"><%=session.getAttribute("name") %></li>
				<li>
					<span><%=session.getAttribute("entranceyear") %>级</span>
					<span><%=session.getAttribute("specialty") %></span>
				</li>
				<li>邮箱：<%=session.getAttribute("email") %></li>
				<li class="mysign">☆个性签名：<%=session.getAttribute("signature") %></li>
				<li style="margin-top: 17px;">
					<ul class="user_atten clearfix">
						<li>
							<strong>88</strong>
							<span>动态</span>
						</li>
						<li>
							<strong>128</strong>
							<span>赞</span>
						</li>
						<li>
							<strong>105</strong>
							<span>评论</span>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
<%}else{ %>
<div class="loginbox">
	<div class="logintitle">
		<img src="img/default_user.png" alt="头像"/>
	</div>
	<div>
		<form method="post" class="loginform" action="#">
			<dl class="top clearfix">
				<dd style="border-color: rgb(173, 182, 201);">
					<input type="text" name="numbers" class="inputtext" id="numbers" tabindex="1" placeholder="请输入学号" style="color: rgb(136, 136, 136);">
				</dd>
			</dl>
			<dl class="pwd clearfix">
				<dd style="border-color: rgb(173, 182, 201);">
					<input type="password" id="password" name="password" class="inputtext" tabindex="2" placeholder="请输入密码" >
				</dd>
			</dl>
				<div class="caps-lock-tips" id="capsLockMessage" style="display:none"></div>
			<dl class="savepassword clearfix">
				<dt>
					<label title="为了确保您的信息安全，请不要在网吧或者公共机房勾选此项！" for="autoLogin" class="labelCheckbox">
					<input type="checkbox" name="autoLogin" id="autoLogin" value="true" tabindex="4">下次自动登录
					</label>
				</dt>
				<dd>
					<span class="getpassword"><a href="#" stats="home_findpassword">忘记密码？</a></span>
				</dd>
			</dl>
		</form>
	</div>
	<div class="loginbutton">
		<div class="regnow">
			<input id="Button1" type="button" value="注册" onclick="ShowDiv('MyDiv','fade')">
			</div>
			<div class="loginSub">
				<input id="login" type="submit" value="登录" />
			</div>
		</div>
	</div>
	<!-- 注册框start -->
	<div id="fade" class="black_overlay">
	</div>
	<div id="MyDiv" class="white_content">
		<span style="float: right;" onclick="CloseDiv('MyDiv','fade')">关闭</span>
	<ul>
		<li>
			<label for="phone">&nbsp;&nbsp;学号&nbsp;</label>
			<input type="text" class="txt" id="rnumber" name="rnumber" placeholder="学号" regex="^1[345678]\d{9}$" />
		</li>
		<li>
			<label for="password">&nbsp;&nbsp;密码&nbsp;</label>
		 	<input type="password" class="txt" id="rpassword" name="rpassword" placeholder="password" regex="^\w{6,16}$" />
			<i class="judge" style="display:none; ">请填写6到16位任意字符！</i>
		</li>
		<li>
			<label for="password1">确认密码&nbsp;</label>
		 	<input type="password" class="txt" id="password1" name="password1" placeholder="password again" regex="^\w{6,16}$" />
			<i class="judge" style="display:none">请再一次输入</i>
			</li>
		</ul>
		<div class="choose">
			<label>请选择身份&nbsp;</label>
			<select id="role" class="txt">
				<option value="0"selected="">在校生</option>
				<option value="1">毕业生</option>
			</select><br>
			<input class="registNow" type="submit" id="registNow" value="立即注册" />
		</div>
	</div>
	<!-- 注册框start -->
<%}%>
	

