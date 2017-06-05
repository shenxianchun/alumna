$(function(){
	$("#save").click(function(){
		var city=$("#city").val();
		var province=$("#province").val();
		var entranceyear=$("#entranceyear").val();
		var role=$("#role").val();
		alert(city);
		alert(role+entranceyear);
		$.ajax({
			type:'post',
			url:'user/SearchUserCity.action',
			contentType:'application/json;charset=utf-8',
			//数据格式是json串
			data:'{"city":"'+city+'","province":"'+province+'","entranceyear":"'+entranceyear+'","role":"'+role+'"}',
			success:function(data){//返回json结果
				alert(data);
				location.reload();
			}
		});
		
	})
})