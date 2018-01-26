<?php
namespace app\sys\controller;
use \think\Controller;
use \think\Loader;
use \think\Session;

class Login extends Controller
{
	public function _initialize()
	{
		$this->sysUser = Loader::model('sysUser');
	}

	public function index()
	{
		return $this->fetch();
	}

	public function doLogin()
	{
		$data['sys_uname'] = input('name');
		$data['sys_upwd'] = input('pwd');
		// var_dump($data);
		$res = $this->sysUser->do_login($data);
		return $res;
	}

	public function logOut()
	{
		Session::set('sys_id',NULL);
        Session::set('sys_info',NULL);
        Session::set('sys_name',NULL);
        return redirect('/index.php/sys');
	}
}