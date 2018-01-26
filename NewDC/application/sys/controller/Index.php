<?php
namespace app\sys\controller;
use app\common\controller\SysBase;
use think\Session;
use think\Loader;

class Index extends SysBase
{
	public function _initialize()
	{
		$this->seller = Loader::model('Seller');
	}
	public function index()
	{
		$list = $this->seller->get_seller();
		$this->assign('list', $list);
		$this->assign('nav', sysNavActive('shgl', 'shlb'));
		return $this->fetch();
	}

	public function details()
	{
		$map['seller_id'] = input('id');
		$data = $this->seller->get_img($map);
		$this->assign('data', $data);
		$this->assign('nav', sysNavActive('shgl', 'shlb'));
		return $this->fetch();
	}

	//通过审核
	public function makePass()
	{
		$map['seller_id'] = input('id');
		$data['seller_remark'] = input('seller_remark');
		$data['seller_status'] = 1;
		$res = $this->seller->change_status($map, $data, 'pass');
		return $res;
	}

	//通过审核
	public function makeRefuse()
	{
		$map['seller_id'] = input('id');
		$data['seller_remark'] = input('seller_remark');
		$data['seller_status'] = 2;
		$res = $this->seller->change_status($map, $data, 'refuse');
		return $res;
	}
}