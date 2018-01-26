<?php
namespace app\admin\validate;

use think\Validate;

class Cate extends Validate
{
    protected $rule = [
        'catename'  =>  'require|max:25|unique:cate',
        'keywords'  =>  'require',
    ];

    protected $message  =   [
        'catename.require' => '栏目名称不能为空！',  
        'catename.unique' => '栏目名称不能重复！',  
        'catename.max' => '栏目名称不能大于25位！', 
        'keywords.require' => '栏目关键字不能为空！', 

    ];

    protected $scene = [
        'edit'  =>  ['catename'],
    ];


}