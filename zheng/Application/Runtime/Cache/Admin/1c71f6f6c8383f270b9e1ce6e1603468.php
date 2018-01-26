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
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.html">首页</a></li>
                <li><a href="#" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
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
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="/zheng/index.php/Admin/Index/lst"><i class="icon-font">&#xe008;</i>学生推荐*</a></li>
                        <li><a href="design.html"><i class="icon-font">&#xe004;</i>管理员管理*</a></li>
                        <!-- <li><a href="##"><i class="icon-font">&#xe004;</i>留言管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe012;</i>评论管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe033;</i>广告管理</a></li> -->
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="system.html"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                        <li><a href="system.html"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">链接管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="/jscss/admin/design/index" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="">
                                    <option value="">全部</option>
                                    <option value="19">精品界面</option><option value="20">推荐界面</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" action="/zheng/index.php/Admin/Index/sort" method="post">
            
                <div class="result-title">
                    <div class="result-list">
                        <a href="/zheng/index.php/Admin/Index/add"><i class="icon-font"></i>新增链接</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>
                        <input type="submit" class="btn btn-primary btn2" value="更新排序"></a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            
                            <th>书名</th>
                            <th>书号</th>
                            <th>作者</th>
                            <th>荐书人</th>
                            <th>联系方式</th>
                            <th>添加时间</th>
                        </tr>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <td><?php echo ($vo["id"]); ?></td>
                            <td title="<?php echo ($vo["title"]); ?>"><a target="_blank" href="#" title="<?php echo ($vo["title"]); ?>"><?php echo ($vo["title"]); ?></a> … <!-- <a class="link-update" href="/zheng/index.php/Admin/Index/edit/id/<?php echo ($vo["id"]); ?>">查看内容</a> -->
                            </td>
                             <td title="<?php echo ($vo["url"]); ?>"><a target="_blank" href="#" title="<?php echo ($vo["url"]); ?>"><?php echo ($vo["url"]); ?></a> … 
                            </td>
                            </td>
                             <td title="<?php echo ($vo["desc"]); ?>"><?php echo ($vo["desc"]); ?>
                            </td>
                            
                            <td>
                                <a class="link-update" href="/zheng/index.php/Admin/Index/edit/id/<?php echo ($vo["id"]); ?>">修改</a>|
                                <a class="link-del" onclick="return confirm('确定删除么')" href="/zheng/index.php/Admin/Index/del/id/<?php echo ($vo["id"]); ?>">删除</a>
                            </td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        
                        
                    </table>
                    <div class="list-page"> 2 条 1/1 页<?php echo ($page); ?></div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>