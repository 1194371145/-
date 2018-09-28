<?php
namespace app\admin\controller;
use think\Controller;
class Proclamation extends Controller
{
//公告等级添加
    public function add(){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Proclamation');
            if(!$validate->check($data)){
                $message=$validate->getError();
                 ReturnJson(2,$message);
            }
            $data['addtime']=time();
            $data['updtime']=time();
            $user=db('proclamation')
              ->data($data)
              ->insert();
              if($user){
                $code=0;
            $message='公告添加通过';
              }else{
                $code=1;
            $message='公告添加不成功';
              }
        }
         ReturnJson($code,$message);
        }
//公告等级修改        
        public function edit($id){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Proclamation');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $data['updtime']=time();
            $user=db('proclamation')->where('id', $id)->update($data);
              if($user){
                $code=0;
            $message='修改公告通过';
              }else{
                $code=1;
            $message='修改公告失败';
              }
        }
        // $level=db('proclamation')->find($id);
          ReturnJson($code,$message);
        }
        //公告等级删除        
        public function del($id){
            $user=db('proclamation')->delete($id);
              if($user){
                $code=0;
            $message='删除公告通过';
              }else{
                $code=1;
            $message='删除公告失败';
              }
        
          ReturnJson($code,$message);
        }
         //公告级别列表
    public function lst($page){
        $user=db('proclamation')
        ->field('id,title,content,updtime')
        ->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='公告获取成功';
        }else{
            $code=1;
            $message='公告获取失败';
        }
          ReturnJson($code,$message,$user);
        }
         //公告级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'title|content|updtime'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('proclamation')
        ->field('id,title,content,updtime')
        ->where($where)
        ->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='公告查找成功';
        }else{
            $code=1;
            $message='公告查找失败';
        }
          ReturnJson($code,$message,$user);
        }
    }
}
?>