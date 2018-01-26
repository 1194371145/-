<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;
use think\Db;
use think\Cookie;


class Order extends Model
{
	public function make_order($data)
	{
		// echo "<pre>";
		// print_r($data);die();
		$order = new Order;
		$det = new Det;
		
		Db::startTrans();
		try {
			$flag = $order->where('user_ident', Cookie('user'))->order('order_id desc')->find();
			if($flag) {
				$order_data['order_num'] = $order->where('user_ident', Cookie('user'))->order('order_id desc')->value('order_num');
			} else {
				$order_data['order_num'] = 'HC'.date('YmdHis').getRandomStr(4,0);
				$order_data['order_table_num'] = session('tablenum');
				$order_data['order_add_time'] = date('Y-m-d H:i:s');
				$order_data['seller_id'] = session('shopid');
				$order_data['user_ident'] = cookie('user');
			}
			
			$det_data = [];
			// var_dump(count($data['flag'][31]));die();
			// is_array($data['flag'])?null:$data['flag'] = array();
			foreach ($data['flag'] as $k => $v) {
				if(isset($data['flag'][$k])) {
					$temp['order_num'] = $order_data['order_num'];
					$temp['dish_id'] = $data['dish_id'][$k];
					$temp['det_dish_price'] = $data['dish_price'][$k];
					$temp['det_dish_num'] = $data['dish_num'][$k];
					array_push($det_data, $temp);
				}
			}
			// var_dump(count($det_data));die();
			if(count($det_data) == 0) {
				return returnMsg(0, '不允许提交空订单，请选择菜品后再结算');
			}
			$det->saveAll($det_data);
			if(!$flag) {
				$order->data($order_data);
				$order->save();
			}
			Db::commit();
			return returnMsg(1, '提交成功！', $order_data['order_num']);
		} catch(\Exception $e) {
			Db::rollback();
			return returnMsg(0, '提交失败！');
		}
	}

	public function check_order_status($map)
	{
		$order = new Order;
		$status = $order->where($map)->value('order_is_pay');
		return $status;
	}

	public function get_my_order()
	{
		$order = new Order;
		$map['user_ident'] = Cookie('user');
		$data = $order->alias('a')->join('__DET__ b', 'a.order_num = b.order_num')->join('__DISH__ c', 'b.dish_id=c.dish_id')->where('a.user_ident', $map['user_ident'])->select();
		foreach ($data as $k => $v) {
			$res[$v['dish_id']]['dish_num'] = 0;
		}
		foreach ($data as $k => $v) {
			$res[$v['dish_id']]['dish_id'] = $v['dish_id'];
			$res[$v['dish_id']]['dish_name'] = $v['dish_name'];
			$res[$v['dish_id']]['dish_img'] = $v['dish_img'];
			$res[$v['dish_id']]['dish_price'] = $v['dish_price'];
			$res[$v['dish_id']]['dish_num'] += $v['det_dish_num'];
		}
		return $res;
	}

	public function get_order_num()
	{
		$order = new Order;
		$map['user_ident'] = Cookie('user');
		$order_num = $order->where($map)->value('order_num');
		return $order_num;
	}

	public function add_dish($map)
	{
		$dish = new Dish;
		$order = new order;
		$det = new Det;
		$dish_data = $dish->where($map)->find();
		// var_dump($dish_data->dish_num);die();
		$order_num = $order->where('user_ident', Cookie('user'))->value('order_num');
		$data['order_num'] = $order_num; 
		$data['dish_id'] = $dish_data->dish_id; 
		$data['det_dish_price'] = $dish_data->dish_price;
		$data['det_dish_num'] = 1;
		// var_dump($data);die();
		$det->data($data);
		$det->save();
		if($det->det_id) {
			return returnMsg(1, '成功');
		} else {
			return returnMsg(0, '失败');
		}
	}
}