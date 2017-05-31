$(function(){
	var uid=$("#persion").prop("class");
	if(uid=="null"){
		alert("你还未登录");
		window.location="/alumna/";//重定向
		return;
	}
})