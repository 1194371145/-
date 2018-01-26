<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Loader;
use think\Request;
use think\Validate;

class Order extends AdminBase
{
	public function _initialize()
	{
		$this->order = Loader::model('Order');
	}

	public function index()
	{	
		$data = $this->order->get_order(); 
		$this->assign('nav', adminNavActive('ddgl'));
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function orderDet()
	{	
		$order_num = input('order_num');
		$data = $this->order->order_det($order_num);
		$this->order->change_order_status_to_doing($order_num);
		// var_dump($data);die();
		$this->assign('nav', adminNavActive('ddgl'));
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function dishComplete()
	{
		$map['det_id'] = input('id');
		$res = $this->order->dish_complete($map);
		return $res;
	}

	public function confirmPay()
	{
		$map['order_num'] = input('order_num');
		$res = $this->order->change_order_is_pay($map);
		return $res;
	}
}