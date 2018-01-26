<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;
use think\Cookie;

class Order extends controller
{
	public function _initialize()
	{
		$this->order = Loader::model('Order');
	}

	public function makeOrder()
	{
		$data['flag'] = input('flag/a');
		$data['dish_id'] = input('dish_id/a');
		$data['dish_num'] = input('dish_num/a');	
		$data['dish_price'] = input('dish_price/a');
		// foreach ($data['flag'] as $k => $v) {
		// 	var_dump($v);
		// }
		
		// 	die();
		// var_dump($data);die();
		$res = $this->order->make_order($data);
		return $res;
	}

	public function checkOrder()
	{
		$map['order_num'] = input('order_num');
		$res = $this->order->check_order_status($map);
		return $res;
	}

	public function index()
	{
		$data = $this->order->get_my_order();
		$this->assign('order_num', $this->order->get_order_num());
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function addDish()
	{
		$map['dish_id'] = input('id');
		$res = $this->order->add_dish($map);
		return $res;
	}
}