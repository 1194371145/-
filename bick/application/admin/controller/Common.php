<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
class Common extends Controller
{
    public function _initialize(){
        if(!session('id') || !session('name')){
           $this->error('您尚未登录系统',url('login/index'));
        }

        $auth=new Auth();
        $request=Request::instance();
        $con=$request->controller();//获取控制器
        $action=$request->action();//获取方法
        $name=$con.'/'.$action;//组合成名
        $notCheck=array('Index/index','Admin/lst','Admin/logout');
        if(session('id')!=1){
        	if(!in_array($name, $notCheck)){
        		if(!$auth->check($name,session('id'))){
		    	$this->error('没有权限',url('index/index'));
		    	}
        	}

        }

    }


}
