$(function(){
	$("#login").click(function(){
		var number=$("#numbers").val();
		var password=$("#password").val();
		if(number==""){
			alert("请输入学号");
			return;
		}
		if(password==""){
			alert("请输入密码");
			return;
		}
		$.ajax({
			type:'post',
			url:'user/findLogin.action',
			contentType:'application/json;charset=utf-8',
			data:'{"number":"'+number+'","password":"'+password+'"}',
			//数据格式是json串
			success:function(data){//返回json结果
				alert(data);
				location.reload();
			}
		});
	});
	$("#registNow").click(function(){
		var number=$("#rnumber").val();
		var password=$("#rpassword").val();
		var password1=$("#password1").val();
		var role=$("#role").val();
		if(number==""){
			alert("请输入学号");
			return;
		}
		if(password==""){
			alert("请输入密码");
			return;
		}
		if(password1==""){
			alert("请再次输入密码");
			return;
		}
		if(password1!=password){
			alert("两次输入的密码不一致");
			return;
		}
		$.ajax({
			type:'post',
			url:'user/insertUser.action',
			contentType:'application/json;charset=utf-8',
			data:'{"number":"'+number+'","password":"'+password+'","role":"'+role+'"}',
			//数据格式是json串
			success:function(data){//返回json结果
				if(data){
					alert("注册成功");
					window.location="personal.html";//重定向
				}else{
					alert("注册失败,用户已存在");
					location.reload();
				}
			}
		});
		
	});
	$("#tui").click(function(){
		$.ajax({
			type:'post',
			url:'user/logout.action',
			contentType:'application/json;charset=utf-8',
			//数据格式是json串
			success:function(data){//返回json结果
				alert(data);
				location.reload();
			}
		});
	});
	
})