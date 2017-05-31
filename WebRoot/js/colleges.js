$(function(){
	$.ajax({
		type:'post',
		url:'city/querycolleges.action',
		contentType:'application/json;charset=utf-8',
		//数据格式是json串
		success:function(data){//返回json结果
			for(var i=0;i<data.length;i++){
				$("#collegeslist").append("<div class='item' data-value='"+data[i].name+"'>"+data[i].name+"</div>");
			}
		}
	});
	
	 $("#colleges").change(function(){
		 $("#speciality").val('');
		 $("#speciality").next(".text").text('选择专业');
		 $("#specialitylist").empty();
		 var name=$("#colleges").val();
		// alert(city);
		 $.ajax({
				type:'post',
				url:'city/queryspeciality.action',
				contentType:'application/json;charset=utf-8',
				//数据格式是json串，市区
				data:'{"name":"'+name+'"}',
				success:function(data){//返回json结果
					for(var i=0;i<data.length;i++){
						$("#specialitylist").append("<div class='item' data-value='"+data[i].name+"'>"+data[i].name+"</div>");
					}
				}
			});
	 });
})