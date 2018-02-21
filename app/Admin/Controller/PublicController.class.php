<?php
//命名空间声明
namespace Admin\Controller;
//引入父类控制器
use Think\Controller;
//声明类并且继承父类
class PublicController extends Controller{

	//登录页面展示
	public function login(){
		//展示模版
		$this -> display();
		//获取模版内容
		//$str = $this -> fetch();
		//dump打印
		//dump($str);
		//echo $str;
	}
		public function captcha(){
          ob_end_clean();
		//配置
		$cfg = array(
				'fontSize'  =>  15.1,              // 验证码字体大小(px)
		        'useCurve'  =>  false,            // 是否画混淆曲线
		        'useNoise'  =>  false, 
		                   // 是否添加杂点
		        'length'    =>  4,               // 验证码位数
		        'imageH'=>35,
		        'imageW'=>100,
		        'fontttf'   =>  '4.ttf',              // 验证码字体，不设置随机获取
			);
		$verify = new \Think\Verify($cfg);
		$verify -> entry();
}
// checklogin
public function checkLogin(){
	$post=I('post.');
	// var_dump($post);
		$verify = new \Think\Verify();
		$result=$verify->check($post['captcha']);
		if(!$result){
			$this->error('验证码错误..');
		}else{
            $model=M('User');
            // 删除验证码元素
            unset($post['captcha']);
            $data=$model->where($post)->find();
            
            if($data){
            //存在用户,用户信息持久保存到session，跳转到后台首页
            session('id',$data['id']);
            session('username',$data['username']);
            session('role_id',$data['role_id']);
            $this->success('登录成功',U('Index/index'),3);
            
            }else{
            	$this->error('用户名或者密码错误');
            }
		}
}
public function logout(){
	//清除session
	session(null);
	// 跳转到登录页面
	$this->success('退出成功',U('login'),3);
	
}
}