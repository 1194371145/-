<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;

class ShopSet extends Model
{
	public function get_set()
	{
		$set = new ShopSet;
		$map['seller_id'] = session('shopid');
		$data = $set->where($map)->find();
		return $data;
	}
}