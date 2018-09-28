<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\Cate as CateModel;
class Cate extends Common
{
    public function catelist(){//栏目列表接口
        $cate=new CateModel();
        $cateres=$cate->catetree();
        if($cateres){
            $code=0;
            $message = '栏目列表展示';
        }else{
            $code=1;
            $message = '展示失败';
        }
       ReturnJson($code,$message,$cateres);
    }

}
