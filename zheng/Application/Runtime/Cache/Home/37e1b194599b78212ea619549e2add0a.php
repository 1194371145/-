<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>郑州成功财经学院图书馆推荐系统</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/zheng/Application/Home/Public/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="http://localhost/zheng/Application/Home/Public/css/main.css"/>
    <script type="text/javascript" src="http://localhost/zheng/Application/Home/Public/js/libs/modernizr.min.js"></script>

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
            <div class="crumb-list"><i class="icon-font"></i><a href="http://www.chenggong.edu.cn/cg_tsg/">首页</a><span class="crumb-step">&gt;</span><span>图书</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="" method="post" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                        <tbody>
                           <div align="center" class="page-header">
  <h1>谢谢你的推荐 <small>该图书会在一定时间内被图书馆采纳</small></h1>
</div>

                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
     
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
layer.tips('<strong>成功学院网站开发小组</strong><br><p align="center">小森</p>', '.show', {
  tips: [1, '#3595CC'],
  time: 4000
});
    });

});
</script>
</html>