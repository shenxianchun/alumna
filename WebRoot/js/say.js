/*$(function(){
	$.ajax({
		type:'post',
		url:'say/findSayAll.action',
		contentType:'application/json;charset=utf-8',
		//数据格式是json串
		success:function(data){//返回json结果
			
			for(var i=0;i<data.length;i++){
				var sum="";
				var top="";
				var bottom="";
				
				var name="",image="";
				if(data[i].student!=null){
					name=data[i].student.name;
					image=data[i].student.photo;
				}else{
					name=data[i].graduate.name;
					image=data[i].graduate.photo;
				}
				
				top="<div class='box clearfix'>" +
						"<a class='close' href='javascript:;'>×</a>" +
						"<img class='head' src='"+image+"' alt=''/>" +
						"<div class='content'><div class='main'>" +
						"<p class='txt'>" +
						"<span class='user'>"+name+"：</span>" +data[i].say.content+"</p>" +
						"<img class='pic' src='"+data[i].say.image+"' alt=''/></div>" +
						"<div class='info clearfix'>" +
						"<span class='time'>"+data[i].say.createtime+"</span>" +
						"<a class='praise' href='javascript:;'>赞</a></div>" +
						"<div class='praises-total' total='4' style='display: block;'>4个人觉得很赞</div>" +
						"<div class='comment-list'>"
				
				
				//alert(data[i].say.content+"：---》接下来就是评论了");
				var midden="";
				for(var j=0;j<data[i].reviewUserVos.length;j++){
					var reviewname="",reviewimage="";
					if(data[i].reviewUserVos[j].student!=null){
						reviewname=data[i].reviewUserVos[j].student.name;
						reviewimage=data[i].reviewUserVos[j].student.photo;
					}else{
						reviewname=data[i].reviewUserVos[j].graduate.name;
						reviewimage=data[i].reviewUserVos[j].graduate.photo;
					}
					midden=midden+"<div class='comment-box clearfix' user='self'>" +
							"<img class='myhead' src='"+reviewimage+"' alt=''/>" +
							"<div class='comment-content'><p class='comment-text'>" +
							"<span class='user'>"+reviewname+"</span>"+data[i].reviewUserVos[j].review.content+"</p>" +
							"<p class='comment-time'>"+data[i].reviewUserVos[j].review.createtime+"<a href='javascript:;' class='comment-praise' total='1' my='0' style='display: inline-block'>1 赞</a><a href='javascript:;' class='comment-operate'>删除</a></p></div></div>";
					
					//alert("评论内容是："+data[i].reviewUserVos[j].review.content);
				}
				bottom='</div><div class="text-box"><textarea class="comment" autocomplete="off">评论…</textarea><button class="btn ">回 复</button><span class="word"><span class="length">0</span>/140</span></div></div></div>';
				sum=top+midden+bottom;
				$("#list").append(sum);
			}
		}
	});
})*/