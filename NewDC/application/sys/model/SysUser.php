<?php
namespace app\sys\model;
use think\Model;
use think\Validate;
use think\Session;

class sysUser extends model
{
	protected $rule = [
		'do_login' =>[
			'sys_uname|用户名' => 'require|min:5',
			'sys_upwd|密码' => 'require|min:5'
		]
	];

	public function do_login($data)
	{
		$user = new sysUser;
		$validate = new Validate($this->rule[__FUNCTION__]);
		if(!$validate->check($data)) {
    		return returnMsg(0,$validate->getError());
    	}
    	$data['sys_upwd'] = md5($data['sys_upwd']);
    	$res = $user->where($data)->find();
    	if($res) {
    		Session::set('sys_id',$res->sys_uid);
    		Session::set('sys_name',$res->sys_uname);
    		Session::set('sys_info',$res);
    		return returnMsg(1, '登录成功！', '/index.php/sys');
    	} else {
    		return returnMsg(0, '用户名或密码错误，登录失败！');
    	}
	}
}