if(/Android (\d+\.\d+)/.test(navigator.userAgent)) {
	var version = parseFloat(RegExp.$1);
	if(version > 2.3) {
		var phoneScale = parseInt(window.screen.width) / 750;
		document.write('<meta name="viewport" content="width=750, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
	} else {
		document.write('<meta name="viewport" content="width=750, target-densitydpi=device-dpi">');
	}
} else {
	document.write('<meta name="viewport" content="width=750, user-scalable=no, target-densitydpi=device-dpi">');
}
window.onload=function(){
	var box=document.getElementById("box");
	var images=box.getElementsByTagName("li");
	var box1=document.getElementById("box1");
	var images1=box1.getElementsByTagName("li");
	var starshow=0;
	for(var i=0;i<images.length;i++){
		images[i].onmouseover=(function(num){
			return function(){
				for(var j=0;j<images.length;j++){
					if(j<=num){
						images[j].className="imageOne";
					}else{
						images[j].className="image";
					}
				}
			}
		}(i));
		images[i].onmouseup=(function(i){
			return function(){
				starshow=1+i;
			}
		}(i));
	}
	starshow=0;
	for(var i=0;i<images1.length;i++){
		images1[i].onmouseover=(function(num){
			return function(){
				for(var j=0;j<images1.length;j++){
					if(j<=num){
						images1[j].className="imageOne";
					}else{
						images1[j].className="image";
					}
				}
			}
		}(i));
		images1[i].onmouseup=(function(i){
			return function(){
				starshow=1+i;
			}
		}(i));
	}
}