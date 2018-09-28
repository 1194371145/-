<?php
namespace app\admin\validate;
use think\Validate;
class Advertise extends Validate
{

    protected $rule=[
        'name'=>'unique:advertise|require',
        'link'=>'require|url',
    ];


    protected $message=[
        'name.require'=>'广告名称不得为空！',
        'name.unique'=>'广告名称不得重复！',
        'link.require'=>'链接名称不得为空！',
        'link.url'=>'链接格式错误！',
    ];





    

    




   

	












}
