<?php
namespace app\admin\model;
use think\Model;
use think\Validate;
use think\Session;

class Dish extends model
{
	
	public function add_dish($data)
	{
		$dish = new Dish;
		$data['seller_id'] = session('u_info')->seller_id;
		$dish->data($data);
		$dish->save();
		if($dish->dish_id) {
			return 1;
		} else {
			return 0;
		}
	}
	

	public function do_edit($data, $map)
	{
		$dish = new Dish;
		if($dish->save($data, $map)) {
			return 1;
		} else {
			return 0;
		}
	}

	public function get_dish_by_id($map)
	{
		$dish = new Dish;
		$data = $dish->where($map)->find();
		return $data;
	}

	public function get_dish_by_type($map)
	{
		$dish = new Dish;
		$data = $dish->where($map)->select();
		return $data;
	}

	public function do_del($map)
	{
		$dish = new Dish;
		$res = $dish->where($map)->delete();
		if($res) {
			return returnMsg(1, '成功');
		} else {
			return returnMsg(0, '失败');
		}
	}

	public function change_status($map)
	{
		$dish = new Dish;
		$status = $dish->where($map)->value('dish_status');
		if($status == 1) {
			$res = $dish->save(['dish_status' => 0], $map);
		} else {
			$res = $dish->save(['dish_status' => 1], $map);
		}
		if($res) {
			return returnMsg(1, '成功');
		} else {
			return returnMsg(0, '失败');
		}
	}
}