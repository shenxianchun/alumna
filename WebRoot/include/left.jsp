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
  				<li>
  					<form action="upload.jsp" method="post" enctype="multipart/form-data">
						<input type="file" name="file" id="file" onchange="uploadFile()" style="display:none">
					</form>
  					<a href="javascript:void(0);" onclick="openFileDialog()" class="uploadbtn">上传头像</a>
  				</li>
  				<li><a href="user/findUser.action">编辑资料</a></li>
  				<li><a href="#">发表文章</a></li>
  				<li><a href="#">我的相册</a></li>
  				<li><a href="#">找校友</a></li>
  				<li><a href="#">找同城</a></li>
  			</ul>
  		</div>
  	</div>
<script type="text/javascript">
function openFileDialog(){
	var ie=navigator.appName=="Microsoft Internet Explorer"?true:false;
	if(ie){//如果是ie浏览器
		document.getElementById("file").click();
	}else{
	//自定义事件es5中的内容
		var a = document.createEvent("MouseEvents");
		a.initEvent("click",true,true);
		document.getElementById("file").dispatchEvent(a);
	}
};
function uploadFile(){
	//如果拿到我们选择的文件，然后通过ajax上传
	var fileList = document.getElementById("file").files;
	//alert(fileList[0].name+"==="+fileList[0].type+"==="+fileList[0].size);//拿到文件的基本信息
	
	var end='';
	if(fileList[0].type=='image/jpeg'){
		end='.jpg';
	}else if(fileList[0].type=='image/png'){
		end='.png';
	}
	else if(fileList[0].type=='image/gif'){
		end='.gif';
	}else{
		alert("不是图片");
	}
	if(fileList[0].type=='image/jpeg'||fileList[0].type=='image/png'||fileList[0].type=='image/gif'){
		var formData = new FormData();
		formData.append("doc",fileList[0]);
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
			//进行数据的解析
				//alert(xhr.responseText);
				var text = xhr.responseText.trim();//trim() 去掉前后空格
				//alert(text);
				var jsonData = eval("("+text+")");
				//alert(jsonData.name);
				var html="";
				
				if(jsonData.ext==".jpg"){
					flag=1;
					html="<img src='"+jsonData.fname+"'/>";
				}else{
					flag=0;
					html = jsonData.name;
				}
				document.getElementById("console").innerHTML += "<div>"+html+"</div>";
			}
		}
		/* xhr.open("post","user/userImg.action",true);//上传  */
		xhr.open("post","upload.jsp",true);//上传 
		xhr.send(formData);
		/* alert(end); */
		$.ajax({
			type:'post',
			url:'user/updatePhoto.action',
			data:'{"num":"'+end+'"}',
			contentType:'application/json;charset=utf-8',
			//数据格式是json串
			success:function(data){//返回json结果
				/* alert(data); */
				location.reload();
			}
		});
	}
};
</script>
</body>
</html>