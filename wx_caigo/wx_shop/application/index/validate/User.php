<?php
namespace app\index\validate;
use think\Validate;
class User extends Validate
{
    protected $rule=[
        'password'=>'require|min:6|max:20',
        ['tel','require|length:11|/^1[34578]\d{9}$/','手机号码必填|手机号码必须为11位，请检查。|您输入的手机号码有问题，请检查。'],
    ];


    protected $message=[
        'password.require'=>'管理员密码不得为空！',
        'password.min'=>'密码不得少于6为！',
    ];

    protected $scene=[
        'add'=>['tel','password'],
    ];





    

    




   

	












}
