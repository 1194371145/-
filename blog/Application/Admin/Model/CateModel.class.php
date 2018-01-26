<?php
namespace Admin\Model;
use Think\Model;
class CateModel extends Model {
   protected $_validate = array(
     array('catename','require','添加栏目不能为空',1,'regex',3), // 
      array('catename','','该栏目已被注册！',0,'unique',1), // 在新增的时候验证name字段是否唯一
   );
}
