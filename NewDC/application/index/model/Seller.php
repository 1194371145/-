<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;

class Seller extends Model
{
	public function get_seller_by_id()
	{
		$seller = new Seller;
		$map['seller_id'] = session('shopid');
		$data = $seller->where($map)->find();
		return $data;
	}
}