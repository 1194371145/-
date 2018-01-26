<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;

class Dish extends model
{
	public function get_dish_by_id($map)
	{
		$dish = new Dish;
		$data = $dish->where($map)->find();
		return $data;
	}

	public function getDishBetween($mycars)
	{
		$dish = new Dish;
		$data = $dish->where('dish_id', 'in', $mycars)->select();
		return $data;
	}

	public function search($key)
	{
		$dish = new Dish;
		$data = $dish->where('dish_name', 'like', '%'.$key.'%')->where('seller_id', session('shopid'))->select();
		return $data;
	}

	public function check_dish_status($map)
	{
		$dish = new Dish;
		$status  = $dish->where($map)->value('dish_status');
		return $status;
	}
}