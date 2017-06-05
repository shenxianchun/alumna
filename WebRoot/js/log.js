$(function(){
	var ue = UE.getEditor('container');
	$("#save").click(function(){
		var title=$("#title").val();
		var content=ue.getContent();
		var a=ue.getPlainTxt();
		if(title==""){
			alert("标题不能为空");
			return;
		}if(a=='\n'){
			alert("文章内容不能为空");
			return;
		}
		var data  = {'title':title,'content':content}
		$.ajax({
			type:'post',
			url:'log/insertLog.action',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			//数据格式是json串
			success:function(data){//返回json结果
				alert("发表成功,请前往我的文章列表查看");
			}
		});
	})
	
})