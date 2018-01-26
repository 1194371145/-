<?php
namespace app\sys\model;
use think\Model;
use think\Validate;
use think\Session;
use think\Db;

class Seller extends Model
{
	public function get_seller()
	{
		$seller = new Seller;
		$data = $seller->select();
		return $data;
	}

	public function get_img($map) 
	{
		$seller = new Seller;
		$data = $seller->where($map)->field('seller_id, seller_shop_logo, seller_business_licence_img, seller_status')->find();
		return $data;
	}

	public function change_status($map, $data, $way)
	{
		$seller = new Seller;
		$user = new User;
		Db::startTrans();
		try {
			$seller->save($data, $map);
			if($way == 'pass') {
				$data = $seller->where($map)->find();
				$data2['seller_id'] = $data->seller_id;
				$data2['user_name'] = $data->seller_name;
				$data2['user_pwd'] = $data->seller_pwd;
				$data2['user_status'] = 1;
				$data2['user_auth'] = 1;
				$user->data($data2);
				$user->save();
			}
			Db::commit();
			return returnMsg(1, '成功');
		} catch (\Exception $e) {
			Db::rollback();
			return returnMsg(0, '失败');
		}
	}
}