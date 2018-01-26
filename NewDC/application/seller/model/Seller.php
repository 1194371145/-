<?php
namespace app\seller\model;
use think\Model;
use think\Validate;
use think\Session;

class Seller extends Model
{
	protected $rule = [
		'do_reg' =>[
			'seller_name|用户名' => 'require|min:4',
			'seller_pwd|密码' => 'require|min:5',
			'seller_true_name|姓名' => 'require',
			'seller_id_num|身份证号' => 'require',
			'seller_email|email' => 'require',
			'seller_tel|手机' => 'require',
			'seller_shop_name|店铺名称' => 'require',
			'seller_shop_addr|店铺地址' => 'require',
			'seller_business_licence_num|营业执照编号' => 'require'
		]
	];
	public function do_reg($data)
	{
		$seller = new Seller;
		$validate = new Validate($this->rule[__FUNCTION__]);
		if(!$validate->check($data)) {
    		echo "<script>parent.callback('".$validate->getError()."',false)</script>"; 
			return;
    	}
    	if(!isphone($data['seller_tel'])) {
    		echo "<script>parent.callback('请输入正确的手机号',false)</script>"; 
			return;
    	}
    	$is_repeat = $this->check_repeat($data);
    	if($is_repeat['code']) {
    		echo "<script>parent.callback('".$is_repeat['msg']."',true)</script>"; 
			return;
    	}
    	$data['seller_pwd'] = md5($data['seller_pwd']);
    	$seller->data($data);
		$seller->save();
		if($seller->seller_id) {
			echo "<script>parent.callback('申请试用成功，请等待系统管理员审核。审核结果将通知至你的手机号。',true)</script>"; 
			return;
		} else {
			echo "<script>parent.callback('新增失败',false)</script>"; 
			return;
		}
	}

	public function check_repeat($data)
	{
		$seller = new Seller;
		$flag = 0;
		$res = $seller->where('seller_name', $data['seller_name'])->find();
		if($res) {
			$return['code'] = 1;
			$return['msg'] = '用户名已存在';
			return $return;
		}
		$res2 = $seller->where('seller_true_name', $data['seller_true_name'])->find();
		if($res2) {
			$return['code'] = 1;
			$return['msg'] = '您的姓名已被注册！';
			return $return;
		}
		$res3 = $seller->where('seller_id_num', $data['seller_id_num'])->find();
		if($res3) {
			$return['code'] = 1;
			$return['msg'] = '您的身份证号已被注册！';
			return $return;
		}
		$res4 = $seller->where('seller_email', $data['seller_email'])->find();
		if($res4) {
			$return['code'] = 1;
			$return['msg'] = '您的邮箱号已被注册！';
			return $return;
		}
		$res5 = $seller->where('seller_tel', $data['seller_tel'])->find();
		if($res5) {
			$return['code'] = 1;
			$return['msg'] = '您的手机号已被注册！';
			return $return;

		}
		$res6 = $seller->where('seller_business_licence_num', $data['seller_business_licence_num'])->find();
		if($res6) {
			$return['code'] = 1;
			$return['msg'] = '您的营业执照编号已存在！';
			return $return;
		}
	}
}