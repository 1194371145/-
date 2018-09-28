<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\User as UserModel;
class User extends Controller
{
    public function login(){//登录接口
        if(request()->isPost()){
            $user=new UserModel();
            $data=input('post.');//接受表单传递的参数
         $validate = \think\Loader::validate('User');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
               ReturnJson(2,$message);
            }
            $userres=$user->login();
            //登录成功的提示信息
            if($userres==1){
                $status = 1;
                $message = '用户不存在';
            }
            if($userres==2){
                $datatel=input('post.tel');//接受表单传递的参数
        $admin=db('user')
        ->where('tel',$datatel)->find();
        $sessid=$admin['id'];
        // print_r($sessid);die;
                // $status = 0;
                // $message = '登录成功';
                ReturnJson(0,'登录成功',$sessid);
            }
            if($userres==3) {
                $status =3;
                $message = '登录失败,密码错误';
            }
            if($userres==4) {
                $status =4;
                $message = '用户未审核,暂不能登录';
            }
            ReturnJson($status,$message);
        }
    }
    public function register(){//注册接口
        $user=new UserModel();
        $data=input('post.');//接受表单传递的参数
         $validate = \think\Loader::validate('User');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
                 ReturnJson(2,$message);
            }
        $userres=$user->isregister();
        if($userres==1){
            $status = 1;
            $message = '注册失败,此手机号已被注册';
        }
        if($userres==2){
            $status = 0;
            $message = '注册成功';
        }
        if($userres==3){
            $status =3;
            $message = '注册失败';
        }
         ReturnJson($status,$message);
    }

    public function logout(){
        session(null);
         ReturnJson(0,'退出登录');
    }


}
