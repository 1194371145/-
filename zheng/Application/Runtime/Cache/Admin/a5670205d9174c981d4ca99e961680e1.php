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
                <li><a class="on" href="/zheng/index.php/Admin/index/index">首页</a></li>
                <li><a href="http://www.chenggong.edu.cn/cg_tsg/" >成功学院图书馆首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="/zheng/index.php/Admin/admin/index">管理员</a></li>
                
                <li><a href="/zheng/index.php/Admin/Login/logout">退出登录</a></li>
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
                        <li><a href="/zheng/index.php/Admin/Index/index"><i class="icon-font">&#xe008;</i>学生推荐*</a></li>
                        <li><a href="/zheng/index.php/Admin/Teacher/index"><i class="icon-font">&#xe004;</i>管理员推荐*</a></li>
                        <li><a href="/zheng/index.php/Admin/Index/excel"><i class="icon-font">&#xe008;</i>excel导出*</a></li>
                        <!-- <li><a href="/zheng/index.php/Admin/tongji/tongji"><i class="icon-font">&#xe008;</i>统计*</a></li> -->
                        <!-- <li><a href="##"><i class="icon-font">&#xe004;</i>留言管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe012;</i>评论管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe033;</i>广告管理</a></li> -->
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="/zheng/index.php/Admin/Admin/index"><i class="icon-font">&#xe017;</i>管理员信息</a></li>
                        <!-- <li><a href="#"><i class="icon-font">&#xe037;</i>清理缓存</a></li> -->
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/zheng/index.php/Admin/index/index">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">图书管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="" method="post">
                    <table class="search-tab">
                        <tr>
                            
                            
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" action="/zheng/index.php/Admin/Teacher/sort" method="post">
            
                <div class="result-title">
                    <div class="result-list">
                        <a href="/zheng/index.php/Admin/Teacher/add"><i class="icon-font"></i>新增书籍</a>
                       (*老师推荐有权限添加书本)
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            
                            <th>书名</th>
                            <th>书号</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>荐书人</th>
                            <th>联系方式</th>
                            <th>添加时间</th>
                            <th>本人信息</th>
                            
                        </tr>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <td><?php echo ($vo["name"]); ?></td>
                            <td title="<?php echo ($vo["shuhao"]); ?>"><a target="_blank" href="#" title="<?php echo ($vo["shuhao"]); ?>"><?php echo ($vo["shuhao"]); ?></a>
                            </td>
                            <td title="<?php echo ($vo["zuoze"]); ?>"><?php echo ($vo["zuoze"]); ?> 
                            </td>
                            <td title="<?php echo ($vo["chubanshe"]); ?>"><?php echo ($vo["chubanshe"]); ?> … 
                            </td>
                             <td title="<?php echo ($vo["tuijianren"]); ?>"><?php echo ($vo["tuijianren"]); ?> 
                            </td>
                             <td title="<?php echo ($vo["tel"]); ?>"><?php echo ($vo["tel"]); ?>
                            </td>
                             <td title="<?php echo ($vo["addtime"]); ?>"><?php echo (date('Y-m-d H:i:s',$vo["addtime"])); ?>
                            </td>
                            
                            <td title="<?php echo ($vo["type"]); ?>"><?php if($vo["type"] == 1 ): ?>学生
    <?php else: ?> 老师<?php endif; ?>
                            </td>
                            
                            <td>
                                <a class="link-update" href="/zheng/index.php/Admin/Teacher/edit/id/<?php echo ($vo["id"]); ?>"><i class="icon-font"></i>修改</a>|
                                <a class="link-del"  onclick="return confirm('确定删除么')" href="/zheng/index.php/Admin/Teacher/del/id/<?php echo ($vo["id"]); ?>"><i class="icon-font"></i>删除</a>
                            </td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        
                        
                    </table>
                    <div class="list-page"> <?php echo ($count); ?> 条 1/1 页<?php echo ($page); ?></div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>