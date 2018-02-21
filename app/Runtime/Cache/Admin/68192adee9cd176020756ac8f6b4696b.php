<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/app/Public/Admin/css/base.css" />
<link rel="stylesheet" href="/app/Public/Admin/css/info-reg.css" />
<title>移动办公自动化系统</title>
<style type='text/css'>
	select {
		background: rgba(0, 0, 0, 0) url("/app/Public/Admin/images/inputbg.png") repeat-x scroll 0 0;
	    border: 1px solid #c5d6e0;
	    height: 28px;
	    outline: medium none;
	    padding: 0 8px;
	    width: 240px;
	}
	.main p input {
		float:none;
	}
</style>
</head>

<body>
<div class="title"><h2>信息登记</h2></div>
<form action="" method="post">
<div class="main">
<input type="hidden" value="id">
	<p class="short-input ue-clear">
    	<label>用户名：</label><input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
        <input name="username" type="text" placeholder="<?php echo ($info["username"]); ?>" /><font color="red">*不可修改</font>
    </p>
	<p class="short-input ue-clear">
    	<label>密码：</label>
        <input name="password" type="text" placeholder="密码" />
    </p>
    <p class="short-input ue-clear">
    	<label>姓名：</label>
        <input name="truename" type="text" placeholder="<?php echo ($info["truename"]); ?>" />
    </p>
	<p class="short-input ue-clear">
    	<label>昵称：</label>
        <input name="nickname" type="text" placeholder="<?php echo ($info["nickname"]); ?>" />
    </p>
    <div class="short-input select ue-clear">
    	<label>所属部门：</label>
        <select name="dept_id"> 
            <option value="<?php echo ($data["id"]); ?>"><?php echo ($data["name"]); ?></option>
            <option value="-1">请选择</option>
            
        </select><font color="red">*不可修改</font>
    </div>
	<p class="short-input ue-clear">
    	<label>性别：</label>
    	<!-- <?php echo ($info["sex"]); ?> --><?php if($info["sex"] == 男 ): ?><input name="sex" type="radio" value="男" checked='checked' />男 <input name="sex" type="radio" value="女" />女    <?php else: ?> <input name="sex" type="radio" value="男" />男 <input name="sex" type="radio" value="女" checked='checked' />女<?php endif; ?>
    	
    </p>
	<p class="short-input ue-clear">
    	<label>生日：</label>
        <input name="birthday" type="text" value="<?php echo ($info["birthday"]); ?>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /><font color="red">*不可修改</font>
    </p>
	<p class="short-input ue-clear">
    	<label>联系电话：</label>
        <input type="text" name="tel" placeholder="<?php echo ($info["tel"]); ?>" />
    </p>
	<p class="short-input ue-clear">
    	<label>邮箱：</label>
        <input type="text" name="email" placeholder="<?php echo ($info["email"]); ?>" />
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <textarea name="remark" style="font-family:Microsoft YaHei !important; font-size:14px;" placeholder="<?php echo ($info["remark"]); ?>" name="remark"></textarea>
    </p>
</div>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" id='btnSubmit'>确定</a>
    <a href="javascript:;" class="clear" id='btnReset'>清空内容</a>
</div>
</form>
</body>
<script type="text/javascript" src="/app/Public/Admin/js/jquery.js"></script>
<script type="text/javascript" src="/app/Public/Admin/js/common.js"></script>
<script type="text/javascript" src="/app/Public/Admin/js/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	$('#btnSubmit').on('click',function(){
		$('form').submit();
	});
	
	$('#btnReset').on('click',function(){
		$('form')[0].reset();
	});
});	

$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

showRemind('input[type=text], textarea','placeholder');
</script>
</html>