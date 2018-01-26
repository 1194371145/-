<?php
namespace app\index\controller;
class Guest extends Base
{
    public function index()
    {
    	
    	if(request()->isPost()){
    		$data=[
    			'nickname'=>input('inpName'),
    			'homepage'=>input('inpHomePage'),
    			'email'=>input('inpEmail'),
    			'content'=>input('inpArticle'),
    			'time'=>time(),
    		];
    		if(\think\Db::name('guest')->insert($data)){
    				echo "<ul class='msg' id='cmt1508'><li class='msgname'><img class='avatar' src='http://cn.gravatar.com/avatar
/155863718d088b0e698dd8854e4e4a3d?s=40&d=mm' alt='' width='32'/>&nbsp;<span class='commentname'><a href
='http://www.youmew.com/zb_system/function/c_urlredirect.asp?url=h1t8t5p4%3A9%2F1%2F3w4w6w7%2E21225292420
%2E9c5o5m8' rel='nofollow' target='_blank'>测试</a></span><br/><small>&nbsp;发布于&nbsp;2016-7-26 22:15:05
&nbsp;&nbsp;<span class='revertcomment'><a href='#comment' onclick='RevertComment('1508')'>回复该留言</a>
</span></small></li><li class='msgarticle'>你好啊，正文相声<!--rev1508--><a style='display:none;' id='AjaxCommentEnd1508'
></a></li></ul>";
    		}else{
    				echo 222;
    		}
    		return;
    	}

    	$guestres=\think\Db::name('guest')->select();
    	$this->assign('guestres',$guestres);
        return $this->fetch('guest');
    }
}
