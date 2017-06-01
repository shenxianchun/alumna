/**
 * Created by an.han on 14-2-20.
 */

window.onload = function () {
	
    var list = document.getElementById('list');
    var boxs = list.children;
    var num = boxs.length;
    var timer;

    //格式化日期
    function formateDate(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var h = date.getHours();
        var mi = date.getMinutes();
        m = m > 9 ? m : '0' + m;
        return y + '-' + m + '-' + d + ' ' + h + ':' + mi;
    }

    //删除节点
    function removeNode(node) {
    	
    	var close=node.getElementsByClassName('close')[0];
    	var id=close.getAttribute('sayid');
    	
//    	alert(id);
    	if(id!=null){
    		$(function(){
            	//传入数据到数据库
    			alert("删除的说说id:"+id);
            	$.ajax({
        			type:'post',
        			url:'say/deleteSay.action',
        			contentType:'application/json;charset=utf-8',
        			data:'{"id":"'+id+'"}',
        			//数据格式是json串
        			success:function(data){//返回json结果
        				
        			}
        		});
            });
    	}
    	
        node.parentNode.removeChild(node);
        num--;
    }

    /**
     * 赞分享
     * @param box 每个分享的div容器
     * @param el 点击的元素
     */
    //-------------------------点赞start-------------------------------------------------
    function praiseBox(box, el) {
        var txt = el.innerHTML;
        var praisesTotal = box.getElementsByClassName('praises-total')[0];
        var oldTotal = parseInt(praisesTotal.getAttribute('total'));
        var uid=parseInt(praisesTotal.getAttribute('uid'));
        var sayid=parseInt(praisesTotal.getAttribute('sayid'));
       // alert(uid);
        if(isNaN(uid)){
        	alert("你还未登陆");
        	return;
        }
        
        var newTotal;
        if (txt == '赞') {//点赞触发
            newTotal = oldTotal + 1;
//          alert(el.parentNode.parentNode);
            $(function(){
            	//传入数据到数据库
            	$.ajax({
        			type:'post',
        			url:'say/insertLove.action',
        			contentType:'application/json;charset=utf-8',
        			data:'{"uid":"'+uid+'","sayid":"'+sayid+'"}',
        			//数据格式是json串
        			success:function(data){//返回json结果
        				alert(data);
        			}
        		});
            });
            praisesTotal.setAttribute('total', newTotal);
            praisesTotal.innerHTML = (newTotal == 1) ? '我觉得很赞' : '我和' + oldTotal + '个人觉得很赞';
            el.innerHTML = '取消赞';
        }
        else {
            newTotal = oldTotal - 1;
            $(function(){
            	//传入数据到数据库
            	$.ajax({
        			type:'post',
        			url:'say/deleteLove.action',
        			contentType:'application/json;charset=utf-8',
        			data:'{"uid":"'+uid+'","sayid":"'+sayid+'"}',
        			//数据格式是json串
        			success:function(data){//返回json结果
        				alert(data);
        			}
        		});
            });
            
            praisesTotal.setAttribute('total', newTotal);
            praisesTotal.innerHTML = (newTotal == 0) ? '' : newTotal + '个人觉得很赞';
            el.innerHTML = '赞';
        }
        praisesTotal.style.display = (newTotal == 0) ? 'none' : 'block';
    }
  //-----------------------------点赞取消赞---------------------------------------------
    /**
     * 发评论
     * @param box 每个分享的div容器
     * @param el 点击的元素
     */
  //-------------------评论start----------------------
    function reply(box, el) {//评论
        var commentList = box.getElementsByClassName('comment-list')[0];
        var textarea = box.getElementsByClassName('comment')[0];
        
        var uid=parseInt(textarea.getAttribute('uid'));//用户id
        var sayid=parseInt(textarea.getAttribute('sayid'));//说说id
        var content=textarea.value;//发表的内容
        if(isNaN(uid)){
        	alert("你还未登陆");
        	return;
        }else{
        	$(function(){
            	//传入数据到数据库
            	$.ajax({
        			type:'post',
        			url:'say/insertReview.action',
        			contentType:'application/json;charset=utf-8',
        			data:'{"uid":"'+uid+'","sayid":"'+sayid+'","content":"'+content+'"}',
        			//数据格式是json串
        			success:function(data){//返回json结果
//        				alert(data);
        			}
        		});
            });
        }
        
        var commentBox = document.createElement('div');
        commentBox.className = 'comment-box clearfix';
        commentBox.setAttribute('user', 'self');
        commentBox.innerHTML =
            '<img class="myhead" src="img/my.jpg" alt=""/>' +
                '<div class="comment-content">' +
                '<p class="comment-text"><span class="user">我：</span>' + textarea.value + '</p>' +
                '<p class="comment-time">' +
                formateDate(new Date()) +
                '<a href="javascript:;" class="comment-praise" total="0" my="0" style="">赞</a>' +
                '<a href="javascript:;" class="comment-operate">删除</a>' +
                '</p>' +
                '</div>'
        commentList.appendChild(commentBox);
        textarea.value = '';
        textarea.onblur();
    }
  //-------------------评论end----------------------
    /**
     * 赞回复
     * @param el 点击的元素
     */
    function praiseReply(el) {
        var myPraise = parseInt(el.getAttribute('my'));
        var oldTotal = parseInt(el.getAttribute('total'));
        var newTotal;
        if (myPraise == 0) {
            newTotal = oldTotal + 1;
            el.setAttribute('total', newTotal);
            el.setAttribute('my', 1);
            el.innerHTML = newTotal + ' 取消赞';
        }
        else {
            newTotal = oldTotal - 1;
            el.setAttribute('total', newTotal);
            el.setAttribute('my', 0);
            el.innerHTML = (newTotal == 0) ? '赞' : newTotal + ' 赞';
        }
        el.style.display = (newTotal == 0) ? '' : 'inline-block'
    }

    /**
     * 操作留言
     * @param el 点击的元素
     */
    function operate(el) {
        var commentBox = el.parentNode.parentNode.parentNode;
        var box = commentBox.parentNode.parentNode.parentNode;
        var txt = el.innerHTML;
        var user = commentBox.getElementsByClassName('user')[0].innerHTML;
        var textarea = box.getElementsByClassName('comment')[0];
        if (txt == '回复') {
            textarea.focus();
            textarea.value = '回复' + user;
            textarea.onkeyup();
        }
        else {
            removeNode(commentBox);
        }
    }
    // list.parentNode.children[2].onclick = function(){
    //     num++;
    // }
    function mHover () {
    //把事件代理到每条分享div容器
        for (var i = 0; i < num; i++) {

            //点击
            boxs[i].onclick = function (e) {
                e = e || window.event;
                var el = e.srcElement;
                switch (el.className) {

                    //关闭分享
                    case 'close':
                        removeNode(el.parentNode);
                        break;

                    //赞分享
                    case 'praise':
                        praiseBox(el.parentNode.parentNode.parentNode, el);
                        break;

                    //回复按钮蓝
                    case 'btn':
                        reply(el.parentNode.parentNode.parentNode, el);
                        break

                    //回复按钮灰
                    case 'btn btn-off':
                        clearTimeout(timer);
                        break;

                    //赞留言
                    case 'comment-praise':
                        praiseReply(el);
                        break;

                    //操作留言
                    case 'comment-operate':
                        operate(el);
                        break;
                    //
                }
            }
        
            //评论
            var textArea = boxs[i].getElementsByClassName('comment')[0];

            //评论获取焦点
            textArea.onfocus = function () {
                this.parentNode.className = 'text-box text-box-on';
                this.value = this.value == '评论…' ? '' : this.value;
                this.onkeyup();
            }

            //评论失去焦点
            textArea.onblur = function () {
                var me = this;
                var val = me.value;
                if (val == '') {
                    timer = setTimeout(function () {
                        me.value = '评论…';
                        me.parentNode.className = 'text-box';
                    }, 200);
                }
            }

            //评论按键事件
            textArea.onkeyup = function () {
                var val = this.value;
                var len = val.length;
                var els = this.parentNode.children;
                var btn = els[1];
                var word = els[2];
                if (len <=0 || len > 140) {
                    btn.className = 'btn btn-off';
                }
                else {
                    btn.className = 'btn';
                }
                word.innerHTML = len + '/140';
            }
        }

    }
    mHover ();
    var newtext = document.getElementsByClassName('newcomment')[0];
    var newbtn = document.getElementsByClassName('newbtn')[0];
    //发表获取焦点
    newtext.onfocus = function () {
        // this.parentNode.className = 'text-box text-box-on';
        // this.value = this.value == '评论…' ? '' : this.value;
        this.value = this.value == '说点什么…' ? '' : this.value;
        this.onkeyup();
    }
    //发表失去焦点
    newtext.onblur = function () {
        var me = this;
        var val = me.value;
        if (val == '') {
            timer = setTimeout(function () {
                me.value = '说点什么…';
                me.parentNode.className = 'newtext-box';
            }, 200);
        }
    }
    //发表按键事件
    newtext.onkeyup = function () {
        var val = this.value;
        var len = val.length;
        var els = this.parentNode.children;
        var btn = els[2];
        var word = els[3];
        if (len <=0 || len > 140) {
            btn.className = 'newbtn newbtn-off';
        }
        else {
            btn.className = 'newbtn';
        }
        word.innerHTML = len + '/140';
    }
    //发表按钮事件---------------个人发表说说----------------------------------------------
    newbtn.onclick = function(){
        var box = this.parentNode.parentNode.children[1];
        var flag = box.children[0];
        var commentBox = document.createElement('div');
        
        var uid=parseInt(newtext.getAttribute('uid'));//用户id
        
        var content=newtext.value;//发表的内容
        
        var name=$("#name").text();
        
        if(isNaN(uid)){
        	alert("你还未登陆");
        	return;
        }
        if(content=="说点什么…"){
        	alert("请填写发表内容");
        	return;
        }
        var fileList = document.getElementById("fileimg").files;
        
       /* alert(fileList[0].name);*/
        $(function(){
        	//传入数据到数据库
        	$.ajax({
    			type:'post',
    			url:'say/insertSay.action',
    			contentType:'application/json;charset=utf-8',
    			data:'{"uid":"'+uid+'","content":"'+content+'","image":"'+fileList[0].name+'"}',
    			//数据格式是json串
    			success:function(data){//返回json结果
//    				alert(data);
    				location.reload();
    			}
    		});
        });
        
        commentBox.className = 'box clearfix';
        commentBox.innerHTML =
        '<a class="close" href="javascript:;">×</a>'+
        '<img class="head" src="img/my.jpg" alt=""/>'+
        '<div class="content">'+
            '<div class="main">'+
                '<p class="txt">'+
                    '<span class="user">'+name+'：</span>'+ newtext.value +
            '</div>'+
            '<div class="info clearfix">'+
                '<span class="time">'+ formateDate(new Date()) +'</span>'+
                '<a class="praise" href="javascript:;">赞</a>'+
            '</div>'+
            '<div class="praises-total" total="0" style="display: none;"></div>'+
            '<div class="comment-list"></div>'+
            '<div class="text-box">'+
                '<textarea class="comment" autocomplete="off">评论…</textarea>'+
                '<button class="btn">回 复</button>'+
                '<span class="word"><span class="length">0</span>/140</span>'+
            '</div>'+
        '</div>'
        flag.parentNode.insertBefore(commentBox, flag);
        newtext.value = '说点什么…';
        this.parentNode.children[3].innerHTML = '0/140';
        num++;
        mHover ();
    }
  //发表按钮事件---------------个人发表说说end----------------------------------------------
}

