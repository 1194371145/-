<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Loader;

class Index extends AdminBase
{
	public function _initialize()
	{
		$this->shop_set = Loader::model('ShopSet');
	}

	public function index()
	{
		$this->assign('nav', adminNavActive('dpsz'));
		$this->assign('data', $this->shop_set->get_set());
		return $this->fetch();
	}

	public function doSet()
	{
		$data['set_start_time'] = input('set_start_time');
		$data['set_end_time'] = input('set_end_time');
		$data['seller_id'] = session('u_info')->seller_id;

		$files = request()->file('img');
	    foreach($files as $file){
	        // 移动到框架应用根目录/public/uploads/ 目录下
	        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .'qrCode');
	        if($info){
	        	$flag[] = 1;
	            $img[] = $info->getSaveName();
	        }else{
	        	$flag[] = 0;
	            echo "<script>parent.callback('图片上传失败',false)</script>"; 
		    	return;
	        }    
	    }
	    $data['set_wx_pay_img'] = $img[0];
	    $data['set_zfb_pay_img'] = $img[1];
	    $res = $this->shop_set->do_set($data);
	    if($res) {
	    	echo "<script>parent.callback('成功',true)</script>"; 
		   	return;
	    } else {
	    	echo "<script>parent.callback('失败',false)</script>"; 
		   	return;
	    }
		
	}

	public function editSet()
	{
		$data['set_start_time'] = input('set_start_time');
		$data['set_end_time'] = input('set_end_time');
		$data['seller_id'] = session('u_info')->seller_id;
		$files = request()->file('img');
		$f = 0;
	    foreach($files as $file){
	        $f++;
	        if($file) {
	        	$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .'qrCode');
		        if($info){
		        	if($f == 1) {
		        		$img['wx'] = $info->getSaveName();
		        	} else {
		        		$img['zfb'] = $info->getSaveName();
		        	}
		            
		        }else{
		            echo "<script>parent.callback('图片上传失败',false)</script>"; 
			    	return;
		        }    
	        }
	        
	    }
	    if(isset($img['wx'])) {
	    	$data['set_wx_pay_img'] = $img['wx'];
	    }

	    if(isset($img['zfb'])) {
	    	$data['set_zfb_pay_img'] = $img['zfb'];
	    }
	    
	    $res = $this->shop_set->do_set($data, input('id'));
	    if($res) {
	    	echo "<script>parent.callback('成功',true)</script>"; 
		   	return;
	    } else {
	    	echo "<script>parent.callback('失败',false)</script>"; 
		   	return;
	    }
		
	}

	public function qrCode()
	{
		$this->assign('nav', adminNavActive('ewm'));
		return $this->fetch();
	}
}