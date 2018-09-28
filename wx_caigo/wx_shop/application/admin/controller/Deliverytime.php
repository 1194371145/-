<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Deliverytime as DeliverytimeModel;
class Deliverytime extends Controller
{
//配送时间添加
    public function add(){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Deliverytime');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $user=db('Deliverytime')
              ->data($data)
              ->insert();
              if($user){
                $code=0;
            $message='配送时间添加通过';
              }else{
                $code=1;
            $message='配送时间添加不成功';
              }
        }
         ReturnJson($code,$message);
        }
//配送时间等级修改        
        public function edit($id){
          $level=db('Deliverytime')->find($id);
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Deliverytime');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $user=db('Deliverytime')->where('id', $id)->update($data);
              if($user){
                $code=0;
            $message='修改配送时间通过';
              }else{
                $code=1;
            $message='修改配送时间失败';
              }
        }
         ReturnJson($code,$message);
        }
        //配送时间等级删除        
        public function del($id){
            $user=db('Deliverytime')->delete($id);
              if($user){
                $code=0;
            $message='删除配送时间通过';
              }else{
                $code=1;
            $message='删除配送时间失败';
              }
        
         ReturnJson($code,$message);
        }
         //配送时间级别列表
    public function lst($page){
        $user=db('Deliverytime')->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='配送时间获取成功';
        }else{
            $code=1;
            $message='配送时间获取失败';
        }
        ReturnJson($code,$message,$user);
        }
         //配送时间级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'time'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('Deliverytime')
        ->where($where)
        ->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='配送时间查找成功';
        }else{
            $code=1;
            $message='配送时间查找失败';
        }
        ReturnJson($code,$message,$user);
        }
    }
}
?>