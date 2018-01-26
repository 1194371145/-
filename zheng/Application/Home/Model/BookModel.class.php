<?php
//声明命名空间
namespace Home\Model;
//引入父类模型
use Think\Model;
//声明模型并且继承父类模型
class BookModel extends Model{
// 字段映射定义
       protected $_map=array(
        // 映射规则: 1,键是表单中name值=值是数据表中的字段值
        'abc'=>'name',);




// 是否批处理验证
    // protected $patchValidate    =   true;
	protected $_validate = array(
//自动验证定义
    array('name','require','书名不能为空'),
     array('name','','抱歉,该书已经被人推荐',0,'unique',1), // 在新增的时候验证name字段是否唯一
     array('zuoze','require','作者信息必填'),
     array('tel','require','留个电话白!'),
     array('tel','number','电话格式错误，请认真填写'),
     // array('verify','verify','验证码不正确！',1,'callback',2),
		); 

    // public function verify($code){
    //     $verify =new \Think\Verify();
    //     return $verify->check($code,'');
    // }
    
}