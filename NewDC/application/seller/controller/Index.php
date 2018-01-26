<?php
namespace app\seller\controller;
use app\common\controller\SellerBase;
use think\Loader;
use think\Request;

class Index extends SellerBase
{
	public function _initialize()
	{
		$this->seller = Loader::model('Seller');
	}

	public function index()
	{
		return $this->fetch();
	}

	public function doReg()
	{	
		$data['seller_name'] = input('seller_name');
		$data['seller_pwd'] = input('seller_pwd');
		$data['seller_true_name'] = input('seller_true_name');
		$data['seller_id_num'] = input('seller_id_num');
		$data['seller_email'] = input('seller_email');
		$data['seller_tel'] = input('seller_tel');
		$data['seller_shop_name'] = input('seller_shop_name');
		$data['seller_shop_addr'] = input('seller_shop_addr');
		$data['seller_business_licence_num'] = input('seller_business_licence_num');
		//店铺图标上传
		$file = request()->file('seller_shop_logo');
		if($file == NULL) {
			echo "<script>parent.callback('请选择店铺图标',false)</script>";
			return;
		}
		$type = $file->getinfo()['type'];
	    $suf = substr($type, 6);
		if($suf!="jpg"&&$suf!="JPG"&&$suf!="png"&&$suf!="PNG"&&$suf!="jpeg"&&$suf!="JPEG") {
			echo "<script>parent.callback('图片必须为jpg,png格式',false)</script>";
			return;
		}
		$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . 'logo');
		if($info) {
			$data['seller_shop_logo'] = $info->getSaveName();
			//生成缩略图
			makeThumb($info->getSaveName(), ROOT_PATH . 'public' . DS . 'uploads' . DS . 'logo');
		} else {
			echo "<script>parent.callback('店铺图标上传失败',false)</script>"; 
			return;
		}

		//营业执照上传
		$file2 = request()->file('seller_business_licence_img');
		if($file2 == NULL) {
			echo "<script>parent.callback('请选择营业执照',false)</script>";
			return;
		}
		$type2 = $file2->getinfo()['type'];
	    $suf2 = substr($type2, 6);
		if($suf2!="jpg"&&$suf2!="JPG"&&$suf2!="png"&&$suf2!="PNG"&&$suf2!="jpeg"&&$suf2!="JPEG") {
			echo "<script>parent.callback('图片必须为jpg,png格式',false)</script>";
			return;
		}
		$info2 = $file2->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . 'licence_img');
		if($info2) {
			$data['seller_business_licence_img'] = $info2->getSaveName();
			//生成缩略图
			makeThumb($info2->getSaveName(), ROOT_PATH . 'public' . DS . 'uploads' . DS . 'licence_img');
		} else {
			echo "<script>parent.callback('营业执照上传失败',false)</script>"; 
			return;
		}

		// var_dump($data);die();
		$res = $this->seller->do_reg($data);
		return;
	}
}