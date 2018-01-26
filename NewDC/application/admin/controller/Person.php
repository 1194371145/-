<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Loader;

class Person extends AdminBase
{
	public function _initialize()
	{
		$this->user = Loader::model('User');
	}

	public function index()
	{
		$data = $this->user->get_user();
		$this->assign('nav', adminNavActive('rygl', 'rylb'));
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function doDel()
	{
		$map['user_id'] = input('id');
		$res = $this->user->do_del($map);
		return $res;
	}

	public function doChange()
	{
		$map['user_id'] = input('id');
		$res = $this->user->do_change($map);
		return $res;
	}

	public function add()
	{
		$this->assign('nav', adminNavActive('rygl', 'tjry'));
		return $this->fetch();
	}

	public function doAdd()
	{
		$data['user_name'] = input('user_name');
		$data['user_pwd'] = input('user_pwd');
		$data['seller_id'] = session('u_id');
		$res = $this->user->do_add($data);
		return $res;
	}
}