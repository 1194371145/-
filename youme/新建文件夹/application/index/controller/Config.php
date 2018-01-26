<?php
namespace app\index\controller;

class Config
{
	// config控制器主要是看配置项的
	// http://localhost/youme/public/index.php/index/config/index
    public function index()
    {
        // return config('site_name');
        dump(\Think\Config::get());
    }
}
