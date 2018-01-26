<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller
{
    public function index(){
        $admin=D('admin');
        if(IS_POST){
            if($admin->create($_POST,4)){
                if($admin->login()){
                    session('username',$_POST['username']);
                    // session('password',$_POST['password']);
                    $this->success('登录成功，跳转中...',U('Index/index'));

                }else{
                    $this->error('用户名或者密码错误！');
                }
            }else{
                $this->error($admin->getError());
            }
            return;
        }

        $this->display();
    }

    public function verify(){
        $Verify = new \Think\Verify();
        $Verify->length=4;
        $Verify->entry();
    }
    public function logout(){
     
         session(null);
         $this->success('退出成功',U('Login/index'),4);
    
}
}