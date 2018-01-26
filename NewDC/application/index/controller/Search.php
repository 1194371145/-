<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;
use think\Cookie;


class Search extends Controller
{
	public function _initialize()
	{
		$this->seller = Loader::model('Seller');
		$this->dish = Loader::model('Dish');
	}
	
	public function search()
    {
    	$key = input('key');
        $seller_data = $this->seller->get_seller_by_id();
        $data = $this->dish->search($key);
        // var_dump(session('shopid'));die();
        $this->assign('seller_data', $seller_data);
        $this->assign('list', $data);
        return $this->fetch('/index/search');
    }
}