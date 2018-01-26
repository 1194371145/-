<?php
namespace app\admin\validate;

use think\Validate;

class Link extends Validate
{
    protected $rule = [
        'title'  =>  'require|max:27|unique:link',//一个汉字代表3个字符
        'url'  =>  'require',
    ];

    protected $message  =   [
        'title.require' => '链接标题不能为空！',  
        'title.unique' => '链接标题不能重复！',  
        'title.max' => '链接标题不能大于25位！', 
        'url.require' => '链接地址不能为空！', 

    ];



}