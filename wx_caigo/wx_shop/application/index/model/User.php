<?php
namespace app\index\model;
use think\Model;
class User  extends Model
{
    public function login(){

        $data=input('post.');//接受表单传递的参数
        $admin=User::getByTel($data['tel']);
        // if($admin['checktype']==1){

        // }else{
        //     return 4;
        // }
        // print_r($admin);die;
        if($admin){
             if($admin['checktype']==1){
                if($admin['password']==md5(md5($data['password']))){
                return 2; //登录密码正确的情况
            }else{
                return 3; //登录密码错误
            }

        }else{//该用户未审核
            return 4;
        }

            // if($admin['password']==md5(md5($data['password']))){
            //     return 2; //登录密码正确的情况
            // }else{
            //     return 3; //登录密码错误
            // }
        }else{
            return 1; //用户不存在的情况
        }
    	return ;
    }
    public function isregister(){
        $data=input('post.');//接受表单传递的参数
        $admin=User::getByTel($data['tel']);
//        $admin=db('User')->where('user_tel',$data['user_tel'])->find();
        if($admin){
            return 1;
        }else{
            $data['password']=md5(md5($data['password']));
            $userData=array();
            $userData['tel']=$data['tel'];
            $userData['password']=$data['password'];
            $userData['addtime']=time();
            if($this->save($userData)){
                return 2;
            }else{
                return 3;
            }
        }
        return ;
    }
}
