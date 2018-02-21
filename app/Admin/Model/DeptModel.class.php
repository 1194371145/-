<?php
//声明命名空间
namespace Admin\Model;
//引入父类模型
use Think\Model;
//声明模型并且继承父类模型
class DeptModel extends Model{
// 字段映射定义
       protected $_map=array(
        // 映射规则: 1,键是表单中name值=值是数据表中的字段值
        'abc'=>'name',);




// 是否批处理验证
    protected $patchValidate    =   true;
	protected $_validate = array(
//自动验证定义
    array('name','require','部门名称不能为空'),
    array('name','','部门已经存在','0','unique'),
    array('sort','number','排序必须是数字'),
    array('remark','require','没工资不可能'),
    array('remark','is_numeric','排序必须是数字','0','function'),

		); 
    
}