$(function(){
	$("#edit_button").click(function(){
		var name=$("#username").val();
		var sex=$("#sex").val();
		if($("#province").val()==""){
			var address=$("#city").val()+$("#province").val();
		}else{
			var address=$("#city").val()+"-"+$("#province").val();
		}
		var entranceyear=$("#entranceyear").val();
		var courtyard=$("#colleges").val();
		var specialty=$("#specialty").val();
		var banji=$("#banji").val();
		var birthday=$("#birthday").val();
		var signature=$("#signature").val();
		var interest=$("#interest").val();
		var tell=$("#tell").val();
		var email=$("#email").val();
		var company=$("#company").val();
		var job=$("#job").val();
		var worktime=$("#worktime").val();
		
		$.ajax({
			type:'post',
			url:'user/updateGraduate.action',
			contentType:'application/json;charset=utf-8',
			//数据格式是json串
			data:'{"name":"'+name+'","sex":"'+sex+'","address":"'+address+'","entranceyear":"'+entranceyear+'","courtyard":"'+courtyard+'","specialty":"'+specialty+'","banji":"'+banji+'","birthday":"'+birthday+'","signature":"'+signature+'","interest":"'+interest+'","tell":"'+tell+'","email":"'+email+'","company":"'+company+'","job":"'+job+'","worktime":"'+worktime+'"}',
			success:function(data){//返回json结果
				location.reload();
			}
		});
		
	});
	
});