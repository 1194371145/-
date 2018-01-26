<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;

class Type extends model
{
	public function get_type($id = '')
	{
		$type = new Type;
		if($id) {
			$map['type_id'] = $id;
			$data = $type->where($map)->find();
		} else {
			$map['seller_id'] = session('shopid');
			$data = $type->order('type_id asc')->where($map)->select();
		}
		return $data;
	}
}