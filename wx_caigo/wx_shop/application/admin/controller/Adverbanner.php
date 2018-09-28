<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Adverbanner as AdverbannerModel;
class Adverbanner extends Controller
{
//插播广告等级添加
    public function add(){
         if(request()->isPost()){
            $data=input('post.');
            $data['addtime']=time();
            $data['updtime']=time();
            $Adverbanner=new AdverbannerModel;
            $user=$Adverbanner
              ->save($data);
              if($user){
                $code=0;
            $message='插播广告添加通过';
              }else{
                $code=1;
            $message='插播广告添加不成功';
              }
        }
        ReturnJson($code,$message);
         // return json_encode(['code'=>$code,'$message'=>$message]);
        }
//用户等级修改        
        public function edit($id){
         if(request()->isPost()){
            $data=input('post.');
            $data['updtime']=time();
            $Adverbanner=new AdverbannerModel;
            $user=$Adverbanner
              ->update($data);
              if($user){
                $code=0;
            $message='修改插播广告通过';
              }else{
                $code=1;
            $message='修改插播广告失败';
              }
        }
        // $level=db('Adverbanner')->find($id);
        ReturnJson($code,$message);
         // return json_encode(['code'=>$code,'data'=>$level,'$message'=>$message]);
        }
        //用户等级删除        
        public function del(){
          // $Adverbanner=new AdverbannerModel;
          //   $user=$Adverbanner->delete($id);
              if(AdverbannerModel::destroy(input('id'))){
                $code=0;
            $message='删除插播广告通过';
              }else{
                $code=1;
            $message='删除插播广告失败';
              }
        ReturnJson($code,$message);
         // return json_encode(['code'=>$code,'$message'=>$message]);
        }
         //用户级别列表
    public function lst($page){
        $user=db('Adverbanner')
        ->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='插播广告获取成功';
        }else{
            $code=1;
            $message='插播广告获取失败';
        }
        ReturnJson($code,$message,$user);
         // return json_encode(['code'=>$code,'data'=>$user,'$message'=>$message]);
        }
         //用户级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'updtime'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('Adverbanner')
        ->where($where)->order('addtime')
        ->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='插播广告查找成功';
        }else{
            $code=1;
            $message='插播广告查找失败';
        }
        ReturnJson($code,$message,$user);
        }
    }
}
?>