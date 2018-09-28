<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Advertise as AdvertiseModel;
class Advertise extends Controller
{
//轮播广告等级添加
    public function add(){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Advertise');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $data['addtime']=time();
            $data['updtime']=time();
            $advertise=new AdvertiseModel;
            $user=$advertise
              ->save($data);
              if($user){
                $code=0;
            $message='轮播广告添加通过';
              }else{
                $code=1;
            $message='轮播广告添加不成功';
              }
        }
         ReturnJson($code,$message);
    }
//轮播广告等级修改        
        public function edit($id){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('Advertise');
            if(!$validate->check($data)){
                $message=$validate->getError();
                 ReturnJson(2,$message);
                 // /public/uploads/20180813/eb5a55befddd6506fe7d308265d2645d.jpg
            }
            $data['updtime']=time();
            $advertise=new AdvertiseModel;
            $user=$advertise
              ->update($data);
              if($user){
                $code=0;
            $message='修改轮播广告通过';
              }else{
                $code=1;
            $message='修改轮播广告失败';
              }
        }
        // $level=db('Advertise')->find($id);
        ReturnJson($code,$message);
         // return json_encode(['code'=>$code,'data'=>$level,'$message'=>$message]);
        }
        //轮播广告等级删除        
        public function del(){
          // $advertise=new AdvertiseModel;
          //   $user=$advertise->delete($id);
              if(AdvertiseModel::destroy(input('id'))){
                $code=0;
            $message='删除轮播广告通过';
              }else{
                $code=1;
            $message='删除轮播广告失败';
              }
        
          ReturnJson($code,$message);
        }
         //轮播广告级别列表
    public function lst($page){
        $user=db('Advertise')
        ->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='轮播广告获取成功';
        }else{
            $code=1;
            $message='轮播广告获取失败';
        }
         return json_encode(['code'=>$code,'data'=>$user,'$message'=>$message]);
        }
         //轮播广告级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'name|link|updtime'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('Advertise')
        ->where($where)->order('addtime')
        ->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='轮播广告查找成功';
        }else{
            $code=1;
            $message='轮播广告查找失败';
        }
         return json_encode(['code'=>$code,'data'=>$user,'$message'=>$message]);
        }
    }
}
?>