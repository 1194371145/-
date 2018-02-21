<?php
namespace Test\Controller;
use Think\Controller;
class TestController extends Controller {
    public function test(){
       $array=array('西游记','葫芦娃','三国演义','水浒传'); 
       $array2=array(
       	array('lol','cf','cs','cross'),
       	array('特仑苏','哇哈哈','纯奶','酸奶'),
       	array('建安','葫芦娃','三国演义','雷利')
       	);
       $this->assign('array',$array);
       $this->assign('array2',$array2);
       $this->display();

    }
}