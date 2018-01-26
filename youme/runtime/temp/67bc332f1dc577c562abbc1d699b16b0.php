<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"D:\phpStudy\WWW\youme\public/../application/admin\view\cate\lst.html";i:1513520105;s:70:"D:\phpStudy\WWW\youme\public/../application/admin\view\Public\top.html";i:1469355121;s:71:"D:\phpStudy\WWW\youme\public/../application/admin\view\Public\left.html";i:1469328218;}*/ ?>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/static/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/static/admin/css/main.css"/>
    <script type="text/javascript" src="__PUBLIC__/static/admin/js/libs/modernizr.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a class="navbar-brand" href="index.html">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a href="index.html" class="on">首页</a></li>
                <li><a target="_blank" href="#">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="">管理员<?php echo session('username');?></a></li>
                <li><a href="<?php echo url('Admin/edit',array('id'=>session('id'))); ?>">修改密码</a></li>
                <li><a href="<?php echo url('Login/logout'); ?>">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
<div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font"></i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo url('cate/lst'); ?>"><i class="icon-font"></i>栏目管理</a></li>
                        <li><a href="<?php echo url('article/lst'); ?>"><i class="icon-font"></i>文章管理</a></li>
                        <li><a href="<?php echo url('link/lst'); ?>"><i class="icon-font"></i>友情链接</a></li>
                        <li><a href="design.html"><i class="icon-font"></i>留言管理</a></li>
                        <li><a href="design.html"><i class="icon-font"></i>评论管理</a></li>
                        <li><a href="design.html"><i class="icon-font"></i>广告管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font"></i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo url('admin/lst'); ?>"><i class="icon-font"></i>管理员管理</a></li>
                        <li><a href="system.html"><i class="icon-font"></i>系统设置</a></li>
                        <li><a href="system.html"><i class="icon-font"></i>清理缓存</a></li>
                        <li><a href="system.html"><i class="icon-font"></i>数据备份</a></li>
                        <li><a href="system.html"><i class="icon-font"></i>数据还原</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">栏目管理</span></div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="<?php echo url('add'); ?>"><i class="icon-font"></i>新增作品</a>
                        <a href="javascript:;" class="del"><i class="fa fa-edit"></i>批量删除</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                        
                            <th width="3%">ID</th>
                            <th width="10%" >栏目名称</th>
                            <th width="6%">栏目类型</th>
                            <th width="8%">操作</th>
                        </tr>
                        <?php if(is_array($cateres) || $cateres instanceof \think\Collection): $i = 0; $__LIST__ = $cateres;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>  
                            <td><?php echo $vo['id']; ?></td>
                            <td title="<?php echo $vo['catename']; ?>"><a target="_blank" href="#" title="<?php echo $vo['catename']; ?>"><?php echo $vo['catename']; ?></a> …
                            </td>
                            <td>
                            <?php if($vo['type'] == 0): ?> 列表栏目
                        <?php else: ?> 留言板
                            <?php endif; ?>
                            </td>
                           
                            <td><input type="checkbox" name="<?php echo $vo['id']; ?>" value="<?php echo $vo['id']; ?>"/>
                                <a class="link-update" href="<?php echo url('edit',array('id'=>$vo['id'])); ?>">修改</a>
                                <a class="link-del" onclick="return confirm('你确定要删除么');" href="<?php echo url('del',array('id'=>$vo['id'])); ?>">删除</a>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </table>
                   
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
<script type="text/javascript" src="__PUBLIC__/static/admin/jquery/jquery.js"></script>
<script type="text/javascript" src="__PUBLIC__/static/admin/jquery/common.js"></script>
<script type="text/javascript" src="__PUBLIC__/static/admin/jquery/WdatePicker.js"></script>
<script type="text/javascript" src="__PUBLIC__/static/admin/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
//jQuery代码
$(function(){
    //给删除按钮绑定点击事件
    $('.del').on('click',function(){
        //事件处理程序
        var idObj = $(':checkbox:checked'); //获取全部已经被选中的checkbox
        var id = '';    //接收处理后的部门id值，组成id1,id2,id3...
        //循环遍历idObj对象，获取其中的每一个值
        for (var i = 0; i < idObj.length; i++) {
            id += idObj[i].value + ',';
        }
        //去掉最后逗号
        id = id.substring(0,id.length - 1);
        //判断id
        if(id == ''){
            return false;
        }
        //带着参数跳转到del方法
        window.location.href = '/youme/public/admin/cate/del/id/' + id;
    });
});
</script>
</html>