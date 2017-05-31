$(function(){
	
	
	
	$.ajax({
		type:'post',
		url:'city/city.action',
		contentType:'application/json;charset=utf-8',
		//数据格式是json串
		success:function(data){//返回json结果
			for(var i=0;i<data.length;i++){
				$("#citylist").append("<div class='item' data-value='"+data[i].cityname+"'>"+data[i].cityname+"</div>");
			}
		}
	});
});