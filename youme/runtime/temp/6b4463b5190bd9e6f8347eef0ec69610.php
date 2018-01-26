<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\phpStudy\WWW\youme\public/../application/admin\view\admin\edit.html";i:1469349963;s:70:"D:\phpStudy\WWW\youme\public/../application/admin\view\Public\top.html";i:1469355121;s:71:"D:\phpStudy\WWW\youme\public/../application/admin\view\Public\left.html";i:1469328218;}*/ ?>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/">管理员管理</a><span class="crumb-step">&gt;</span><span>修改管理员</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="" method="post" >
                    <input type="hidden" name="id" value="<?php echo $admins['id']; ?>">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th width="10%"><i class="require-red">*</i>用户名：</th>
                                <td>
                                    <input class="common-text required" id="username" name="username" size="50" value="<?php echo $admins['username']; ?>" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>密码：</th>
                                <td><input class="common-text" name="password" size="50" value="" type="text"><i class="require-red">*</i>留空则表示不修改密码 </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>