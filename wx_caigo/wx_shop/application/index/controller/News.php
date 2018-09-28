<?php
namespace app\index\controller;
use think\Controller;
class News extends Common
{
    //热点新闻列表
    public function newslist(){
        $news=db('news')
            ->order('addtime desc')
            ->select();
        if($news){
            $code=0;
            $message = '查询成功';
        }else{
            $code=1;
            $message = '查询失败';
        }
       ReturnJson($code,$message,$news);
    }
    //热点新闻详细
    public function newsdetail($id){
        $news=db('news')
            ->where(array('id'=>$id))
            ->find();
            db('news')->where('id', $id)->setInc('alick');
        if($news){
            $code=0;
            $message = '查询成功';
        }else{
            $code=1;
            $message = '查询失败';
        }
        ReturnJson($code,$message,$news);
    }

}
