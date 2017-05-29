var curIndex = 0;
var arr = new Array(); 
    arr[0] = "img/101.jpg"; 
    arr[1] = "img/102.jpg"; 
    arr[2] = "img/103.jpg"; 
    arr[3] = "img/104.jpg";
    arr[4] = "img/105.jpg";
setInterval(changeImg,3000); 
function changeImg() {
  var img = document.getElementById("imglist"); 
  var number=document.getElementById("number");
  var n=number.getElementsByTagName("li"); 
    if (curIndex == arr.length-1) {
      curIndex = 0;
      //alert(n[curIndex].innerHTML);
      n[curIndex].style.background="#00BEB7";
      for(var j=1;j<5;j++){
       n[j].style.background="#95988B";
      }
    } else {
      curIndex += 1; 
      //alert(n[curIndex].innerHTML);
      n[curIndex].style.background="#00BEB7";
      n[0].style.background="#95988B";
      if(curIndex==1){
        n[2].style.background="#95988B";
        n[3].style.background="#95988B";
        n[4].style.background="#95988B";
      }
      if(curIndex==2){
       n[1].style.background="#95988B";
       n[3].style.background="#95988B";
        n[4].style.background="#95988B";
      }
      if(curIndex==3){
        n[1].style.background="#95988B";
        n[2].style.background="#95988B";
        n[4].style.background="#95988B";
      }
      if(curIndex==4){
        n[1].style.background="#95988B";
        n[2].style.background="#95988B";
        n[3].style.background="#95988B";
      }
    } 
  img.src = arr[curIndex]; 
}

 
//弹出隐藏层
function ShowDiv(show_div,bg_div){
document.getElementById(show_div).style.display='block';
document.getElementById(bg_div).style.display='block' ;
var bgdiv = document.getElementById(bg_div);
bgdiv.style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
$("#"+bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
document.getElementById(show_div).style.display='none';
document.getElementById(bg_div).style.display='none';
};