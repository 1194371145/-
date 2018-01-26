<?php
namespace app\index\controller;
class Search extends Base
{
    public function index()
    {
    	$keywords=input('keywords');
    	if($keywords){
    		$map['title']  = ['like','%'.$keywords.'%'];
    		$seares=\think\Db::name('article')->where($map)->order('id desc')->paginate(2);
    		$this->assign('seares',$seares);
    		$this->assign('keywords',$keywords);
    	}else{
    		$this->assign('keywords','没有关键词');
    		$this->assign('seares',null);

    	}

        return $this->fetch('search');
    }
}
