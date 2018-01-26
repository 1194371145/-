<?php
namespace Admin\Model;
use Think\Model;
class AdminModel extends Model {
   protected $_validate = array(
     array('username','require','管理员不能为空',1,'regex',3), // 
      array('username','','管理员不能重复！',0,'unique',1), // 在新增的时候验证name字段是否唯一
      array('password','require','密码不能为空',1,'regex',3),
      // array('username','require','账号不能为空',1,'regex',4),
      // array('password','require','密码不能为空',1,'regex',4),
     // array('username','checkName','帐号错误！',1,'function',4),  // 只在登录时候验证
     // array('password','checkPwd','密码错误！',1,'function',4), // 只在登录时候验证
   );
   // public function checklogin(){
   // 	$username=$this->data['username'];//表单提交的密码
   // 	$password=$this->data['password'];
   // 	$info=$this->where(array('username'=>$username))->find();
   // 	// dump($info);die;
   //   if($info['password']==md5($password)){
   //   	 session('id',$info['id']);
   //      session('username',$info['username']);
      
   //   }else{
   //   	'错误';
   //   }
   // }
}
