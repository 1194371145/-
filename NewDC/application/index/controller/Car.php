<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;
use think\Cookie;

class Car extends controller
{
	public function _initialize()
	{
		$this->type = Loader::model('Type');
        $this->dish = Loader::model('Dish');
		$this->seller = Loader::model('Seller');
	}

	public function index()
	{
		return $this->fetch();
	}

	public function getCarDish()
	{
		$mycars = input('mycars/a');
		$count = array_count_values($mycars);
		$mycars = array_unique($mycars);
		$data = $this->dish->getDishBetween($mycars);
		$list = [];
		foreach ($data as $k => $v) {
			$temp['dish_id'] = $v->dish_id;
			$temp['dish_name'] = $v->dish_name;
			$temp['dish_price'] = $v->dish_price;
			$temp['dish_img'] = $v->dish_img;
			$temp['dish_num'] = $count[$v->dish_id];
			array_push($list, $temp);
		}
		// echo '<pre>';
		// print_r($list);
		return json($list);
	}
}