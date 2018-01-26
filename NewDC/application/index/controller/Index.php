<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;
use think\Cookie;

class Index extends controller
{
	public function _initialize()
	{
        if(!session('tablenum')) {
            if(input('tablenum')) {
                Session::set('tablenum', input('tablenum'));
            } else {
                echo "<script>alert('请通过扫描二维码进入网站');</script>";
                // return $this->error('请通过扫描二维码进入');
                die('请通过扫描二维码进入网站');
            }
        } else {
            if(input('tablenum')) {
                if(session('tablenum') != input('tablenum')) {
                    Session::set('tablenum', input('tablenum'));
                }
            }
        }   

        if(!session('shopid')) {
            if(input('shopid')) {
                Session::set('shopid', input('shopid'));
            } else {
                echo "<script>alert('请通过扫描二维码进入网站');</script>";
                // return $this->error('请通过扫描二维码进入');
                die('请通过扫描二维码进入网站');
            }
        } else {
            if(input('shopid')) {
                if(session('shopid') != input('shopid')) {
                    Session::set('shopid', input('shopid'));
                }
            }
        } 
        // Session::set('shopid', input('shopid'));
        // Session::set('tablenum', input('tablenum'));
        if(!cookie('user')) {
            Cookie::set('user',date("YmdHis").getRandomStr(5,1),10800);
        }
		$this->type = Loader::model('Type');
        $this->dish = Loader::model('Dish');
        $this->seller = Loader::model('Seller');
		$this->shopSet = Loader::model('ShopSet');
        $this->comment = Loader::model('Comment');
	}

    public function index()
    {
        $seller_data = $this->seller->get_seller_by_id();
    	$data = $this->type->get_type();
        $set_data = $this->shopSet->get_set();
        $comment_data = $this->comment->get_comment();
        $this->assign('seller_data', $seller_data);
        $this->assign('comment_data', $comment_data);
        $this->assign('set_data', $set_data);
    	$this->assign('list', $data);
        return $this->fetch();
    }

    public function getDishById()
    {
        $map['dish_id'] = input('id');
        $data = $this->dish->get_dish_by_id($map);
        return json($data);
    }

    public function checkDishStatus()
    {
        $map['dish_id'] = input('id');
        $res = $this->dish->check_dish_status($map);
        return $res;
    }
}
