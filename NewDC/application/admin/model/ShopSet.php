<?php
namespace app\admin\model;
use think\Model;
use think\Validate;
use think\Session;

class ShopSet extends Model
{
	public function get_set()
	{
		$shop_set = new ShopSet;
		$data = $shop_set->where('seller_id', session('u_info')->seller_id)->find();
		return $data;
	}

	public function do_set($data, $id = '')
	{
		$shop_set = new ShopSet;
		if($id) {
			$map['set_id'] = $id;
			$res = $shop_set->save($data, $map);
		} else {
			$shop_set->data($data);
			$shop_set->save();
			$res = $shop_set->set_id;
		}
		if($res) {
			return 1;
		} else {
			return 0;
		}
	}
}