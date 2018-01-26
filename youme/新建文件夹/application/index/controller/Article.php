<?php
namespace app\index\controller;
use think\Controller;
class Article extends Base
{
    public function index(){
        return $this->fetch('article');
    }
}
