<?php
namespace app\admin\validate;
use think\Validate;
class User extends Validate
{

    protected $rule=[
        'name'=>'unique:user|require|max:25',
        'password'=>'require|min:6|max:25',
        ['tel','require|length:11|/^1[34578]\d{9}$/','手机号码必填|手机号码必须为11位，请检查。|您输入的手机号码有问题，请检查。'],
    ];


    protected $message=[
        'name.require'=>'用户名称不得为空！',
        'name.unique'=>'用户名称不得重复！',
        'password.require'=>'管理员密码不得为空！',
        'password.min'=>'密码不得少于6为！',
    ];

    protected $scene=[
        'check'=>['name'],
        'add'=>['name','tel','password'],
        'edit'=>['name','tel','password'],
    ];





    

    




   

	












}
