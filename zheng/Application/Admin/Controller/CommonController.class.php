<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller
{
    public function __construct(){
        parent::__construct();
        if (!Session('username')){
            $this->error('请先登录在访问',U('Login/index'));
        }
    }
}