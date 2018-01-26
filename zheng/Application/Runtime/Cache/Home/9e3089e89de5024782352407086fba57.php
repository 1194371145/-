<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>郑州成功财经学院图书馆推荐系统</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/zheng/Application/Home/Public/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="http://localhost/zheng/Application/Home/Public/css/main.css"/>
    <script type="text/javascript" src="http://localhost/zheng/Application/Home/Public/js/libs/modernizr.min.js"></script>
    <script type="text/javascript">
function MM_validateForm() { //v4.0
  if (document.getElementById){
    var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
    for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=document.getElementById(args[i]);
      if (val) { nm=val.name; if ((val=val.value)!="") {
        if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
          if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
        } else if (test!='R') { num = parseFloat(val);
          if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
          if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
            min=test.substring(8,p); max=test.substring(p+1);
            if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
      } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
    } if (errors) alert('The following error(s) occurred:\n'+errors);
    document.MM_returnValue = (errors == '');
} }
    </script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">郑州成功财经学院</a></h1>
            <ul class="navbar-list clearfix">
                <li><a target="_blank" class="on" href="http://www.chenggong.edu.cn/">郑州成功财经学院</a></li>
                <li><a href="http://www.chenggong.edu.cn/cg_tsg/" >图书推荐系统</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href ='javascript:;' class='book'>图书馆首页</a></li>
                
                <li><a href ='javascript:;' class='show'>开发人员</a></li>

            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <!--/sidebar需要引入左侧文件在引入-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="http://localhost/blog/index.php/Admin/">首页</a><span class="crumb-step">&gt;</span><span>新增图书</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="" method="post" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red"></i>书名：</th>
                                <td>
                                    <input name="name" type="text" class="common-text required" id="name" value="" size="50">*
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>书号：</th>
                                <td>
                                    <input class="common-text required" id="shuhao" name="shuhao" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>作者：</th>
                                <td>
                                    <input class="common-text required" id="zuoze" name="zuoze" size="50" value="" type="text">*
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>出版社：</th>
                                <td>
                                    <input class="common-text required" id="chubanshe" name="chubanshe" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>荐书人：</th>
                                <td>
                                    <input class="common-text required" id="tuijianren" name="tuijianren" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>联系方式：</th>
                                <td>
                                    <input class="common-text required" id="tel" name="tel" size="50" value="" type="text">* 
                                </td>
                            </tr>
                           
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" id="send" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
     <div class="footer">
        <div align="center" class="copyright">郑州成功财经学院图书馆版权所有(C) 郑州成功财经学院网站开发小组技术支持  www.chenggong.edu.cn/cg_web</div>  
    </div>
</div>


</body>
<script type="text/javascript" src="/zheng/Public/Admin/js/jquery.js"></script>
<script type="text/javascript" src="/zheng/Public/Admin/plugin/layer/layer.js"></script>
<script>

//jQuery代码
////jQuery代码
$(function(){
    //给查看按钮绑定点击事件
    $('.book').on('click',function(){
layer.tips('感谢你的推荐', '.book');
    });
     $('.show').on('click',function(){
layer.tips('<strong>成功学院网站开发小组|九云科技</strong><br><p align="center">崔荣森，孙金科</p>', '.show', {
  tips: [1, '#3595CC'],
  time: 4000
});
    });

});
</script>
<script type="text/javascript">
$(function(){
        // $("form :input.required").each(function(){
        //     var $required = $("<strong class='high'> *</strong>"); //创建元素
        //     $(this).parent().append($required); //然后将它追加到文档中
        // });
         //文本框失去焦点后
        $('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             //验证用户名
             if( $(this).is('#tel') ){
                    if( this.value=="" || this.value.length < 11 ){
                        var errorMsg = '请输入至少11位.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                    }else{
                        var okMsg = '输入正确.';
                        $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                    }
             }
             //验证邮件
             // if( $(this).is('#email') ){
             //    if( this.value=="" || ( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value) ) ){
             //          var errorMsg = '请输入正确的E-Mail地址.';
             //          $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
             //    }else{
             //          var okMsg = '输入正确.';
             //          $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
             //    }
             // }
        }).keyup(function(){
           $(this).triggerHandler("blur");
        }).focus(function(){
             $(this).triggerHandler("blur");
        });//end blur

        
        //提交，最终验证。
         $('#send').click(function(){
                $("form :input.required").trigger('blur');
                var numError = $('form .onError').length;
                if(numError){
                    return false;
                } 
                alert("谢谢你的推荐.");
         });

        // //重置
        //  $('#res').click(function(){
        //         $(".formtips").remove(); 
        //  });
})
//]]>
</script>
</html>