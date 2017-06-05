$(function(){
	$("#save").click(function(){
		var courtyard=$("#colleges").val();
		var specialty=$("#specialty").val();
		var entranceyear=$("#entranceyear").val();
		var role=$("#role").val();
		
		alert(role+courtyard);
		$.ajax({
			type:'post',
			url:'user/SearchUser.action',
			contentType:'application/json;charset=utf-8',
			//数据格式是json串
			data:'{"courtyard":"'+courtyard+'","specialty":"'+specialty+'","entranceyear":"'+entranceyear+'","role":"'+role+'"}',
			success:function(data){//返回json结果
				alert(data);
				location.reload();
			}
		});
		
	})
})