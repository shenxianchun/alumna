<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/UploadImage/Submit.action" method="post" enctype="multipart/form-data">
	<input type="file" name="pictureFile"/>
	<input type="submit" value="上传">
</form>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$.ajax({
	type:'post',
	url:'say/findSayAll.action',
	contentType:'application/json;charset=utf-8',
	//数据格式是json串
	success:function(data){//返回json结果
		alert(data);
	}
});

</script>
</body>
</html>