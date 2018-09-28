<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
class Opinion extends Common
{
    // public function index(){//检查复选按钮提交数据
    //      if(request()->isPost()){
    //     $data=input('post.');
    //     print_r($data);die;
    // }
    //      return view();
    // }
    //意见反馈接口
    public function getopinion(){
        if(request()->isPost()) {
            // input('post.sessid');
            $data['content']=input('post.content');
            $data['optel']=input('post.optel');
            //$data = input('post.');//接受表单传递的参数
            $data['addtime']=time();
            // $data['user_id']=$Request.session.id;
            $data['user_id']=input('post.sessid');
            $validate = \think\Loader::validate('Opinion');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
                 ReturnJson(2,$message);
            }
            $result = db('opinion')
                ->data($data)
                ->insert();
       if($result){
            $code=0;
            $message = '意见反馈成功';
        }else{
            $code=1;
            $message = '意见反馈失败';
        }
       ReturnJson($code,$message);
        }
    }

}
