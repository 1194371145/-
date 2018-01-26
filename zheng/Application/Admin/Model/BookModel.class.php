<?php
//声明命名空间
namespace Admin\Model;
//引入父类模型
use Think\Model;
//声明模型并且继承父类模型
class BookModel extends Model{

// 是否批处理验证
    // protected $patchValidate    =   true;
	protected $_validate = array(
//自动验证定义
    // array('name','require','书名不能为空'),
     array('name','','抱歉,该书已经被人推荐',0,'unique',1), // 在新增的时候验证name字段是否唯一
     array('zuoze','require','作者信息必填'),
     array('tel','require','留个电话白!'),
     array('tel','number','电话格式错误，请认真填写'),
		); 
    
}