<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Loader;
use \think\Session;

class Login extends Controller
{
	public function _initialize()
	{
		$this->user = Loader::model('User');
	}

	public function index()
	{
		return $this->fetch();
	}

	public function doLogin()
	{
		$data['user_name'] = input('name');
		$data['user_pwd'] = input('pwd');
		$res = $this->user->do_login($data);
		return $res;
	}

	public function logOut()
	{
		Session::set('u_id',NULL);
        Session::set('u_info',NULL);
        return redirect('/index.php/admin');
	}
}