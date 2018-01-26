var slider = document.getElementById("slider");
var lis = document.getElementsByClassName("tou1");
var lun = document.getElementsByClassName("lun");

for(var i = 0; i < lis.length; i++) {
	//为每个li添加一个自定义属性值
	lis[i].index = i;

	var timer = null;

	lis[i].onclick = function() {
		//t-起始时间,b-起始值,c-变化量,d-结束时间		
		var t = 0;
		var d = 30;
		var b = slider.offsetLeft;
		var c = slider.offsetWidth * this.index - slider.offsetLeft;

		clearInterval(timer);
		timer = setInterval(function() {

			t++;
			if(t >= d) {
				clearInterval(timer);
			}
			slider.style.left = Tween.Elastic.easeOut(t, b, c, d) + "px";
		}, 30)
		for(var i = 0; i < lis.length; i++) {
			lun[i].style.display = "none";
			lis[i].style.color = "";
		}
		lun[this.index].style.display = "block";
		lis[this.index].style.color = "orange"
	}
}
//////懒加载
var container=document.getElementById("container");
var imgs = container.getElementsByTagName("img");

    imgs[0].src = imgs[0].getAttribute("c");
	imgs[1].src = imgs[1].getAttribute("c");
	imgs[2].src = imgs[2].getAttribute("c");
	imgs[3].src = imgs[3].getAttribute("c");
	imgs[4].src = imgs[4].getAttribute("c");

//  console.log(imgs[1].offsetTop)
//查找定位元素的offsetTop  -obj:当前元素
function offset(obj) {
	var l = obj.offsetLeft;
	var t = obj.offsetTop;
	//
	while(obj) {
		l += obj.offsetLeft;
		t += obj.offsetTop;
		obj = obj.offsetParent;
			// console.log(obj)
	}
	// offsetParent
	return {
		left: l,
		top: t
	};
}
var big = document.getElementById("container")
big.onscroll = function() {

	var scrollTop = big.scrollTop

	var ch = big.clientHeight;

	// console.log(oh);		
	for(var i = 0; i < imgs.length; i++) {

		var oh = offset(imgs[i]).top;
		if(oh < ch + scrollTop + 245) {
			// console.log(imgs[i].getAttribute("c"));	
			imgs[i].src = imgs[i].getAttribute("c");
		}
	}
}

/* 滚动监听 */
// 定义一个获取所有div的距离高度
var arrOffsetTop = [

];

for (var i = 0; i < $('.section').length; i++) {
	     arrOffsetTop.push($('.section')[i].offsetTop) 
	    
}

// 滚动事件(每次滚动都做一次循环判断)
$("#container").scroll(function() {
	for(var i = 0; i < $('.section').length; i++) {

		if($(this).scrollTop() > arrOffsetTop[i] - 400) { // 减去一个固定量，是定位准确点
			$('#nav li').eq(i).addClass('current').siblings().removeClass('current');
		}
	}
});                                      
/* 点击事件 */
$('#nav li').click(function() {
	$(this).addClass('current').siblings().removeClass('current');
	$('#container').animate({
		scrollTop: arrOffsetTop[$(this).index()-300]
	}, 10);
});
       
function addFly(event) {
	$('.u-flyer').remove();
	var offset = $('#total').offset(),
		flyer = $('<img class="u-flyer" src="static/pro/img/cai.jpg"/>');
	flyer.fly({
		start: {
			left: event.pageX - 40,
			top: event.pageY - 20
		},
		end: {
			left:offset.left,
			top:offset.top,
			width:24,
			height:24,
		}
	});
}
                  
$(function() {
	$(".add").on("click", function() {
		addFly(event);
	})
})
   
   window.onscroll=function(){
	  var sc=document.body.scrollTop||document.documentElement.scrollTop;
	       	if(sc>0){
	       		$("header").css({
	       			"background":"white",
	       			"opacity":"0.5"
	       		})
	       	}  else if(sc==0){
	       		$("header").css({
	       			"background":"#6a3726",
	       			"opacity":"1"
	       		} 			
	       		)
	       	}    
	  }                                      

              

  