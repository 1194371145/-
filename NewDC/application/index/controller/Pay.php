<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;
use think\Cookie;

class Pay extends Controller
{
	public function _initialize()
	{
		$this->shopSet = Loader::model('ShopSet');
	}
	
	public function index()
	{
		$order_num = input('order_num');
		$set_data = $this->shopSet->get_set();
		$this->assign('order_num', $order_num);
		$this->assign('set_data', $set_data);
		return $this->fetch();
	}
}