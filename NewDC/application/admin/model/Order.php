<?php
namespace app\admin\model;
use think\Model;
use think\Validate;
use think\Session;
use think\Db;
use think\Cookie;

class Order extends model
{
	public function get_order()
	{
		$order = new order;
		$map['seller_id'] = session('u_info')->seller_id;
		$data = $order->where($map)->order('order_id desc')->select();
		return $data;
	}

	public function order_det($order_num)
	{
		$det = new Det;
		$data = $det->alias('a')->join('__DISH__ b', 'a.dish_id = b.dish_id')->where('a.order_num', $order_num)->select();
		return $data;
	}

	public function change_order_status($order_num, $status)
	{
		$order = new order;
		$order->save(['order_status' => $status], ['order_num' => $order_num]);
	}

	public function change_order_status_to_doing($order_num)
	{
		$order = new order;
		$order_status = $order->where('order_num', $order_num)->value('order_status');
		if($order_status == 0) {
			$order->save(['order_status' => 1], ['order_num' => $order_num]);
		}
		
	}

	public function dish_complete($map)
	{
		$det = new Det;
		Db::startTrans();
		try {
			$det->save(['det_status' => 1], $map);
			$order_num = $det->where($map)->value('order_num');
			$flag = $det->where('order_num', $order_num)->where('det_status', 0)->find();
			if($flag == NULL) {
				$this->change_order_status($order_num, 2);
			} 
			Db::commit();
			return returnMsg(1, '成功！');
		} catch(\Exception $e) {
			Db::rollback();
			return returnMsg(0, '失败！');
		}
		
	}

	public function change_order_is_pay($map)
	{
		$order = new order;
		$res = $order->save(['order_is_pay' => 1], $map);
		if($res) {
			// Cookie::set('user',date("YmdHis").getRandomStr(5,1),10800);
			Cookie::delete('user');
			return returnMsg(1, '成功！');
		} else {
			return returnMsg(0, '失败！');
		}
	}
}